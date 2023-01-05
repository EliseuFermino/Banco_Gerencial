<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="SLV001_W.aspx.vb" Inherits="MemberPages_SLV_SLV001_W" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css" >

        #ShowButton {
            float: left;
            margin-left: 5px;            
            padding-top: 6px;    
            padding-left: 5px;                  
        }

        #Filial {
            float: left;
            padding-left: 5px;
            margin-left: 5px;
          }

        #Periodo {
            float: left;
            margin-left: 5px; 
            padding-left: 5px;       
        }

        #divBotaoAtualizar {   
            float: left ;         
            margin-left: 5px;  
            padding-top: 6px;    
            padding-left: 5px;                                        
        }

        #divVisao {
            float:left ;
            margin-left: 5px;
            margin-top : 3px;
            padding-left: 5px;
            padding-top: 4px;
        }

        #divExibir_AnoAnterior {
           clear: both;
           float: left;          
           margin-left: 2px; 
           margin-top: 2px;
           padding-top: 4px;        
        }
        
        #divExibir_AnoAtual {    
            float: left;        
            margin-left: 12px;  
            margin-top: 2px;      
            padding-top: 4px;                                               
        }

        #divExibir_SellOut {  
           float: left;          
           margin-left: 2px; 
           margin-top: 2px;   
           padding-top: 4px;                                        
       }

        #divExibir_Meta {  
           float: left;          
           margin-top: 2px;  
           padding-top: 4px;                                         
       }
        
        #divExibir_CAI {  
           float: left;          
           margin-left: 2px; 
           margin-top: 2px;  
           padding-top: 4px;                                         
       }

        #FixarCabecalho {
            float: left;
            margin-left: 2px;    
            margin-top: 2px;     
            padding-top: 4px;               
        }

        #divExibirMesmosDias {
            float: left;
            margin-left: 15px;
            margin-top: 2px; 
            padding-top: 4px;
        }

        #divSizeTitulo {
            float: left;
            margin-left:10px;
            margin-top: 2px;
            padding-top: 3px;
        }

        #divSize {
            float:left ;  
            margin-left: 2px;  
            padding-top: 5px;         
        }

        #divDados {
            clear: both;
            float: left;
            padding-top: 2px;            
            margin-left: 1px; 
            padding-right: 5px;
            width: 100%;           
        } 

        #Grupo {
            float: left;
            margin-left: 2px;                     
        }

        #Subgrupo {
            float: left;
            margin-left: 2px;                     
        }              

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 25px;
            margin-left: 1px;      
            margin-top: 2px; 
            padding-left: 2px;       
        }

        .Panel_ShowButton {
           
        }

        #divMercadologico_Total {
            float: left;           
        }

        #divMercadologico_Departamento {
            float: left;
            margin-left: 15px;
        }

        #divMercadologico_Secao {
            float: left;
            margin-left: 15px;
        }

        #divMercadologico_Grupo {
            float: left;
            margin-left: 15px;
        }

        #divMercadologico_Subgrupo {
            float: left;
            margin-left: 15px;
        }

        #divLista_Departamento {
            clear: both;
            float: left;
        }

        #divLista_Secao {            
            float: left;
            padding-left: 5px;
        }

        #divLista_Grupo {            
            float: left;
            padding-left: 5px;
        }

        #divLista_Subgrupo {            
            float: left;
            padding-left: 5px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   
        <div id="ShowButton" class="BGC_myBorder" >
            <dx:ASPxButton ID="btnShowButton" runat="server" Text="Mercadologico" AutoPostBack="False" Width="50px"
                Theme="SoftOrange" ClientInstanceName="meuBotao" ClientSideEvents-Click="function(s, e) { MudarTextoBotao(); }">
            </dx:ASPxButton>
        </div>

        <div id="Filial" class="BGC_myBorder">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>

        <div id="Periodo" class="BGC_myBorder"> 
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
        </div>

        <div id="divBotaoAtualizar" class="BGC_myBorder">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue" Height="27px">
                <ClientSideEvents Click="function(s, e) {

