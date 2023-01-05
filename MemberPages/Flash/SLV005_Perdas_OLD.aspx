<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="SLV005_Perdas_OLD.aspx.vb" Inherits="MemberPages_SLV_SLV005_Perdas_OLD" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wucMercadologico.ascx" TagPrefix="uc1" TagName="wucMercadologico" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>

<%@ Register Src="~/Controles/wucOpcoesSLV.ascx" TagPrefix="uc1" TagName="wucOpcoesSLV" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>



<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <script lang="javascript" type ="text/javascript">
            function OnGridFocusedRowChanged() {
                grid.GetRowValues(grid.GetFocusedRowIndex(), 'idSecao;idSecao', OnGetRowValues);
            }            

            function OnGetRowValues(values) {                
                label.SetText(values[1]);
                cbPanelSecao.PerformCallback();
            }


            function OnGridFocusedRowChanged_Item() {
                grid2.GetRowValues(grid2.GetFocusedRowIndex(), 'idProduto;idProduto', OnGetRowValues2);
            }

            function OnGetRowValues2(values) {
                lblProduto.SetText(values[1]);
               
            }

   </script>


    <style type ="text/css" >

        html {            
            overflow-x:hidden;  
            overflow-y:auto;          
        }       

        #divFilial { 
           clear: both;
           float: left;         
           padding-left: 2px;
           margin-left: 2px;
           margin-top: 3px;             
        }

        #divGrafico {            
            float: left;
            padding-top: 5px;                        
        }

        #divBotaoAtualizar { 
           
            float:left ;           
            margin-left: 2px;
            width: 80px;  
            padding-top: 2px;                                            
        }

        #divOpcaoExibir {    
            clear: both;
            float:left ;        
            margin-left: 2px;
            width: 600px;  
            padding-top: 2px; 
                                           
        }

        #divExibir_AnoAnterior { 
            clear:both; 
            float: left;          
            margin-left: 2px;           
            padding-top: 2px;                                          
        }

        #divExibir_AnoAtual {  
            float: left;          
            margin-left: 10px;            
            padding-top: 2px;                                          
        }

        #divSize {            
            float: left;   
            padding: 9px;  
            margin-top: 3px;
            margin-left: 5px;      
        }

        #divExibir_SellOut {
            float: left;          
            margin-left: 2px;           
            padding-top: 2px;          
        }

       #divExibir_CAI {  
            float: left;          
            margin-left: 2px;            
            padding-top: 2px;                                        
        }

        #divFixarCabecalho {
            float: left;          
            margin-left: 2px;            
            padding-top: 2px;                
        }

        #divExibirMesmosDias {
            float: left;
            margin-left: 10px;
            margin-top: 2px; 
        }

        #divVisao { 
            
            float: left; 
            margin-left: 20px;           
            padding-Top: 2px;  
        }

        #divManual {            
            float: left;
            margin-left: 5px;
             margin-top: 2px;
        }
       
        #divDados {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 100%;
            margin-left: 1px;            
            padding-right: 2px;  
        }    
          

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="moldura">

        <div id="divFilial" class="BGC_myBorder">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>

        <div id="divPeriodo" class="BGC_Periodo BGC_myBorder" >
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
        </div>

        <div id="divSize" class="BGC_myBorder " >
            <uc1:wucSize runat="server" ID="cboSize" CallSize="100" AutoPostBack="false"  />
        </div>
        

