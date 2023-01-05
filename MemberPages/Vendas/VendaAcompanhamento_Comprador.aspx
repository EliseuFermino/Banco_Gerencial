<%@ Page Title="Comprador - Acompanhamento de Vendas Diarias" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaAcompanhamento_Comprador.aspx.vb" Inherits="MemberPages_Vendas_VendaAcompanhamento_Comprador" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web.Designer" TagPrefix="dxchartdesigner" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wuc_KPI_Comprador.ascx" TagPrefix="uc1" TagName="wuc_KPI_Comprador" %>



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

                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="percConclusao" SummaryType="Custom" />
                           

                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaCheckout" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMetragem" SummaryType="Custom" />
                         
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDifVenda" SummaryType="Sum" />
                            </TotalSummary>
                          
                            <Columns>
                                <dx:GridViewBandColumn Caption="Margem" VisibleIndex="6">
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
                                <dx:GridViewBandColumn Caption="Vendas Financeiras" VisibleIndex="4" 
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
                                            SelectCommand="Vendas.uspBuscarVendaAcompanhamento_Comprador" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="dia" SessionField="sDIA" DbType="Date" />
                                                <asp:SessionParameter Name="idComprador" SessionField="sUSUARIO" DbType="String" />
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
    



    
    <div id="divDadosItens">

        <dx:ASPxCallbackPanel ID="cbPanelItens" runat="server" Width="100%" ClientInstanceName="cbPanelItens" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
                <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttributes="both">

        <div class="row Quebra_Pagina_Row">
                	
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="fa fa-sort-amount-desc" ></span> &nbsp Top 30 por Produto - Vendas - Comprador: <span> <asp:Label ID="lblTOP30_Venda" runat="server" Text=""></asp:Label> </span>  </h4>

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
                                        <dx:GridViewDataTextColumn Caption="Preço Venda" FieldName="precoVenda" UnboundType="Decimal" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Praticada" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroComercial" ToolTip="Valor do Lucro Praticado" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ToolTip="Percentual da Margem Praticada" VisibleIndex="1" Width="60px" UnboundType="Decimal">
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
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px" UnboundType="Decimal">
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
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ToolTip="Percentual da Margem Final " VisibleIndex="1" Width="60px" UnboundType="Decimal">
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
                            <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" ShowTitlePanel="True" ShowFooter="True" HorizontalScrollBarMode="Visible" />
                            <SettingsText Title="Top 30 - Itens Mais Vendidos na Empresa" />
                             <TotalSummary>
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Sum" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="percPart" SummaryType="Sum" />
                             </TotalSummary>
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                                <Footer Font-Bold="True">
                                </Footer>
                                <TitlePanel BackColor="#336600" Font-Size="X-Large">
                                </TitlePanel>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsItensMaisVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Comprador.usp_TOP30_Venda" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                <asp:SessionParameter DbType="String" Name="idComprador" SessionField="sUSUARIO" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                                <div style="padding-top:3px">
                        <dx:ASPxLabel ID="lbl_ItensMaisVendidos" runat="server"  ForeColor="Red" Font-Size="Medium" ></dx:ASPxLabel>
                                </div>						
							</div>
						</div>
					</div>
				</div><!-- /.span -->

        </div>  

        <div class="row Quebra_Pagina_Row">
                
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="fa fa-sort-amount-desc" ></span> &nbsp Top 30 por Produto - Volume - Comprador: <span> <asp:Label ID="lblTOP30_Volume" runat="server" Text=""></asp:Label> </span>   </h4>

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
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ShowInCustomizationForm="True" ToolTip="Valor da venda de cada item" VisibleIndex="2" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle Font-Bold="True" ForeColor="Blue">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Preço Venda" FieldName="precoVenda" UnboundType="Decimal" VisibleIndex="3" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" VisibleIndex="4">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroComercial" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Praticado" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Praticada" VisibleIndex="1" Width="60px" UnboundType="Decimal">
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
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px" UnboundType="Decimal">
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
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final " VisibleIndex="1" Width="60px" UnboundType="Decimal">
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
                                        <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" ShowTitlePanel="True" ShowFooter="True" HorizontalScrollBarMode="Visible" />
                                        <SettingsText Title="Top 30 - Volume Mais Vendido na Empresa" />
                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" SummaryType="Custom" />
                                        </TotalSummary>
                                        <Styles>
                                            <Header HorizontalAlign="Center">
                                            </Header>
                                            <AlternatingRow BackColor="#F2F2F2">
                                            </AlternatingRow>
                                            <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                            </FocusedRow>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                            <TitlePanel Font-Size="X-Large">
                                            </TitlePanel>
                                        </Styles>
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="dsItensMenosVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Comprador.usp_TOP30_Volume" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                            <asp:SessionParameter DbType="String" Name="idComprador" SessionField="sUSUARIO" />
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
						<div class="widget-header"><h4 class="widget-title"><span class="fa fa-sort-amount-desc" ></span> &nbsp Top 30 por Produto - Lucro - Comprador: <span> <asp:Label ID="lblTOP30_Lucro" runat="server" Text=""></asp:Label> </span>  </h4>
						
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
                                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Praticada" VisibleIndex="1" Width="60px" UnboundType="Decimal">
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
                                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px" UnboundType="Decimal">
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
                                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final " VisibleIndex="1" Width="60px" UnboundType="Decimal">
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
                                        <asp:SqlDataSource ID="dsItensMaisVendidosLucro" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Comprador.usp_TOP30_LucroFinal" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                                <asp:SessionParameter DbType="String" Name="idComprador" SessionField="sUSUARIO" />
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
						<div class="widget-header"><h4 class="widget-title"><span class="fa fa-sort-amount-asc" ></span> &nbsp Top 30 por Produto - Itens Menos Vendidos - Comprador: <span> <asp:Label ID="lblTOP30_Menos" runat="server" Text=""></asp:Label> </span>  </h4>
						
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
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px" FixedStyle="Left">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="4">
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
                                                    <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" VisibleIndex="5">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroComercial" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Praticado" VisibleIndex="0" Width="70px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Praticada" VisibleIndex="1" Width="60px" UnboundType="Decimal">
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
                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px" UnboundType="Decimal">
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
                                                    <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="9">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0" Width="70px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final " VisibleIndex="1" Width="60px" UnboundType="Decimal">
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
                                                    <dx:GridViewDataTextColumn Caption="Situação" FieldName="Ativo" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="3" Width="100px">
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                                <SettingsPager Mode="ShowAllRecords">
                                                </SettingsPager>
                                                <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" ShowTitlePanel="True" HorizontalScrollBarMode="Visible" />
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
                                            <asp:SqlDataSource ID="dsItensMenosVendidosEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Comprador.usp_TOP30_VendaMenos" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                                     <asp:SessionParameter DbType="String" Name="idComprador" SessionField="sUSUARIO" />
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

