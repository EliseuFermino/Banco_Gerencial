<%@ Page Title="Bazar - Acompanhamento de Vendas Diarias" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaAcompanhamento_Bazar.aspx.vb" Inherits="MemberPages_Vendas_VendaAcompanhamento_Bazar" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web.Designer" TagPrefix="dxchartdesigner" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wuc_KPI_Secao_Depto_Bazar.ascx" TagPrefix="uc1" TagName="wuc_KPI_Secao_Depto_Bazar" %>


<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
   
    <link href="../../css/Dashboard.css" rel="stylesheet" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
      <!-- Ionicons -->
    <link href="../../css/ionicons.min.css" rel="stylesheet" />
    <link href="../../assets/css/fonts.googleapis.com.css" rel="stylesheet" />
    <link href="../../assets/css/ace.min.css" rel="stylesheet" />


  <!-- Font Awesome -->    

    <link href="../../assets/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../assets/css/ace-skins.min.css" rel="stylesheet" />
    <link href="../../assets/css/ace-rtl.min.css" rel="stylesheet" />

    <script src="../../assets/js/ace-extra.min.js"></script>

    

    <style type ="text/css" >
   

        #divGraficoGestor {
            clear: both;
            float: left;
            margin-top: 6px;
            width: 100%;
        }

        #divDia {
            clear: both;
            float: left;
            margin-top: 6px;
        }

        #divVendaAno {
            float: left;
            margin-top: 6px;
            margin-left: 30px;
        }

        #divAtualizar {
            float: left;
            margin-top: 7px;
            margin-left: 30px;            
        }

        #divDados{
            clear:both;
            float: left;
            margin-top: 6px;
            width: 100%;
        }

        #divGraficoMetaRealizado{
            clear:both;
            float: left;
            margin-top: 6px;
            width: 100%;
        }

        #divGraficoMetaRealizadoAno {
             clear:both;
            float: left;
            margin-top: 6px;
            width: 100%;
        }

        #divDadosItens {
            clear: both;
            float: left;
            margin-top: 6px;
            width: 100%;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    

    <div id="divDia">
        <dx:ASPxDateEdit ID="cboDia" runat="server" Theme="Mulberry" AutoPostBack="false" Caption="Dia" Width="115px" EditFormat="Custom" ></dx:ASPxDateEdit>
    </div>

    <div id="divVendaAno">
        <dx:ASPxTextBox ID="txtVendaAno" runat="server" Width="120px" Theme="Mulberry" Caption="Venda no Ano" HorizontalAlign="Center" ReadOnly="True"></dx:ASPxTextBox>
    </div>

    <div id="divAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="MetropolisBlue" Height="30px" Width="100px" AutoPostBack="False">
            <ClientSideEvents Click="function(s, e) {
	cbPanelGrid.PerformCallback();
    cbPanelItens.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divDados">

        <div class="row Quebra_Pagina_Row">
                
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="fa fa-th" ></span> &nbsp Acompanhamento Diario de Vendas, Lucro e Margem <span><asp:Label ID="lblComprador_GR1" runat="server" Text="" ></asp:Label></span> </h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								
                            <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="100%" ClientInstanceName="cbPanelGrid" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
                <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttributes="both">

                        <div id="divGridVendaAcompanhamento">

                           <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
                            AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Descricao" 
                            Theme="SoftOrange" style="margin-bottom: 0px" DataSourceID="dsVendaLoja" Width="100%">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifCresc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestaoVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientes" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOut" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="NumClientes" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaMargem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemFinal" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVendaClube" SummaryType="Sum" />
                                
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" SummaryType="Custom" />                            
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaFunc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="vlrTicketMedio" SummaryType="Custom" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemClube" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOutClube" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="percConclusao" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientesClube" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="vlrTicketMedioClube" SummaryType="Custom" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaCheckout" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMetragem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrQtdeClube" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargemClube" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargemSellOutClube" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDifVenda" SummaryType="Sum" />
                            </TotalSummary>                          
                            <Columns>
                                <dx:GridViewBandColumn Caption="Margem" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta " FieldName="percMetaMargem" 
                                            VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#009900" ForeColor="White" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg &lt;br&gt; PDV" FieldName="percRealMargem" 
                                            VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn 
                                            UnboundType="Decimal" VisibleIndex="2" Caption="Dif." 
                                            FieldName="difMargem"  Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg &lt;br&gt; c/ Sellout" FieldName="percRealMargemSellOut" 
                                            ToolTip="Margem com Sell-Out" VisibleIndex="3" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#CC3300" ForeColor="White" />
                                            <CellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Realizado Ano Anterior" VisibleIndex="1" Name="bandAnoAnterior">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealAA" ToolTip="Venda do Ano Anterior (mesmo dia da semana)" VisibleIndex="0" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% de&lt;br&gt;Cresc" FieldName="percDifCresc" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Desc." FieldName="Descricao" 
                                    VisibleIndex="0" Width="120px" FixedStyle="Left">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Invisivel" Visible="False" VisibleIndex="16">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" 
                                            VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Vendas Financeiras" VisibleIndex="5" 
                                    ToolTip="Grupo de vendas financeiras que compreende: Sugestão, Meta, Realizado e Percentual de Atingimento da Venda Realizada sobre a Meta de Venda.">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="vlrSugestaoVenda" 
                                            VisibleIndex="1" 
                                            ToolTip="Sugestão de vendas calculada com base no hitórico do ano anterior da loja" 
                                            Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#996600">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#996600">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#996600">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nº de &lt;br&gt; Clientes" FieldName="numClientes" ToolTip="Número de clientes que passou na loja." VisibleIndex="7" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle Wrap="True" HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Ticket &lt;br&gt; Médio" FieldName="vlrTicketMedio" ToolTip="Valor do Ticket Médio" UnboundType="Decimal" VisibleIndex="9" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:c}">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Clube Condor" VisibleIndex="6" 
                                
                                    ToolTip="Informações do Clube Condor" 
                                    Name="bcVendaClube">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrRealVendaClube" 
                                            VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg &lt;br&gt; PDV" FieldName="percRealMargemClube" ToolTip="Percentual de Margem do PDV" VisibleIndex="3" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg&lt;br&gt;c/ Sellout" FieldName="percRealMargemSellOutClube" ToolTip="Percentual de Margem com Sell-Out" VisibleIndex="5" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nº de &lt;br&gt; Clientes" FieldName="numClientesClube" ToolTip="Numero de Clientes" VisibleIndex="6" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Ticket &lt;br&gt; Médio" FieldName="vlrTicketMedioClube" ToolTip="Valor do Ticket Médio do Clube" VisibleIndex="7" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:c}">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="vlrQtdeClube" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro &lt;br&gt; PDV" FieldName="vlrRealMargemClube" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro&lt;br&gt;c/ SellOut" FieldName="vlrRealMargemSellOutClube" ShowInCustomizationForm="True" ToolTip="85" VisibleIndex="4" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle BackColor="#3399FF" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Meta x Realizado - Lucro" Name="bandLucratividade1" ToolTip="Grupo de Lucratividade, exibe o quanto de meta de lucro a loja teve dia por dia. Exibe as colunas de Meta, Realizado, Diferença entre a Meta e o Realizado e o Percentual de Atingimento (Realizado dividido pela Meta)" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaMargem" ToolTip="Valor da meta de lucro" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#009900" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingLucro" ToolTip="Percentual de atingimento do lucro (Realizado dividido pela Meta)" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="difLucro" ToolTip="Valor da diferença entre a Meta de Lucro e o Realizado do Lucro." UnboundType="Decimal" VisibleIndex="2" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro &lt;br&gt; PDV" FieldName="vlrRealMargem" ShowInCustomizationForm="True" ToolTip="Valor do realizado do lucro" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#003399" HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="Blue">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn Caption="Lucro &lt;br&gt; Final" FieldName="vlrMargemFinal" ShowInCustomizationForm="True" ToolTip="Lucro Final = ( Lucro PDV + Sellout )" VisibleIndex="4" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Meta x Realizado - Vendas" ShowInCustomizationForm="True" VisibleIndex="2" Name="bandVendaAnoAtual">
                                    <HeaderStyle BackColor="Gray" ForeColor="White" />
                                    <Columns>

                                      <%--  <dx:GridViewDataProgressBarColumn Caption="Concluido" FieldName="percConclusao" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                            <PropertiesProgressBar DisplayFormatString="0.#">
                                            </PropertiesProgressBar>
                                        </dx:GridViewDataProgressBarColumn>--%>

                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" ShowInCustomizationForm="True" ToolTip="Valor da meta revista de venda que foi replanejada." VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#009900" ForeColor="White" HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAting" ShowInCustomizationForm="True" ToolTip="Percentual de atingimento (meta x realizado)" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Gray" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Diferença" FieldName="vlrDifVenda" ShowInCustomizationForm="True" ToolTip="Diferença entre Meta de Venda e o Realizado da Venda" UnboundType="Decimal" VisibleIndex="2" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Gray" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn FieldName="percConclusao" VisibleIndex="4" Caption="Concluido" Width="100px" >
                                            <DataItemTemplate>
                                                <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="SoftOrange" 
                                                    Value='<%#Eval("percConclusao")%>' Width="80px" DisplayFormatString=" 0.0" >
                                                </dx:ASPxProgressBar>
                                            </DataItemTemplate>
                                            <HeaderStyle BackColor="Gray" ForeColor="White" />
                                            <CellStyle HorizontalAlign="Center">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle HorizontalAlign="Center">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>


                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrRealVenda" ShowInCustomizationForm="True" ToolTip="Valor da venda realizada." VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#003399" ForeColor="White" HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="Blue">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>


                                    </Columns>
                                </dx:GridViewBandColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings VerticalScrollableHeight="430"    
                                ShowGroupFooter="VisibleAlways" ShowVerticalScrollBar="True" 
                                ShowFooter="True" HorizontalScrollBarMode="Visible" />
                            <SettingsText EmptyDataRow="Não há vendas realizadas para este dia." />
                               <FormatConditions>
                                   <dx:GridViewFormatConditionIconSet FieldName="percDifCresc" Format="PositiveNegativeArrowsColored" />
                                   <dx:GridViewFormatConditionIconSet FieldName="percAting" Format="PositiveNegativeTriangles" />
                                   <dx:GridViewFormatConditionIconSet FieldName="percAtingLucro" Format="PositiveNegativeTriangles" />
                               </FormatConditions>
                            <Styles>
	                            <FocusedRow BackColor="Yellow" ForeColor="#0066FF"> </FocusedRow>
	                            <Header HorizontalAlign="Center">
                                </Header>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                <Footer Font-Bold="True">
                                </Footer>
                                <TitlePanel BackColor="#4E4E4E" Font-Size="Large">
                                </TitlePanel>
                            </Styles>

                        </dx:ASPxGridView>
                        
                           <asp:SqlDataSource ID="dsVendaLoja" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                            SelectCommand="Vendas.uspBuscarVendaAcompanhamento_Depto" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="dia" SessionField="sDIA" DbType="Date" />
                                                 <asp:SessionParameter Name="idDepto" SessionField="sMERCADOLOGICO" DbType="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                            
                        </div>

                    </dx:PanelContent>
                </PanelCollection>
        </dx:ASPxCallbackPanel>

                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

      </div>  


        <%------------------------------------------------------------------------------------------------------------------------------------------------------%>


    </div>
    
    <div id="divGraficoGestor">

        <div class="row Quebra_Pagina_Row">
                
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="fa fa-bar-chart" ></span> &nbsp Gráfico de Crescimento de Vendas Total do Departamento 3 - Bazar </h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body" >
							<div class="widget-main " style="overflow-x:auto  "  >
								
                               <uc1:wuc_KPI_Secao_Depto_Bazar runat="server" ID="wuc_KPI_Secao_Depto_Bazar" />
                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

      </div>  

        
    </div>

    <div id="divGraficoMetaRealizado">

        <div class="row Quebra_Pagina_Row">
                
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="fa fa-bar-chart" ></span> &nbsp Gráfico de Metas x Realizado <span class="bolder"> por Mês </span>  do Departamento 3 - Bazars</h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main" style="overflow-x:auto  " >
								
                                        <dx:WebChartControl ID="Graph_Mes_Empresa" runat="server" CrosshairEnabled="True" Height="400px" Width="1500px" DataSourceID="ds_Graph_Mes_Empresa" AppearanceNameSerializable="The Trees" PaletteName="Palette 1">
            <DiagramSerializable>
                <cc1:XYDiagram>
                    <axisx minorcount="1" visibility="False" visibleinpanesserializable="-1">
                        <gridlines visible="True">
                        </gridlines>
                    </axisx>
                    <axisy visibility="False" visibleinpanesserializable="-1">
                        <gridlines visible="False">
                        </gridlines>
                    </axisy>
                    <secondaryaxesx>
                        <cc1:SecondaryAxisX Alignment="Near" AxisID="0" MinorCount="1" Name="Secondary AxisX 1" VisibleInPanesSerializable="0">
                            <label font="Tahoma, 9pt, style=Bold">
                            </label>
                            <gridlines visible="True">
                            </gridlines>
                        </cc1:SecondaryAxisX>
                    </secondaryaxesx>
                    <secondaryaxesy>
                        <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" Visibility="False" VisibleInPanesSerializable="0">
                            <constantlines>
                                <cc1:ConstantLine AxisValueSerializable="0" Name="" ShowBehind="True" ShowInLegend="False">
                                </cc1:ConstantLine>
                            </constantlines>
                        </cc1:SecondaryAxisY>
                    </secondaryaxesy>
                    <panes>
                        <cc1:XYDiagramPane Name="Pane 1" PaneID="0">
                        </cc1:XYDiagramPane>
                    </panes>
                </cc1:XYDiagram>
            </DiagramSerializable>
