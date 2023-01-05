<%@ Page Title="Filial - Altera Concorrente" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AlteraConcorrenteFilial.aspx.vb" Inherits="MemberPages_Concorrrentes_AlteraConcorrenteFilial" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div>
        <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="ASPxGridView1" GuiaNome="Cadastro Concorrentes" />
    </div>

    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="IE" Width="1000px">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True" ShowNewButton="True" ShowDeleteButton="True"/>
                <dx:GridViewDataTextColumn FieldName="IE" VisibleIndex="1" Width="150px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CNPJ_Principal" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoCod" VisibleIndex="3" Caption="Tipo" Width="50px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CEP" VisibleIndex="4" Width="60px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Ativo" VisibleIndex="5" Width="30px">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="InicioDasAtividades" VisibleIndex="6" Caption="Data Abertura" Width="80px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CNPJ" VisibleIndex="7" Width="150px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NumEstabelecimento" VisibleIndex="8" Caption="Nº" Width="40px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idLojaConcorrente" VisibleIndex="9" Caption="Concorrente Direto" Width="40px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AEP" VisibleIndex="10" Caption="CNAE" Width="80px">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ColumnResizeMode="Control" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerConcorConnectionString %>" DeleteCommand="DELETE FROM [Cadastros].[tblEstab_Filiais] WHERE [IE] = @IE" InsertCommand="INSERT INTO [Cadastros].[tblEstab_Filiais] ([IE], [CNPJ_Principal], [TipoCod], [CEP], [Ativo], [InicioDasAtividades], [CNPJ], [NumEstabelecimento], [idLojaConcorrente], [AEP]) VALUES (@IE, @CNPJ_Principal, @TipoCod, @CEP, @Ativo, @InicioDasAtividades, @CNPJ, @NumEstabelecimento, @idLojaConcorrente, @AEP)" SelectCommand="SELECT [IE], [CNPJ_Principal], [TipoCod], [CEP], [Ativo], [InicioDasAtividades], [CNPJ], [NumEstabelecimento], [idLojaConcorrente], [AEP] FROM [Cadastros].[tblEstab_Filiais]" UpdateCommand="UPDATE [Cadastros].[tblEstab_Filiais] SET [CNPJ_Principal] = @CNPJ_Principal, [TipoCod] = @TipoCod, [CEP] = @CEP, [Ativo] = @Ativo, [InicioDasAtividades] = @InicioDasAtividades, [CNPJ] = @CNPJ, [NumEstabelecimento] = @NumEstabelecimento, [idLojaConcorrente] = @idLojaConcorrente, [AEP] = @AEP WHERE [IE] = @IE">
            <DeleteParameters>
                <asp:Parameter Name="IE" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="IE" Type="Int64" />
                <asp:Parameter Name="CNPJ_Principal" Type="Int32" />
                <asp:Parameter Name="TipoCod" Type="Int16" />
                <asp:Parameter Name="CEP" Type="Int32" />
                <asp:Parameter Name="Ativo" Type="Boolean" />
                <asp:Parameter Name="InicioDasAtividades" Type="String" />
                <asp:Parameter Name="CNPJ" Type="String" />
                <asp:Parameter Name="NumEstabelecimento" Type="String" />
                <asp:Parameter Name="idLojaConcorrente" Type="Byte" />
                <asp:Parameter Name="AEP" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CNPJ_Principal" Type="Int32" />
                <asp:Parameter Name="TipoCod" Type="Int16" />
                <asp:Parameter Name="CEP" Type="Int32" />
                <asp:Parameter Name="Ativo" Type="Boolean" />
                <asp:Parameter Name="InicioDasAtividades" Type="String" />
                <asp:Parameter Name="CNPJ" Type="String" />
                <asp:Parameter Name="NumEstabelecimento" Type="String" />
                <asp:Parameter Name="IE" Type="Int64" />
                <asp:Parameter Name="idLojaConcorrente" Type="Byte" />
                <asp:Parameter Name="AEP" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