cbPanelGrid.PerformCallback();

}" />
            </dx:ASPxButton>
        </div>

        <div id="divVisao" class="BGC_myBorder">
            <dx:ASPxComboBox ID="cboVisao" runat="server" SelectedIndex="0" ClientInstanceName="cboVisao" Theme="Mulberry">
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
	}

	cbPanelGrid.PerformCallback();
}" CloseUp="function(s, e) {

}" DropDown="function(s, e) {

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
                </Items>
            </dx:ASPxComboBox>
        </div>
           
        <div id="divExibir_AnoAnterior">
            <dx:ASPxCheckBox ID="chkMostrar_AA" runat="server" Text="Ver Ano Anterior" Theme="DevEx" CheckState="Unchecked" Width="130px" ClientInstanceName="chkMostrar_AA" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>

        <div id="divExibir_AnoAtual">
            <dx:ASPxCheckBox ID="chkMostrar_AT" runat="server" Text="Ver Ano Atual" Theme="DevEx" CheckState="Checked" Width="120px" ClientInstanceName="chkMostrar_AT" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>

        <div id="divExibir_CAI">
            <dx:ASPxCheckBox ID="chkMostrar_CAI" runat="server" Text="Ver CAI" Theme="DevEx" CheckState="Unchecked" Width="85px" ClientInstanceName="chkMostrar_CAI" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>  
    
        <div id="divExibir_SellOut">
            <dx:ASPxCheckBox ID="chkMostrar_SellOut" runat="server" Text="Ver SellOut" Theme="DevEx" CheckState="Unchecked" Width="110px" ClientInstanceName="chkMostrar_SellOut" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>        
    
        <div id="divExibir_Meta">
            <dx:ASPxCheckBox ID="chkMostrar_Meta" runat="server" Text="Ver Meta" Theme="DevEx" CheckState="Unchecked" Width="95px" ClientInstanceName="chkMostrar_Meta" ForeColor="#009900" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>         
    
        <div id="FixarCabecalho" >
            <dx:ASPxCheckBox ID="chkFixarCabecalho" runat="server" Text="Fixar Cabeçalho" Checked="true" Theme="DevEx">
                 <ClientSideEvents CheckedChanged="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>   

        <div id="divExibirMesmosDias">
            <dx:ASPxCheckBox ID="chkMostrar_MesmosDias" runat="server" Text="Mesmos Dias" Theme="DevEx" CheckState="Unchecked" Width="115px" ClientInstanceName="chkMostrar_MesmosDias" ForeColor ="Blue" 
                ToolTip="Exibe a informação do ano anterior com os mesmos dias da semana ou não. Se você selecionar 'Mesmos dias' será exibido segunda com segunda, terça com terça e assim por diante, se você não selecionar exibirá por dia. " >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>         

        <div id="divSizeTitulo">
            Zoom
        </div>

        <div id="divSize">
            <asp:DropDownList ID="cboSize" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="80">80%</asp:ListItem>
                    <asp:ListItem Value="90">90%</asp:ListItem>
                    <asp:ListItem Value="100">100%</asp:ListItem>                  
                    <asp:ListItem Value="110">110%</asp:ListItem>
                    <asp:ListItem Value="120">120%</asp:ListItem>
                    <asp:ListItem Value="130">130%</asp:ListItem>
                    <asp:ListItem Value="140">140%</asp:ListItem>
                    <asp:ListItem Value="150">150%</asp:ListItem>
                    <asp:ListItem Value="160">160%</asp:ListItem>
                    <asp:ListItem Value="170">170%</asp:ListItem>
                    <asp:ListItem Value="180">180%</asp:ListItem>
                    <asp:ListItem Value="190">190%</asp:ListItem>
                    <asp:ListItem Value="200">200%</asp:ListItem>
             </asp:DropDownList>
        </div>
    
        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="100%" ClientInstanceName="cbPanelGrid" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
<SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttributes="both">

                        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
                                        EnableTheming="True" Theme="SoftOrange" 
                                        KeyFieldName="codId" Visible="False" 
                                        Width="100%" DataSourceID="SqlDataSource1" ClientInstanceName="grid">
                                        <Toolbars>
                                        <dx:GridViewToolbar EnableAdaptivity="true">
                                            <Items>
                                                <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                                <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                                <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação"  />
                                            </Items>
                                        </dx:GridViewToolbar>
                                    </Toolbars>
                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="mAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pmAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="mAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrImpostosAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="percImpostosAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pmAT" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDif_Volume" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDif_Vendas" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDif_LucroPDV" SummaryType="Sum" />                                            

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="mv" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaVlr" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="mm" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pmm" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargem" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescQtde" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescLucro" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="cAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="cAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AA" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="mSOAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pmSOAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="mCAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pmCAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="mSOAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pmSOAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="mCAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pmCAT" SummaryType="Custom" />

                                        </TotalSummary>
                                        <Columns>                                           

                                                                 
                                            <dx:GridViewBandColumn Caption="Ano Anterior" Name="bandAnoAnterior" 
                                                ToolTip="Exibe informações do Ano Anterior" VisibleIndex="2" 
                                                Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="qAA" 
                                                        ToolTip="Volume do Ano Anterior (mesmo período)" VisibleIndex="0" 
                                                        Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#663300">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#663300">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vAA" 
                                                        ToolTip="Valor da venda do ano anterior (mesmo período)" VisibleIndex="1" 
                                                        Width="120px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#663300">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#663300">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="pAA" 
                                                        ToolTip="Percentual de participação da venda da seção sobre a venda total" 
                                                        VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#663300">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#663300">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro " FieldName="mAA" 
                                                        ToolTip="Valor do lucro do ano anterior (mesmo período)" VisibleIndex="3" 
                                                        Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#663300">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#663300">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="mSOAA" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#F4B800" />
                                                        <CellStyle ForeColor="#996600">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#996600">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="mCAA" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#F4B800" />
                                                        <CellStyle ForeColor="#996600">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#996600">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg " FieldName="pmAA" 
                                                        ToolTip="Percentual de margem do ano anterior (mesmo período)" VisibleIndex="6" 
                                                        Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#663300">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#663300">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="pmSOAA" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#F4B800" />
                                                        <CellStyle ForeColor="#996600">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#996600">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg F" FieldName="pmCAA" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#F4B800" />
                                                        <CellStyle ForeColor="#996600">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#996600">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn> <%-- 01 - Dados Ano Anterior--%>

                                            <dx:GridViewBandColumn Caption="Fornecedor" Name="bandFornecedor" 
                                                VisibleIndex="6" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Codigo" FieldName="idf" VisibleIndex="0" 
                                                        Width="60px">
                                                        <Settings AutoFilterCondition="Contains" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Nome" FieldName="nf" VisibleIndex="1" 
                                                        Width="100px">
                                                        <Settings AutoFilterCondition="Contains" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn> <%--Fornecedor--%>

                                           
                                            <dx:GridViewBandColumn Caption="Metas" Name="bandMeta" 
                                                ToolTip="Exibe as informações de metas de Venda, Margem e Quebra Conhecida (Agenda 23)" 
                                                VisibleIndex="8" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="mv" 
                                                        ToolTip="Valor de meta de venda do período selecionado" 
                                                        VisibleIndex="0" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="pmm" 
                                                        ToolTip="Diferença entre o percentual margem realizado versus o percentual margem da meta." 
                                                        VisibleIndex="3" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating." FieldName="percAtingMetaVlr" 
                                                        ToolTip="Atingimento entre Realizado versus Meta" 
                                                        VisibleIndex="1" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difPercMargem" ShowInCustomizationForm="True" ToolTip="Diferença do Realizado x Meta da Margem " UnboundType="Decimal" VisibleIndex="4" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="mm" ShowInCustomizationForm="True" ToolTip="Meta de lucro" VisibleIndex="2" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn> <%--Meta--%>

                                             
                                            <dx:GridViewBandColumn Caption="Crescimento em %" Name="bandCrescimento" 
                                                ToolTip="Exibe as informações de crescimento de Quantidade, Venda e Lucratividade em relação ao ano anterior." VisibleIndex="5">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc" 
                                                        ToolTip="Percentual de crescimento de Venda entre periodo atual e periodo do ano anterior" VisibleIndex="0" 
                                                        Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Vol." FieldName="percCrescQtde" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" 
                                                        VisibleIndex="1" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCrescLucro" 
                                                        ToolTip="Percentual de crescimento de Lucro entre periodo atual e periodo do ano anterior" 
                                                        VisibleIndex="2" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn> <%--% 03 - Crescimento--%>

                                            <dx:GridViewBandColumn Caption="Diferenças em R$" Name="bandDiferencas" 
                                                ToolTip="Exibe as informações de diferenças em R$ em relação ao ano anterior." VisibleIndex="7">
                                                <Columns>

                                                    <dx:GridViewDataTextColumn Caption="Dif. Volume" FieldName="vlrDif_Volume" 
                                                        ToolTip="Diferenças de Volume entre periodo atual e periodo do ano anterior" VisibleIndex="0" 
                                                        Width="110px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />                                                        
                                                        <HeaderStyle BackColor="#666633" />
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Dif. Vendas" FieldName="vlrDif_Vendas" 
                                                        ToolTip="Diferenças de Vendas entre periodo atual e periodo do ano anterior" VisibleIndex="1" 
                                                        Width="110px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />                                                        
                                                        <HeaderStyle BackColor="#666633" />
                                                    </dx:GridViewDataTextColumn>
                                                    
                                                    <dx:GridViewDataTextColumn Caption="Dif. Lucro PDV" FieldName="vlrDif_LucroPDV" 
                                                        ToolTip="Diferença de Lucro PDV entre periodo atual e periodo do ano anterior" VisibleIndex="2" 
                                                        Width="110px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#666633" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#505027" />
                                            </dx:GridViewBandColumn> <%--% 03 - Crescimento--%>

                                            
                                            
                                            <dx:GridViewBandColumn Caption="Ano Atual" Name="bandAnoAtual" ShowInCustomizationForm="True" ToolTip="Exibe as informações do ano atual" VisibleIndex="4">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="qAT" ShowInCustomizationForm="True" ToolTip="Volume vendida do período selecionado" VisibleIndex="0" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vAT" ShowInCustomizationForm="True" ToolTip="Valor de venda do período selecionado" VisibleIndex="1" Width="120px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="pAT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="mAT" ShowInCustomizationForm="True" ToolTip="Valor do lucro do período selecionado" VisibleIndex="3" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="mSOAT" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="mCAT" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="pmAT" ShowInCustomizationForm="True" ToolTip="Percentual de margem do período selecionado" UnboundType="Decimal" VisibleIndex="6" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="pmSOAT" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg F" FieldName="pmCAT" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Impostos" FieldName="vlrImpostosAA" ShowInCustomizationForm="True" VisibleIndex="9" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Imp." FieldName="percImpostos_AT" ShowInCustomizationForm="True" VisibleIndex="10" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn> <%--% 02 - Dados Ano Atual--%>

                                            <dx:GridViewDataTextColumn FieldName="descId" VisibleIndex="1" 
                                                Caption="Seção" Width="150px" FixedStyle="Left">
                                                <Settings AutoFilterCondition="Contains" />
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Caption="CAI Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False" Name="bandCAI_AnoAnterior">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="cAA" ShowInCustomizationForm="True" ToolTip="Valor do CAI do ano anterior" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCAI_AA" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn> <%--% CAI - Ano Anterior --%>

                                            <dx:GridViewBandColumn Caption="CAI Ano Atual" ShowInCustomizationForm="True" VisibleIndex="10" Visible="False" Name="bandCAI_AnoAtual">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="cAT" ShowInCustomizationForm="True" ToolTip="Valor do CAI do ano atual" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCAI_AT" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn> <%--% CAI - Ano Atual --%>

                                            <dx:GridViewDataTextColumn Caption="Código" FieldName="codId" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="0" Width="70px" Visible="False">
                                            </dx:GridViewDataTextColumn>

                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" ></SettingsExport>
                                        <FormatConditions>
                                            <dx:GridViewFormatConditionIconSet FieldName="vlrDif_Volume" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="vlrDif_Vendas" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="vlrDif_LucroPDV" Format="PositiveNegativeArrowsColored" />
                                        </FormatConditions>
                                        <Styles>
	                                        <FocusedRow BackColor="Yellow"  ForeColor="#333333"> </FocusedRow>
	                                        	<Header HorizontalAlign="Center" Font-Size="Small">
                                            </Header>
	                                        	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Cell Font-Size="Small">
                                            </Cell>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                        </Styles>                                        
                                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="300" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" 
                                            UseFixedTableLayout="True" ShowFilterRow="True" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                            />
                                    </dx:ASPxGridView>                          

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Dia.uspSLV001_W" SelectCommandType="StoredProcedure" EnableCaching="False" >
                            <SelectParameters>
                                <asp:SessionParameter Name="f" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter DbType="Date" Name="iAT" SessionField="sDIA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="fAT" SessionField="sDIA_FINAL" />
                                <asp:SessionParameter Name="vOpcao" SessionField="sOPCAO" Type="Byte" />
                                <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />   
                                <asp:SessionParameter Name="MesmosDias" SessionField="sMESMOSDIAS" Type="Byte" />                              
                            </SelectParameters>
                        </asp:SqlDataSource>                        

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>   

   <%-- AQUI COMEÇA A CAIXA DE DIALOGO.--%>
    <dx:ASPxPopupControl ID="popMercadologico" runat="server" LoadContentViaCallback="OnFirstShow" Theme="Metropolis"
                                PopupElementID="ShowButton" PopupVerticalAlign="Below" PopupHorizontalAlign="LeftSides" AllowDragging="True" Width="900px" Height="50px" 
                         HeaderText="Updatable content" ClientInstanceName="ClientPopupControl" ShowRefreshButton="True" SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;">
        <ClientSideEvents Closing="function(s, e) {
	cbPanelMercadologico.PerformCallback();
}" />
        <HeaderTemplate>      
        </HeaderTemplate>

        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl" runat="server">
  <%--              <div style="vertical-align:middle">
                    The content of this popup control is relevant to: <b> <%= DateTime.Now.ToLongTimeString() %></b>
                     <asp:Label ID="lblDados" runat="server" Text="Label"></asp:Label>
                </div>--%>

                    <dx:ASPxCallbackPanel ID="cbPanelMercadologico" runat="server" Width="980px" Theme="Metropolis" ClientInstanceName="cbPanelMercadologico" SettingsLoadingPanel-Delay="150" >
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent1"  runat="server" SupportsDisabledAttributes="both">

                                <div id="divMercadologico_Total">
                                    <dx:ASPxRadioButton ID="rdTotal" runat="server" Text="Total" GroupName="rdMercadologico" Checked="True" ClientInstanceName="rdTotal" Theme="Metropolis" ToolTip="Exibe a venda de todos os departamentos" TextSpacing="2">
                                         <ClientSideEvents CheckedChanged="function(s, e) {
	chkMostrar_Meta.SetEnabled(true);
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divMercadologico_Departamento">
                                    <dx:ASPxRadioButton ID="rdDepartamento" runat="server" Text="Departamento" GroupName="rdMercadologico" ClientInstanceName="rdDepartamento" Theme="Metropolis" ToolTip="Exibe a venda de todas as seções do departamento selecionado" AutoPostBack="False">
                                        <ClientSideEvents CheckedChanged="function(s, e) {
	chkMostrar_Meta.SetEnabled(true);
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divMercadologico_Secao">
                                    <dx:ASPxRadioButton ID="rdSecao" runat="server" Text="Seção" GroupName="rdMercadologico" ClientInstanceName="rdSecao" Theme="Metropolis" ToolTip="Exibe a venda de todos os grupos de familia da seção selecionada" AutoPostBack="False">
                                        <ClientSideEvents CheckedChanged="function(s, e) {
	chkMostrar_Meta.SetChecked(false);
	chkMostrar_Meta.SetEnabled(false);
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>

                                </div>

                                <div id="divMercadologico_Grupo">
                                    <dx:ASPxRadioButton ID="rdGrupo" runat="server" Text="Grupo" GroupName="rdMercadologico" ClientInstanceName="rdGrupo" Theme="Metropolis" ToolTip="Exibe a venda de todas os familias do grupo selecionado" AutoPostBack="False" Width="59px">
                                        <ClientSideEvents CheckedChanged="function(s, e) {
	chkMostrar_Meta.SetChecked(false);
	chkMostrar_Meta.SetEnabled(false);
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divMercadologico_Subgrupo">
                                    <dx:ASPxRadioButton ID="rdSubgrupo" runat="server" Text="Familia" GroupName="rdMercadologico" ClientInstanceName="rdSubgrupo" Theme="Metropolis" ToolTip="Exibe a venda de todos os itens da familia selecionada" AutoPostBack="False">
                                        <ClientSideEvents CheckedChanged="function(s, e) {
	chkMostrar_Meta.SetChecked(false);
	chkMostrar_Meta.SetEnabled(false);
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divLista_Departamento" >
                                    <dx:ASPxListBox ID="cblDepartamento" runat="server" ValueType="System.Int32" ClientInstanceName="cblDepartamento" DataSourceID="dsListaDepartamento" SelectionMode="CheckColumn" TextField="ListaReduzida" ValidateRequestMode="Disabled" ValueField="idDepto" ViewStateMode="Disabled" EnableTheming="True" Height="145px" Theme="DevEx" Visible="False" Width="160px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Departamento" FieldName="ListaReduzida" />
                                        </Columns>
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {	

	if (rdSecao.GetChecked()) {		
		cbPanelMercadologico.PerformCallback();
	}	
}" EndCallback="function(s, e) {
	grid.ShowTitlePanel==true;
	grid.SettingsText.Title=&quot;Eliseu&quot;;
}" />
                                    </dx:ASPxListBox>               

                                    <asp:SqlDataSource ID="dsListaDepartamento" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboDepartamento" SelectCommandType="StoredProcedure">
                                        <SelectParameters>                                            
                                            <asp:SessionParameter Name="Departamento" SessionField="sDEPARTAMENTO" Type="String" />
                                            <asp:SessionParameter Name="Matricula" SessionField="sMATRICULA" Type="String" />                                            
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <div id="divLista_Secao" >
                                    <dx:ASPxListBox ID="cblSecao" runat="server" ValueType="System.Int32" ClientInstanceName="cblSecao" DataSourceID="dsListaSecao" EnableTheming="True" Height="145px" SelectionMode="CheckColumn" TextField="ListaReduzida" Theme="DevEx" ValidateRequestMode="Disabled" ValueField="idSecao" ViewStateMode="Disabled" Visible="False" Width="190px">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	chkMostrar_Meta.SetEnabled(false);
	if (rdGrupo.GetChecked()) {		
		cbPanelMercadologico.PerformCallback();
	}		
}" />
                                            <Columns>                                                
                                                <dx:ListBoxColumn FieldName="ListaReduzida" Caption="Seção" />
                                            </Columns>
                                    </dx:ASPxListBox>
                                    <asp:SqlDataSource ID="dsListaSecao" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboSecaoFiltro_IN" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cblDepartamento" Name="idDepto" PropertyName="Value" Type="Byte" />
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <div id="divLista_Grupo" >
                                    <dx:ASPxListBox ID="cblGrupo" runat="server" ValueType="System.Int32" ClientInstanceName="cblGrupo" DataSourceID="dsListaGrupo" EnableTheming="True" Height="145px" SelectionMode="CheckColumn" TextField="ListaReduzida" Theme="DevEx" ValidateRequestMode="Disabled" ValueField="idGrupo" ViewStateMode="Disabled" Visible="False" Width="290px">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {

	if (rdSubgrupo.GetChecked()) {		
		cbPanelMercadologico.PerformCallback();
	}	

}" />
                                            <Columns>                                                
                                                <dx:ListBoxColumn FieldName="ListaReduzida" Caption="Grupo" />
                                            </Columns>
                                    </dx:ASPxListBox>
                                    <asp:SqlDataSource ID="dsListaGrupo" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboGrupoFiltro_IN" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cblSecao" Name="idSecao" PropertyName="Value" Type="Byte" />
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <div id="divLista_Subgrupo">
                                    <dx:ASPxListBox ID="cblsubgrupo" runat="server" ValueType="System.Int32" ClientInstanceName="cblSubgrupo" DataSourceID="dsListaSubgrupo" EnableTheming="True" Height="145px" SelectionMode="CheckColumn" TextField="ListaReduzida" Theme="DevEx" ValidateRequestMode="Disabled" ValueField="idSubgrupo" ViewStateMode="Disabled" Visible="False" Width="300px">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {}" />
                                            <Columns>                                                
                                                <dx:ListBoxColumn FieldName="ListaReduzida" Caption="Familia" />
                                            </Columns>
                                    </dx:ASPxListBox>
                                    <asp:SqlDataSource ID="dsListaSubgrupo" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboSubgrupoFiltro_IN" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cblGrupo" Name="idGrupo" PropertyName="Value" Type="Int16" />
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>


                                
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                
            </dx:PopupControlContentControl>
        </ContentCollection>

    </dx:ASPxPopupControl>
      
    <asp:Label ID="lblError" runat="server" Text="" ForeColor="red"></asp:Label>
    </asp:Content>

