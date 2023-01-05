<%@ Page Title="Relatório de Produtos à Vencidos" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ListaProdutosVencidosLojaTodos.aspx.vb" Inherits="MemberPages_Quebras_Validade_ListaProdutosVencidosLojaTodos" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

        <style type ="text/css" >

        #divFilial {
            clear: both ;
            float :left;
            margin-left : 2px;
            margin-top : 5px
        }

        #divGrid1 {
            clear: both ;
            float :left;
            margin-left : 2px;
            margin-top : 5px;
            width: 100%;
            
        }

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      
        <ContentTemplate >

            <div id ="divFilial">
                <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
            </div>           

            <div id="divGrid1">

            <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsData" AutoGenerateColumns="False" KeyFieldName="ID" Width="100%">
                <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="Quantidade" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="Total de Produtos: {0:n0}" FieldName="Quantidade" ShowInColumn="Setor" SummaryType="Count" />
                </TotalSummary>
                <GroupSummary>
                    <dx:ASPxSummaryItem DisplayFormat="Total: {0:n2}" FieldName="vlrTotal" ShowInGroupFooterColumn="vlrTotal" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="Qtde: {0:n3}" FieldName="Quantidade" ShowInGroupFooterColumn="Quantidade" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="Total de Produtos: {0:n0}" FieldName="Quantidade" ShowInGroupFooterColumn="nomeProduto" SummaryType="Count" />
                </GroupSummary>
                <Columns>
                    <dx:GridViewDataDateColumn Caption="Vencimento" FieldName="dataVencimento" VisibleIndex="4" >
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Setor" VisibleIndex="5" width="200px">
                        <Settings AutoFilterCondition="Contains" />
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Corredor" FieldName="numCorredor" VisibleIndex="6"  Visible="False">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" VisibleIndex="0" FixedStyle="Left" >
                        <Settings AutoFilterCondition="Contains" />
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" VisibleIndex="1" FixedStyle="Left" Width="350px" >
                        <Settings AutoFilterCondition="Contains" />
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Preço" FieldName="vlrPrecoVenda" VisibleIndex="8" >
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Qtde." FieldName="Quantidade" VisibleIndex="7" >
                        <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrTotal" ReadOnly="True" VisibleIndex="9" >
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ID" Visible="False" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Coletado" FieldName="Dia" SortIndex="0" SortOrder="Descending" VisibleIndex="2" >
                        <PropertiesTextEdit DisplayFormatString="&nbsp;{0:dd/MM/yyyy} " EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                <SettingsPager PageSize="25">
                </SettingsPager>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Visible" />
                <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                <Styles>
                    <Header HorizontalAlign="Center">
                    </Header>
                    <AlternatingRow BackColor="#F4F4F4">
                    </AlternatingRow>
                    <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                    </FocusedRow>
                    <Footer Font-Bold="True">
                    </Footer>
                    <GroupFooter Font-Bold="True">
                    </GroupFooter>
                </Styles>

            </dx:ASPxGridView>

            <asp:SqlDataSource ID="dsData" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vencidos.uspListaProdutosVencidosLoja" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16"  />                    
                </SelectParameters>
            </asp:SqlDataSource>

                </div>



            

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

