<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseCategoria.aspx.vb" Inherits="MemberPages_AnaliseCategoria" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register Src="~/Controles/wucMercadologico.ascx" TagPrefix="uc1" TagName="wucMercadologico" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucOpcoesSLV.ascx" TagPrefix="uc1" TagName="wucOpcoesSLV" %>
<%@ Register Src="~/Controles/wucAnoMes.ascx" TagPrefix="uc1" TagName="wucAnoMes" %>
<%@ Register Src="~/Controles/wuciAno.ascx" TagPrefix="uc1" TagName="wuciAno" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>






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
           width: 400px;    
           margin-left: 209px; 
           margin-top: -27px;                   
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 27px;
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
            padding-top: 30px; 
            margin-left: 208px;                                
        }

        #divExibir_AnoAnterior {  
            float: left;          
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px;            
            margin-top: -24px;                               
        }

        #divExibir_Volume {  
            float: left;           
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px; 
            margin-left: 138px; 
            margin-top: -24px;                               
        }

       #divExibir_Lucro {      
           float: left;                 
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px; 
            margin-left: 278px; 
            margin-top: -24px;                               
        } 

       #divExibir_Participacao {      
           float: left;                 
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px; 
            margin-left: 408px; 
            margin-top: -24px;                               
        } 

       #divExibir_PercMargem {      
           float: left;                 
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px; 
            margin-left: 578px; 
            margin-top: -24px;                               
        } 
       
       #divExibir_Class {  
           float: left;            
            width: 125px;  
            margin-top: -25px; 
            margin-left: 398px;                                      
        } 
       
       #divExibir_Status {  
           float: left;                    
            margin-top: -25px; 
            width: 125px;              
            margin-left: 528px;                                         
        }                
       
        #divDados {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 1015px;
            margin-left: 1px;            
        }        

        #divAno {
           float: left;
           margin-left: 1px;           
        }

        #divMesInicial {
           float: left;
           margin-left: 1px;           
        }

        #divMesFinal {
           float: left;
           margin-left: 1px;           
        }

        #divClassificacao {
           float: left;
           margin-left: 2px;   
           margin-left: 308px;  
           margin-top: -29px; 
           width:170px;
           padding-left: 5px;             
        }

        #divCboClassificacao {
            float: left;
            margin-top: -18px;
            margin-left: 80px;
        }

        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="moldura">
        <div id="divMercadologico">
             <uc1:wucMercadologico runat="server" ID="cboMercadologico" />
        </div>

        <div id="divPeriodo" class="myBorder">
            <div id="divAno">
                <uc1:wucAno runat="server" ID="cboAno" />                
            </div>

            <div id="divMesInicial">
                <uc1:wuciListaMes runat="server" ID="cboMesInicial" />
            </div>

            <div id="divMesFinal">
                <uc1:wuciListaMes runat="server" ID="cboMesFinal" />
            </div>
            
        </div>

        <div id="divClassificacao" class="myBorder">
            <div>
                Classificação
            </div>

            <div id="divCboClassificacao">
                <asp:DropDownList ID="cboClassificacao" runat="server">
                    <asp:ListItem Value="1">Venda</asp:ListItem>
                    <asp:ListItem Value="2">Qtde</asp:ListItem>
                    <asp:ListItem Value="3">Lucro</asp:ListItem>
                </asp:DropDownList>
            </div>
            
        </div>
        
        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" Height="32px">
                <ClientSideEvents Click="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="divBotaoExcel">
            <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" />
        </div>

        <div id="divExibir_Class">
            <dx:ASPxCheckBox ID="chkMostrar_Class" runat="server" Text="Mostrar Class." Theme="DevEx" CheckState="Checked" Width="150px" ToolTip="Exibir a coluna de classificação" ForeColor="Blue" >
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanelGrid.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>

        <div id="divExibir_Status">
            <dx:ASPxCheckBox ID="chkMostrar_Status" runat="server" Text="Mostrar Status" Theme="DevEx" CheckState="Checked" Width="150px" ToolTip="Exibir a coluna de status" ForeColor="Green" >
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanelGrid.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>

        <div id="divOpcaoExibir">
            <div id="divExibir_AnoAnterior">
                <dx:ASPxCheckBox ID="chkMostrar_Venda" runat="server" Text="Mostrar Venda" Theme="DevEx" CheckState="Unchecked" Width="150px" ToolTip="Exibe a Venda" >
                                       
                </dx:ASPxCheckBox> 
            </div>

            <div id="divExibir_Volume">
                <dx:ASPxCheckBox ID="chkMostrar_Volume" runat="server" Text="Mostrar Volume" Theme="DevEx" CheckState="Unchecked" Width="150px" >
                    
                </dx:ASPxCheckBox> 
            </div>

            <div id="divExibir_Lucro">
                <dx:ASPxCheckBox ID="chkMostrar_Lucro" runat="server" Text="Mostrar Lucro" Theme="DevEx" CheckState="Unchecked" Width="150px" >
                    
                </dx:ASPxCheckBox> 
            </div>

            <div id="divExibir_Participacao">
                <dx:ASPxCheckBox ID="chkMostrar_Participacao" runat="server" Text="Mostrar Participação" Theme="DevEx" CheckState="Unchecked" Width="150px" >
                    
                </dx:ASPxCheckBox> 
            </div>

            <div id="divExibir_PercMargem">
                <dx:ASPxCheckBox ID="chkMostrar_PercMargem" runat="server" Text="Mostrar % Margem" Theme="DevEx" CheckState="Unchecked" Width="150px" >
                   
                </dx:ASPxCheckBox> 
            </div>


            
        </div>

        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="1020px" ClientInstanceName="cbPanelGrid" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDepto" AutoGenerateColumns="False" EnableTheming="True" Theme="Default" KeyFieldName="nomeProduto" Width="1000px">
                           
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="nomeProduto" ReadOnly="True" VisibleIndex="2" Width="175px" Caption="Nome do Produto" FixedStyle="Left">
                                    <HeaderStyle Font-Size="Medium" />
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Metropolitana" Name="bandMetropolitana" VisibleIndex="4" ToolTip="Região Metropolitana (Lojas 4,5,14,23,30,31,33,38,39)">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Status" FieldName="Cat_RM" VisibleIndex="1" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                                            <CellStyle HorizontalAlign="Center">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Class_RM" VisibleIndex="0" Width="50px" Caption="Class." ToolTip="Quantidade Vendida">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="Venda_RM" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_RM" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#996633">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_RM" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="Part_RM" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#996600">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem_RM" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#0066FF">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                                <dx:GridViewBandColumn Caption="Paranaguá" Name="bandParanagua" VisibleIndex="7" ToolTip="Região Paranaguá (Lojas 8,25)">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Class." FieldName="Class_RP" VisibleIndex="0" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Status" FieldName="Cat_RP" VisibleIndex="1" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                                            <CellStyle HorizontalAlign="Center">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="Venda_RP" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_RP" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#996633">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_RP" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="Part_RP" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#996600">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem_RP" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#0066FF">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                                <dx:GridViewBandColumn Caption="Curitiba" Name="bandCuritiba" VisibleIndex="3" ToolTip="Região Curitiba (Lojas 3,6,7,10,11,13,17,21,22,24,26,27,28,29,34,37)">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Class." FieldName="Class_RC" VisibleIndex="0" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Status" FieldName="Cat_RC" VisibleIndex="1" Width="50px" ToolTip="Percentual de Margem Praticada">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                                            <CellStyle HorizontalAlign="Center">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="Venda_RC" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_RC" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#996633">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_RC" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="Part_RC" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#996600">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem_RC" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#0066FF">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                                <dx:GridViewBandColumn Caption="Norte" Name="bandNorte" VisibleIndex="6" ToolTip="Região Norte (Lojas 9,15,20,40)">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Class." FieldName="Class_RN" VisibleIndex="0" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Status" FieldName="Cat_RN" VisibleIndex="1" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="Venda_RN" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_RN" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#996633">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_RN" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="Part_RN" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#996600">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem_RN" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#0066FF">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                                <dx:GridViewBandColumn Caption="Centro-Oeste" VisibleIndex="5" ToolTip="Região Centro-Oeste (Lojas 18,19,32,36)" Name="bandCentroOeste">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Class." FieldName="Class_RCO" VisibleIndex="0" Width="50px" ToolTip="Valor do Sell Out">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Status" FieldName="Cat_RCO" VisibleIndex="1" Width="50px" ToolTip="Percentual do Sellout">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                                            <CellStyle HorizontalAlign="Center">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="Venda_RCO" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_RCO" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#996633">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro_RCO" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="Part_RCO" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#996600">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem_RCO" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle ForeColor="#0066FF">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                                <dx:GridViewDataTextColumn Caption="Código" FieldName="idProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" ShowInFilterControl="False" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager PageSize="15">
                            </SettingsPager>
                            <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="400" ShowFilterRow="True" />
                            <SettingsText EmptyDataRow="Não há informações disponíveis ainda para esse período e loja" />
                            <SettingsDetail ShowDetailButtons="False" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <Footer Font-Bold="True">
                                </Footer>
                                    <FocusedRow BackColor="#FFFFCC" ForeColor="Black"> </FocusedRow>
                                	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                            </Styles>
                    
                        </dx:ASPxGridView>



                        <asp:SqlDataSource ID="dsDepto" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemMesConnectionString %>" SelectCommand="uspBuscarGestaCategoria" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="MesInicial" SessionField="sMES_INICIAL" Type="Byte" />   
                                <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />                             
                                <asp:SessionParameter Name="Ordem" SessionField="sORDEM" Type="Byte" />
                                <asp:SessionParameter Name="Mercadologico" SessionField="sMERCADOLOGICO" Type="Int16" />
                                <asp:SessionParameter Name="ID" SessionField="sID" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>



    </div>
    
</asp:Content>