<Legend Name="Default Legend" AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="LeftToRight" Visibility="True"></Legend>
            <SeriesSerializable>
                <cc1:Series ArgumentDataMember="Legenda" LabelsVisibility="True" Name="Meta" ToolTipPointPattern="{V:n0}" ValueDataMembersSerializable="vlrMeta">
                    <labelserializable>
                        <cc1:SideBySideBarSeriesLabel Font="Tahoma, 10pt, style=Bold" Position="BottomInside" TextOrientation="TopToBottom" TextPattern="{V:n0}">
                        </cc1:SideBySideBarSeriesLabel>
                    </labelserializable>
                </cc1:Series>
                <cc1:Series ArgumentDataMember="Legenda" LabelsVisibility="True" Name="Realizado" ValueDataMembersSerializable="vlrReal">
                    <labelserializable>
                        <cc1:SideBySideBarSeriesLabel Font="Tahoma, 10pt, style=Bold" Position="BottomInside" TextOrientation="TopToBottom" TextPattern="{V:n0}">
                        </cc1:SideBySideBarSeriesLabel>
                    </labelserializable>
                </cc1:Series>
                <cc1:Series ArgumentDataMember="Legenda" LabelsVisibility="True" Name="Atingimento" ValueDataMembersSerializable="percAting">
                    <viewserializable>
                        <cc1:StepLineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="128, 100, 162" MarkerVisibility="True" PaneName="Pane 1">
                            <linemarkeroptions size="5">
                            </linemarkeroptions>
                        </cc1:StepLineSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:PointSeriesLabel Font="Tahoma, 10pt, style=Bold" TextPattern="{V:n2}%">
                        </cc1:PointSeriesLabel>
                    </labelserializable>
                </cc1:Series>
            </SeriesSerializable>
            <PaletteWrappers>
                <dx:PaletteWrapper Name="Palette 1" ScaleMode="Extrapolate">
                    <Palette>
                        <cc1:PaletteEntry Color="0, 187, 0" Color2="0, 187, 0" />
                        <cc1:PaletteEntry Color="117, 152, 217" Color2="50, 97, 183" />
                        <cc1:PaletteEntry Color="179, 44, 22" Color2="125, 31, 15" />
                        <cc1:PaletteEntry Color="245, 205, 45" Color2="194, 157, 9" />
                        <cc1:PaletteEntry Color="174, 186, 213" Color2="98, 121, 173" />
                        <cc1:PaletteEntry Color="119, 124, 132" Color2="83, 87, 92" />
                    </Palette>
                </dx:PaletteWrapper>
            </PaletteWrappers>
        </dx:WebChartControl>
        <asp:SqlDataSource ID="ds_Graph_Mes_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" SelectCommand="Depto.usp_Graph_Mes_Empresa" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                <asp:SessionParameter Name="idDepto" SessionField="sMERCADOLOGICO" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>

                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

      </div>  

    </div>

    <div id="divGraficoMetaRealizadoAno">

                <div class="row Quebra_Pagina_Row">
                
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="fa fa-bar-chart" ></span> &nbsp Gráfico de Metas x Realizado <span class="bolder">por Ano</span>  do Departamento 3 - Bazar</h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main" style="overflow-x:auto  " >
								
        <dx:WebChartControl ID="Graph_Ano_Empresa" runat="server" CrosshairEnabled="True" Height="400px" Width="1500px" DataSourceID="ds_Graph_Ano_Empresa" AppearanceNameSerializable="The Trees" PaletteName="Palette 1">
            <DiagramSerializable>
                <cc1:XYDiagram>
                    <axisx minorcount="1" visibility="False" visibleinpanesserializable="-1">
                        <gridlines visible="True">
                        </gridlines>
                    </axisx>
                    <axisy visibility="False" visibleinpanesserializable="-1">
                        <gridlines visible="False">
                        </gridlines>
                    </axisy>
                    <secondaryaxesx>
                        <cc1:SecondaryAxisX Alignment="Near" AxisID="0" MinorCount="1" Name="Secondary AxisX 1" VisibleInPanesSerializable="0">
                            <label font="Tahoma, 9pt, style=Bold">
                            </label>
                            <gridlines visible="True">
                            </gridlines>
                            <numericscaleoptions autogrid="False" />
                        </cc1:SecondaryAxisX>
                    </secondaryaxesx>
                    <secondaryaxesy>
                        <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" Visibility="False" VisibleInPanesSerializable="0">
                            <constantlines>
                                <cc1:ConstantLine AxisValueSerializable="0" Name="" ShowBehind="True" ShowInLegend="False">
                                </cc1:ConstantLine>
                            </constantlines>
                        </cc1:SecondaryAxisY>
                    </secondaryaxesy>
                    <panes>
                        <cc1:XYDiagramPane Name="Pane 1" PaneID="0">
                        </cc1:XYDiagramPane>
                    </panes>
                </cc1:XYDiagram>
            </DiagramSerializable>
