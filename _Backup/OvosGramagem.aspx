<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/mpCampanha_Pascoa.master" AutoEventWireup="false" CodeFile="OvosGramagem.aspx.vb" Inherits="MemberPages_Campanhas_Pascoa_OvosGramagem" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>


<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">

    <style type="text/css" >

        #divAno {
            clear: both;
            float: left;
        }

        #divFilial {
            float: left;
        }

        #divDados {
            clear: both;
            float: left; 
            margin-left: 2px;       
        }

        #divSize {
            float: left;
            margin-left: 2px;
            margin-top: -2px; 
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

    </style>

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>

    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" CallSize="100" />
    </div>


    <div id="divDados">
            
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>


        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="ds" AutoGenerateColumns="False" Width="1035px" KeyFieldName="Gramagem">
            <TotalSummary>

                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AA2_Fechada" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AA_Fechada" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescQtdeAA" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AA_Parcial" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AT_Parcial" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ProjecaoEstoque" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeProjecaoReal" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescEstoque" SummaryType="Custom" />      
                
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrEstoque_AT_Parcial" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrEstoque_AA_Fechada" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeEstoque_AT_Parcial" SummaryType="Sum" />                
                
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda_AA2_Fechada" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda_AA_Fechada" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescVendaAA" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda_AA_Parcial" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda_AT_Parcial" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ProjecaoVenda" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaProjecaoReal" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescVenda" SummaryType="Custom" />



                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeEstoque_AA_Fechada" SummaryType="Sum" />   
                              
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedio_AA2_Fechada" SummaryType="Custom" />                
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedio_AA_Fechada" SummaryType="Custom" /> 
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedio_AA_Parcial" SummaryType="Custom" /> 
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedio_AT_Parcial" SummaryType="Custom" />  
                
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="custoMedio_AA2_Fechada" SummaryType="Average" />                
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="custoMedio_AA_Fechada" SummaryType="Average" /> 
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="custoMedio_AA_Parcial" SummaryType="Average" /> 
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="custoMedio_AT_Parcial" SummaryType="Average" />                                 
                
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoKilo_AA2_Fechada" SummaryType="Average" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoKilo_AA_Fechada" SummaryType="Average"/>
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoKilo_AA_Parcial" SummaryType="Average" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoKilo_AT_Parcial" SummaryType="Average" />   

                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente_AA2_Fechada" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente_AA_Fechada" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente_AA_Parcial" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente_AT_Parcial" SummaryType="Sum" />                

                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Lucro_AA2_Fechada" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Lucro_AA_Fechada" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescLucroAA" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Lucro_AA_Parcial" SummaryType="Sum" />                
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Lucro_AT_Parcial" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ProjecaoLucro" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroProjecaoReal" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescLucro" SummaryType="Custom" />

                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AA2_Fechada" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AA_Fechada" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AA_Parcial" SummaryType="Custom" />               
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AT_Parcial" SummaryType="Custom" />

            </TotalSummary>
            <Columns>
                <dx:GridViewBandColumn Caption="Estoque de Ovos em Unidade" VisibleIndex="3">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="qtdeEstoque_AT_Parcial" VisibleIndex="0" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2014" FieldName="qtdeEstoque_AA_Fechada" VisibleIndex="1" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle BackColor="Gray" ForeColor="White" />
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Estoque Em R$" VisibleIndex="5">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="vlrEstoque_AT_Parcial" VisibleIndex="0" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrEstoque_AA_Fechada" VisibleIndex="1" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle BackColor="Gray" ForeColor="White" />
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Vendas de Ovos em R$" VisibleIndex="4">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Venda_AT_Parcial" VisibleIndex="4" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="percCrescVendaAA" VisibleIndex="2" Width="60px" Caption="%">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Venda_AA_Parcial" VisibleIndex="3" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2014" FieldName="Venda_AA_Fechada" VisibleIndex="1" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Projeção" FieldName="ProjecaoVenda" VisibleIndex="5" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True" ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True" ForeColor="#009900">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Real+Projeção" FieldName="VendaProjecaoReal" VisibleIndex="6" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescVenda" ToolTip="% de Crescimento de Venda" VisibleIndex="7" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2013" FieldName="Venda_AA2_Fechada" VisibleIndex="0" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Custo Médio dos Ovos" VisibleIndex="6">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="custoMedio_AT_Parcial" VisibleIndex="3" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="custoMedio_AA_Parcial" VisibleIndex="2" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2014" FieldName="custoMedio_AA_Fechada" VisibleIndex="1" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2013" FieldName="custoMedio_AA2_Fechada" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Preço Médio dos Ovos" VisibleIndex="7">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="precoMedio_AT_Parcial" VisibleIndex="3" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="precoMedio_AA_Parcial" VisibleIndex="2" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2014" FieldName="precoMedio_AA_Fechada" VisibleIndex="1" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2013" FieldName="precoMedio_AA2_Fechada" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Nº de Clientes" VisibleIndex="9">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="numCliente_AT_Parcial" VisibleIndex="3" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="numCliente_AA_Parcial" VisibleIndex="2" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2014" FieldName="numCliente_AA_Fechada" VisibleIndex="1" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2013" FieldName="numCliente_AA2_Fechada" VisibleIndex="0" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Lucro dos Ovos" VisibleIndex="11">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="2013" FieldName="Lucro_AA2_Fechada" VisibleIndex="0" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2014" FieldName="Lucro_AA_Fechada" VisibleIndex="1" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="percCrescLucroAA" VisibleIndex="2" Width="60px" Caption="% Cresc" ToolTip="% de Crescimento sobre Pascoa Fechada nos anos anteriores">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Lucro_AA_Parcial" VisibleIndex="3" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Lucro_AT_Parcial" VisibleIndex="4" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Projeção" FieldName="ProjecaoLucro" VisibleIndex="5" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True" ForeColor="#009900">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Real+Projeção" FieldName="LucroProjecaoReal" VisibleIndex="6" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescLucro" ShowInCustomizationForm="True" ToolTip="% de Crescimento de Venda" VisibleIndex="7" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="% de Margem" VisibleIndex="10">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="percMargem_AT_Parcial" VisibleIndex="3" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="percMargem_AA_Parcial" VisibleIndex="2" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2014" FieldName="percMargem_AA_Fechada" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2013" FieldName="percMargem_AA2_Fechada" VisibleIndex="0" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Preço por Kilo dos Ovos" VisibleIndex="8">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="precoKilo_AT_Parcial" VisibleIndex="3" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="precoKilo_AA_Parcial" VisibleIndex="2" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2014" FieldName="precoKilo_AA_Fechada" VisibleIndex="1" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2013" FieldName="precoKilo_AA2_Fechada" VisibleIndex="0" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn FieldName="Gramagem" FixedStyle="Left" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descricao" FixedStyle="Left" VisibleIndex="0" Width="140px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Unidade de Ovos" VisibleIndex="2">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Qtde_AT_Parcial" VisibleIndex="4" Width="85px">
                            <PropertiesTextEdit DisplayFormatString=" {0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="percCrescQtdeAA" VisibleIndex="2" Width="60px" Caption="% Cresc" ToolTip="% de Crescimento sobre Pascoa Fechada nos anos anteriores">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Qtde_AA_Parcial" VisibleIndex="3" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2014" FieldName="Qtde_AA_Fechada" VisibleIndex="1" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2013" FieldName="Qtde_AA2_Fechada" VisibleIndex="0" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Projeção" FieldName="ProjecaoEstoque" VisibleIndex="5" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True" ForeColor="#009900">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Real+Projeção" FieldName="QtdeProjecaoReal" VisibleIndex="6" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescEstoque" ToolTip="% de Crescimento de Venda" VisibleIndex="7" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Auto" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#F4F4F4">
                </AlternatingRow>
                <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="Blue">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="ds" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Gerencial.uspBuscarOvosPorGramagem" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>


    </div>


</asp:Content>

