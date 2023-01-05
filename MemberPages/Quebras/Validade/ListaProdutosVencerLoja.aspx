<%@ Page Title="Lista de Produtos à Vencer" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ListaProdutosVencerLoja.aspx.vb" Inherits="MemberPages_Quebras_Validade_ListaProdutosVencer" %>

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
            margin-top : 5px
        }

        #divGrid2 {
            clear: both ;
            float :left;
            margin-left : 2px;
            margin-top : 5px
        }

        #divGrid3 {
            clear: both ;
            float :left;
            margin-left : 2px;
            margin-top : 5px
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">       

        <ContentTemplate>


    <div id="divFilial">
        
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divGrid1">
 
          <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsData" AutoGenerateColumns="False" KeyFieldName="ID" Width="850px">
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
                </TotalSummary>
                <Columns>
                    <dx:GridViewDataDateColumn Caption="Vencimento" FieldName="dataVencimento" VisibleIndex="1" Width="90px">
                        <Settings AllowAutoFilter="False" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Setor" VisibleIndex="3" Width="150px">
                        <Settings AutoFilterCondition="Contains" />
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Corredor" FieldName="numCorredor" VisibleIndex="4" Width="60px">
                        <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" VisibleIndex="5" Width="70px">
                        <Settings AutoFilterCondition="Contains" />
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" VisibleIndex="6" Width="240px">
                        <Settings AutoFilterCondition="Contains" />
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Preço" FieldName="vlrPrecoVenda" VisibleIndex="8" Width="70px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Qtde." FieldName="Quantidade" VisibleIndex="7" Width="70px">
                        <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrTotal" ReadOnly="True" VisibleIndex="9" Width="100px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ID" Visible="False" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                <SettingsPager PageSize="25" Mode="ShowAllRecords">
                </SettingsPager>
              <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupFooter="VisibleAlways" VerticalScrollBarMode="Auto" ShowTitlePanel="True" VerticalScrollableHeight="150" />
                <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" EmptyDataRow="Não há produtos vencendo hoje!!!" />
                <Styles>
                    <Header HorizontalAlign="Center">
                    </Header>
                    <AlternatingRow BackColor="#EAEAEA">
                    </AlternatingRow>
                    <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                    </FocusedRow>
                    <Footer Font-Bold="True">
                    </Footer>
                    <GroupFooter Font-Bold="True">
                    </GroupFooter>
                    <TitlePanel BackColor="#FF4242">
                    </TitlePanel>
                </Styles>

            </dx:ASPxGridView>

          <asp:SqlDataSource ID="dsData" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Validade.uspListaProdutosVencerPorDia" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                    <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                </SelectParameters>
          </asp:SqlDataSource>


   </div>  

      
    <div id="divGrid2">
 
              <dx:ASPxGridView ID="grid2" runat="server" DataSourceID="dsData2" AutoGenerateColumns="False" KeyFieldName="ID" Width="850px">
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
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataDateColumn Caption="Vencimento" FieldName="dataVencimento" VisibleIndex="1" Width="90px">
                            <Settings AllowAutoFilter="False" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="Setor" VisibleIndex="3" Width="150px">
                            <Settings AutoFilterCondition="Contains" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Corredor" FieldName="numCorredor" VisibleIndex="4" Width="60px">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" VisibleIndex="5" Width="70px">
                            <Settings AutoFilterCondition="Contains" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" VisibleIndex="6" Width="240px">
                            <Settings AutoFilterCondition="Contains" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Preço" FieldName="vlrPrecoVenda" VisibleIndex="8" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Qtde." FieldName="Quantidade" VisibleIndex="7" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrTotal" ReadOnly="True" VisibleIndex="9" Width="100px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ID" Visible="False" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <SettingsPager PageSize="25" Mode="ShowAllRecords">                         
                    </SettingsPager>
                   <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                    <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupFooter="VisibleAlways" VerticalScrollBarMode="Auto" ShowTitlePanel="True" VerticalScrollableHeight="150" />
                    <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" EmptyDataRow="Não há produtos vencendo amanhã!!!" />
                    <Styles>
                        <Header HorizontalAlign="Center">
                        </Header>
                        <AlternatingRow BackColor="#EAEAEA">
                        </AlternatingRow>
                        <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                        </FocusedRow>
                        <Footer Font-Bold="True">
                        </Footer>
                        <GroupFooter Font-Bold="True">
                        </GroupFooter>
                        <TitlePanel BackColor="#FF771C">
                        </TitlePanel>
                    </Styles>

                </dx:ASPxGridView>

          <asp:SqlDataSource ID="dsData2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Validade.uspListaProdutosVencerPorDia" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                    <asp:SessionParameter Name="Dia" SessionField="sDIA2" Type="DateTime" />
                </SelectParameters>
          </asp:SqlDataSource>


   </div>  



    <div id="divGrid3">
 
              <dx:ASPxGridView ID="grid3" runat="server" DataSourceID="dsData3" AutoGenerateColumns="False" KeyFieldName="ID" Width="850px">
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
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataDateColumn Caption="Vencimento" FieldName="dataVencimento" VisibleIndex="1" Width="90px">
                            <Settings AllowAutoFilter="False" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="Setor" VisibleIndex="3" Width="150px">
                            <Settings AutoFilterCondition="Contains" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Corredor" FieldName="numCorredor" VisibleIndex="4" Width="60px">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" VisibleIndex="5" Width="70px">
                            <Settings AutoFilterCondition="Contains" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" VisibleIndex="6" Width="240px">
                            <Settings AutoFilterCondition="Contains" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Preço" FieldName="vlrPrecoVenda" VisibleIndex="8" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Qtde." FieldName="Quantidade" VisibleIndex="7" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrTotal" ReadOnly="True" VisibleIndex="9" Width="100px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ID" Visible="False" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <SettingsPager PageSize="25" Mode="ShowAllRecords">
                    </SettingsPager>
                   <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                    <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupFooter="VisibleAlways" VerticalScrollBarMode="Auto" ShowTitlePanel="True" VerticalScrollableHeight="150" />
                    <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" EmptyDataRow="Não há produtos vencendo nos próximos 5 dias!!!" />
                    <Styles>
                        <Header HorizontalAlign="Center">
                        </Header>
                        <AlternatingRow BackColor="#EAEAEA">
                        </AlternatingRow>
                        <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                        </FocusedRow>
                        <Footer Font-Bold="True">
                        </Footer>
                        <GroupFooter Font-Bold="True">
                        </GroupFooter>
                        <TitlePanel BackColor="#3366FF">
                        </TitlePanel>
                    </Styles>

                </dx:ASPxGridView>

          <asp:SqlDataSource ID="dsData3" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Validade.uspListaProdutosVencerPorDia" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                    <asp:SessionParameter Name="Dia" SessionField="sDIA5" Type="DateTime" />
                </SelectParameters>
          </asp:SqlDataSource>


   </div>  

      
        </ContentTemplate>
    </asp:UpdatePanel>
                

</asp:Content>

