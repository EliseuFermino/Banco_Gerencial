<%@ Page Title="PGR425 - Acompanhamento de Vendas Diarias" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Acompanhamento_Vendas_Diarias.aspx.vb" Inherits="MemberPages_Replanejamento_Acompanhamento_Vendas_Diarias" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>

<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <link href="../../css/myCSS.css" rel="stylesheet" />

    <style type ="text/css" >

         #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divMes {            
            float: left;
            margin-left: 10px;
        }

        #divFilial {            
            float: left;
            margin-left: 10px;
        }


        #divTipoTotal {
            float: left ;
            margin-left: 20px ;
            margin-top: 3px;
        }

        #divTipoSecao {
            float: left ;
            margin-left: 10px ;
            margin-top: 3px;
        }        

        #divSecaoCbo {
            float: left ;
            margin-left: 20px ;
           
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

      <div id="divAno" class="BGC_myBorder" >
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>

    
    <div id="divFilial" class="BGC_myBorder">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>    

     <div id="divBotaoAtualizar" style="float:left ; padding-left: 10px; padding-top:5px" class="BGC_myBorder">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue" Height="30px">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>


    <div id="divFixar"  style="float:left ; padding-left: 10px; margin-top: -3px">
        
        <dx:ASPxCheckBox ID="chkFixarCabecalho" runat="server" Text="fixar Cabeçalho" Theme="MaterialCompactOrange" Checked="True" CheckState="Checked" >
            <ClientSideEvents CheckedChanged="function(s, e) {
cbPanel.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divSecaoCbo" class="BGC_myBorder">
    <dx:ASPxComboBox ID="cboSecao" runat="server" DataSourceID="SqlDataSource1" TextField="ListaReduzida" ValueField="idSecao" Width="200px" SelectedIndex="0" ValueType="System.Int32" Caption="Seção" Theme="Mulberry" ClientInstanceName="cboSecao" AutoPostBack="false" DropDownRows="25" ></dx:ASPxComboBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>"                                       
        SelectCommand="Cadastros.uspCboSecao" SelectCommandType="StoredProcedure" >
        <SelectParameters>
            <asp:SessionParameter Name="idTipoLista" SessionField="sTIPO_LISTA" Type="Int32" DefaultValue="0" />
            <asp:SessionParameter Name="Matricula" SessionField="sMATRICULA" Type="String" DefaultValue="0" />
       
        </SelectParameters>
    </asp:SqlDataSource>
