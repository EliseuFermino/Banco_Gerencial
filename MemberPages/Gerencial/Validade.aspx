<%@ Page Title="Validade" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Validade.aspx.vb" Inherits="MemberPages_Gerencial_Validade" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        html {            
                overflow-x:hidden;            
            }

        #divPeriodo {
            float: left;
             margin: 5px;
        }

        #divBotaoAtualizar {
            float: left;
             margin: 3px;    
        }

  
        #divDados {
            clear: both ;
            float: left;
            margin: 5px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divPeriodo">
        <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Atualizar" AutoPostBack ="False" Theme ="Metropolis" >
            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>  

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="900px" ClientInstanceName ="cbPanel" Theme ="Metropolis" >
            <PanelCollection>
                <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="dsTotal" AutoGenerateColumns="False" KeyFieldName="idFilial" Width="650px">
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
                            <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Filial" FieldName="NomeDaFilial" ShowInCustomizationForm="True" VisibleIndex="1" Width="450px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Qtde" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                         <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Settings ShowFooter="True" ShowTitlePanel="True" />
                        <SettingsText EmptyDataRow="Não há informações disponíveis ainda para esse período " Title="Total de Produtos - Validade Vencida Encontrado nas Lojas - Agenda 550 " />
                        <SettingsDetail ShowDetailRow="True" />
                        <Styles>
                            <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                            </FocusedRow>
                            <TitlePanel Font-Size="Large">
                            </TitlePanel>
                        </Styles>
                        <Templates>
                            <DetailRow>



                                <dx:ASPxGridView ID="ASPxGridView2" runat="server" DataSourceID="dsDetail" AutoGenerateColumns="False" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" Width="600px" KeyFieldName="idProduto">
                                    <TotalSummary>
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="Qtde" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
                                    </TotalSummary>
                                    <Columns>
                                        <dx:GridViewDataDateColumn Caption="Dia" FieldName="Data" VisibleIndex="0" Width="80px">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" VisibleIndex="2" Width="70px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="NomeDoProduto" ReadOnly="True" VisibleIndex="3" Width="200px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Seção" FieldName="NomeDaSecao" ReadOnly="True" VisibleIndex="4" Width="100px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Qtde" VisibleIndex="5" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="CustoCondor" Visible="False" VisibleIndex="6">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="vlrTotal" ReadOnly="True" VisibleIndex="7" Caption="Valor" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                    <Settings ShowFooter="True" ShowGroupPanel="True" />
                                    <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                                    <Styles>
                                        <Header HorizontalAlign="Center">
                                        </Header>
                                        <AlternatingRow BackColor="#EEEEEE">
                                        </AlternatingRow>
                                        <FocusedRow BackColor="#FFFF99" ForeColor="#0066FF">
                                        </FocusedRow>
                                    </Styles>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="dsDetail" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Validade.usp_BuscarProdutoSecao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter DbType="Date" Name="diaInicial" SessionField="sDIA_INICIAL" />
                                        <asp:SessionParameter DbType="Date" Name="diaFinal" SessionField="sDIA_FINAL" />
                                        <asp:SessionParameter DbType="Int16" Name="idFilial" SessionField="sFILIAL" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </DetailRow>
                        </Templates>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="dsTotal" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Validade.usp_BuscarTotalPorLoja" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DbType="Date" Name="diaInicial" SessionField="sDIA_INICIAL" />
                            <asp:SessionParameter DbType="Date" Name="diaFinal" SessionField="sDIA_FINAL" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

        
    </div>
    
</asp:Content>

