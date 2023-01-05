<%@ Page Title="Ranking de Vendas Diário -Posto" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="VendaAcompanhamento_Posto.aspx.vb" Inherits="MemberPages_Vendas_VendaAcompanhamento_Posto" %>

<%@ OutputCache Duration="42000" VaryByParam="none" %>

<%@ Register src="../../Controles/wucListaDia.ascx" tagname="wucListaDia" tagprefix="uc5" %>

<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc2" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa_1.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa_1" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa_2.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa_2" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">

         #divBotaoAtualizar {
            clear:both;
            float:left;
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

      
        #divBotao_PaneVendaItem_1 {
            float: left; 
            margin-left: 5px;
            padding-top: 20px;
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
                        ShowFooter="True" HorizontalScrollBarMode="Visible" />
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
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                    SelectCommand="Vendas.uspBuscarVendaAcompanhamentoPosto" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="dia" SessionField="sDIA" DbType="Date" />
                                
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>


 <%-- ********************* L U C R O   N E G A T I V O ************************* --%>
            
    

            <div id="div_Top30_Lucro_Negativa_Lojas" class="Separacao">                        
                <uc1:wucLista_Filial_Empresa_2 runat="server" ID="cboFilial_ItensLucroNegativo" AutoPostBack="false" Visible="False"  />

            </div>

            <div id="divBotao_PaneVendaItemLucroNegativo" >
                <dx:ASPxButton ID="btnAtualizar_ItemLucroNegativo" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue" Visible="False">
                    <ClientSideEvents Click="function(s, e) {cboPaneLucroItemNegativo.PerformCallback();}" />
                </dx:ASPxButton>
            </div>

            <dx:ASPxCallbackPanel ID="cboPaneLucroItemNegativo" runat="server" Width="100%" ClientInstanceName="cboPaneLucroItemNegativo" Theme="Metropolis" Images-LoadingPanel-AlternateText="Aguarde. Atualizando" >
            <Images>
                <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
            </Images>

            <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
          
                <PanelCollection>
                    <dx:PanelContent>   
                             
                         <div id="divTop30_Lucro_Negativo" class="Separacao">

                          <dx:ASPxGridView ID="grid_Top30_Lucro_Negativo" ClientInstanceName="grid_Top30_Lucro_Negativo" runat="server" DataSourceID="ds_Top30_Lucro_Negativo" AutoGenerateColumns="False" Width="1150px" KeyFieldName="CodProduto">
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
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ToolTip="Código do produto" VisibleIndex="3" Width="70px">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" VisibleIndex="5">
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
                                <dx:GridViewBandColumn Caption="Margem Praticada" VisibleIndex="6">
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
                                <dx:GridViewBandColumn Caption="Sell Out" VisibleIndex="7">
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
                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ToolTip="Nome do produto" VisibleIndex="4" Width="200px">
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
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0" Width="70px" SortIndex="0" SortOrder="Ascending">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <HeaderStyle BackColor="#999999" />
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
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ToolTip="Posição no TOP 10" VisibleIndex="2" Width="30px">
                                    <Settings AllowAutoFilter="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialDesc" ShowInCustomizationForm="True" ToolTip="Descrição da Filial" VisibleIndex="1" Width="200px">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                              <SettingsPager Mode="ShowAllRecords">
                              </SettingsPager>
                            <Settings VerticalScrollableHeight="460" VerticalScrollBarMode="Visible" ShowTitlePanel="True" ShowFilterRow="True" ShowFooter="True" />
                            <SettingsText Title="Todos Itens com Lucro Negativo na Empresa" />
                              <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                              <TotalSummary>
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoVenda" SummaryType="Average" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercial" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut_Kit" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                              </TotalSummary>
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

                        <asp:SqlDataSource ID="ds_Top30_Lucro_Negativo" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Lucro_Negativo_Posto" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                <asp:SessionParameter DbType="Int16" DefaultValue="99" Name="idFilial" SessionField="sFILIAL_LUCRO_NEGATIVO" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                
                    </div>

                     </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
                  

            
                    
<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>

</asp:Content>

