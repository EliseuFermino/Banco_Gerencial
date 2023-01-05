<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="appQuebras010_old.aspx.vb" Inherits="MemberPages_appQuebras010_Old" %>

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

        #divMercadologico {
           float: left;
           margin-left: 1px;           
        }


        #divPeriodo {                                    
           padding-left: 2px;  
           width: 330px;    
           margin-left: 208px; 
           margin-top: -27px;                   
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
            margin-left: 2px;
            width: 80px;  
            padding-top: 2px; 
            margin-left: 208px;                                
        }

        #divBotaoExcel {                     
            width: 80px;  
            padding-top: 2px;   
            margin-left: 278px;
            margin-top: -34px;                              
        }

        #divOpcaoExibir {   
            clear: both;
            float: left;  
            margin-left: 2px;
            width: 405px;  
            padding-top: 20px; 
            margin-left: 208px;                                
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
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px; 
            margin-left: 328px; 
            margin-top: -24px;                               
        } 
       
       #divExibir_Faltas {                      
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px; 
            margin-left: 458px; 
            margin-top: -24px;                               
        }          
       
        #divDados {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 1015px;
            margin-left: 1px;            
        }        

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="moldura">
        <div id="divMercadologico">
             <uc1:wucMercadologico runat="server" ID="cboMercadologico" />
        </div>

        <div id="divPeriodo" class="myBorder">
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" Height="32px">
                <ClientSideEvents Click="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="divBotaoExcel">
            <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="grid" />
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
            <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="1020px" ClientInstanceName="cbPanelGrid" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsGrupo" AutoGenerateColumns="False" EnableTheming="True" Theme="Default" KeyFieldName="lista" Width="1000px">
                           
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="lista" ReadOnly="True" VisibleIndex="0" Width="175px" Caption="Departamento" FixedStyle="Left">
                                    <HeaderStyle Font-Size="Medium" />
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Venda e Margem" Name="bandVendaMargem" VisibleIndex="1">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="V" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Q" VisibleIndex="0" Width="80px" Caption="Volume" ToolTip="Quantidade Vendida">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 51 (sobras)" Name="bandAgenda51" VisibleIndex="5" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="q51" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="v51" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="p51" ShowInCustomizationForm="True" ToolTip="Percentual das Sobras (Agenda 51) sobre a venda." VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 52 (falta)" Name="bandAgenda52" VisibleIndex="8" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="q52" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="v52" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="p52" ShowInCustomizationForm="True" ToolTip="Percentual das Faltas (Agenda 52) sobre a venda." VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
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
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vD" UnboundType="Decimal" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="pD" ShowInCustomizationForm="True" ToolTip="Percentual da Divergência (Agenda 51 - Agenda 52) sobre a venda." VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
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
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="v23" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="p23" ShowInCustomizationForm="True" ToolTip="Percentual do Lixo (Agenda 23) sobre a venda." VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Final" Name="bandMargemFinal" VisibleIndex="4" ToolTip="Informações da Margem Final" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LF" VisibleIndex="0" Width="80px" ToolTip="Valor da Margem Final (valor da margem praticada + valor do Sell Out)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="pMF" VisibleIndex="1" Width="60px" ToolTip="Percentual da Margem Praticada (% da margem praticada + % do Sell Out)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Total da Perda" Name="bandTotalPerda" ShowInCustomizationForm="True" VisibleIndex="14">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="qQ" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vQ" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" SortIndex="0" SortOrder="Ascending">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Perda" FieldName="pQ" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Sell Out" Name="bandSellOut" ShowInCustomizationForm="True" ToolTip="Valor e Margem do Sell Out" Visible="False" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LS" ShowInCustomizationForm="True" ToolTip="Valor do Sell Out" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="pMS" ShowInCustomizationForm="True" ToolTip="Percentual do Sellout" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" ToolTip="Informações sobre Margem Praticada" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LC" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% " FieldName="pM" ShowInCustomizationForm="True" ToolTip="Percentual de Margem Praticada" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="15" Width="5px" Visible="False">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" />
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



                        <asp:SqlDataSource ID="dsGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:tempdbConnectionString %>" SelectCommand="Perdas.uspPerdaLojaVersusLoja_Grupo" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDATA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDATA_FINAL" />
                                <asp:SessionParameter Name="idOpcao" SessionField="sOPCAO" Type="Byte" />
                                <asp:SessionParameter Name="idMercadologico" SessionField="sMERCADOLOGICO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        


                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>



    </div>
   
</asp:Content>

