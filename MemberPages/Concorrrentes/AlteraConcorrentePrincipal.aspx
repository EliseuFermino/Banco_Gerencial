<%@ Page Title="Principal - Altera Concorrente" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AlteraConcorrentePrincipal.aspx.vb" Inherits="MemberPages_Concorrrentes_AlteraConcorrentePrincipal" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="CNPJ_Principal" Width="800px">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True" ShowNewButton="True" ShowDeleteButton="True" ShowClearFilterButton="True"/>
            <dx:GridViewDataTextColumn Caption="CNPJ Principal" FieldName="CNPJ_Principal" VisibleIndex="1" Width="70px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NomeEstabPrincipal" VisibleIndex="2" Caption="Razão Social">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NomeEstabFantasia" VisibleIndex="3" Caption="Nome Fantasia">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
        <SettingsCommandButton>
            <EditButton Text="Alterar"/>
            <NewButton Text="Novo"/>
            <DeleteButton Text="Excluir"/>
            <CancelButton Text="Cancelar"/>
            <UpdateButton Text="Salvar"/>
            <ClearFilterButton Text="Limpar"/>
        </SettingsCommandButton>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerConcorConnectionString %>" DeleteCommand="DELETE FROM [Cadastros].[tblEstab_Principal] WHERE [CNPJ_Principal] = @CNPJ_Principal" InsertCommand="INSERT INTO [Cadastros].[tblEstab_Principal] ([CNPJ_Principal], [NomeEstabPrincipal], [NomeEstabFantasia]) VALUES (@CNPJ_Principal, @NomeEstabPrincipal, @NomeEstabFantasia)" SelectCommand="SELECT [CNPJ_Principal], [NomeEstabPrincipal], [NomeEstabFantasia] FROM [Cadastros].[tblEstab_Principal]" UpdateCommand="UPDATE [Cadastros].[tblEstab_Principal] SET [NomeEstabPrincipal] = @NomeEstabPrincipal, [NomeEstabFantasia] = @NomeEstabFantasia WHERE [CNPJ_Principal] = @CNPJ_Principal">
        <DeleteParameters>
            <asp:Parameter Name="CNPJ_Principal" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CNPJ_Principal" Type="Int32" />
            <asp:Parameter Name="NomeEstabPrincipal" Type="String" />
            <asp:Parameter Name="NomeEstabFantasia" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NomeEstabPrincipal" Type="String" />
            <asp:Parameter Name="NomeEstabFantasia" Type="String" />
            <asp:Parameter Name="CNPJ_Principal" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

