<%@ Page Title="" Language="VB"  MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="appQuebras009.aspx.vb" Inherits="MemberPages_appQuebras009" %>

<%@ OutputCache Duration="42000" VaryByParam="none" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucMercadologico.ascx" TagPrefix="uc1" TagName="wucMercadologico" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>

<%@ Register Src="~/Controles/wucOpcoesSLV.ascx" TagPrefix="uc1" TagName="wucOpcoesSLV" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css" >


        #divMercadologico {
            clear: both;
           float: left;
           margin-left: 1px;  
           margin-top: 2px;         
        }

        #divFilial {           
          float:left;
          margin-left: 5px;        
        }       

        #divGrafico {            
            float: left;
            padding-top: 5px;                        
        }

        #divBotaoAtualizar { 
            clear: both;
            float:left;         
            padding-top: 5px; 
            margin-left: 208px;                                
        }

        #divOpcaoExibir {   
            float:left;          
            padding-top: 30px; 
            margin-left: 10px;                                
        }

        #divExibir_AnoAnterior {  
            float: left;          
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px;            
            margin-top: -24px;                               
        }

        #divExibir_AnoAtual {  
            float: left;           
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px; 
            margin-left: 158px; 
            margin-top: -24px;                               
        }

       #divExibir_CAI {      
           float: left;       
            width: 155px;  
            padding-top: 2px; 
            margin-left: 328px; 
            margin-top: -24px;                               
        } 
       
       #divExibir_Faltas {            
            width: 155px;  
            padding-top: 2px; 
            margin-left: 458px; 
            margin-top: -24px;                               
        }          
       
        #divDados {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 100%;
            margin-left: 1px;            
        }   
        
        #divSize {           
                    
            margin-left: 1px;   
            margin-left: 823px; 
            margin-top: -24px;                       
        }    
        
        #divExcel {
            float: left ;
            margin-left: 5px;
        }           

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

        <div id="divMercadologico">
             <uc1:wucMercadologico runat="server" ID="cboMercadologico" />
        </div>

        <div id="divFilial" class="BGC_myBorder" >
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>

        <div id="divPeriodo" class="BGC_Periodo BGC_myBorder" >
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
        </div>

        <div id="divSize">
            <uc1:wucSize runat="server" ID="cboSize" CallSize="100"  AutoPostBack="false" />
        </div>

        <div id="divExcel">
            <uc1:wucBotaoExcel runat="server" ID="cboExcel" CallGridViewID="grid" GuiaNome="PGR 92" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue" Height="20px">
                <ClientSideEvents Click="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxButton>
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
                <dx:ASPxCheckBox ID="chkMostrar_Sobras" runat="server" Text="Mostrar Sobras " Theme="DevEx" CheckState="Unchecked" Width="150px" ToolTip="Exibir a coluna de sobras (Agenda 51).  (clique no botão Atualizar  para exibir ou ocultar as colunas)" >
                    
                </dx:ASPxCheckBox> 
            </div>

            <div id="divExibir_Faltas">
                <dx:ASPxCheckBox ID="chkMostrar_Faltas" runat="server" Text="Mostrar Faltas" Theme="DevEx" CheckState="Unchecked" Width="150px" ToolTip="Exibir a coluna de faltas (Agenda 52). (clique no botão Atualizar  para exibir ou ocultar as colunas)" >
                    
                </dx:ASPxCheckBox> 
            </div>
            
        </div>

        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="100%" ClientInstanceName="cbPanelGrid" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
<SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDepto" AutoGenerateColumns="False" EnableTheming="True" Theme="Default" KeyFieldName="lista" Width="100%">
                          
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="V" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="V_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LC" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LC_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pM" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pM_AA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="q51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="q52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v52" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="q51_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v51_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="q52_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v52_AA" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qD" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vD" SummaryType="Sum" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qD_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vD_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="q23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="q23_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v23_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qQ" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vQ" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pQ" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Q" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Q_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LS" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LF" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LS_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LF_AA" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qQ_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vQ_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pQ_AA" SummaryType="Custom" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p51" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p52" SummaryType="Custom" />

                                 <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p51_AA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p52_AA" SummaryType="Custom" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pD" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pD_AA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p23" SummaryType="Custom" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="p23_AA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pMF" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pMS" SummaryType="Custom" />
                                
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pMF_AA" SummaryType="Custom" /> 
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pMS_AA" SummaryType="Custom" />                                                                 
                            </TotalSummary>
                            <Columns>
                                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="lista" ReadOnly="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="1" Width="175px" Caption="Departamento" FixedStyle="Left">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    <HeaderStyle Font-Size="Medium" />
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Venda" Name="bandVendaMargem" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Ano Atual" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Q" ShowInCustomizationForm="True" ToolTip="Quantidade Vendida" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                    <CellStyle ForeColor="Blue">
                                                    </CellStyle>
                                                    <FooterCellStyle ForeColor="Blue">
                                                    </FooterCellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="V" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                    <CellStyle ForeColor="Blue">
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                    </CellStyle>
                                                    <FooterCellStyle ForeColor="Blue">
                                                    </FooterCellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Q_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <CellStyle ForeColor="Blue">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="V_AA" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <CellStyle ForeColor="Blue">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 51 (sobras)" Name="bandAgenda51" VisibleIndex="8" Visible="False">
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="q51_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="v51_AA" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p51_AA" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Ano Atual" ShowInCustomizationForm="True" VisibleIndex="4">
                                            <HeaderStyle BackColor="#CCCCCC" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="q51" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="v51" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
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
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 52 (falta)" Name="bandAgenda52" VisibleIndex="12" Visible="False">
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Ano Atual" ShowInCustomizationForm="True" VisibleIndex="4">
                                            <HeaderStyle BackColor="#CCCCCC" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="q52" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="v52" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
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
                                        <dx:GridViewBandColumn Caption="Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="q52_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="v52_AA" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p52_AA" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Divergência (dif. 51 e 52)" Name="bandDivergencia" VisibleIndex="13">
                                    <HeaderStyle Font-Bold="False" />
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="qD_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vD_AA" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="pD_AA" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Ano Atual" ShowInCustomizationForm="True" VisibleIndex="4">
                                            <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="qD" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vD" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="pD" ShowInCustomizationForm="True" ToolTip="Percentual da Divergência (Agenda 51 - Agenda 52) sobre a venda." VisibleIndex="2" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                    <CellStyle>
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 23 (lixo)" Name="bandAgenda23" VisibleIndex="14">
                                    <HeaderStyle Font-Bold="False" />
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Ano Atual" ShowInCustomizationForm="True" VisibleIndex="4">
                                            <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="q23" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="v23" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p23" ShowInCustomizationForm="True" ToolTip="Percentual do Lixo (Agenda 23) sobre a venda." VisibleIndex="2" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                    <CellStyle>
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="q23_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="v23_AA" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="p23_AA" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Final" Name="bandMargemFinal" VisibleIndex="6" ToolTip="Informações da Margem Final" Visible="False">
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Ano Atual" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <HeaderStyle BackColor="#CCCCCC" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="LF" ShowInCustomizationForm="True" ToolTip="Valor da Margem Final (valor da margem praticada + valor do Sell Out)" VisibleIndex="0" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="pMF" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Praticada (% da margem praticada + % do Sell Out)" VisibleIndex="1" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <CellStyle>
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="LF_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="pMF_AA" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Total da Perda" Name="bandTotalPerda" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Ano Atual" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="qQ" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vQ" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="% Perda" FieldName="pQ" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                    <CellStyle>
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="qQ_AA" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$ " FieldName="vQ_AA" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="% Perda" FieldName="pQ_AA" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Sell Out" Name="bandSellOut" ShowInCustomizationForm="True" ToolTip="Valor e Margem do Sell Out" Visible="False" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Ano Atual" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <HeaderStyle BackColor="#CCCCCC" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="LS" ShowInCustomizationForm="True" ToolTip="Valor do Sell Out" VisibleIndex="0" Width="70px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="pMS" ShowInCustomizationForm="True" ToolTip="Percentual do Sellout" VisibleIndex="1" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <CellStyle>
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="LS_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="pMS_AA" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" ToolTip="Informações sobre Margem Praticada" VisibleIndex="4" Name="bandMargemPraticada">
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Ano Atual" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="LC" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="% " FieldName="pM" ShowInCustomizationForm="True" ToolTip="Percentual de Margem Praticada" VisibleIndex="1" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                    <CellStyle>
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="LC_AA" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="pM_AA" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="15" Width="5px" Visible="False">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                    
                            <Settings ShowFooter="True" HorizontalScrollBarMode="Auto" ShowFilterRow="True" />
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

                        <asp:SqlDataSource ID="dsItem" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspBuscarItem" SelectCommandType="StoredProcedure" EnableCaching="False">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                <asp:SessionParameter Name="idSubgrupo" SessionField="sSUBGRUPO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:SqlDataSource ID="dsSubgrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspBuscarSubgrupo" SelectCommandType="StoredProcedure" EnableCaching="False">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                        <asp:SqlDataSource ID="dsGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspBuscarGrupo" SelectCommandType="StoredProcedure" EnableCaching="False">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="int16" />
                                <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        

                        <asp:SqlDataSource ID="dsSecao" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspBuscarSecao" SelectCommandType="StoredProcedure" EnableCaching="False" >
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL"  />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                <asp:SessionParameter Name="idDepto" SessionField="sDEPTO" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        

                        <asp:SqlDataSource ID="dsDepto" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspBuscarDepartamento" SelectCommandType="StoredProcedure" EnableCaching="False">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:Label ID="lblError" runat="server" Text="Label" ForeColor="Red" Font-Size="Large" Visible="false" ></asp:Label>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>


   
</asp:Content>

