<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="SLV005_MP.aspx.vb" Inherits="MemberPages_SLV_SLV005_MP" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register Src="~/Controles/wucMercadologico.ascx" TagPrefix="uc1" TagName="wucMercadologico" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucOpcoesSLV.ascx" TagPrefix="uc1" TagName="wucOpcoesSLV" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css" >

        html {            
            overflow-x:hidden;            
        }

        #moldura {
            width:1024px; 
            margin: 0 auto ;                      
        }

        #divFilial { 
           float: left;           
           width: 318px;
           padding-left: 2px;
           margin-left: 2px;           
              
        }

        #divPeriodo { 
           float: left;                                    
           padding-left: 2px;  
           width: 330px;    
           margin-left: 3px;                             
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 25px;
            margin-left: 1px;  
            margin-top: 2px;          
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

        #divBotaoExcel {   
            float:left ;                    
            width: 80px;  
            padding-top: 2px;   
            margin-left: -6px;                                         
        }

        #divSize {
            float:left ;  
            margin-left: 5px;
            margin-top: 2px;
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
            margin-left: 2px;           
            width: 100px;
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
            width: 1015px;
            margin-left: 1px;            
        }    
        
        #divSizeTitulo {
            float: left;
            margin-left:25px;
            margin-top: 5px;
        }            

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <%--<div id="moldura">--%>

        <div id="divFilial" class="myBorder">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>

        <div id="divPeriodo" class="myBorder">
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" >
                <ClientSideEvents Click="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="divBotaoExcel">
            <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="grid" ClientInstanceName="Excel_Real" />            
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

        <div id="divExibir_SellOut">
            <dx:ASPxCheckBox ID="chkMostrar_SellOut" runat="server" Text="Ver Sell-Out" Theme="DevEx" CheckState="Unchecked" Width="110px" ClientInstanceName="chkMostrar_SellOut" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div> 

        <div id="divExibir_CAI">
            <dx:ASPxCheckBox ID="chkMostrar_CAI" runat="server" Text="Ver CAI" Theme="DevEx" CheckState="Unchecked" Width="90px" ClientInstanceName="chkMostrar_CAI" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>  

        <div id="divFixarCabecalho" >
            <dx:ASPxCheckBox ID="chkFixarCabecalho" runat="server" Text="Fixar Cabeçalho" Checked="true" Theme="DevEx" Width="130px">
                 <ClientSideEvents CheckedChanged="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div> 
            
        <div id="divExibirMesmosDias">
            <dx:ASPxCheckBox ID="chkMostrar_MesmosDias" runat="server" Text="Mesmos Dias" Theme="DevEx" CheckState="Unchecked" Width="115px" ClientInstanceName="chkMostrar_MesmosDias" ForeColor ="blue"  >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxCheckBox> 
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
        Excel_Real.SetVisible(true);                    	
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
        Excel_Real.SetVisible(true);
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
        Excel_Real.SetVisible(true);
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
        Excel_Real.SetVisible(true);
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
        Excel_Real.SetVisible(true);
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
        Excel_Real.SetVisible(true);
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
        Excel_Real.SetVisible(true);
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
        Excel_Real.SetVisible(true);
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
        Excel_Real.SetVisible(false);       
	}

	cbPanelGrid.PerformCallback();
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
                </Items>
            </dx:ASPxComboBox>
        </div>

        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="1020px" ClientInstanceName="cbPanelGrid" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
                <ClientSideEvents EndCallback="function(s, e) {
		
}" />
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
                                        EnableTheming="True" Theme="SoftOrange" 
                                        KeyFieldName="idSecao" Visible="False" DataSourceID="SqlDataSource1" Width="1000px">
                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellout_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellout_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AT" SummaryType="Custom" />                                          
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Venda" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Lucro" SummaryType="Custom" />                                                                              
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellout_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellout_AA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal_AA" SummaryType="Custom" />
                                        </TotalSummary>
                                        <Columns>                                           

                         

                                            <dx:GridViewBandColumn Caption="Ano Anterior" Name="bandAnoAnterior" 
                                                ToolTip="Exibe informações do Ano Anterior" VisibleIndex="2" 
                                                Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_AA" 
                                                        ToolTip="Volume do Ano Anterior (mesmo período)" VisibleIndex="0" 
                                                        Width="90px">
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
                                                        Width="90px">
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
                                                VisibleIndex="3">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_AT" 
                                                        ToolTip="Volume vendida do período selecionado" 
                                                        VisibleIndex="0" Width="90px">
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
                                                        VisibleIndex="1" Width="100px">
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
                                                        VisibleIndex="6" Width="60px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg F" FieldName="percMargemFinal_AT" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final" VisibleIndex="7" Width="70px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Part T" FieldName="percPart_AT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="8" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucro_AT" ShowInCustomizationForm="True" ToolTip="Valor do lucro do período selecionado" VisibleIndex="2" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="vlrLucroSellout_AT" ShowInCustomizationForm="True" VisibleIndex="3" Width="90px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroFinal_AT" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#84C1FF" />
                                                        <CellStyle ForeColor="#0984FF">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#0984FF">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem_AT" ShowInCustomizationForm="True" ToolTip="Percentual de margem do período selecionado" VisibleIndex="5" Width="60px">
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
                                                    <dx:GridViewDataTextColumn Caption="Part D" FieldName="percPartDepto_AT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda do Departamento" VisibleIndex="9" Width="60px">
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
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                             
                                            <dx:GridViewBandColumn Caption="Crescimento em %" Name="bandCrescimento" 
                                                ToolTip="Exibe as informações do ano atual" VisibleIndex="4 ">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc_Venda" 
                                                        ToolTip="Percentual de crescimento de Venda entre periodo atual e periodo do ano anterior" VisibleIndex="0" 
                                                        Width="60px">
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
                                                        VisibleIndex="2" Width="60px">
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

                                            <dx:GridViewBandColumn Caption="CAI Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False" Name="bandCAI_AnoAnterior">
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
                                            <dx:GridViewBandColumn Caption="CAI Ano Atual" ShowInCustomizationForm="True" VisibleIndex="9" Visible="False" Name="bandCAI_AnoAtual">
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

                                            <dx:GridViewDataTextColumn Caption="Código" FieldName="idSecao" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="0" Width="70px" Visible="False">
                                            </dx:GridViewDataTextColumn>

                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                        <Styles>
	                                        <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF" Font-Bold="True"> </FocusedRow>
	                                        	<Header HorizontalAlign="Center" Font-Size="Small">
                                            </Header>
	                                        	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Cell Font-Size="Small">
                                            </Cell>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                        </Styles>                                        
                                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                            />
                                    </dx:ASPxGridView>                           

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Dia.SLV004_MP" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="DiaInicial_AT" SessionField="sDATA_INICIAL" DbType="Date" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal_AT" SessionField="sDATA_FINAL" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="MesmosDias" SessionField="sMESMOSDIAS" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>                        

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

   <%-- </div>--%>
   
</asp:Content>

