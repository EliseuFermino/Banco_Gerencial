    <%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="appQuebras003.aspx.vb" Inherits="MemberPages_appQuebras003" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucMercadologico.ascx" TagPrefix="uc1" TagName="wucMercadologico" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>

<%@ Register Src="~/Controles/wucOpcoesSLV.ascx" TagPrefix="uc1" TagName="wucOpcoesSLV" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucMercadologicoNew.ascx" TagPrefix="uc1" TagName="wucMercadologicoNew" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >
        
        #divMercadologico {
            clear: both;
           float: left;
           margin-left: 1px;           
        }
           
        #divGrafico {            
            float: left;
            padding-top: 5px;                        
        }

        #divBotaoAtualizar {  
            float : left;          
            margin-left: 10px;            
            padding-top: 2px;                                        
        }

         #divExcel {  
            float : left;          
            margin-left: 10px;            
            padding-top: 2px;            
        }

        #divSize {   
            float: left;   
            padding-top: 2px;                                           
        }       

        #divExibir_AnoAnterior {  
            float: left;          
            margin-left: 5px;             
            padding-top: 5px;                                     
        }

        #divExibir_AnoAtual { 
            float: left;           
            margin-left: 5px;         
            padding-top: 5px;                                       
        }

       #divExibir_CAI {      
           float: left;                 
            margin-left: 5px;            
            padding-top: 5px;                                      
        } 
       
       #divExibir_Faltas { 
           float: left;                     
            margin-left: 5px;      
            padding-top: 5px;                                    
        }       
       
       #divFornecedor { 
           float: left;                     
            margin-left: 5px;      
            padding-top: 5px;                                    
        }   
       
        #divDados {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 100%;
            margin-left: 1px;            
        }        

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

         <div id="divFilial" class="BGC_Filial BGC_myBorder" >
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>

        <div id="divPeriodo" class="BGC_Periodo BGC_myBorder" >
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
        </div>

    <div id="divSize">
            <uc1:wucSize runat="server" ID="cboSize" CallSize="100" />
        </div>

        <div id="divMercadologico">             
            <uc1:wucMercadologicoNew runat="server" ID="cboMercadologico" />
        </div>

       

       

        <div id="divOpcaoExibir">
            <div id="divExibir_AnoAnterior">
                <dx:ASPxCheckBox ID="chkMostrar_SellOut" runat="server" Text="Mostrar Sell Out" Theme="DevEx" CheckState="Unchecked" Width="150px" ToolTip="Exibe o Sell Out se houver (clique no botão Atualizar  para exibir ou ocultar as colunas)" >
                    
                </dx:ASPxCheckBox> 
            </div>

            <div id="divExibir_AnoAtual">
                <dx:ASPxCheckBox ID="chkMostrar_MargemFinal" runat="server" Text="Mostrar Margem Final" Theme="DevEx" CheckState="Unchecked" Width="150px" ToolTip="Margem Final = Margem Praticada + Sell Out. (clique no botão Atualizar  para exibir ou ocultar as colunas)" >
                    
                </dx:ASPxCheckBox> 
            </div>


            <div id="divExibir_CAI">
                <dx:ASPxCheckBox ID="chkMostrar_Sobras" runat="server" Text="Mostrar Sobras " Theme="DevEx" CheckState="Unchecked" Width="120px" ToolTip="Exibir a coluna de sobras (Agenda 51).  (clique no botão Atualizar  para exibir ou ocultar as colunas)" >
                    
                </dx:ASPxCheckBox> 
            </div>

            <div id="divExibir_Faltas">
                <dx:ASPxCheckBox ID="chkMostrar_Faltas" runat="server" Text="Mostrar Faltas" Theme="DevEx" CheckState="Unchecked" Width="120px" ToolTip="Exibir a coluna de faltas (Agenda 52). (clique no botão Atualizar  para exibir ou ocultar as colunas)" >
                    
                </dx:ASPxCheckBox> 
            </div>

            <div id="divFornecedor">
                <dx:ASPxCheckBox ID="chkPorFornecedor" runat="server" Text="por Fornecedor" Theme="DevEx" CheckState="Unchecked" Width="150px" ForeColor="Blue" ToolTip="Exibe as quebras por Fornecedor" >
                    
                </dx:ASPxCheckBox> 
            </div>
            
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue" Height="22px">
                <ClientSideEvents Click="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="divExcel">
            <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
        </div>
        

        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="100%" ClientInstanceName="cbPanelGrid" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
<SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsTotal" AutoGenerateColumns="False" EnableTheming="True" Theme="Default" KeyFieldName="rnk" Width="100%" Visible="False">
                         
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qQ" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vQ" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="V" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Q" SummaryType="Sum" />
                                <%--<dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LS" SummaryType="Sum" />--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LC" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LT" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LF" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LS" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qD" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vD" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="q23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="q51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="q52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="I" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pQ" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pM" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pD" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p23" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pMF" SummaryType="Custom" />                                
                            </TotalSummary>
                           
                            <GroupSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="V" ShowInGroupFooterColumn="V" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Q" ShowInGroupFooterColumn="Q" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LC" ShowInGroupFooterColumn="LC" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LC" ShowInGroupFooterColumn="LT" SummaryType="Sum" />
                               <%-- <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LS" ShowInGroupFooterColumn="LS" SummaryType="Sum" />--%>
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LF" ShowInGroupFooterColumn="LF" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="q23" ShowInGroupFooterColumn="q23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v23" ShowInGroupFooterColumn="v23" SummaryType="Sum" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="q51" ShowInGroupFooterColumn="q51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v51" ShowInGroupFooterColumn="v51" SummaryType="Sum" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="q52" ShowInGroupFooterColumn="q52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v52" ShowInGroupFooterColumn="v52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qQ" ShowInGroupFooterColumn="qQ" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vQ" ShowInGroupFooterColumn="vQ" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pQ" ShowInGroupFooterColumn="pQ" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pM" ShowInGroupFooterColumn="pM" SummaryType="Custom" />
                                <%--<dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pMS" ShowInGroupFooterColumn="pMS" SummaryType="Custom" />--%>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pMF" ShowInGroupFooterColumn="pMF" SummaryType="Custom" />
                            </GroupSummary>

                           
                            <Columns>
                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                                <dx:GridViewDataTextColumn FieldName="lista" ReadOnly="True" VisibleIndex="3" Width="175px" Caption="Seção" FixedStyle="Left">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    <HeaderStyle Font-Size="Medium" />
                                    <CellStyle Wrap="False">
                                       
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Venda e Margem" Name="bandVendaMargem" VisibleIndex="6">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="V" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Q" VisibleIndex="0" Width="80px" Caption="Volume" ToolTip="Quantidade Vendida">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="I" VisibleIndex="2" Width="80px" Caption="Impostos" ToolTip="Valor dos Impostos" Visible="False">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 51 (sobras)" Name="bandAgenda51" VisibleIndex="10" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="q51" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="v51" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="p51" ShowInCustomizationForm="True" ToolTip="Percentual das Sobras (Agenda 51) sobre a venda." VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 52 (falta)" Name="bandAgenda52" VisibleIndex="11" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="q52" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="v52" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="p52" ShowInCustomizationForm="True" ToolTip="Percentual das Faltas (Agenda 52) sobre a venda." VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Divergência (dif. 51 e 52)" Name="bandDivergencia" VisibleIndex="12">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="qD" UnboundType="Decimal" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vD" UnboundType="Decimal" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="pD" ShowInCustomizationForm="True" ToolTip="Percentual da Divergência (Agenda 51 - Agenda 52) sobre a venda." VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 23 (lixo)" Name="bandAgenda23" VisibleIndex="13">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="q23" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="v23" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="NotEqual" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="p23" ShowInCustomizationForm="True" ToolTip="Percentual do Lixo (Agenda 23) sobre a venda." VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Final" Name="bandMargemFinal" VisibleIndex="9" ToolTip="Informações da Margem Final" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LT" VisibleIndex="0" Width="80px" ToolTip="Valor da Margem Final (valor da margem praticada + valor do Sell Out)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="pMF" VisibleIndex="1" Width="60px" ToolTip="Percentual da Margem Praticada (% da margem praticada + % do Sell Out)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Total da Perda" Name="bandTotalPerda" ShowInCustomizationForm="True" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="qQ" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <HeaderStyle BackColor="Silver" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vQ" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <HeaderStyle BackColor="Silver" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Perda" FieldName="pQ" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="DoesNotContain" />
                                            <HeaderStyle BackColor="Silver" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle BackColor="Silver" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Sell Out" Name="bandSellOut" ShowInCustomizationForm="True" ToolTip="Valor e Margem do Sell Out" Visible="False" VisibleIndex="8">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LS" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" ToolTip="Informações sobre Margem Praticada" VisibleIndex="7" Name="bandMargemPraticada">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LC" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% " FieldName="pM" ShowInCustomizationForm="True" ToolTip="Percentual de Margem Praticada" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Fornecedor" Name="bandFornecedor" ShowInCustomizationForm="True" VisibleIndex="15">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Nome do Fornecedor" FieldName="nFo" ShowInCustomizationForm="True" ToolTip="Nome do Fornecedor" VisibleIndex="1" Width="150px">
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Código" FieldName="iFo" ShowInCustomizationForm="True" ToolTip="Código do Fornecedor" VisibleIndex="0" Width="70px">
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="CGC" FieldName="cgc" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Fornecedor Principal" FieldName="cgcDesc" ShowInCustomizationForm="True" VisibleIndex="3" Width="150px">
                                            <Settings AutoFilterCondition="Contains" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                                <dx:GridViewBandColumn Caption="Mercadologico" Name="bandMercadologico" ShowInCustomizationForm="True" VisibleIndex="16">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Departamento" FieldName="Depto" ShowInCustomizationForm="True" ToolTip="Nome do Departamento" VisibleIndex="1" Width="150px">
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="Seção" FieldName="Secao" ShowInCustomizationForm="True" ToolTip="Nome da Seção" VisibleIndex="3" Width="150px">
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="Grupo" FieldName="Grupo" ShowInCustomizationForm="True" ToolTip="Nome do Grupo" VisibleIndex="5" Width="150px">
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="Subgrupo" FieldName="Subgrupo" ShowInCustomizationForm="True" ToolTip="Nome do Subgrupo" VisibleIndex="7" Width="150px">
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>

                                    </Columns>
                                </dx:GridViewBandColumn>



                             <%--   <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="13" Width="5px" Visible="False">
                                </dx:GridViewDataTextColumn>--%>
                                <dx:GridViewDataTextColumn Caption="Status" FieldName="Ativo" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="idProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Rnk" FieldName="Rnk" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Ranking ou Posição" VisibleIndex="1" Width="40px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Siste&lt;br&gt;mática" FieldName="Sistematica" ShowInCustomizationForm="True" VisibleIndex="14">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                                    <HeaderStyle BackColor="#CCCCCC" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager PageSize="15">
                            </SettingsPager>
                           
                            <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="400" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" ShowFooter="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" />
                            <SettingsText EmptyDataRow="Não há informações disponíveis ainda para esse período e loja" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                            <SettingsDetail ShowDetailButtons="False" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <Footer Font-Bold="True">
                                </Footer>
                                    <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
                                	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                            </Styles>
                    
                        </dx:ASPxGridView>

                     <asp:SqlDataSource ID="dsSubgrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspBuscarPerdaItem_Subgrupo" SelectCommandType="StoredProcedure" EnableCaching="false">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />  
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />                              
                                <asp:SessionParameter Name="idSubgrupo" SessionField="sMERCADOLOGICO" Type="Int16" />
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
 
                        <asp:SqlDataSource ID="dsGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspBuscarPerdaItem_Grupo" SelectCommandType="StoredProcedure" EnableCaching="false">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                <asp:SessionParameter Name="idGrupo" SessionField="sMERCADOLOGICO" Type="Int16" />
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>                        
  
                        <asp:SqlDataSource ID="dsSecao" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspBuscarPerdaItem_Secao" SelectCommandType="StoredProcedure" EnableCaching="false">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />   
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />                             
                                <asp:SessionParameter Name="idSecao" SessionField="sMERCADOLOGICO" Type="Int16" />
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>                      
  
                        <asp:SqlDataSource ID="dsDepto" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspBuscarPerdaItem_Depto" SelectCommandType="StoredProcedure" EnableCaching="false">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />   
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />                             
                                <asp:SessionParameter Name="idDepto" SessionField="sMERCADOLOGICO" Type="Byte" />
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:SqlDataSource ID="dsTotal" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspBuscarPerdaItem" SelectCommandType="StoredProcedure" EnableCaching="false">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />   
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />     
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Byte" />                       
                                
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <br />
                        <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Banco: gerPerdas" Anotacao2="Procedure: Analises.uspBuscarPerdaItem" />


                        <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>



    
   
</asp:Content>