</div>
       

   <%-- <div id="divTipoTotal">
        <dx:ASPxRadioButton ID="rndTotal" runat="server" Text="Total" GroupName="grTipo" Checked="true" Theme="MaterialCompact" EnableTheming="True" AutoPostBack="true" ></dx:ASPxRadioButton>
    </div>

    <div id="divTipoSecao">
        <dx:ASPxRadioButton ID="rndSecao" runat="server" Text="Seção" GroupName="grTipo" Theme="MaterialCompact" ClientInstanceName="rndSecao" EnableTheming="True" AutoPostBack="true">
                               
        </dx:ASPxRadioButton>
    </div>

    <div id="divSecao">
        <uc1:wucListaSecao runat="server" id="cboSecao" Caption="False" cboSecao_Visible="False" Secao_InstanceName="iSecao" />
    </div>--%>


     <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

                   <div id="divDados" style="clear:both; padding-top: 5px; margin-left: 5px;">

        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" EnableTheming="True" KeyFieldName="Dia" Theme="SoftOrange" Width="100%">
            <SettingsPager NumericButtonCount="31" PageSize="31">
            </SettingsPager>
            <Settings ShowFooter="True" ShowFilterRow="True" HorizontalScrollBarMode="Visible" VerticalScrollableHeight="450" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsResizing ColumnResizeMode="Control" />
            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataDateColumn FieldName="Dia" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px" FixedStyle="Left">
                    <Settings AutoFilterCondition="LessOrEqual" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Descrição" FieldName="nomeDiaSemana" ShowInCustomizationForm="True" VisibleIndex="2" Width="125px" FixedStyle="Left">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="4">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealVenda" ShowInCustomizationForm="True" VisibleIndex="1" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" ShowInCustomizationForm="True" VisibleIndex="0" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <HeaderStyle BackColor="#009900" />
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Dif. Meta x Real" FieldName="dif_VendaMeta" ShowInCustomizationForm="True" VisibleIndex="2">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <HeaderStyle BackColor="#009900" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingMeta_Vendas" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <HeaderStyle BackColor="#009900" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="8">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Real" FieldName="percMargemTotal_AT" ShowInCustomizationForm="True" VisibleIndex="2" Width="65px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Dif" FieldName="dif_PercMargemTotal" ShowInCustomizationForm="True" VisibleIndex="3" Width="65px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMetaLucroFinal" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Quadro de Lotação (QL)" ShowInCustomizationForm="True" VisibleIndex="14" Visible="False">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="0">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ano Atual" ShowInCustomizationForm="True" VisibleIndex="1">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Lucro Total (PDV + SellOut)" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Ano Atual" FieldName="vlrLucroTotalAT" ShowInCustomizationForm="True" VisibleIndex="1">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn FieldName="vlrLucroComercialAA" ShowInCustomizationForm="True" VisibleIndex="15" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="vlrLucroComercialAT" ShowInCustomizationForm="True" VisibleIndex="16" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Volumes" ShowInCustomizationForm="True" VisibleIndex="3">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="QtdeAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ano Atual" FieldName="QtdeAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="difVolume" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="perc_CrescVolume" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Quebra Valor" ShowInCustomizationForm="True" VisibleIndex="17">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaAgenda23" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealAgenda23" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Diferença" FieldName="vlrDifAg23" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Quebra Percentual" ShowInCustomizationForm="True" VisibleIndex="18">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMetaAgenda23" ShowInCustomizationForm="True" VisibleIndex="0" Width="65px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Real" FieldName="percRealAgenda23" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difPercMxR_Ag23" ShowInCustomizationForm="True" VisibleIndex="2" Width="65px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta_Venda" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVendas" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="dif_VendaMeta" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta_Lucro" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="dif_vlrLucroTotal" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVolume" SummaryType="Sum" />                
                
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaAgenda23" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAgenda23" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDifAg23" SummaryType="Sum" />

                

                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMeta_Vendas" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc_CrescVendas" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc_CrescVolume" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc_CrescLucroTotal" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV_AA" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV_AT" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="dif_PercMargemPDV" SummaryType="Custom" />          
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="dif_PercMargemTotal" SummaryType="Custom" />

                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaAgenda23" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAgenda23" SummaryType="Custom" />   
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMxR_Ag23" SummaryType="Custom" />    
                
                
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="numFuncionariosAA" SummaryType="Average" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="numFuncionariosAT" SummaryType="Average" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="QL_AA" SummaryType="Average" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="QL_AT" SummaryType="Average" />
                
                
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAA" ShowInColumn="numClienteAA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAT" ShowInColumn="numClienteAT" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difClientes" ShowInColumn="difClientes" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc_CrescNumClientes" ShowInColumn="perc_CrescNumClientes" SummaryType="Custom" />

                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AA" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AT" SummaryType="Custom" />
                
                
            </TotalSummary>
           
            <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <FormatConditions>
                <dx:GridViewFormatConditionHighlight Expression="dif_VendaMeta &lt; 0" FieldName="dif_VendaMeta">
                </dx:GridViewFormatConditionHighlight>
                <dx:GridViewFormatConditionIconSet FieldName="percAtingMeta_Vendas" Format="PositiveNegativeTriangles" />
                <dx:GridViewFormatConditionHighlight Expression="difVendas &lt; 0" FieldName="difVendas">
                </dx:GridViewFormatConditionHighlight>
                <dx:GridViewFormatConditionHighlight Expression="dif_PercMargemTotal &lt; 0.0" FieldName="dif_PercMargemTotal">
                </dx:GridViewFormatConditionHighlight>
                <dx:GridViewFormatConditionHighlight Expression="dif_PercMargemPDV &lt; 0.0" FieldName="dif_PercMargemPDV">
                </dx:GridViewFormatConditionHighlight>
                <dx:GridViewFormatConditionIconSet FieldName="perc_CrescVendas" Format="PositiveNegativeArrowsColored" />
                <dx:GridViewFormatConditionHighlight Expression="dif_vlrLucroTotal &lt; 0.0" FieldName="dif_vlrLucroTotal">
                </dx:GridViewFormatConditionHighlight>
                <dx:GridViewFormatConditionIconSet FieldName="perc_CrescLucroTotal" Format="PositiveNegativeArrowsColored" />
                <dx:GridViewFormatConditionIconSet FieldName="vlrSaldo" Format="PositiveNegativeTriangles" />
                <dx:GridViewFormatConditionHighlight Expression="difClientes &lt; 0" FieldName="difClientes">
                </dx:GridViewFormatConditionHighlight>
                <dx:GridViewFormatConditionIconSet FieldName="perc_CrescNumClientes" Format="PositiveNegativeArrowsColored" />
            </FormatConditions>
            <Styles>
                <Header HorizontalAlign="Center" >
                </Header>
                <AlternatingRow BackColor="#EBEBEB">
                </AlternatingRow>
                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                </FocusedRow>                
                <Footer BackColor="#99FF99" Font-Bold="True" >
                </Footer>
                <TitlePanel Font-Size="Medium">
                </TitlePanel>
                
            </Styles>

        </dx:ASPxGridView>

        <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Programas.uspPGR425" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />    
                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte"  />              
                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />          
                     <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Int32" DefaultValue="0" />
            </SelectParameters>

        </asp:SqlDataSource>

    </div>
                    
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel> 

</asp:Content>

