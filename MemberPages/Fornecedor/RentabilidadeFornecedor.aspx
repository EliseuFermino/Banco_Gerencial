    <%@ Page Title="Rentabilidade do Fornecedor" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="RentabilidadeFornecedor.aspx.vb" Inherits="MemberPages_Fornecedor_RentabilidadeFornecedor" %>


    <%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divMesInicial {            
            float: left;
            margin-left: 10px;
        }

        #divMesFinal {            
            float: left;
            margin-left: 10px;
        }

        #divBaseCNPJ {
            float: left;
            margin-left: 5px;
             margin-top: 4px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divShowAgenda {            
            float: left;
            margin-left: 10px;
            margin-top: 4px;
        }

        #divSize {            
            float: left;           
        }


        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divBotaoExcel { 
            clear:both;           
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMesInicial">
        <uc1:wuciListaMes runat="server" ID="cboMesInicial" />
    </div>

    <div id="divMesFinal">
        <uc1:wuciListaMes runat="server" ID="cboMesFinal" />
    </div>

    <div id="divBaseCNPJ">
        <dx:ASPxCheckBox ID="chkBaseCNPJ" runat="server" Theme="DevEx" Text="Base CNPJ" Checked="True" CheckState="Checked" >
            <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divShowAgenda">
        <dx:ASPxCheckBox ID="chkShowAgendas" runat="server" Theme="DevEx" Text="Abrir Rentabilidade por Tipo / Agenda" Checked="false" >
            <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxCheckBox>

    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" CallSize="100" />
    </div>




    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                  
                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" Width="1024px" KeyFieldName="cgcPrincipal">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFornecedor" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOperComl" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOperComl" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percFornecedor" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_67" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_249" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_250" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_257" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_262" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_284" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_322" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_324" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg325_" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_326" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_333" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_347" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_410" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_500" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg_562" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CP_Fidelidade" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CP_Logistica" SummaryType="Sum" /> 
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CP_Publicidade" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CP_Trocas" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CP_Check_Stand" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CP_Compart_Informacoes" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CP_DescontoFinanceiro" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CP_Quebras" SummaryType="Sum" />


                        </TotalSummary>
                        <Columns>
                            <dx:GridViewBandColumn Caption="Total Operação Comercial" Name="bandTotalFinal" ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrOperComl" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="Gray" ForeColor="White" />
                                        <CellStyle Font-Bold="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percOperComl" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="Gray" ForeColor="White" />
                                        <CellStyle Font-Bold="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="Gray" ForeColor="White" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn Caption="Ranking" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="50px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="LessOrEqual" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Código Fornecedor" FieldName="idFornecedor" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px" ToolTip="Código do Fornecedor">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Nome Fornecedor" FieldName="nomeFornecedor" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="3" Width="200px" ToolTip="Nome do Fornecedor">
                                <Settings AutoFilterCondition="Contains" AllowAutoFilter="True" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="CGC Principal" FieldName="cgcPrincipal" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="4" Width="90px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Fornecedor Principal" FieldName="NomeFornecedorPrincipal" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="5" Width="200px">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="&amp;nbsp &amp;nbsp &amp;nbsp &amp;nbsp &amp;nbsp &amp;nbsp &amp;nbsp &amp;nbsp &amp;nbsp &amp;nbsp &amp;nbsp Contas à Receber" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12" Name="bandOperacoes">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Agenda 67 &lt;br&gt; Encarte" FieldName="vlrAg_67" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 67 - Clientes Reembolso Encarte e Publicidade" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 249 &lt;br&gt; Ponta Gondola" FieldName="vlrAg_249" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 249 - Ponta de Gondola" VisibleIndex="1" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 250 &lt;br&gt; Placas" FieldName="vlrAg_250" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 250 - Clientes Reembolso de Placas Promocionais" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 257 &lt;br&gt; Acordo Comercial" FieldName="vlrAg_257" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 257 - Clientes Acordo Comercial Promoções" VisibleIndex="3" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 262 &lt;br&gt; Novos Produtos" FieldName="vlrAg_262" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 262 - Clientes Introdução Novos Produtos" VisibleIndex="4" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 284 &lt;br&gt; Contratos" FieldName="vlrAg_284" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 284 - Clientes Acordo Comercial / Contratos" VisibleIndex="5" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 322 &lt;br&gt; Bonus" FieldName="vlrAg_322" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 322 - Clientes Bonus Especial Devolução" VisibleIndex="6" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 324 &lt;br&gt; Indenização" FieldName="vlrAg_324" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 324 - Clientes Indenização Preço Venda Concorrente" VisibleIndex="7" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 325 &lt;br&gt; Rebaixa Preço" FieldName="vlrAg_325" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 325 - Clientes Rebaixa de Preço x Custo" VisibleIndex="8" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 326 &lt;br&gt; Rebaixa" FieldName="vlrAg_326" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 326 - rebaixa de Preço Financeiro" VisibleIndex="9" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 333 &lt;br&gt; Desconto" FieldName="vlrAg_333" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 333 - Clientes Desconto de Contrato Preço de Venda" VisibleIndex="10" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 347&lt;br&gt; Enxoval" FieldName="vlrAg_347" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 347 - Clientes Enxoval &amp; Inauguração" VisibleIndex="11" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 410 &lt;br&gt; Logistica" FieldName="vlrAg_410" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 410 - Acordo Logistica" VisibleIndex="12" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 500 &lt;br&gt; Sell-Out" FieldName="vlrAg_500" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 500 - Clientes Sell-Out" VisibleIndex="13" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 562 &lt;br&gt; Merchandising" FieldName="vlrAg_562" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Agenda 562 - Merchandising" VisibleIndex="14" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" HorizontalAlign="Left" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Rentabilidade do Fornecedor" ShowInCustomizationForm="True" VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFornecedor" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="#336600">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#336600">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percFornecedor" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="#336600">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#336600">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <CellStyle Font-Bold="True" ForeColor="#3333FF">
                                </CellStyle>
                                <FooterCellStyle ForeColor="#3333FF">
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucro" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Total Operação Comercial" ShowInCustomizationForm="True" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrOperComl" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="Gray" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percOperComl" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="Gray" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="Gray" ForeColor="White" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="% Margem" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Contas à Pagar" Name="bandContasPagar" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Fidelidade" FieldName="CP_Fidelidade" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="Silver" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Logística" FieldName="CP_Logistica" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="Silver" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Publicidade" FieldName="CP_Publicidade" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="Silver" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Trocas" FieldName="CP_Trocas" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="Silver" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Check&lt;br&gt;Stand" FieldName="CP_Check_Stand" ShowInCustomizationForm="True" VisibleIndex="4" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Compart&lt;br&gt;Informações" FieldName="CP_Compart_Informacoes" ShowInCustomizationForm="True" VisibleIndex="5" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descontos&lt;br&gt;Financeiros" FieldName="CP_DescontoFinanceiro" ShowInCustomizationForm="True" VisibleIndex="6" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Quebras" FieldName="CP_Quebras" ShowInCustomizationForm="True" VisibleIndex="7" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="Silver" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager PageSize="20">
                            <Summary AllPagesText="Pages: {0} - {1} ({2} fornecedores)" Text="Page {0} of {1} ({2} fornecedores)" />
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="400" ShowFooter="True" ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Fornecedor.uspAnaliseRentabilidadeFornecedor" SelectCommandType="StoredProcedure" EnableCaching="True">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes_Inicial" SessionField="sMES_INICIAL" Type="Byte" />
                            <asp:SessionParameter Name="Mes_Final" SessionField="sMES_FINAL" Type="Byte" />
                            <asp:SessionParameter Name="BaseCNPJ" SessionField="sCNPJ" Type="Byte" />
                            
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>




</asp:Content>



