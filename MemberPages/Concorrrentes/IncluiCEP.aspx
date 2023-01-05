<%@ Page Title="CEP - Inclusão" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="IncluiCEP.aspx.vb" Inherits="MemberPages_Concorrrentes_IncluiCEP" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="cep" Width="900px">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True" ShowNewButton="True" ShowClearFilterButton="True"/>
            <dx:GridViewDataTextColumn FieldName="cep" VisibleIndex="1" Caption="CEP">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="logradouro" VisibleIndex="2" Width="300px" Caption="Rua">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="bairro" VisibleIndex="3" Width="200px" Caption="Bairro">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="cidade" VisibleIndex="4" Width="200px" Caption="Cidade">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
        <SettingsCommandButton>
            <EditButton Text="Editar"/>
            <NewButton Text="Novo"/>
            <DeleteButton Text="Excluir"/>
            <CancelButton Text="Cancelar"/>
            <UpdateButton Text="Salvar"/>
            <ClearFilterButton Text="Limpar"/>
        </SettingsCommandButton>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerConcorConnectionString %>" DeleteCommand="DELETE FROM [CEP].[Parana] WHERE [cep] = @cep" InsertCommand="INSERT INTO [CEP].[Parana] ([cep], [logradouro], [bairro], [cidade]) VALUES (@cep, @logradouro, @bairro, @cidade)" SelectCommand="SELECT [cep], [logradouro], [bairro], [cidade] FROM [CEP].[Parana]" UpdateCommand="UPDATE [CEP].[Parana] SET [logradouro] = @logradouro, [bairro] = @bairro, [cidade] = @cidade WHERE [cep] = @cep">
        <DeleteParameters>
            <asp:Parameter Name="cep" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="cep" Type="Int32" />
            <asp:Parameter Name="logradouro" Type="String" />
            <asp:Parameter Name="bairro" Type="String" />
            <asp:Parameter Name="cidade" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="logradouro" Type="String" />
            <asp:Parameter Name="bairro" Type="String" />
            <asp:Parameter Name="cidade" Type="String" />
            <asp:Parameter Name="cep" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

