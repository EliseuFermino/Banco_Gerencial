<%@ Page Title="Número de Clientes - Loja - Mês" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="NumClienteMesLojaRef.aspx.vb" Inherits="MemberPages_NumClienteMesLojaRef" %>


<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>



<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>  

    <div id="divBotaoAtualizar">
        <dxe:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dxe:ASPxButton>
    </div>

 <div id="divDados">
        <dxe:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
            <PanelCollection>
                <dxe:PanelContent>
                  
                                 <dxe:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False" 
                     DataSourceID="SqlDataSource1" 
                    KeyFieldName="FilialLista" Theme="DevEx" EnableTheming="True">
                    <SettingsBehavior AllowFocusedRow="True" />
                    
                    <SettingsPager mode="ShowAllRecords">
                    </SettingsPager>
                    
                    <SettingsText EmptyDataRow="Não há número de clientes para este ano ainda." 
                        Title="Total de Número de Cliente por Loja - Mensal" />
                    <TotalSummary>
                        <dxe:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Janeiro" SummaryType="Sum" />
                        <dxe:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Fevereiro" SummaryType="Sum" />
                        <dxe:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Março" SummaryType="Sum" />
                        <dxe:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ABRIL" SummaryType="Sum" />
                        <dxe:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Maio" SummaryType="Sum" />
                        <dxe:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Junho" SummaryType="Sum" />
                        <dxe:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Julho" SummaryType="Sum" />
                        <dxe:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Agosto" SummaryType="Sum" />
                        <dxe:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Setembro" SummaryType="Sum" />
                        <dxe:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Outubro" SummaryType="Sum" />
                        <dxe:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Novembro" SummaryType="Sum" />
                        <dxe:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Dezembro" SummaryType="Sum" />
                        <dxe:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalAno" SummaryType="Sum" />
                    </TotalSummary>
                                     <Toolbars>
                <dxe:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dxe:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dxe:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dxe:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dxe:GridViewToolbar>
            </Toolbars>

                    <Columns>
                        <dxe:GridViewDataTextColumn FieldName="FilialLista" VisibleIndex="0" 
                            Caption="Filial" Width="150px">
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                        </dxe:GridViewDataTextColumn>
                        <dxe:GridViewDataTextColumn FieldName="Janeiro" ReadOnly="True" 
                            VisibleIndex="1" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxe:GridViewDataTextColumn>
                        <dxe:GridViewDataTextColumn FieldName="Fevereiro" ReadOnly="True" 
                            VisibleIndex="2" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxe:GridViewDataTextColumn>
                        <dxe:GridViewDataTextColumn FieldName="Março" ReadOnly="True" 
                            VisibleIndex="3" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxe:GridViewDataTextColumn>
                        <dxe:GridViewDataTextColumn FieldName="ABRIL" ReadOnly="True" 
                            VisibleIndex="4" Caption="Abril" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxe:GridViewDataTextColumn>
                        <dxe:GridViewDataTextColumn FieldName="Maio" ReadOnly="True" VisibleIndex="5" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxe:GridViewDataTextColumn>
                        <dxe:GridViewDataTextColumn FieldName="Junho" ReadOnly="True" 
                            VisibleIndex="6" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxe:GridViewDataTextColumn>
                        <dxe:GridViewDataTextColumn FieldName="Julho" ReadOnly="True" 
                            VisibleIndex="7" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxe:GridViewDataTextColumn>
                        <dxe:GridViewDataTextColumn FieldName="Agosto" ReadOnly="True" 
                            VisibleIndex="8" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxe:GridViewDataTextColumn>
                        <dxe:GridViewDataTextColumn FieldName="Setembro" ReadOnly="True" 
                            VisibleIndex="9" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxe:GridViewDataTextColumn>
                        <dxe:GridViewDataTextColumn FieldName="Outubro" ReadOnly="True" 
                            VisibleIndex="10" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxe:GridViewDataTextColumn>
                        <dxe:GridViewDataTextColumn FieldName="Novembro" ReadOnly="True" 
                            VisibleIndex="11" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxe:GridViewDataTextColumn>
                        <dxe:GridViewDataTextColumn FieldName="Dezembro" ReadOnly="True" 
                            VisibleIndex="12" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxe:GridViewDataTextColumn>
                        <dxe:GridViewDataTextColumn Caption="Ano" FieldName="TotalAno" VisibleIndex="13" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                        </dxe:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="500" 
                        ShowTitlePanel="True" ShowFooter="True" />
                     <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dxe:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                    SelectCommand="SELECT FilialLista, Janeiro, Fevereiro, Março, ABRIL, Maio, Junho, Julho, Agosto, Setembro, Outubro, Novembro, Dezembro, (Janeiro + Fevereiro + Março + ABRIL + Maio + Junho + Julho + Agosto + Setembro + Outubro + Novembro + Dezembro) AS TotalAno FROM Gerencial.viewNumeroClientesLoja_Mes_Referencia WHERE (Ano = @Ano)">
                    <SelectParameters>                        
                        <asp:SessionParameter DbType="Int16" Name="Ano" SessionField="sANO" />
                    </SelectParameters>
                </asp:SqlDataSource>
                        
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="CentroCusto.uspNivelRateio_AberturaPorGrupo" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dxe:PanelContent>
            </PanelCollection>
        </dxe:ASPxCallbackPanel>
    </div>



</asp:Content>

