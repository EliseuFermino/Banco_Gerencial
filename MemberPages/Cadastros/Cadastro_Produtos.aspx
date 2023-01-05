<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Cadastro_Produtos.aspx.vb" Inherits="MemberPages_Cadastros_Cadastro_Produtos" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="SoftOrange" Width="100%">
        <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
        <SettingsPager NumericButtonCount="20" PageSize="20">
        </SettingsPager>
        <Settings ShowFilterRow="True" ShowFilterBar="Auto" ShowTitlePanel="True" ShowGroupPanel="True" />
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <SettingsSearchPanel Visible="True" />
        <SettingsText SearchPanelEditorNullText="Entre com um texto para pesquisar" Title="Cadastro de Produtos" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" Visible="False" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="EAN" VisibleIndex="1">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Cod Host" FieldName="idProduto" VisibleIndex="2">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nome do Produto" FieldName="nomeProduto" VisibleIndex="3">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Departamento" FieldName="descProdutoDeptoLista" VisibleIndex="9">
                <Settings AutoFilterCondition="Contains" AllowHeaderFilter="True" />
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Seção" FieldName="descProdutoSecaoLista" VisibleIndex="10">
                <Settings AutoFilterCondition="Contains" AllowHeaderFilter="True" />
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Grupo " FieldName="descProdutoGrupoLista" VisibleIndex="11">
                <Settings AutoFilterCondition="Contains" AllowHeaderFilter="True" />
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Subgrupo" FieldName="descProdutoSubgrupoLista" VisibleIndex="12">
                <Settings AutoFilterCondition="Contains" AllowHeaderFilter="True" />
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Ativo" FieldName="Ativo" VisibleIndex="4">
                <Settings AllowHeaderFilter="True" />
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Comprador" FieldName="Comprador" VisibleIndex="5">
                <Settings AllowHeaderFilter="True" />
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Gestor" FieldName="nomeGestorComercial" VisibleIndex="6">
                <Settings AutoFilterCondition="Contains" AllowHeaderFilter="True" />
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Cod Fornecedor" FieldName="idFornecedor" VisibleIndex="7">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Fornecedor" FieldName="nomeFornecedor" VisibleIndex="8">
                <Settings AutoFilterCondition="Contains" AllowHeaderFilter="True" />
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>

        </Columns>
        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="usp_idProduto_EAN" SelectCommandType="StoredProcedure" EnableCaching="false"></asp:SqlDataSource>

</asp:Content>