<Legend Name="Default Legend" AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="LeftToRight" Visibility="True"></Legend>
            <SeriesSerializable>
                <cc1:Series ArgumentDataMember="Legenda" LabelsVisibility="True" Name="Meta" ToolTipPointPattern="{V:n0}" ValueDataMembersSerializable="vlrMeta">
                    <labelserializable>
                        <cc1:SideBySideBarSeriesLabel Font="Tahoma, 10pt, style=Bold" Position="BottomInside" TextOrientation="TopToBottom" TextPattern="{V:n0}">
                        </cc1:SideBySideBarSeriesLabel>
                    </labelserializable>
                </cc1:Series>
                <cc1:Series ArgumentDataMember="Legenda" LabelsVisibility="True" Name="Realizado" ValueDataMembersSerializable="vlrReal">
                    <labelserializable>
                        <cc1:SideBySideBarSeriesLabel Font="Tahoma, 10pt, style=Bold" Position="BottomInside" TextOrientation="TopToBottom" TextPattern="{V:n0}">
                        </cc1:SideBySideBarSeriesLabel>
                    </labelserializable>
                </cc1:Series>
                <cc1:Series ArgumentDataMember="Legenda" LabelsVisibility="True" Name="Atingimento" ValueDataMembersSerializable="percAting">
                    <viewserializable>
                        <cc1:StepLineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="128, 100, 162" MarkerVisibility="True" PaneName="Pane 1">
                            <linemarkeroptions size="5">
                            </linemarkeroptions>
                        </cc1:StepLineSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:PointSeriesLabel Font="Tahoma, 10pt, style=Bold" TextPattern="{V:n2}%">
                        </cc1:PointSeriesLabel>
                    </labelserializable>
                </cc1:Series>
            </SeriesSerializable>
            <PaletteWrappers>
                <dx:PaletteWrapper Name="Palette 1" ScaleMode="Extrapolate">
                    <Palette>
                        <cc1:PaletteEntry Color="0, 187, 0" Color2="0, 187, 0" />
                        <cc1:PaletteEntry Color="117, 152, 217" Color2="50, 97, 183" />
                        <cc1:PaletteEntry Color="179, 44, 22" Color2="125, 31, 15" />
                        <cc1:PaletteEntry Color="245, 205, 45" Color2="194, 157, 9" />
                        <cc1:PaletteEntry Color="174, 186, 213" Color2="98, 121, 173" />
                        <cc1:PaletteEntry Color="119, 124, 132" Color2="83, 87, 92" />
                    </Palette>
                </dx:PaletteWrapper>
            </PaletteWrappers>
        </dx:WebChartControl>
        <asp:SqlDataSource ID="ds_Graph_Ano_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" SelectCommand="Depto.usp_Graph_Ano_Empresa" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                <asp:SessionParameter Name="idDepto" SessionField="sMERCADOLOGICO" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>

                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

      </div>  


     </div>


    
    <div id="divDadosItens">

        <dx:ASPxCallbackPanel ID="cbPanelItens" runat="server" Width="100%" ClientInstanceName="cbPanelItens" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
                <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttributes="both">

        <div class="row Quebra_Pagina_Row">
                	
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="fa fa-sort-amount-desc" ></span> &nbsp Top 30 por Produto - Lucro Negativo </h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								
                          <dx:ASPxGridView ID="grid_Top30_Lucro_Negativo" runat="server" DataSourceID="ds_Top30_Lucro_Negativo" AutoGenerateColumns="False" Width="100%" KeyFieldName="CodProduto">
                              <Toolbars>
                                <dx:GridViewToolbar EnableAdaptivity="true">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>
                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True"/>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ToolTip="Código do produto" VisibleIndex="2" Width="70px" FixedStyle="Left">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <HeaderStyle BackColor="#999999" />
                                            <CellStyle Font-Bold="True" ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Preço Venda" FieldName="precoVenda" UnboundType="Decimal" VisibleIndex="2" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Praticada" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroComercial" ToolTip="Valor do Lucro Praticado" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ToolTip="Percentual da Margem Praticada" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Nº Cliente" FieldName="numCliente" ToolTip="Número de clientes que compraram o item." VisibleIndex="12" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <Settings AllowAutoFilter="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Sell Out" VisibleIndex="6">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ToolTip="Valor do Sell Out" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ToolTip="Nome do produto" VisibleIndex="3" Width="200px" FixedStyle="Left">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Sell Out - Kit" VisibleIndex="9">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut_Kit" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" VisibleIndex="1" Width="60px">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="10">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final " VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ToolTip="Posição no TOP 10" VisibleIndex="1" Width="30px" FixedStyle="Left">
                                    <Settings AllowAutoFilter="False" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" ShowTitlePanel="True" ShowFilterRow="True" HorizontalScrollBarMode="Visible" />
                              <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <SettingsText Title="Top 30 - Itens com Lucro Negativo na Empresa" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                                <TitlePanel BackColor="#660066" ForeColor="White" Font-Size="X-Large">
                                </TitlePanel>
                            </Styles>
                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="ds_Top30_Lucro_Negativo" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_LucroNegativo_Top10_Empresa_Bazar" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

        </div>  

        <div class="row Quebra_Pagina_Row">
                	
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="fa fa-sort-amount-desc" ></span> &nbsp Top 30 por Produto - Vendas </h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								
                         <dx:ASPxGridView ID="gridItensMaisVendidos" runat="server" DataSourceID="dsItensMaisVendidos" AutoGenerateColumns="False" Width="100%">
                             <Toolbars>
                                <dx:GridViewToolbar EnableAdaptivity="true">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ToolTip="Código do produto" VisibleIndex="1" Width="70px" FixedStyle="Left">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#999999" />
                                            <CellStyle Font-Bold="True" ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Preço Venda" FieldName="precoVenda" UnboundType="Decimal" VisibleIndex="2" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Praticada" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroComercial" ToolTip="Valor do Lucro Praticado" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ToolTip="Percentual da Margem Praticada" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Nº Cliente" FieldName="numCliente" ToolTip="Número de clientes que compraram o item." VisibleIndex="12" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Sell Out" VisibleIndex="6">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ToolTip="Valor do Sell Out" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ToolTip="Nome do produto" VisibleIndex="2" Width="250px" FixedStyle="Left">
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Margem Final" VisibleIndex="10">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ReadOnly="True" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ToolTip="Percentual da Margem Final " VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ToolTip="Posição no TOP 10" VisibleIndex="0" Width="30px" FixedStyle="Left">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" ShowTitlePanel="True" HorizontalScrollBarMode="Visible" />
                             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <SettingsText Title="Top 30 - Itens Mais Vendidos na Empresa" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                                <TitlePanel BackColor="#336600" Font-Size="X-Large">
                                </TitlePanel>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsItensMaisVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Venda_ItemMaisVendido_Top10_Empresa_Bazar" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

        </div>  

        <div class="row Quebra_Pagina_Row">
                
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="fa fa-sort-amount-desc" ></span> &nbsp Top 30 por Produto - Volume </h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								
                                <dx:ASPxGridView ID="gridItensMenosVendidos" runat="server" AutoGenerateColumns="False" DataSourceID="dsItensMenosVendidos" Width="100%">
                                    <Toolbars>
                                <dx:GridViewToolbar EnableAdaptivity="true">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px" FixedStyle="Left">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#999999" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ShowInCustomizationForm="True" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle Font-Bold="True" ForeColor="Blue">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Preço Venda" FieldName="precoVenda" UnboundType="Decimal" VisibleIndex="2" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" VisibleIndex="4">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroComercial" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Praticado" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Praticada" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn Caption="Nº Cliente" FieldName="numCliente" ShowInCustomizationForm="True" ToolTip="Número de clientes que compraram o item." VisibleIndex="12" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewBandColumn Caption="Sell Out" ShowInCustomizationForm="True" VisibleIndex="6">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ShowInCustomizationForm="True" ToolTip="Valor do Sell Out" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ShowInCustomizationForm="True" ToolTip="Nome do produto" VisibleIndex="2" Width="250px" FixedStyle="Left">
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="10">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final " VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição no TOP 10" VisibleIndex="0" Width="30px" FixedStyle="Left">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" ShowTitlePanel="True" HorizontalScrollBarMode="Visible" />
                                    <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                        <SettingsText Title="Top 30 - Volume Mais Vendido na Empresa" />
                                        <Styles>
                                            <Header HorizontalAlign="Center">
                                            </Header>
                                            <AlternatingRow BackColor="#F2F2F2">
                                            </AlternatingRow>
                                            <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                            </FocusedRow>
                                            <TitlePanel Font-Size="X-Large">
                                            </TitlePanel>
                                        </Styles>
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="dsItensMenosVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Volume_ItemMaisVendido_Top10_Empresa_Bazar" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

      </div>  

        <div class="row Quebra_Pagina_Row">
                
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header"><h4 class="widget-title"><span class="fa fa-sort-amount-desc" ></span> &nbsp Top 30 por Produto - Lucro</h4>
						
							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								
                                   <dx:ASPxGridView ID="gridItensMaisVendidosLucro" runat="server" AutoGenerateColumns="False" DataSourceID="dsItensMaisVendidosLucro" Width="100%">
                                       <Toolbars>
                                <dx:GridViewToolbar EnableAdaptivity="true">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px" FixedStyle="Left">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="70px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ShowInCustomizationForm="True" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="90px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle Font-Bold="True" ForeColor="Blue">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Preço Venda" FieldName="precoVenda" UnboundType="Decimal" VisibleIndex="2" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" VisibleIndex="4">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroComercial" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Praticado" VisibleIndex="0" Width="70px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Praticada" VisibleIndex="1" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewDataTextColumn Caption="Nº Cliente" FieldName="numCliente" ShowInCustomizationForm="True" ToolTip="Número de clientes que compraram o item." VisibleIndex="12" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewBandColumn Caption="Sell Out" ShowInCustomizationForm="True" VisibleIndex="6">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ShowInCustomizationForm="True" ToolTip="Valor do Sell Out" VisibleIndex="0" Width="70px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ShowInCustomizationForm="True" ToolTip="Nome do produto" VisibleIndex="2" Width="250px" FixedStyle="Left">
                                                    <CellStyle Wrap="False">
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="10">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0" Width="70px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle BackColor="#999999" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final " VisibleIndex="1" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição no TOP 10" VisibleIndex="0" Width="30px" FixedStyle="Left">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" ShowTitlePanel="True" HorizontalScrollBarMode="Visible" />
                                       <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                            <SettingsText Title="Top 30 - Lucro dos Itens Mais Vendidos na Empresa" />
                                            <Styles>
                                                <Header HorizontalAlign="Center">
                                                </Header>
                                                <AlternatingRow BackColor="#F2F2F2">
                                                </AlternatingRow>
                                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                                </FocusedRow>
                                                <TitlePanel Font-Size="X-Large">
                                                </TitlePanel>
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="dsItensMaisVendidosLucro" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Lucro_ItemMaisVendido_Top10_Empresa_Bazar" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

      </div>  

        <div class="row Quebra_Pagina_Row">
                
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header"><h4 class="widget-title"><span class="fa fa-sort-amount-asc" ></span> &nbsp Top 30 por Produto - Itens Menos Vendidos</h4>
						
							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								
                                <dx:ASPxGridView ID="gridItensMenosVendidosEmpresa" runat="server" AutoGenerateColumns="False" DataSourceID="dsItensMenosVendidosEmpresa" EnableTheming="True" Theme="Default" Width="100%">
                                    <Toolbars>
                                <dx:GridViewToolbar EnableAdaptivity="true">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px" FixedStyle="Left">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="70px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ShowInCustomizationForm="True" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="90px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <HeaderStyle BackColor="#999999" />
                                                                <CellStyle Font-Bold="True" ForeColor="Blue">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Preço Venda" FieldName="precoVenda" UnboundType="Decimal" VisibleIndex="2" Width="80px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <CellStyle>
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>
                                                    <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" VisibleIndex="4">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroComercial" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Praticado" VisibleIndex="0" Width="70px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Praticada" VisibleIndex="1" Width="60px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <CellStyle>
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>
                                                    <dx:GridViewDataTextColumn Caption="Nº Cliente" FieldName="numCliente" ShowInCustomizationForm="True" ToolTip="Número de clientes que compraram o item." VisibleIndex="12" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewBandColumn Caption="Sell Out" ShowInCustomizationForm="True" VisibleIndex="6">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ShowInCustomizationForm="True" ToolTip="Valor do Sell Out" VisibleIndex="0" Width="70px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <CellStyle>
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>
                                                    <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ShowInCustomizationForm="True" ToolTip="Nome do produto" VisibleIndex="2" Width="250px" FixedStyle="Left">
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="10">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0" Width="70px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final " VisibleIndex="1" Width="60px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <CellStyle>
                                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>
                                                    <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição no TOP 10" VisibleIndex="0" Width="30px" FixedStyle="Left">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                                <SettingsPager Mode="ShowAllRecords">
                                                </SettingsPager>
                                                <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" ShowTitlePanel="True" HorizontalScrollBarMode="Visible" />
                                    <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                                <SettingsText Title="Top 30 - Itens Menos Vendidos na Empresa" />
                                                <Styles>
                                                    <Header HorizontalAlign="Center">
                                                    </Header>
                                                    <AlternatingRow BackColor="#F2F2F2">
                                                    </AlternatingRow>
                                                    <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                                    </FocusedRow>
                                                    <TitlePanel BackColor="Red" Font-Size="X-Large">
                                                    </TitlePanel>
                                                </Styles>
                                            </dx:ASPxGridView>
                                            <asp:SqlDataSource ID="dsItensMenosVendidosEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Venda_ItemMenosVendido_Top10_Empresa_Bazar" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

      </div>  

        

                    </dx:PanelContent>
                </PanelCollection>
        </dx:ASPxCallbackPanel>

    </div>

    <%------------------------------------------------------------------------------------------------------------------------------------------------------------%>


    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>   
    <script src="../../plugins/fastclick/fastclick.min.js"></script>   
    <script src="../../dist/js/app.min.js"></script>
    <script src="../../plugins/sparkline/jquery.sparkline.min.js"></script>

    <script src="../../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="../../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>

    
    <script src="../../dist/js/pages/dashboard2.js"></script>
    <script src="../../dist/js/demo.js"></script>


        <script src="../../assets/js/jquery-ui.custom.min.js"></script>
		<script src="../../assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="../../assets/js/chosen.jquery.min.js"></script>
		<script src="../../assets/js/spinbox.min.js"></script>
		<script src="../../assets/js/bootstrap-datepicker.min.js"></script>
		<script src="../../assets/js/bootstrap-timepicker.min.js"></script>
		<script src="../../assets/js/moment.min.js"></script>
		<script src="../../assets/js/daterangepicker.min.js"></script>
		<script src="../../assets/js/bootstrap-datetimepicker.min.js"></script>
		<script src="../../assets/js/bootstrap-colorpicker.min.js"></script>
		<script src="../../assets/js/jquery.knob.min.js"></script>
		<script src="../../assets/js/autosize.min.js"></script>
		<script src="../../assets/js/jquery.inputlimiter.min.js"></script>
		<script src="../../assets/js/jquery.maskedinput.min.js"></script>
		<script src="../../assets/js/bootstrap-tag.min.js"></script>

		<!-- ace scripts -->
		<script src="../../assets/js/ace-elements.min.js"></script>
		<script src="../../assets/js/ace.min.js"></script>


</asp:Content>