<%--       
        <div id="divExibir_AnoAnterior">
            <dx:ASPxCheckBox ID="chkMostrar_AA" runat="server" Text="Ver Ano Anterior" Theme="DevEx" CheckState="Unchecked" Width="130px" ClientInstanceName="chkMostrar_AA" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>

        <div id="divExibir_AnoAtual">
            <dx:ASPxCheckBox ID="chkMostrar_AT" runat="server" Text="Ver Ano Atual" Theme="DevEx" CheckState="Checked" Width="120px" ClientInstanceName="chkMostrar_AT" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>

        <div id="divExibir_SellOut">
            <dx:ASPxCheckBox ID="chkMostrar_SellOut" runat="server" Text="Ver Sell-Out" Theme="DevEx" CheckState="Unchecked" Width="110px" ClientInstanceName="chkMostrar_SellOut" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div> 

        <div id="divExibir_CAI">
            <dx:ASPxCheckBox ID="chkMostrar_CAI" runat="server" Text="Ver CAI" Theme="DevEx" CheckState="Unchecked" Width="90px" ClientInstanceName="chkMostrar_CAI" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>  

        <div id="divFixarCabecalho" >
            <dx:ASPxCheckBox ID="chkFixarCabecalho" runat="server" Text="Fixar Cabeçalho" Checked="true" Theme="DevEx" Width="130px">
                 <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>  --%>
    
        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" UseSubmitBehavior="False" >
                <ClientSideEvents Click="function(s, e) {	
    cbPanelSecao.PerformCallback();
    cbPanel.PerformCallback();
   cbPanel2.PerformCallback();
}" />
            </dx:ASPxButton>
        </div>       
        
        <div id="divVisao">
            <dx:ASPxComboBox ID="cboVisao" runat="server" Native="True" SelectedIndex="0" ClientInstanceName="cboVisao">
                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	

	if (s.GetSelectedItem().value == 1) {
        chkMostrar_AA.SetChecked(false);
        chkMostrar_AT.SetChecked(true);
		chkMostrar_SellOut.SetChecked(false);
		chkMostrar_CAI.SetChecked(false);
		chkMostrar_AA.SetEnabled(true);
		chkMostrar_AT.SetEnabled(true);
        chkMostrar_SellOut.SetEnabled(true);
		chkMostrar_CAI.SetEnabled(true);        
        chkMesAnterior.SetEnabled(true);
        chkMesmosDias.SetEnabled(true);                                      	
	}  	
    else if (s.GetSelectedItem().value == 2) {
        chkMostrar_AA.SetChecked(true);
        chkMostrar_AT.SetChecked(true);
		chkMostrar_SellOut.SetChecked(false);
		chkMostrar_CAI.SetChecked(false);
		chkMostrar_AA.SetEnabled(false);
		chkMostrar_AT.SetEnabled(false);
        chkMostrar_SellOut.SetEnabled(false);
		chkMostrar_CAI.SetEnabled(false);        
        chkMesAnterior.SetEnabled(true);
        chkMesmosDias.SetEnabled(true);
    }      
    else if (s.GetSelectedItem().value == 3) {
        chkMostrar_AA.SetChecked(true);
        chkMostrar_AT.SetChecked(true);
		chkMostrar_SellOut.SetChecked(false);
		chkMostrar_CAI.SetChecked(false);
		chkMostrar_AA.SetEnabled(false);
		chkMostrar_AT.SetEnabled(false);
        chkMostrar_SellOut.SetEnabled(false);
		chkMostrar_CAI.SetEnabled(false);        
        chkMesAnterior.SetEnabled(true);
        chkMesmosDias.SetEnabled(true);
	}        
    else if (s.GetSelectedItem().value == 4) {
        chkMostrar_AA.SetChecked(true);
        chkMostrar_AT.SetChecked(true);
		chkMostrar_SellOut.SetChecked(false);
		chkMostrar_CAI.SetChecked(false);
		chkMostrar_AA.SetEnabled(false);
		chkMostrar_AT.SetEnabled(false);
        chkMostrar_SellOut.SetEnabled(false);
		chkMostrar_CAI.SetEnabled(false);       
        chkMesAnterior.SetEnabled(true);
        chkMesmosDias.SetEnabled(true);
	}
	else if (s.GetSelectedItem().value == 5) {
        chkMostrar_AA.SetChecked(true);
        chkMostrar_AT.SetChecked(true);
		chkMostrar_SellOut.SetChecked(false);
		chkMostrar_CAI.SetChecked(false);
		chkMostrar_AA.SetEnabled(false);
		chkMostrar_AT.SetEnabled(false);
        chkMostrar_SellOut.SetEnabled(false);
		chkMostrar_CAI.SetEnabled(false);        
        chkMesAnterior.SetEnabled(true);
        chkMesmosDias.SetEnabled(true);
	}
	else if (s.GetSelectedItem().value == 6){
        chkMostrar_AA.SetChecked(true);
        chkMostrar_AT.SetChecked(true);
		chkMostrar_SellOut.SetChecked(false);
		chkMostrar_CAI.SetChecked(false);
		chkMostrar_AA.SetEnabled(false);
		chkMostrar_AT.SetEnabled(false);
        chkMostrar_SellOut.SetEnabled(false);
		chkMostrar_CAI.SetEnabled(false);        
        chkMesAnterior.SetEnabled(true);
        chkMesmosDias.SetEnabled(true);
	}
	else if (s.GetSelectedItem().value == 7) {
        chkMostrar_AA.SetChecked(true);
        chkMostrar_AT.SetChecked(true);
		chkMostrar_SellOut.SetChecked(false);
		chkMostrar_CAI.SetChecked(false);
		chkMostrar_AA.SetEnabled(false);
		chkMostrar_AT.SetEnabled(false);
        chkMostrar_SellOut.SetEnabled(false);
		chkMostrar_CAI.SetEnabled(false);
        chkMesAnterior.SetEnabled(true);
        chkMesmosDias.SetEnabled(true);
	}
	else if (s.GetSelectedItem().value == 8) {
        chkMostrar_AA.SetChecked(true);
        chkMostrar_AT.SetChecked(true);
		chkMostrar_SellOut.SetChecked(false);
		chkMostrar_CAI.SetChecked(false);
		chkMostrar_AA.SetEnabled(false);
		chkMostrar_AT.SetEnabled(false);
        chkMostrar_SellOut.SetEnabled(false);
		chkMostrar_CAI.SetEnabled(false);
        chkMesAnterior.SetEnabled(true);
        chkMesmosDias.SetEnabled(true);
	}
    else if (s.GetSelectedItem().value == 9) {
        chkMostrar_AA.SetChecked(false);
        chkMostrar_AT.SetChecked(true);
		chkMostrar_SellOut.SetChecked(false);
		chkMostrar_CAI.SetChecked(false);
		chkMostrar_AA.SetEnabled(false);
		chkMostrar_AT.SetEnabled(false);
        chkMostrar_SellOut.SetEnabled(false);
		chkMostrar_CAI.SetEnabled(false); 
        chkMesAnterior.SetEnabled(false);
        chkMesmosDias.SetEnabled(false);
	}

	cbPanel.PerformCallback();
}" CloseUp="function(s, e) {

}" DropDown="function(s, e) {

}" Init="function(s, e) {
	
}" />

                <Items>
                    <dx:ListEditItem Selected="True" Text="Visão 1 - Normal" Value="1" />
                    <dx:ListEditItem Text="Visão 2 - Vendas" Value="2" />
                    <dx:ListEditItem Text="Visão 3 - Vendas e Participação" Value="3" />
                    <dx:ListEditItem Text="Visão 4 - Volume" Value="4" />
                    <dx:ListEditItem Text="Visão 5 - Lucro" Value="5" />
                    <dx:ListEditItem Text="Visão 6 - Lucro com Sell-Out" Value="6" />
                    <dx:ListEditItem Text="Visão 7 - Margem" Value="7" />
                    <dx:ListEditItem Text="Visão 8 - Margem com Sell-Out" Value="8" />
                    <dx:ListEditItem Text="Visão 9 - Meta x Realizado" Value="9" />
                </Items>
            </dx:ASPxComboBox>
        </div>
        
        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
                <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>

                <ClientSideEvents EndCallback="function(s, e) {}" />
                <PanelCollection>
                    <dx:PanelContent runat="server">

                        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" 
                                        KeyFieldName="idSecao"  DataSourceID="SqlDataSource1" Width="99%" Visible="False" ClientInstanceName="grid">
                                        <Toolbars>
                                            <dx:GridViewToolbar>
                                                <Items>
                                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para EXCEL - XLS" />
                                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para EXCEL - XLSX" />
                                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" />
                                                </Items>
                                            </dx:GridViewToolbar>
                                        </Toolbars>
                                        <TotalSummary>

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AT" SummaryType="Sum" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDivergencia_AT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_AT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTotalPerda_AT" SummaryType="Sum" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellout_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AT" SummaryType="Custom" />
                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellout_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorMeta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorMetaLucro" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Venda" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Lucro" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaVlr" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaLucro" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellout_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellout_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal_AA" SummaryType="Custom" />
                                          
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorMetaAg23" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaAg23" SummaryType="Custom" />
                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedio_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedio_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescReal" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioCresc" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n1}%" FieldName="percAtingMetaVlrG" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDiv" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percTotalPerda" SummaryType="Custom" />
                                            
                                        </TotalSummary>
                                        <Columns>                                           

                         

                                            <dx:GridViewBandColumn Caption="Ano Anterior" Name="bandAnoAnterior" 
                                                ToolTip="Exibe informações do Ano Anterior" VisibleIndex="3" 
                                                Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_AA" 
                                                        ToolTip="Volume do Ano Anterior (mesmo período)" VisibleIndex="0" 
                                                        Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#663300">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#5B2E00">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda_AA" 
                                                        ToolTip="Valor da venda do ano anterior (mesmo período)" VisibleIndex="1" 
                                                        Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#5B2E00">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#5B2E00">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="percMargemSellout_AA" 
                                                        VisibleIndex="6" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#F4B800" />
                                                        <CellStyle ForeColor="#996600">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#996600">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg F" FieldName="percMargemFinal_AA" ShowInCustomizationForm="True" VisibleIndex="7" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#F4B800" />
                                                        <CellStyle ForeColor="#996600">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#996600">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Part T" FieldName="percPart_AA" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="8" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#5B2E00">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#5B2E00">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucro_AA" 
                                                        ToolTip="Valor do lucro do ano anterior (mesmo período)" VisibleIndex="2" 
                                                        Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#5B2E00">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#5B2E00">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sell Out" FieldName="vlrLucroSellout_AA" VisibleIndex="3" 
                                                        Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#F4B800" />
                                                        <CellStyle ForeColor="#996600">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#996600">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroFinal_AA" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#F4B800" />
                                                        <CellStyle ForeColor="#996600">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#996600">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg " FieldName="percMargem_AA" ShowInCustomizationForm="True" ToolTip="Percentual de margem do ano anterior (mesmo período)" VisibleIndex="5" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#5B2E00">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#5B2E00">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Part D" FieldName="percPartDepto_AA" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda do Departamento" VisibleIndex="9" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" />
                                                        <CellStyle ForeColor="#5B2E00">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#5B2E00">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                                                                         
                                            <dx:GridViewBandColumn Caption="Ano Atual" Name="bandAnoAtual" 
                                                ToolTip="Exibe as informações de metas de Venda, Margem e Quebra Conhecida (Agenda 23)" 
                                                VisibleIndex="4">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_AT" 
                                                        ToolTip="Volume vendida do período selecionado" 
                                                        VisibleIndex="0" Width="100px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda_AT" 
                                                        ToolTip="Valor de venda do período selecionado" 
                                                        VisibleIndex="1" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="percMargemSellout_AT" 
                                                        VisibleIndex="7" Width="60px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg F" FieldName="percMargemFinal_AT" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final" VisibleIndex="8" Width="70px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Part T" FieldName="percPart_AT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="9" Width="60px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucro_AT" ShowInCustomizationForm="True" ToolTip="Valor do lucro do período selecionado" VisibleIndex="2" Width="100px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="vlrLucroSellout_AT" ShowInCustomizationForm="True" VisibleIndex="4" Width="90px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroFinal_AT" ShowInCustomizationForm="True" VisibleIndex="5" Width="100px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem_AT" ShowInCustomizationForm="True" ToolTip="Percentual de margem do período selecionado" VisibleIndex="6" Width="60px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Part D" FieldName="percPartDepto_AT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda do Departamento" VisibleIndex="10" Width="60px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrAg23" ShowInCustomizationForm="True" ToolTip="Valor da Agenda 23 (Quebra Conhecida)" VisibleIndex="3" Width="80px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                             
                                            <dx:GridViewBandColumn Caption="Meta de Venda" Name="bandMeta"
                                                VisibleIndex="9" ToolTip="Exibe as informações de crescimento de Quantidade, Venda e Lucratividade em relação ao ano anterior." Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda_meta" VisibleIndex="0" 
                                                        Width="110px" ToolTip="Valor de meta de venda do período selecionado">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating." FieldName="percAtingMetaVlr" ShowInCustomizationForm="True" ToolTip="Atingimento entre Realizado versus Meta" VisibleIndex="2" Width="75px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle forecolor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difValorMeta" ShowInCustomizationForm="True" ToolTip="Diferença entre o valor da Meta e o valor do Realizado" UnboundType="Decimal" VisibleIndex="1" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="percAtingMetaVlrG" VisibleIndex="4" Caption="Concluido" Width="100px" >
                                                       
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle HorizontalAlign="Center">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle HorizontalAlign="Center">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewBandColumn Caption="Crescimento em %" Name="bandCrescimento" 
                                                ToolTip="Exibe as informações do ano atual" VisibleIndex="5" Visible="False">
                                                <Columns>

                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc_Venda" 
                                                        ToolTip="Percentual de crescimento de Venda entre periodo atual e periodo do ano anterior" VisibleIndex="0" 
                                                        Width="75px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Vol." FieldName="percCresc_Qtde" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" 
                                                        VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCresc_Lucro" 
                                                        ToolTip="Percentual de crescimento de Lucro entre periodo atual e periodo do ano anterior" 
                                                        VisibleIndex="2" Width="75px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <%--<dx:GridViewDataTextColumn Caption="Cliente 2017" FieldName="numCliente_AA" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" 
                                                        VisibleIndex="4" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>--%>

                                                   <%-- <dx:GridViewDataTextColumn FieldName="precoMedioCresc" ShowInCustomizationForm="True"  VisibleIndex="5" Caption="% Cresc">
                                                         <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>--%>
                                                     
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                            
                                            <dx:GridViewDataTextColumn FieldName="descId" VisibleIndex="1" 
                                                Caption="Seção / Departamento" Width="200px" FixedStyle="Left">
                                                <Settings AutoFilterCondition="Contains" />
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Caption="CAI Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="13" Visible="False" Name="bandCAI_AnoAnterior">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrCAI_AA" ShowInCustomizationForm="True" ToolTip="Valor do CAI do ano anterior" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCAI_AA" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="CAI Ano Atual" ShowInCustomizationForm="True" VisibleIndex="14" Visible="False" Name="bandCAI_AnoAtual">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrCAI_AT" ShowInCustomizationForm="True" ToolTip="Valor do CAI do ano atual" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCAI_AT" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewBandColumn Caption="Meta de Lucro" Name="bandMetaLucro" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucro_meta" ShowInCustomizationForm="True" ToolTip="Meta de lucro" VisibleIndex="0" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difValorMetaLucro" ShowInCustomizationForm="True" ToolTip="Diferença entre o valor da Meta de Lucro e o valor do Realizado do Lucro" UnboundType="Decimal" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingMetaLucro" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Meta de Margem" Name="bandMetaMargem" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem_meta" ShowInCustomizationForm="True" ToolTip="Diferença entre o percentual margem realizado versus o percentual margem da meta." VisibleIndex="0" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difPercMargem" ShowInCustomizationForm="True" ToolTip="Diferença do Realizado x Meta da Margem " UnboundType="Decimal" VisibleIndex="1" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewBandColumn Caption="Meta de Agenda 23" ShowInCustomizationForm="True" VisibleIndex="12" Name="bandMetaAg23" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrAg23_meta" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difValorMetaAg23" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingMetaAg23" ShowInCustomizationForm="True" ToolTip="Percentual de Atingimento" UnboundType="Decimal" VisibleIndex="2" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                            <dx:GridViewDataTextColumn Caption="Código" FieldName="idSecao" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="0" Width="70px" Visible="False">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Caption="Preço Médio" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2018" FieldName="precoMedio_AA" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2019" FieldName="precoMedio_AT" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" VisibleIndex="1" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn Caption="Inflação &lt;br&gt; Interna" FieldName="precoMedioCresc" ShowInCustomizationForm="True" VisibleIndex="7" Width="70px" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#666666" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Cresc &lt;br&gt; Real" FieldName="percCrescReal" ShowInCustomizationForm="True" VisibleIndex="8" Width="75px" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#666666" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Caption="Perdas" ShowInCustomizationForm="True" VisibleIndex="2">
                                                <HeaderStyle BackColor="Red" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Divergência" FieldName="vlrDivergencia_AT" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrAg23_AT" ShowInCustomizationForm="True" VisibleIndex="2">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Total Perda" FieldName="vlrTotalPerda_AT" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="4">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percTotalPerda" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="5">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percDiv" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="3">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                        </Columns>
                                        <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged();
	
	alert (&quot;Esta Visivle sem IF&quot;);
}" RowDblClick="function(s, e) {
	cbPanel2.PerformCallback();

	

	
}" />
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control"  />
                                        <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged();
	

}" RowDblClick="function(s, e) {
	cbPanel2.PerformCallback();

}" />
                                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>

                                        <FormatConditions>
                                            <dx:GridViewFormatConditionIconSet FieldName="percAtingMetaVlr" Format="PositiveNegativeTriangles" ShowInColumn="percAtingMetaVlr" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCrescReal" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Venda" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Lucro" Format="PositiveNegativeArrowsColored" />
                                        </FormatConditions>
                                        <Styles>
	                                        <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF" Font-Bold="True"> </FocusedRow>
	                                        <Header HorizontalAlign="Center" Font-Size="Small"></Header>
	                                        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Cell Font-Size="Small"></Cell>
                                            <Footer Font-Bold="True"></Footer>
                                        </Styles>                                        
                                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                            />
                                    </dx:ASPxGridView>                        

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Dia.SLV004_Perdas" SelectCommandType="StoredProcedure" CacheExpirationPolicy="Absolute" EnableCaching="False" >
                            <SelectParameters>
                                <asp:SessionParameter Name="DiaInicial_AT" SessionField="sDATA_INICIAL" DbType="Date" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal_AT" SessionField="sDATA_FINAL" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="MesmosDias" SessionField="sMESMOSDIAS" Type="Byte" />                           
                                <asp:SessionParameter Name="Matricula" SessionField="sMATRICULA" Type="String" DefaultValue="0" />
                                <asp:SessionParameter Name="MesAnterior" SessionField="sMES_ANTERIOR" Type="Byte" DefaultValue="1" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                     
                        <asp:Label ID="lbl_cpPanel1" runat="server" Text="" Visible="false"></asp:Label>

                        <dx:ASPxTextBox ID="txtTipoFilial" runat="server" Width="170px" ClientInstanceName="TipoFilial"></dx:ASPxTextBox>

                        <br />
                        <br />

                                               
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>


            <dx:ASPxCallbackPanel ID="cbPanel2" runat="server" Width="100%" ClientInstanceName="cbPanel2" Visible="false"  Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
                <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                                
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttributes="both">

                       <dx:ASPxGridView ID="grid2" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="" EnableTheming="True" Theme="SoftOrange" ClientInstanceName="grid2" >
                            <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged_Item();
}" RowDblClick="function(s, e) {
	cpGraph.PerformCallback();
	
	
	 
}" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>

                            <Styles>
	                            <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF" Font-Bold="True"> </FocusedRow>
	                            <Header HorizontalAlign="Center" Font-Size="Small"></Header>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                <Cell Font-Size="Small"></Cell>
                                <Footer Font-Bold="True"></Footer>
                            </Styles>

                            <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" />
                            <SettingsBehavior AllowFocusedRow="True" />
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="descId" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Filial" FixedStyle="Left" Width="200px">
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdVendas" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrVenda_AT" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Vendas">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroReal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroComercial" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroCondor" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="numCliente" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroSellOut" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrCAI" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrMAI" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrLucroTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeAgenda23" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="13" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeAgenda51" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="14" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrAgenda51" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="15" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeAgenda52" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="16" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrAgenda52" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="17" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeDivergencia" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="18" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="QtdeTotalPerda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="21" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Perdas" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <HeaderStyle BackColor="Red" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Divergência" FieldName="vlrDivergencia_AT" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrAg23_AT" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Total Perda" FieldName="vlrTotalPerda_AT" ReadOnly="True" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="4">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percDiv" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percTotalPerda" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="5">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Red" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="22">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTotalPerda_AT" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_AT" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDivergencia_AT" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AT" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDiv" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percTotalPerda" SummaryType="Custom" />

                            </TotalSummary>
                        </dx:ASPxGridView>
                       
                       <asp:SqlDataSource ID="DSGrid2" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="vw_Venda_por_Secao_Loja_a_Loja" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia_Inicial" SessionField="sDATA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="Dia_Final" SessionField="sDATA_FINAL" />
                                <asp:SessionParameter Name="idProdutoSecao" SessionField="sPRODUTO_SECAO" Type="Int16" />
                                <%--<asp:ControlParameter ControlID="lblSecao" DbType="int16" Name="idProdutoSecao" PropertyName="Text"  />--%>
                                
                            </SelectParameters>
                        </asp:SqlDataSource>              
                        
                       <asp:SqlDataSource ID="DSGrid2_Item" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="usp_Buscar_Quebra_Venda_por_Loja_Item" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia_Inicial" SessionField="sDATA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="Dia_Final" SessionField="sDATA_FINAL" />
                                <asp:SessionParameter Name="idProdutoSecao" SessionField="sPRODUTO_SECAO" Type="Int16" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                <%--<asp:ControlParameter ControlID="lblSecao" DbType="int16" Name="idProdutoSecao" PropertyName="Text"  />--%>
                                
                            </SelectParameters>
                        </asp:SqlDataSource>                             
                              
                    <br />



                </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>


             <dx:ASPxCallbackPanel ID="cpGraph" runat="server" Width="100%" ClientInstanceName="cpGraph" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
                <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                                
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttributes="both">

                        <div id="div_Grafico">

                            <dx:WebChartControl ID="graph_item" runat="server" DataSourceID="dsGrafico" Width="1400px" Height="600px" SideBySideBarDistanceFixed="0" ClientInstanceName="graph_item">

                                <DiagramSerializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" visibility="True" title-font="Tahoma, 9.75pt">
                                            <qualitativescaleoptions autogrid="False" />
                                            <autoscalebreaks maxcount="1" />
                                            <tickmarks minorvisible="False" />
                                            <label angle="90">
                                            <resolveoverlappingoptions allowhide="False" minindent="10" />
                                            </label>
                                            <numericscaleoptions autogrid="False" />
                                        </axisx>
                                        <axisy visibleinpanesserializable="-1">
                                        </axisy>
                                    </cc1:XYDiagram>
                                </DiagramSerializable>
