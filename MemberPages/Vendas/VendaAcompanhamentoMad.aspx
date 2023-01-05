<%@ Page Title="Ranking de Vendas Diário - por Loja" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="VendaAcompanhamentoMad.aspx.vb" Inherits="MemberPages_Vendas_VendaAcompanhamentoMad" %>

<%@ OutputCache Duration="42000" VaryByParam="none" %>
<%@ Register Src="~/Controles/wuc_KPI_Secao_Depto.ascx" TagPrefix="uc1" TagName="wuc_KPI_Secao_Depto" %>
<%@ Register src="../../Controles/wucListaDia.ascx" tagname="wucListaDia" tagprefix="uc5" %>

<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc2" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa_1.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa_1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">

        #divBotaoAtualizar {
            clear:both;
            float:left;
        }

        #divKPI {
            clear: both;
            float: left;
        }

        #divCabecalho {
            clear: both;
            float: left;  
            margin-top: -1px;         
        }

        #ddivSelecaoDia {
            clear: both;
            float: left;
            margin-top: -3px;
        }

        #divRanking_Loja {
            clear: both;
            float: left;
            padding-top: 10px;
            width: 99.5%;
        }

        #divRankingRegional {   
             clear: both;
            float: left;         
            width: 99.5%;
        }

        #divRankingRegiao {   
             clear: both;
            float: left;         
            width: 99.5%;
        }

        #divRankingCidade {   
            clear: both;
            float: left;         
            width: 99.5%;
        }

        #div_Top30_Vendas_Lojas_1 {
            clear: both;
            float: left; 
        }

        #divBotao_PaneVendaItem_1 {
            float: left; 
            margin-left: 5px;
            padding-top: 20px;
        }

         #div_Top30_Vendas_Lojas_2 {
            clear: both;
            float: left; 
        }

        #divBotao_PaneVendaItem_2 {
            float: left; 
            margin-left: 5px;
            padding-top: 20px;
        }


        .Separacao {
            clear: both;
            float: left;
            padding-top: 20px;
        }

        .Separacao_Filial {
            clear: both;
            float: left;
            padding-top: 2px;
        }

        .Titulo_Grafico {
            color: gray;
            font-size :26px; 
            text-align:center;
            font-weight: bold;
        }

        .Cabecalho_Item {
            float: left;
            margin-left: 30px;
            margin-top: 10px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


   


    <div id="divKPI">
        <uc1:wuc_KPI_Secao_Depto runat="server" ID="KPI" />
    </div>

<%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>


            <div id="divCabecalho">

                <div id="divBotaoAtualizar"  class="Cabecalho_Item">
                    <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="MetropolisBlue" AutoPostBack="true" Width="180px" ></dx:ASPxButton>
                </div> 

                <div id="divSelecaoDia"  class="Cabecalho_Item">
                    <uc5:wucListaDia ID="cboDia" runat="server" />
                </div> 
                
                <div id="divEstatisticas" class="Cabecalho_Item">
                    <dx:ASPxCheckBox ID="chkEstatisticas" runat="server" AutoPostBack="True" 
                            Text="Exibir Estatísticas" Theme="DevEx">
                        </dx:ASPxCheckBox>
                </div>   
                
                <div id="divFixarCabecalho" class="Cabecalho_Item">
                    <dx:ASPxCheckBox ID="chkFixar" runat="server" AutoPostBack="True" 
                            Text="Fixar Cabeçalho" Theme="DevEx" Checked="True" CheckState="Checked">
                        </dx:ASPxCheckBox>
                </div> 

                <div class="Cabecalho_Item">
                        <strong>Venda no Ano:</strong>
                </div>
                
                <div id="divVendaAno"  class="Cabecalho_Item">
                    <asp:Label ID="lblVendaAno" runat="server" Font-Size="Medium" Text="Label" Width="115px"></asp:Label>
                </div>   
                
                           

            </div>

            <div id="divRanking_Loja">                    

                <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Descricao" 
                    Theme="SoftOrange" style="margin-bottom: 0px" DataSourceID="dsVendaLoja" Width="100%">
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifCresc" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestaoVenda" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientes" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargem" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOut" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="NumClientes" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaMargem" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargem" SummaryType="Custom" />

                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVendaClube" SummaryType="Custom" />
                                
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" SummaryType="Custom" />                            
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaFunc" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="vlrTicketMedio" SummaryType="Custom" />

                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemClube" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOutClube" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientesClube" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="vlrTicketMedioClube" SummaryType="Custom" />

                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaCheckout" 
                            SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMetragem" 
                            SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargemSellOutKit" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOutKit" SummaryType="Custom" />
                    </TotalSummary>
                    <GroupSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestao" 
                            ShowInGroupFooterColumn="vlrSugestao" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" 
                            ShowInGroupFooterColumn="vlrMetaVenda" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" 
                            ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaLucro" 
                            ShowInGroupFooterColumn="vlrMetaLucro" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" 
                            ShowInGroupFooterColumn="vlrMargem" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" 
                            ShowInGroupFooterColumn="difLucro" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="NumClientes" 
                            ShowInGroupFooterColumn="NumClientes" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" 
                            ShowInGroupFooterColumn="percAting" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" 
                            ShowInGroupFooterColumn="percAtingLucro" SummaryType="Custom" />
                    </GroupSummary>
                    <EditFormLayoutProperties ColCount="1">
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewBandColumn Caption="Estatísticas - valor médio" VisibleIndex="8" 
                            Name="bandEstatisticas" Visible="False">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Func." FieldName="vlrVendaFunc" 
                                    ToolTip="Valor médio de vendas por funcionários." VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Right"></CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Ticket" FieldName="vlrTicketMedio" 
                                    ToolTip="Valor do ticket médio" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Right"></CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Check" FieldName="vlrVendaCheckout" ToolTip="Valor médio de vendas por check-out." 
                                    VisibleIndex="2">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Right"></CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="M2" FieldName="vlrVendaMetragem" ToolTip="Valor da venda por metro quadrado" 
                                    VisibleIndex="3">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Right"></CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="% Margem PDV" VisibleIndex="5">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Meta " FieldName="percMetaMargem" 
                                    VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#009900" ForeColor="White" />
                                    <CellStyle ForeColor="#009900">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#009900">
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle ForeColor="#009900">
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Real" FieldName="percRealMargem" 
                                    VisibleIndex="1">
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
                                    FieldName="difMargem">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Sell Out &lt;br&gt; Kit" FieldName="percRealMargemSellOutKit" VisibleIndex="4">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="1">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealAA" ToolTip="Venda do Ano Anterior (mesmo dia da semana)" VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% de&lt;br&gt;Cresc" FieldName="percDifCresc" VisibleIndex="1" MinWidth="60" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewDataTextColumn Caption="Desc." FieldName="Descricao" VisibleIndex="0" FixedStyle="Left" Width="185px">
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
                        <dx:GridViewBandColumn Caption="Vendas Financeiras" VisibleIndex="2" 
                            ToolTip="Grupo de vendas financeiras que compreende: Sugestão, Meta, Realizado e Percentual de Atingimento da Venda Realizada sobre a Meta de Venda.">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Sugestão" FieldName="vlrSugestaoVenda" 
                                    VisibleIndex="2" 
                                    ToolTip="Sugestão de vendas calculada com base no hitórico do ano anterior da loja">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle ForeColor="#996600">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#996600">
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle ForeColor="#996600">
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" 
                                    VisibleIndex="3" 
                                    ToolTip="Valor da meta revista de venda que foi replanejada.">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#009900" ForeColor="White" />
                                    <CellStyle ForeColor="#009900">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#009900">
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle ForeColor="#009900">
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealVenda" 
                                    VisibleIndex="4" ToolTip="Valor da venda realizada.">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle ForeColor="Blue">
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Concluido" FieldName="idStatusAtingMeta_100" ToolTip="Indicador se a Meta de Venda foi atingida."  VisibleIndex="5">
                                       <DataItemTemplate>
                                            <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="SoftOrange" 
                                                Value='<%#Eval("idStatusAtingMeta_100")%>' Width="80px" DisplayFormatString=" 0.0" >
                                            </dx:ASPxProgressBar>
                                        </DataItemTemplate>                                   
                                    
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="%&lt;br&gt;Atingimento" FieldName="percAting" 
                                    ToolTip="Percentual de atingimento (meta x realizado)" VisibleIndex="6" UnboundType="Decimal">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Nº de &lt;br&gt; Clientes" FieldName="numClientes" ToolTip="Número de clientes que passou na loja." VisibleIndex="7">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle Wrap="True" HorizontalAlign="Center" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Ticket &lt;br&gt; Médio" FieldName="vlrTicketMedio" ToolTip="Valor do Ticket Médio" UnboundType="Decimal" VisibleIndex="9">
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
                        <dx:GridViewBandColumn Caption="Venda Clube" VisibleIndex="3" 
                                
                            ToolTip="Vendas do Clube Condor" 
                            Name="bcVendaClube">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealVendaClube" 
                                    VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Marg &lt;br&gt; PDV" FieldName="percRealMargemClube" ToolTip="Percentual de Margem do PDV" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Marg &lt;br&gt; c/ Sellout" FieldName="percRealMargemSellOutClube" ToolTip="Percentual de Margem com Sell-Out" VisibleIndex="2">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Nº de &lt;br&gt; Clientes" FieldName="numClientesClube" ToolTip="Numero de Clientes" VisibleIndex="3">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Ticket &lt;br&gt; Médio" FieldName="vlrTicketMedioClube" ToolTip="Valor do Ticket Médio do Clube" VisibleIndex="4">
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
                            </Columns>
                            <HeaderStyle BackColor="#3399FF" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="Lucro PDV" Name="bandLucratividade" ToolTip="Grupo de Lucratividade, exibe o quanto de meta de lucro a loja teve dia por dia. Exibe as colunas de Meta, Realizado, Diferença entre a Meta e o Realizado e o Percentual de Atingimento (Realizado dividido pela Meta)" VisibleIndex="4">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="PDV" FieldName="vlrRealMargem" ToolTip="Valor do realizado do lucro" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle ForeColor="Blue">
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaMargem" ToolTip="Valor da meta de lucro" VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle ForeColor="#009900">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#009900">
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle ForeColor="#009900">
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="%" FieldName="percAtingLucro" ToolTip="Percentual de atingimento do lucro (Realizado dividido pela Meta)" VisibleIndex="3">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Right">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Dif." FieldName="difLucro" ToolTip="Valor da diferença entre a Meta de Lucro e o Realizado do Lucro." UnboundType="Decimal" VisibleIndex="2">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Right">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Sell Out &lt;br&gt; Kit" FieldName="vlrRealMargemSellOutKit" VisibleIndex="4">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="% Margem Final" VisibleIndex="6">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMetaMargemFinal" ToolTip="Meta" VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Real" FieldName="percRealMargemSellOut" ToolTip="Margem com Sell-Out" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#003399" ForeColor="White" HorizontalAlign="Center" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Dif." FieldName="difMargemFinal" VisibleIndex="2">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#666666" />
                        </dx:GridViewBandColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <SettingsAdaptivity AdaptivityMode="HideDataCells">
                        <AdaptiveDetailLayoutProperties ColCount="1">
                        </AdaptiveDetailLayoutProperties>
                    </SettingsAdaptivity>
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings VerticalScrollableHeight="430" 
                        ShowGroupFooter="VisibleAlways" ShowVerticalScrollBar="True" 
                        ShowFooter="False" HorizontalScrollBarMode="Visible" />
                    <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
                    <SettingsText EmptyDataRow="Não há vendas realizadas para este dia." />
                    <FormatConditions>
                        <dx:GridViewFormatConditionIconSet FieldName="percDifCresc" Format="PositiveNegativeArrowsColored" />
                        <dx:GridViewFormatConditionIconSet FieldName="percAting" Format="PositiveNegativeTriangles" />

                        <dx:GridViewFormatConditionTopBottom Threshold="10">
                        </dx:GridViewFormatConditionTopBottom>
                        <dx:GridViewFormatConditionIconSet Format="Quarters5" />

                    </FormatConditions>
                    <Styles>
	                    <FocusedRow BackColor="#66ffff" ForeColor="#0066FF" Font-Bold="true"> </FocusedRow>
	                    <Header HorizontalAlign="Center">
                        </Header>
	                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                        <Footer Font-Bold="True">
                        </Footer>
                    </Styles>

                </dx:ASPxGridView>

                <asp:SqlDataSource ID="dsVendaLoja" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:SQL14_gerManagerConnectionString %>" 
                    SelectCommand="Ranking.uspBuscarVendaAcompanhamento" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="dia" SessionField="sDIA" DbType="Date" />
                                
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>

            <div id="divRankingRegional" class="Separacao">

                    <dx:ASPxGridView ID="gridAcompanhamentoSupervisor" runat="server" 
                            AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Descricao" 
                            Theme="SoftOrange" style="margin-bottom: 0px" DataSourceID="dsSupervisor">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestaoVenda" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifCresc" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientes" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaMargem" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargem" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" 
                                    SummaryType="Custom" />                            
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargemSellOut" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOut" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numFunc" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numMetragem" ShowInGroupFooterColumn="numMetragem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMetragem" ShowInColumn="vlrVendaMetragem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaFunc" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCheckout" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaCheckout" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTicketMedio" 
                                    SummaryType="Custom" />
                            </TotalSummary>
                            <GroupSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" ShowInGroupFooterColumn="vlrRealAA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestaoVenda" 
                                    ShowInGroupFooterColumn="vlrSugestaoVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" 
                                    ShowInGroupFooterColumn="vlrMetaVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" 
                                    ShowInGroupFooterColumn="vlrRealVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaLucro" 
                                    ShowInGroupFooterColumn="vlrMetaLucro" SummaryType="Sum" />
                               <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargem" 
                                    ShowInGroupFooterColumn="vlrRealMargem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargemSellOut" ShowInGroupFooterColumn="vlrRealMargemSellOut" SummaryType="Sum" />
                               <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" 
                                    ShowInGroupFooterColumn="difLucro" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaMargem" ShowInGroupFooterColumn="vlrMetaMargem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" 
                                    ShowInGroupFooterColumn="percAting" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" 
                                    ShowInGroupFooterColumn="percAtingLucro" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifCresc" ShowInGroupFooterColumn="percDifCresc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" ShowInGroupFooterColumn="percMetaMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargem" ShowInGroupFooterColumn="percRealMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOut" ShowInGroupFooterColumn="percRealMargemSellOut" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" ShowInGroupFooterColumn="difMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientes" ShowInGroupFooterColumn="numClientes" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numFunc" ShowInGroupFooterColumn="numFunc" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCheckout" ShowInGroupFooterColumn="numCheckout" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numMetragem" ShowInGroupFooterColumn="numMetragem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaCheckout" ShowInGroupFooterColumn="vlrVendaCheckout" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMetragem" ShowInGroupFooterColumn="vlrVendaMetragem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaFunc" ShowInGroupFooterColumn="vlrVendaFunc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTicketMedio" SummaryType="Custom" ShowInGroupFooterColumn="vlrTicketMedio" />
                                <dx:ASPxSummaryItem DisplayFormat="Lojas: {0:n0}" FieldName="descRegional" SummaryType="Count" />
                            </GroupSummary>
                            <Columns>
                                <dx:GridViewBandColumn Caption="Estatísticas - valor médio em R$" VisibleIndex="8" 
                                    Name="bandEstatisticas" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Func." FieldName="vlrVendaFunc" 
                                            ToolTip="Valor médio de vendas por funcionários." VisibleIndex="0" 
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                            <FooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Ticket" FieldName="vlrTicketMedio" 
                                            ToolTip="Valor do ticket médio" VisibleIndex="1" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                            <FooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Check" FieldName="vlrVendaCheckout" ToolTip="Valor médio de vendas por check-out." 
                                            VisibleIndex="2"  Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                            <FooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="M2" FieldName="vlrVendaMetragem" ToolTip="Valor da venda por metro quadrado" 
                                            VisibleIndex="3" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                            <FooterCellStyle BackColor="#FFFF99">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFF99">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta " FieldName="percMetaMargem" 
                                            VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="percRealMargem" 
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn 
                                            UnboundType="Decimal" VisibleIndex="3" Caption="Dif." 
                                            FieldName="difMargem"  Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Sell" FieldName="percRealMargemSellOut" 
                                            ToolTip="Margem com Sell-Out" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn FieldName="numClientes" 
                                    VisibleIndex="7" Caption="Nº Clientes" Visible="False" 
                                    ToolTip="Número de clientes que passou na loja." Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle Wrap="True" />
                                    <CellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                    <FooterCellStyle BackColor="#CCFF99">
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle BackColor="#CCFF99">
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealAA" ToolTip="Venda do Ano Anterior (mesmo dia da semana)" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percDifCresc" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn Caption="Status" FieldName="idStatusAtingCresc" ToolTip="Indicador se o % de Crescimento sobre a venda do ano anterior esta maior ou meno" VisibleIndex="2" Width="45px">
                                            <PropertiesCheckEdit>
                                                <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                                </DisplayImageChecked>
                                                <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                                </DisplayImageUnchecked>
                                                <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageUndefined>
                                                <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageGrayed>
                                            </PropertiesCheckEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataCheckColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Supervisor" FieldName="descRegional" 
                                    VisibleIndex="0" Width="150px" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                                    <Settings AllowDragDrop="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Desc." FieldName="Descricao" VisibleIndex="1" Width="120px">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Invisivel" VisibleIndex="16" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" 
                                            VisibleIndex="1" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="numMetragem" Visible="False" VisibleIndex="2" Width="80px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="numFunc" Visible="False" VisibleIndex="3" Width="70px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="numCheckout" Visible="False" VisibleIndex="0" Width="70px">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Vendas Financeiras" VisibleIndex="3" 
                                    ToolTip="Grupo de vendas financeiras que compreende: Sugestão, Meta, Realizado e Percentual de Atingimento da Venda Realizada sobre a Meta de Venda.">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Sugestão" FieldName="vlrSugestaoVenda" 
                                            VisibleIndex="3" 
                                            ToolTip="Sugestão de vendas calculada com base no hitórico do ano anterior da loja" 
                                            Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#996600">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#996600">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#996600">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" 
                                            VisibleIndex="4" 
                                            ToolTip="Valor da meta revista de venda que foi replanejada." Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealVenda" 
                                            VisibleIndex="5" ToolTip="Valor da venda realizada." Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn Caption="Status" FieldName="idStatusAtingMeta" ToolTip="Indicador se a Meta de Venda foi atingida." VisibleIndex="7" Width="45px">
                                            <PropertiesCheckEdit>
                                                <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                                </DisplayImageChecked>
                                                <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                                </DisplayImageUnchecked>
                                                <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageUndefined>
                                                <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageGrayed>
                                            </PropertiesCheckEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAting" 
                                            ToolTip="Percentual de atingimento (meta x realizado)" VisibleIndex="6"  
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Lucro" VisibleIndex="4" 
                                
                                    ToolTip="Grupo de Lucratividade, exibe o quanto de meta de lucro a loja teve dia por dia. Exibe as colunas de Meta, Realizado, Diferença entre a Meta e o Realizado e o Percentual de Atingimento (Realizado dividido pela Meta)" 
                                    Name="bandLucratividade" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealMargem" 
                                            VisibleIndex="1" ToolTip="Valor do realizado do lucro" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaMargem" 
                                            VisibleIndex="0" ToolTip="Valor da meta de lucro" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAtingLucro" 
                                            VisibleIndex="4"  Width="60px" 
                                        
                                            ToolTip="Percentual de atingimento do lucro (Realizado dividido pela Meta)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="difLucro" 
                                            ToolTip="Valor da diferença entre a Meta de Lucro e o Realizado do Lucro." 
                                            UnboundType="Decimal" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right">
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="c/ SellOut" FieldName="vlrRealMargemSellOut" ToolTip="Valor do Lucro com Sellout" VisibleIndex="2" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings VerticalScrollableHeight="430" 
                                ShowGroupFooter="VisibleAlways" ShowVerticalScrollBar="True" 
                                ShowFooter="True" />
                            <SettingsText EmptyDataRow="Não há vendas realizadas para este dia." />
                            <Styles>
	                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                <Footer Font-Bold="True">
                                </Footer>
                                <GroupFooter Font-Bold="True">
                                </GroupFooter>
                                <TitlePanel Font-Size="Large">
                                </TitlePanel>
                            </Styles>

                        </dx:ASPxGridView>

                    <asp:SqlDataSource ID="dsSupervisor" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:SQL14_gerManagerConnectionString %>" 
                        SelectCommand="Vendas.uspBuscarVendaAcompanhamentoSupervisor" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="dia" SessionField="sDIA" DbType="Date" />
                                
                        </SelectParameters>
                    </asp:SqlDataSource>


            </div>

            <div id="divRankingRegiao" class="Separacao">

                        <dx:ASPxGridView ID="gridAcompanhamentoRegiao" runat="server" 
                            AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Descricao" 
                            Theme="SoftOrange" style="margin-bottom: 0px" DataSourceID="dsRegiao">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestaoVenda" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifCresc" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientes" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaMargem" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargem" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" 
                                    SummaryType="Custom" />                            
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargemSellOut" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOut" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numFunc" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numMetragem" ShowInGroupFooterColumn="numMetragem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMetragem" ShowInColumn="vlrVendaMetragem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaFunc" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCheckout" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaCheckout" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTicketMedio" 
                                    SummaryType="Custom" />
                            </TotalSummary>
                            <GroupSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" ShowInGroupFooterColumn="vlrRealAA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestaoVenda" 
                                    ShowInGroupFooterColumn="vlrSugestaoVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" 
                                    ShowInGroupFooterColumn="vlrMetaVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" 
                                    ShowInGroupFooterColumn="vlrRealVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaLucro" 
                                    ShowInGroupFooterColumn="vlrMetaLucro" SummaryType="Sum" />
                               <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargem" 
                                    ShowInGroupFooterColumn="vlrRealMargem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargemSellOut" ShowInGroupFooterColumn="vlrRealMargemSellOut" SummaryType="Sum" />
                               <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" 
                                    ShowInGroupFooterColumn="difLucro" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaMargem" ShowInGroupFooterColumn="vlrMetaMargem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" 
                                    ShowInGroupFooterColumn="percAting" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" 
                                    ShowInGroupFooterColumn="percAtingLucro" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifCresc" ShowInGroupFooterColumn="percDifCresc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" ShowInGroupFooterColumn="percMetaMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargem" ShowInGroupFooterColumn="percRealMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOut" ShowInGroupFooterColumn="percRealMargemSellOut" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" ShowInGroupFooterColumn="difMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientes" ShowInGroupFooterColumn="numClientes" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numFunc" ShowInGroupFooterColumn="numFunc" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCheckout" ShowInGroupFooterColumn="numCheckout" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numMetragem" ShowInGroupFooterColumn="numMetragem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaCheckout" ShowInGroupFooterColumn="vlrVendaCheckout" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMetragem" ShowInGroupFooterColumn="vlrVendaMetragem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaFunc" ShowInGroupFooterColumn="vlrVendaFunc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTicketMedio" SummaryType="Custom" ShowInGroupFooterColumn="vlrTicketMedio" />
                                <dx:ASPxSummaryItem DisplayFormat="Lojas: {0:n0} " FieldName="Cidade" SummaryType="Count" />
                            </GroupSummary>
                            <Columns>
                                <dx:GridViewBandColumn Caption="Estatísticas - valor médio em R$" VisibleIndex="8" 
                                    Name="bandEstatisticas" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Func." FieldName="vlrVendaFunc" 
                                            ToolTip="Valor médio de vendas por funcionários." VisibleIndex="0" 
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                            <FooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Ticket" FieldName="vlrTicketMedio" 
                                            ToolTip="Valor do ticket médio" VisibleIndex="1" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                            <FooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Check" FieldName="vlrVendaCheckout" ToolTip="Valor médio de vendas por check-out." 
                                            VisibleIndex="2"  Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                            <FooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="M2" FieldName="vlrVendaMetragem" ToolTip="Valor da venda por metro quadrado" 
                                            VisibleIndex="3" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                            <FooterCellStyle BackColor="#FFFF99">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFF99">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta " FieldName="percMetaMargem" 
                                            VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="percRealMargem" 
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn 
                                            UnboundType="Decimal" VisibleIndex="3" Caption="Dif." 
                                            FieldName="difMargem"  Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Sell" FieldName="percRealMargemSellOut" 
                                            ToolTip="Margem com Sell-Out" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn FieldName="numClientes" 
                                    VisibleIndex="7" Caption="Nº Clientes" Visible="False" 
                                    ToolTip="Número de clientes que passou na loja." Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle Wrap="True" />
                                    <CellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                    <FooterCellStyle BackColor="#CCFF99">
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle BackColor="#CCFF99">
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealAA" ToolTip="Venda do Ano Anterior (mesmo dia da semana)" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percDifCresc" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn Caption="Status" FieldName="idStatusAtingCresc" ToolTip="Indicador se o % de Crescimento sobre a venda do ano anterior esta maior ou meno" VisibleIndex="2" Width="45px">
                                            <PropertiesCheckEdit>
                                                <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                                </DisplayImageChecked>
                                                <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                                </DisplayImageUnchecked>
                                                <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageUndefined>
                                                <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageGrayed>
                                            </PropertiesCheckEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataCheckColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Região" FieldName="Regiao" 
                                    VisibleIndex="0" Width="150px" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                                    <Settings AllowDragDrop="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Desc." FieldName="Descricao" VisibleIndex="1" Width="120px">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Invisivel" VisibleIndex="16" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" 
                                            VisibleIndex="1" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="numMetragem" Visible="False" VisibleIndex="2" Width="80px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="numFunc" Visible="False" VisibleIndex="3" Width="70px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="numCheckout" Visible="False" VisibleIndex="0" Width="70px">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Vendas Financeiras" VisibleIndex="3" 
                                    ToolTip="Grupo de vendas financeiras que compreende: Sugestão, Meta, Realizado e Percentual de Atingimento da Venda Realizada sobre a Meta de Venda.">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Sugestão" FieldName="vlrSugestaoVenda" 
                                            VisibleIndex="3" 
                                            ToolTip="Sugestão de vendas calculada com base no hitórico do ano anterior da loja" 
                                            Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#996600">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#996600">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#996600">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" 
                                            VisibleIndex="4" 
                                            ToolTip="Valor da meta revista de venda que foi replanejada." Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealVenda" 
                                            VisibleIndex="5" ToolTip="Valor da venda realizada." Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn Caption="Status" FieldName="idStatusAtingMeta" ToolTip="Indicador se a Meta de Venda foi atingida." VisibleIndex="7" Width="45px">
                                            <PropertiesCheckEdit>
                                                <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                                </DisplayImageChecked>
                                                <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                                </DisplayImageUnchecked>
                                                <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageUndefined>
                                                <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageGrayed>
                                            </PropertiesCheckEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAting" 
                                            ToolTip="Percentual de atingimento (meta x realizado)" VisibleIndex="6"  
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Lucro" VisibleIndex="4" 
                                
                                    ToolTip="Grupo de Lucratividade, exibe o quanto de meta de lucro a loja teve dia por dia. Exibe as colunas de Meta, Realizado, Diferença entre a Meta e o Realizado e o Percentual de Atingimento (Realizado dividido pela Meta)" 
                                    Name="bandLucratividade" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealMargem" 
                                            VisibleIndex="1" ToolTip="Valor do realizado do lucro" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaMargem" 
                                            VisibleIndex="0" ToolTip="Valor da meta de lucro" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAtingLucro" 
                                            VisibleIndex="4"  Width="60px" 
                                        
                                            ToolTip="Percentual de atingimento do lucro (Realizado dividido pela Meta)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="difLucro" 
                                            ToolTip="Valor da diferença entre a Meta de Lucro e o Realizado do Lucro." 
                                            UnboundType="Decimal" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right">
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="c/ SellOut" FieldName="vlrRealMargemSellOut" ToolTip="Valor do Lucro com Sellout" VisibleIndex="2" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings VerticalScrollableHeight="430" 
                                ShowGroupFooter="VisibleAlways" ShowVerticalScrollBar="True" 
                                ShowFooter="True" />
                            <SettingsText EmptyDataRow="Não há vendas realizadas para este dia." />
                            <Styles>
	                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                <Footer Font-Bold="True">
                                </Footer>
                                <GroupFooter Font-Bold="True">
                                </GroupFooter>
                                <TitlePanel Font-Size="Large">
                                </TitlePanel>
                            </Styles>

                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="dsRegiao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            SelectCommand="Vendas.uspBuscarVendaAcompanhamentoRegiao" 
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="dia" SessionField="sDIA" DbType="Date" />
                                
                            </SelectParameters>
                        </asp:SqlDataSource>

            </div>

            <div id="divRankingCidade" class="Separacao">

                   <dx:ASPxGridView ID="gridAcompanhamentoCidade" runat="server" 
                            AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Descricao" 
                            Theme="SoftOrange" style="margin-bottom: 0px" DataSourceID="dsCidade">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestaoVenda" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifCresc" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientes" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaMargem" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargem" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" 
                                    SummaryType="Custom" />                            
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargemSellOut" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOut" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numFunc" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numMetragem" ShowInGroupFooterColumn="numMetragem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMetragem" ShowInColumn="vlrVendaMetragem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaFunc" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCheckout" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaCheckout" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTicketMedio" 
                                    SummaryType="Custom" />
                            </TotalSummary>
                            <GroupSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" ShowInGroupFooterColumn="vlrRealAA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestaoVenda" 
                                    ShowInGroupFooterColumn="vlrSugestaoVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" 
                                    ShowInGroupFooterColumn="vlrMetaVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" 
                                    ShowInGroupFooterColumn="vlrRealVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaLucro" 
                                    ShowInGroupFooterColumn="vlrMetaLucro" SummaryType="Sum" />
                               <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargem" 
                                    ShowInGroupFooterColumn="vlrRealMargem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargemSellOut" ShowInGroupFooterColumn="vlrRealMargemSellOut" SummaryType="Sum" />
                               <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" 
                                    ShowInGroupFooterColumn="difLucro" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaMargem" ShowInGroupFooterColumn="vlrMetaMargem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" 
                                    ShowInGroupFooterColumn="percAting" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" 
                                    ShowInGroupFooterColumn="percAtingLucro" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifCresc" ShowInGroupFooterColumn="percDifCresc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" ShowInGroupFooterColumn="percMetaMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargem" ShowInGroupFooterColumn="percRealMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOut" ShowInGroupFooterColumn="percRealMargemSellOut" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" ShowInGroupFooterColumn="difMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientes" ShowInGroupFooterColumn="numClientes" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numFunc" ShowInGroupFooterColumn="numFunc" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCheckout" ShowInGroupFooterColumn="numCheckout" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numMetragem" ShowInGroupFooterColumn="numMetragem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaCheckout" ShowInGroupFooterColumn="vlrVendaCheckout" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMetragem" ShowInGroupFooterColumn="vlrVendaMetragem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaFunc" ShowInGroupFooterColumn="vlrVendaFunc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTicketMedio" SummaryType="Custom" ShowInGroupFooterColumn="vlrTicketMedio" />
                                <dx:ASPxSummaryItem DisplayFormat="Lojas: {0:n0} " FieldName="Cidade" SummaryType="Count" />
                            </GroupSummary>
                            <Columns>
                                <dx:GridViewBandColumn Caption="Estatísticas - valor médio em R$" VisibleIndex="8" 
                                    Name="bandEstatisticas" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Func." FieldName="vlrVendaFunc" 
                                            ToolTip="Valor médio de vendas por funcionários." VisibleIndex="0" 
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                            <FooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Ticket" FieldName="vlrTicketMedio" 
                                            ToolTip="Valor do ticket médio" VisibleIndex="1" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                            <FooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Check" FieldName="vlrVendaCheckout" ToolTip="Valor médio de vendas por check-out." 
                                            VisibleIndex="2"  Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                            <FooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFF99">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="M2" FieldName="vlrVendaMetragem" ToolTip="Valor da venda por metro quadrado" 
                                            VisibleIndex="3" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                            <FooterCellStyle BackColor="#FFFF99">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFF99">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta " FieldName="percMetaMargem" 
                                            VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="percRealMargem" 
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn 
                                            UnboundType="Decimal" VisibleIndex="3" Caption="Dif." 
                                            FieldName="difMargem"  Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Sell" FieldName="percRealMargemSellOut" 
                                            ToolTip="Margem com Sell-Out" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn FieldName="numClientes" 
                                    VisibleIndex="7" Caption="Nº Clientes" Visible="False" 
                                    ToolTip="Número de clientes que passou na loja." Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle Wrap="True" />
                                    <CellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                    <FooterCellStyle BackColor="#CCFF99">
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle BackColor="#CCFF99">
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealAA" ToolTip="Venda do Ano Anterior (mesmo dia da semana)" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percDifCresc" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn Caption="Status" FieldName="idStatusAtingCresc" ToolTip="Indicador se o % de Crescimento sobre a venda do ano anterior esta maior ou meno" VisibleIndex="2" Width="45px">
                                            <PropertiesCheckEdit>
                                                <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                                </DisplayImageChecked>
                                                <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                                </DisplayImageUnchecked>
                                                <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageUndefined>
                                                <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageGrayed>
                                            </PropertiesCheckEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataCheckColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Cidade" FieldName="Cidade" 
                                    VisibleIndex="0" Width="150px" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                                    <Settings AllowDragDrop="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Desc." FieldName="Descricao" VisibleIndex="1" Width="120px">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Invisivel" VisibleIndex="16" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" 
                                            VisibleIndex="1" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="numMetragem" Visible="False" VisibleIndex="2" Width="80px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="numFunc" Visible="False" VisibleIndex="3" Width="70px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="numCheckout" Visible="False" VisibleIndex="0" Width="70px">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Vendas Financeiras" VisibleIndex="3" 
                                    ToolTip="Grupo de vendas financeiras que compreende: Sugestão, Meta, Realizado e Percentual de Atingimento da Venda Realizada sobre a Meta de Venda.">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Sugestão" FieldName="vlrSugestaoVenda" 
                                            VisibleIndex="3" 
                                            ToolTip="Sugestão de vendas calculada com base no hitórico do ano anterior da loja" 
                                            Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#996600">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#996600">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#996600">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" 
                                            VisibleIndex="4" 
                                            ToolTip="Valor da meta revista de venda que foi replanejada." Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealVenda" 
                                            VisibleIndex="5" ToolTip="Valor da venda realizada." Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn Caption="Status" FieldName="idStatusAtingMeta" ToolTip="Indicador se a Meta de Venda foi atingida." VisibleIndex="7" Width="45px">
                                            <PropertiesCheckEdit>
                                                <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                                </DisplayImageChecked>
                                                <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                                </DisplayImageUnchecked>
                                                <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageUndefined>
                                                <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageGrayed>
                                            </PropertiesCheckEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAting" 
                                            ToolTip="Percentual de atingimento (meta x realizado)" VisibleIndex="6"  
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Lucro" VisibleIndex="4" 
                                
                                    ToolTip="Grupo de Lucratividade, exibe o quanto de meta de lucro a loja teve dia por dia. Exibe as colunas de Meta, Realizado, Diferença entre a Meta e o Realizado e o Percentual de Atingimento (Realizado dividido pela Meta)" 
                                    Name="bandLucratividade" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealMargem" 
                                            VisibleIndex="1" ToolTip="Valor do realizado do lucro" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaMargem" 
                                            VisibleIndex="0" ToolTip="Valor da meta de lucro" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAtingLucro" 
                                            VisibleIndex="4"  Width="60px" 
                                        
                                            ToolTip="Percentual de atingimento do lucro (Realizado dividido pela Meta)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="difLucro" 
                                            ToolTip="Valor da diferença entre a Meta de Lucro e o Realizado do Lucro." 
                                            UnboundType="Decimal" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right">
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="c/ SellOut" FieldName="vlrRealMargemSellOut" ToolTip="Valor do Lucro com Sellout" VisibleIndex="2" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings VerticalScrollableHeight="530" 
                                ShowGroupFooter="VisibleAlways" ShowVerticalScrollBar="True" 
                                ShowFooter="True" />
                            <SettingsText EmptyDataRow="Não há vendas realizadas para este dia." />
                            <Styles>
	                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                <Footer Font-Bold="True">
                                </Footer>
                                <GroupFooter Font-Bold="True">
                                </GroupFooter>
                                <TitlePanel Font-Size="Large">
                                </TitlePanel>
                            </Styles>

                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="dsCidade" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            SelectCommand="Vendas.uspBuscarVendaAcompanhamentoCidade" 
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="dia" SessionField="sDIA" DbType="Date" />
                                
                            </SelectParameters>
                        </asp:SqlDataSource>


            </div>


            <div id="div_Top30_Vendas_Lojas_1" class="Separacao">                        
                <uc1:wucLista_Filial_Empresa runat="server" ID="cboFilial_ItensMaisVendidos" AutoPostBack="false"  />
            </div>

            <div id="divBotao_PaneVendaItem_1" >
                <dx:ASPxButton ID="btnAtualizar_VendaItem_1" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue">
                    <ClientSideEvents Click="function(s, e) {cboPaneVendaItem_1.PerformCallback();}" />
                </dx:ASPxButton>
            </div>

            <dx:ASPxCallbackPanel ID="cboPaneVendaItem_1" runat="server" Width="100%" ClientInstanceName="cboPaneVendaItem_1" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
                <PanelCollection>
                    <dx:PanelContent>
                    
                    <div id="div_Top30_Vendas_ItensMaisVendidos_1" class="Separacao_Filial">

                        <dx:ASPxGridView ID="gridItensMaisVendidos" runat="server" DataSourceID="dsItensMaisVendidos" AutoGenerateColumns="False" Width="910px" KeyFieldName="CodProduto">
                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True"/>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ToolTip="Código do produto" VisibleIndex="2" Width="70px">
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
                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ToolTip="Nome do produto" VisibleIndex="3" Width="200px">
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
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ToolTip="Posição no TOP 10" VisibleIndex="1" Width="30px">
                                    <Settings AllowAutoFilter="False" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" ShowTitlePanel="True" ShowFilterRow="True" />
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

                        <asp:SqlDataSource ID="dsItensMaisVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Venda_ItemMaisVendido_Top10_Empresa" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                <asp:SessionParameter DbType="Byte" Name="idFilial" SessionField="sFILIAL_VENDA_ITEM_1" DefaultValue="99" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>

                   </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>


           

            <div id="div_Top30_Vendas_Lojas_2" class="Separacao">          
                <uc1:wucLista_Filial_Empresa_1 runat="server" ID="cboFilial_ItensMaisVendidos2"  AutoPostBack="false" />                     
            </div>

             <div id="divBotao_PaneVendaItem_2" >
                <dx:ASPxButton ID="btnAtualizar_VendaItem_2" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                    <ClientSideEvents Click="function(s, e) {cboPaneVendaItem_2.PerformCallback();}" />
                </dx:ASPxButton>
            </div>

            <dx:ASPxCallbackPanel ID="cboPaneVendaItem_2" runat="server" Width="100%" ClientInstanceName="cboPaneVendaItem_2" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
                <PanelCollection>
                    <dx:PanelContent>

                    <div id="div2" class="Separacao_Filial">

                        <dx:ASPxGridView ID="gridItensMaisVendidos2" runat="server" AutoGenerateColumns="False" DataSourceID="dsItensMaisVendidos2" KeyFieldName="CodProduto" Width="910px">
                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True"/>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ToolTip="Código do produto" VisibleIndex="2" Width="70px">
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
                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ToolTip="Nome do produto" VisibleIndex="3" Width="200px">
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
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ToolTip="Posição no TOP 10" VisibleIndex="1" Width="30px">
                                    <Settings AllowAutoFilter="False" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowFilterRow="True" ShowTitlePanel="True" VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" />
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

                        <asp:SqlDataSource ID="dsItensMaisVendidos2" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Venda_ItemMaisVendido_Top10_Empresa" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                <asp:SessionParameter DbType="Byte" DefaultValue="99" Name="idFilial" SessionField="sFILIAL_VENDA_ITEM_2" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                    </div>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

                    <div id="divTop30_Volume" class="Separacao">

                        <dx:ASPxGridView ID="gridItensMenosVendidos" runat="server" AutoGenerateColumns="False" DataSourceID="dsItensMenosVendidos" KeyFieldName="CodProduto" Width="910px">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px">
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
                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ShowInCustomizationForm="True" ToolTip="Nome do produto" VisibleIndex="2" Width="200px">
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
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição no TOP 10" VisibleIndex="0" Width="30px">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowTitlePanel="True" VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" />
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
                        <asp:SqlDataSource ID="dsItensMenosVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Volume_ItemMaisVendido_Top10_Empresa" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                <asp:SessionParameter DbType="Byte" DefaultValue="99" Name="idFilial" SessionField="sFILIAL2" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                
                    </div>

                    <div id="divTop30_Lucro" class="Separacao">

                        <dx:ASPxGridView ID="gridItensMaisVendidosLucro" runat="server" AutoGenerateColumns="False" DataSourceID="dsItensMaisVendidosLucro" KeyFieldName="CodProduto" Width="910px">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px">
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
                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ShowInCustomizationForm="True" ToolTip="Nome do produto" VisibleIndex="2" Width="200px">
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
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição no TOP 10" VisibleIndex="0" Width="30px">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowTitlePanel="True" VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" />
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
                        <asp:SqlDataSource ID="dsItensMaisVendidosLucro" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Lucro_ItemMaisVendido_Top10_Empresa" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                <asp:SessionParameter DbType="Byte" DefaultValue="99" Name="idFilial" SessionField="sFILIAL2" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                
                    </div>

                    <div id="divTop30_Menos" class="Separacao">

                        <dx:ASPxGridView ID="gridItensMenosVendidosEmpresa" runat="server" AutoGenerateColumns="False" DataSourceID="dsItensMenosVendidosEmpresa" EnableTheming="True" KeyFieldName="CodProduto" Theme="Default" Width="910px">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px">
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
                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ShowInCustomizationForm="True" ToolTip="Nome do produto" VisibleIndex="2" Width="200px">
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
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição no TOP 10" VisibleIndex="0" Width="30px">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowTitlePanel="True" VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" />
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
                        <asp:SqlDataSource ID="dsItensMenosVendidosEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Venda_ItemMenosVendido_Top10_Empresa" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                <asp:SessionParameter DbType="Byte" DefaultValue="99" Name="idFilial" SessionField="sFILIAL2" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                                
                    </div>

                    <div id="divItensComSellout" class="Separacao">

                        <dx:ASPxGridView ID="grid_Venda_ItemComSellOut_Empresa" runat="server" AutoGenerateColumns="False" DataSourceID="dsItensComSellOut" EnableTheming="True" KeyFieldName="CodProduto" Theme="Default" Width="910px">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px">
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
                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ShowInCustomizationForm="True" ToolTip="Nome do produto" VisibleIndex="2" Width="200px">
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
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição no TOP 10" VisibleIndex="0" Width="30px">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager PageSize="30">
                            </SettingsPager>
                            <Settings ShowTitlePanel="True" VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" />
                            <SettingsText Title="Itens com SellOut - Empresa" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                                <TitlePanel BackColor="DarkBlue" Font-Size="X-Large">
                                </TitlePanel>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsItensComSellOut" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Venda_ItemComSellOut_Empresa" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                                                
                    </div>
                    

<%--                </ContentTemplate>
            </asp:UpdatePanel>--%>



            <div id="divTitulo_GraficoCidade" class="Titulo_Grafico Separacao" runat="server">
                      Gráfico por Cidade - Venda e Participação
            </div>

            <div id="divGraficoCidade" class="Separacao_Filial">

                <dxchartsui:WebChartControl ID="grafParticipacaoCidade" runat="server" BackColor="Transparent" DataSourceID="dsGraficoParticipacaoCidade" Height="235px" Width="1000px" CrosshairEnabled="True">
                        <borderoptions Color="192, 192, 192" />
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="-1">
                                    <range sidemarginsenabled="True" />
                                </axisx>
                                <axisy visible="False" visibleinpanesserializable="-1">
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="False">
                                    </gridlines>
                                </axisy>
                                <defaultpane backcolor="Transparent" bordervisible="False">
                                </defaultpane>
                            </cc1:XYDiagram>
                        </diagramserializable>
                        <fillstyle>
                            <optionsserializable>
                                <cc1:SolidFillOptions />
                            </optionsserializable>
                        </fillstyle>
                        <legend  visibility="False"></legend>
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="Cidade" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Descending" SeriesPointsSortingKey="Value_1" SynchronizePointOptions="False" ValueDataMembersSerializable="vlrVendaCidade" CrosshairLabelPattern="{V:n2}" LegendName="Default Legend" ShowInLegend="False">
                                <viewserializable>
                                    <cc1:SideBySideBarSeriesView ColorEach="True">
                                    </cc1:SideBySideBarSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="Currency" precision="0" />
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:SideBySideBarSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions PointView="Argument">
                                        <valuenumericoptions format="Percent" />
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                        </seriesserializable>
                        <seriestemplate>
                            <viewserializable>
                                <cc1:SideBySideBarSeriesView>
                                </cc1:SideBySideBarSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:SideBySideBarSeriesLabel LineVisible="True">
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
                                    <pointoptionsserializable>
                                        <cc1:PointOptions>
                                        </cc1:PointOptions>
                                    </pointoptionsserializable>
                                </cc1:SideBySideBarSeriesLabel>
                            </labelserializable>
                            <legendpointoptionsserializable>
                                <cc1:PointOptions>
                                </cc1:PointOptions>
                            </legendpointoptionsserializable>
                        </seriestemplate>
                        <titles>
                            <cc1:ChartTitle Indent="0" Text="Vendas por Cidade" />
                        </titles>
                        <crosshairoptions>
                            <commonlabelpositionserializable>
                                <cc1:CrosshairMousePosition />
                            </commonlabelpositionserializable>
                        </crosshairoptions>
                        <tooltipoptions>
                            <tooltippositionserializable>
                                <cc1:ToolTipMousePosition />
                            </tooltippositionserializable>
                        </tooltipoptions>
                    </dxchartsui:WebChartControl>                

                <dxchartsui:WebChartControl ID="grafPaticipacaoCidade_Percentual" runat="server" BackColor="Transparent" DataSourceID="dsGraficoParticipacaoCidade" Height="235px" Width="1000px" CrosshairEnabled="True">
                        <borderoptions Color="192, 192, 192" />
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="-1">
                                    <range sidemarginsenabled="True" />
                                </axisx>
                                <axisy visible="False" visibleinpanesserializable="-1">
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="False">
                                    </gridlines>
                                </axisy>
                                <defaultpane backcolor="Transparent" bordervisible="False">
                                </defaultpane>
                            </cc1:XYDiagram>
                        </diagramserializable>
                        <fillstyle>
                            <optionsserializable>
                                <cc1:SolidFillOptions />
                            </optionsserializable>
                        </fillstyle>
                        <legend  visibility="False"></legend>
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="Cidade" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Descending" SeriesPointsSortingKey="Value_1" SynchronizePointOptions="False" ValueDataMembersSerializable="percPartCidade">
                                <viewserializable>
                                    <cc1:SideBySideBarSeriesView ColorEach="True">
                                    </cc1:SideBySideBarSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n2}">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="Number" />
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:SideBySideBarSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions PointView="Argument">
                                        <valuenumericoptions format="Percent" />
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                        </seriesserializable>
                        <seriestemplate>
                            <viewserializable>
                                <cc1:SideBySideBarSeriesView>
                                </cc1:SideBySideBarSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:SideBySideBarSeriesLabel LineVisible="True">
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
                                    <pointoptionsserializable>
                                        <cc1:PointOptions>
                                        </cc1:PointOptions>
                                    </pointoptionsserializable>
                                </cc1:SideBySideBarSeriesLabel>
                            </labelserializable>
                            <legendpointoptionsserializable>
                                <cc1:PointOptions>
                                </cc1:PointOptions>
                            </legendpointoptionsserializable>
                        </seriestemplate>
                        <titles>
                            <cc1:ChartTitle Text="Participação de Vendas por Cidade" />
                        </titles>
                        <crosshairoptions>
                            <commonlabelpositionserializable>
                                <cc1:CrosshairMousePosition />
                            </commonlabelpositionserializable>
                        </crosshairoptions>
                        <tooltipoptions>
                            <tooltippositionserializable>
                                <cc1:ToolTipMousePosition />
                            </tooltippositionserializable>
                        </tooltipoptions>
                    </dxchartsui:WebChartControl>

                <asp:SqlDataSource ID="dsGraficoParticipacaoCidade" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Gerencial.uspBuscarGraficoParticipacao_Cidade" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                    </SelectParameters>
                </asp:SqlDataSource>
                                
            </div>

            <div id="divTitulo_GraficoRegiao" class="Titulo_Grafico Separacao" runat="server"  >
                 Gráfico por Região - Venda e Participação
            </div>

            <div id="divGraficoRegiao" class="Separacao_Filial">

                <dxchartsui:WebChartControl ID="grafParticipacaoRegiao" runat="server" BackColor="Transparent" DataSourceID="dsGraficoParticipacaoRegiao" Height="235px" Width="1000px" CrosshairEnabled="True">
                    <borderoptions Color="192, 192, 192" />
                    <diagramserializable>
                        <cc1:XYDiagram>
                            <axisx visibleinpanesserializable="-1">
                                <range sidemarginsenabled="True" />
                            </axisx>
                            <axisy visible="False" visibleinpanesserializable="-1">
                                <range sidemarginsenabled="True" />
                                <gridlines visible="False">
                                </gridlines>
                            </axisy>
                            <defaultpane backcolor="Transparent" bordervisible="False">
                            </defaultpane>
                        </cc1:XYDiagram>
                    </diagramserializable>
                    <fillstyle>
                        <optionsserializable>
                            <cc1:SolidFillOptions />
                        </optionsserializable>
                    </fillstyle>
                    <legend Visibility="False"></legend>
                    <seriesserializable>
                        <cc1:Series ArgumentDataMember="Cidade" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Descending" SeriesPointsSortingKey="Value_1" SynchronizePointOptions="False" ValueDataMembersSerializable="vlrVendaCidade">
                            <viewserializable>
                                <cc1:SideBySideBarSeriesView ColorEach="True">
                                </cc1:SideBySideBarSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
                                    <pointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Currency" precision="0" />
                                        </cc1:PointOptions>
                                    </pointoptionsserializable>
                                </cc1:SideBySideBarSeriesLabel>
                            </labelserializable>
                            <legendpointoptionsserializable>
                                <cc1:PointOptions PointView="Argument">
                                    <valuenumericoptions format="Percent" />
                                </cc1:PointOptions>
                            </legendpointoptionsserializable>
                        </cc1:Series>
                    </seriesserializable>
                    <seriestemplate>
                        <viewserializable>
                            <cc1:SideBySideBarSeriesView>
                            </cc1:SideBySideBarSeriesView>
                        </viewserializable>
                        <labelserializable>
                            <cc1:SideBySideBarSeriesLabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:SolidFillOptions />
                                    </optionsserializable>
                                </fillstyle>
                                <pointoptionsserializable>
                                    <cc1:PointOptions>
                                    </cc1:PointOptions>
                                </pointoptionsserializable>
                            </cc1:SideBySideBarSeriesLabel>
                        </labelserializable>
                        <legendpointoptionsserializable>
                            <cc1:PointOptions>
                            </cc1:PointOptions>
                        </legendpointoptionsserializable>
                    </seriestemplate>
                    <titles>
                        <cc1:ChartTitle Indent="0" Text="Vendas por Região" />
                    </titles>
                    <crosshairoptions>
                        <commonlabelpositionserializable>
                            <cc1:CrosshairMousePosition />
                        </commonlabelpositionserializable>
                    </crosshairoptions>
                    <tooltipoptions>
                        <tooltippositionserializable>
                            <cc1:ToolTipMousePosition />
                        </tooltippositionserializable>
                    </tooltipoptions>
                </dxchartsui:WebChartControl>

                <dxchartsui:WebChartControl ID="grafPaticipacaoRegiao_Percentual" runat="server" BackColor="Transparent" DataSourceID="dsGraficoParticipacaoRegiao" Height="235px" Width="1000px" CrosshairEnabled="True">
                    <borderoptions Color="192, 192, 192" />
                    <diagramserializable>
                        <cc1:XYDiagram>
                            <axisx visibleinpanesserializable="-1">
                                <range sidemarginsenabled="True" />
                            </axisx>
                            <axisy visible="False" visibleinpanesserializable="-1">
                                <range sidemarginsenabled="True" />
                                <gridlines visible="False">
                                </gridlines>
                            </axisy>
                            <defaultpane backcolor="Transparent" bordervisible="False">
                            </defaultpane>
                        </cc1:XYDiagram>
                    </diagramserializable>
                    <fillstyle>
                        <optionsserializable>
                            <cc1:SolidFillOptions />
                        </optionsserializable>
                    </fillstyle>
                    <legend Visibility="False"></legend>
                    <seriesserializable>
                        <cc1:Series ArgumentDataMember="Cidade" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Descending" SeriesPointsSortingKey="Value_1" SynchronizePointOptions="False" ValueDataMembersSerializable="percPartCidade">
                            <viewserializable>
                                <cc1:SideBySideBarSeriesView ColorEach="True">
                                </cc1:SideBySideBarSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n2}">
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
                                    <pointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" />
                                        </cc1:PointOptions>
                                    </pointoptionsserializable>
                                </cc1:SideBySideBarSeriesLabel>
                            </labelserializable>
                            <legendpointoptionsserializable>
                                <cc1:PointOptions PointView="Argument">
                                    <valuenumericoptions format="Percent" />
                                </cc1:PointOptions>
                            </legendpointoptionsserializable>
                        </cc1:Series>
                    </seriesserializable>
                    <seriestemplate>
                        <viewserializable>
                            <cc1:SideBySideBarSeriesView>
                            </cc1:SideBySideBarSeriesView>
                        </viewserializable>
                        <labelserializable>
                            <cc1:SideBySideBarSeriesLabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:SolidFillOptions />
                                    </optionsserializable>
                                </fillstyle>
                                <pointoptionsserializable>
                                    <cc1:PointOptions>
                                    </cc1:PointOptions>
                                </pointoptionsserializable>
                            </cc1:SideBySideBarSeriesLabel>
                        </labelserializable>
                        <legendpointoptionsserializable>
                            <cc1:PointOptions>
                            </cc1:PointOptions>
                        </legendpointoptionsserializable>
                    </seriestemplate>
                    <titles>
                        <cc1:ChartTitle Text="Participação de Vendas por Região" />
                    </titles>
                    <crosshairoptions>
                        <commonlabelpositionserializable>
                            <cc1:CrosshairMousePosition />
                        </commonlabelpositionserializable>
                    </crosshairoptions>
                    <tooltipoptions>
                        <tooltippositionserializable>
                            <cc1:ToolTipMousePosition />
                        </tooltippositionserializable>
                    </tooltipoptions>
                </dxchartsui:WebChartControl>
                
                <asp:SqlDataSource ID="dsGraficoParticipacaoRegiao" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Gerencial.uspBuscarGraficoParticipacao_Regiao" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
            </div> 

            <div id="divVendaHora" class="Separacao">

                     <dx:ASPxGridView ID="gridHoras" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="dsVendaPorHora" EnableTheming="True" KeyFieldName="descHI" 
                            Theme="DevEx" Width="345px">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Intervalo" FieldName="descHI" 
                                    VisibleIndex="0" Width="40px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Venda" FieldName="Real" VisibleIndex="1" 
                                    Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="%" FieldName="perc" VisibleIndex="2" 
                                    Width="75px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Hora" FieldName="Hora"  ToolTip ="Hora de Atualização"
                                    VisibleIndex="3" Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:HH:mm}" EncodeHtml="False"></PropertiesTextEdit>                                    
                                    <CellStyle HorizontalAlign="Center"  BorderRight-BorderColor="Gray" BorderRight-BorderStyle="Solid" BorderRight-BorderWidth="1px">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Venda Hora" FieldName="vlrVendaHora" VisibleIndex="4" 
                                    Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit> 
                                    <CellStyle ForeColor="Blue"></CellStyle>                                   
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" VisibleIndex="5" 
                                    Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <CellStyle ForeColor="Blue"></CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowTitlePanel="True" />
                            <SettingsText Title="Analise Venda por Hora" 
                                EmptyDataRow="Disponível à partir das 09:30" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <TitlePanel Font-Size="Medium">
                                </TitlePanel>
                            	    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>

                            </Styles>
                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="dsVendaPorHora" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            SelectCommand="web_VendaPorHora" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                            </SelectParameters>
                        </asp:SqlDataSource>


            </div>
                    
<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>

</asp:Content>

