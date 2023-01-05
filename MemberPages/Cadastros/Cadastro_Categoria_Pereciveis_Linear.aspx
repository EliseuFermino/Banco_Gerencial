<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Cadastro_Categoria_Pereciveis_Linear.aspx.vb" Inherits="MemberPages_Cadastros_Cadastro_Categoria_Pereciveis_Linear" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divDados">
        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="idProduto" EnableTheming="True" Theme="MaterialCompact">
            <SettingsPager PageSize="15">
            </SettingsPager>
            <SettingsEditing Mode="Batch">
                <BatchEditSettings StartEditAction="Click" />
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <SettingsResizing ColumnResizeMode="Control" />
            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
            <SettingsSearchPanel Visible="True" />
            <SettingsLoadingPanel Text="Buscando&amp;hellip;" />
            <SettingsText CommandBatchEditCancel="Cancelar" CommandBatchEditPreviewChanges="Ver Alterações" CommandBatchEditUpdate="Salvar" SearchPanelEditorNullText="Digite um texto para pesquisar..." />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" Visible="False" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="idProduto" ReadOnly="True" VisibleIndex="1" Caption="Produto" SortIndex="0" SortOrder="Ascending" Width="100px">
                    <Settings ShowEditorInBatchEditMode="False" AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="nomeProduto" VisibleIndex="2" Caption="Nome do Produto">
                    <Settings ShowEditorInBatchEditMode="False" AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idCategoria_Pereciveis_Linear" VisibleIndex="3" Caption="ID Categoria Linear" Width="160px">
                    <CellStyle Font-Bold="True" ForeColor="#FF6600" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descProdutoDeptoLista" VisibleIndex="7" Caption="Departamento" Width="150px">
                    <Settings ShowEditorInBatchEditMode="False" AutoFilterCondition="Contains" AllowHeaderFilter="True" />
                    <SettingsHeaderFilter Mode="CheckedList">
                    </SettingsHeaderFilter>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descProdutoSecaoLista" VisibleIndex="8" Caption="Seção">
                    <Settings ShowEditorInBatchEditMode="False" AutoFilterCondition="Contains" AllowHeaderFilter="True" />
                    <SettingsHeaderFilter Mode="CheckedList">
                    </SettingsHeaderFilter>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descProdutoGrupoLista" VisibleIndex="9" Caption="Grupo">
                    <Settings ShowEditorInBatchEditMode="False" AutoFilterCondition="Contains" AllowHeaderFilter="True" />
                    <SettingsHeaderFilter Mode="CheckedList">
                    </SettingsHeaderFilter>
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descProdutoSubgrupoLista" VisibleIndex="10" Caption="Subgrupo">
                    <Settings ShowEditorInBatchEditMode="False" AutoFilterCondition="Contains" AllowHeaderFilter="True" />
                    <SettingsHeaderFilter Mode="CheckedList">
                    </SettingsHeaderFilter>
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Categoria Pereciveis Linear" FieldName="descCategoria_Pereciveis_Linear" VisibleIndex="4">
                    <Settings ShowEditorInBatchEditMode="False" AllowHeaderFilter="True" />
                    <SettingsHeaderFilter Mode="CheckedList">
                    </SettingsHeaderFilter>
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Gerenciamento de Categorias" FieldName="descProdutoGC" VisibleIndex="6">
                    <Settings AllowHeaderFilter="True" AutoFilterCondition="Contains" ShowEditorInBatchEditMode="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ID. GC" FieldName="idProdutoGC" ToolTip="Codigo do Gerenciamento de Categorias" VisibleIndex="5" Width="80px">
                    <CellStyle Font-Bold="True" ForeColor="#009900" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
            <Styles>
                <Header BackColor="#666666" ForeColor="White">
                </Header>
                <AlternatingRow BackColor="#EBEBEB">
                </AlternatingRow>
                <TitlePanel BackColor="#333333" ForeColor="#CCCCCC">
                </TitlePanel>
                
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="SELECT idProduto, nomeProduto, idCategoria_Pereciveis_Linear, descCategoria_Pereciveis_Linear, descProdutoDeptoLista, descProdutoSecaoLista, descProdutoGrupoLista, descProdutoSubgrupoLista, idProdutoGC, descProdutoGC FROM gerCadastro_Altera_Ronei" UpdateCommand="UPDATE SLV.tblProduto SET idCategoria_Pereciveis_Linear = @idCategoria_Pereciveis_Linear, idProdutoGC = @idProdutoGC WHERE (idProduto = @idProduto)">
            
            
            <UpdateParameters>
                <asp:Parameter Name="idCategoria_Pereciveis_Linear" Type="Byte" />
                <asp:Parameter Name="idProdutoGC" Type="int16" />
                <asp:Parameter Name="idProduto" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