<Legend Name="Default Legend" Visibility="False"></Legend>
                                <SeriesSerializable>
                                    <cc1:Series ArgumentDataMember="FilialDesc" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Ascending" SeriesPointsSortingKey="Value_1" ValueDataMembersSerializable="vlrTotalPerda" ArgumentScaleType="Qualitative" LegendName="Default Legend">
                                        <labelserializable>
                                            <cc1:SideBySideBarSeriesLabel Position="Top" TextPattern="{V:n0}" LineLength="5" ResolveOverlappingMode="Default">
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                    </cc1:Series>
                                </SeriesSerializable>

                            </dx:WebChartControl>

                            <asp:SqlDataSource ID="dsGrafico" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="usp_Buscar_Quebra_Item_Todas_Lojas" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter DbType="Date" Name="Dia_Inicial" SessionField="sDATA_INICIAL" />
                                    <asp:SessionParameter DbType="Date" Name="Dia_Final" SessionField="sDATA_FINAL" />
                                    <asp:SessionParameter Name="idProduto" SessionField="sPRODUTO" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>

                        <asp:Label ID="lblGraph" runat="server" Text="Label"></asp:Label>

                            </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

        </div>

        <dx:ASPxCallbackPanel ID="cbPanelSecao" runat="server" Width="100%" ClientInstanceName="cbPanelSecao" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
                <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                            
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent3" runat="server" SupportsDisabledAttributes="both">

                        <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>
                        <dx:ASPxLabel ID="lblTipoFilial" runat="server" Text="" ClientInstanceName="lblTipoFilial"></dx:ASPxLabel>

                         <dx:ASPxTextBox ID="lblSecao" runat="server" Width="100px" ClientInstanceName="label" ReadOnly="True"> <Border BorderStyle="None" />
                        </dx:ASPxTextBox>

                        <dx:ASPxTextBox ID="lblProduto" runat="server" Width="100px" ClientInstanceName="lblProduto" ReadOnly="True"> <Border BorderStyle="None" />
                        </dx:ASPxTextBox>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Banco: DW_Condor_One" Anotacao2="Stored Procedure: Vendas_Dia.SLV004" />

    </div>
   
</asp:Content>

