<%@ Page Title="Vendas por Loja" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaAcompanhamentoJoanir.aspx.vb" Inherits="MemberPages_Vendas_VendaAcompanhamentoJoanir" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<%@ Register src="../../Controles/wucListaDia.ascx" tagname="wucListaDia" tagprefix="uc5" %>

<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc2" %>

<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc2" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wuc_KPI_Secao_Depto.ascx" TagPrefix="uc1" TagName="wuc_KPI_Secao_Depto" %>


<%@ Register src="../../Controles/wucListaSecao.ascx" tagname="wucListaSecao" tagprefix="uc3" %>


<%@ Register src="../../Controles/wucProdutoEncontra.ascx" tagname="wucProdutoEncontra" tagprefix="uc4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <link href="../../css/myCSS.css" rel="stylesheet" />
    
    <style type="text/css">  
        .accordion {  
            width: 400px;  
        }  
          
        .accordionHeader {  
            border: 1px solid #2F4F4F;  
            color: white;  
            background-color: #2E4d7B;  
            font-family: Arial, Sans-Serif;  
            font-size: 12px;  
            font-weight: bold;  
            padding: 5px;  
            margin-top: 5px;  
            cursor: pointer;  
        }  
          
        .accordionHeaderSelected {  
            border: 1px solid #2F4F4F;  
            color: white;  
            background-color: #5078B3;  
            font-family: Arial, Sans-Serif;  
            font-size: 12px;  
            font-weight: bold;  
            padding: 5px;  
            margin-top: 5px;  
            cursor: pointer;  
        }  
          
        .accordionContent {  
            background-color: #D3DEEF;  
            border: 1px dashed #2F4F4F;  
            border-top: none;  
            padding: 5px;  
            padding-top: 10px;  
        }  
            .style4
            {
                width: 100%;
                 border: 1px solid gray;
                 border-radius: 3px;
                 padding: 2px;
            }
               .auto-style1 {
                   width: 37px;
               }
               .FixarCabecalho {
                   width: 147px;
               }
               .descVendaAno {
                   width: 98px;
               }
               .BotaoAtualizar {
                   width: 106px;
               }
               .BotaoExcel {
                   width: 143px;
               }
               .SelecaoDia {
        }

        #divKPI {
            clear: both;
            float: left;
        }

        #divDados {
                        clear: both;
            float: left;
        }

 
        .auto-style4 {
            width: 87px;
           
        }
        .auto-style5 {
            width: 77px;
        }

 
        .auto-style6 {
            width: 244px;
        }

        divTotal {           
            float: left;
        }

        divSecao {
            float: left;
        }

        divItem {
            float: left;
        }

        divListaSecao {
            float: left
        }

        FiltroMercadologico {
            clear: both;
            float: left;
            height: 140px;
            width: 800px;
            border: 1px solid gray
        }

 
    </style>  
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 




    <div id="divDados">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
        <ContentTemplate>   

           

            <table>
               
                <tr>
                    <td style="background-color:red">
                        <asp:LinkButton ID="lnkAcompanhamento" runat="server" PostBackUrl="~/MemberPages/Gerencial/AnaliseHoraJoanir.aspx" ForeColor="White">Analise Hora</asp:LinkButton>
                    </td>
                  <%--  <td style="width: 100px; background-color:blue; margin-left: 10px">
                               &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <asp:LinkButton ID="lnkPosto" runat="server" PostBackUrl="http://10.1.1.14:82/MemberPages/PostoEmpresa" ForeColor="White">Posto</asp:LinkButton>
                            </td>--%>
                    <td class="SelecaoDia">
                        <uc5:wucListaDia ID="cboDia" runat="server" />
                    </td>
                   
                    <td style="width: 130px">
                        <dx:ASPxCheckBox ID="optNumCliente" runat="server" AutoPostBack="True" 
                            Text="Mostrar Clientes" Theme="DevEx">
                        </dx:ASPxCheckBox>
                    </td>

                    <td style="width: 100px"> 
                        <dx:ASPxCheckBox ID="chkLucratividade" runat="server" Text="Exibir Lucro" 
                            Theme="DevEx" AutoPostBack="True">
                        </dx:ASPxCheckBox>
                    </td>

                    <td style="width: 150px">
                        <dx:ASPxCheckBox ID="chkEstatisticas" runat="server" AutoPostBack="True" 
                            Text="Exibir Estatísticas" Theme="DevEx">
                        </dx:ASPxCheckBox>
                    </td>
                    
                    <td class="FixarCabecalho">
                        <dx:ASPxCheckBox ID="chkFixar" runat="server" AutoPostBack="True" 
                            Text="Fixar Cabeçalho" Theme="DevEx" Height="27px" Width="150px" 
                            Checked="True" CheckState="Checked">
                        </dx:ASPxCheckBox>
                    </td>

                    <td class="descVendaAno">
                        <strong>Venda no Ano:</strong>
                    </td>

                    <td>
                        <asp:Label ID="lblVendaAno" runat="server" Font-Size="Medium" Text="Label" Width="115px"></asp:Label>
                    </td>

                    <td class="BotaoAtualizar">
                        <uc2:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
                    </td>
                    
                    <td style="width: 100px">

                    </td>
                </tr> <%--Primeiro Cabeçalho--%>

            </table>

            <table align="left" cellpadding="2" class="auto-style1">
              
                <tr>
                    <td align="left" valign="top" rowspan="2">
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
                            AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Descricao" 
                            Theme="SoftOrange" style="margin-bottom: 0px" DataSourceID="dsVendaLoja">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifCresc" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestaoVenda" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOut" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="NumClientes" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargem" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" 
                                    SummaryType="Custom" />                            
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrVendaFunc" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTicketMedio" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrVendaCheckout" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrVendaMetragem" 
                                    SummaryType="Custom" />
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
                            <Columns>
                                <dx:GridViewBandColumn Caption="Estatísticas - valor médio" VisibleIndex="8" 
                                    Name="bandEstatisticas" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Func." FieldName="vlrVendaFunc" 
                                            ToolTip="Valor médio de vendas por funcionários." VisibleIndex="0" 
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Ticket" FieldName="vlrTicketMedio" 
                                            ToolTip="Valor do ticket médio" VisibleIndex="1" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Check" FieldName="vlrVendaCheckout" ToolTip="Valor médio de vendas por check-out." 
                                            VisibleIndex="2"  Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EnableFocusedStyle="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="M2" FieldName="vlrVendaMetragem" ToolTip="Valor da venda por metro quadrado" 
                                            VisibleIndex="3" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right"></CellStyle>
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
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="percRealMargem" 
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
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
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Sell" FieldName="percRealMargemSellOut" 
                                            ToolTip="Margem com Sell-Out" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn FieldName="numClientes" 
                                    VisibleIndex="6" Caption="Nº Clientes" Visible="False" 
                                    ToolTip="Número de clientes que passou na loja." Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle Wrap="True" />
                                    <CellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="1">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealAA" ToolTip="Venda do Ano Anterior (mesmo dia da semana)" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
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
                                        </dx:GridViewDataCheckColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Desc." FieldName="Descricao" 
                                    VisibleIndex="0" Width="120px">
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
                                            VisibleIndex="3" 
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
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" 
                                            VisibleIndex="4" 
                                            ToolTip="Valor da meta revista de venda que foi replanejada." Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealVenda" 
                                            VisibleIndex="5" ToolTip="Valor da venda realizada." Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="Blue">
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
                                <dx:GridViewBandColumn Caption="Lucro" VisibleIndex="3" 
                                
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
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="Blue">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaMargem" 
                                            VisibleIndex="0" ToolTip="Valor da meta de lucro" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle ForeColor="#009900">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAtingLucro" 
                                            VisibleIndex="3"  Width="60px" 
                                        
                                            ToolTip="Percentual de atingimento do lucro (Realizado dividido pela Meta)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right">
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="difLucro" 
                                            ToolTip="Valor da diferença entre a Meta de Lucro e o Realizado do Lucro." 
                                            UnboundType="Decimal" VisibleIndex="2" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Right">
                                            </CellStyle>
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
                                ShowFooter="False" />
                            <SettingsText EmptyDataRow="Não há vendas realizadas para este dia." />
                            <Styles>
	                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                <Footer Font-Bold="True">
                                </Footer>
                            </Styles>

                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="dsVendaLoja" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            SelectCommand="Vendas.uspBuscarVendaAcompanhamento" 
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="dia" SessionField="sDIA" DbType="Date" />
                                
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:SqlDataSource ID="dsVendaSecao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            SelectCommand="Ranking.uspRankigDiarioAtualiza_w_Secao" 
                            SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Dia" SessionField="sDIA" DbType="Date" />
                                <asp:SessionParameter Name="idSecao" SessionField="sSECAO" DbType="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                                <asp:SqlDataSource ID="dsTopWeek" runat="server" 
                                
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            SelectCommand="SET LANGUAGE 'Portuguese' SELECT TOP 10 Dia, vlrVenda, LEFT(DATENAME(weekday, Dia),3) AS Semana, CASE WHEN vlrVenda=0 THEN 0 WHEN vlrMargem = 0 THEN 0 ELSE ((vlrMargem / vlrVenda) * 100) END AS 'Margem', ROW_NUMBER() OVER(ORDER BY vlrVenda DESC) AS rnk  
FROM viewVendaRealEmpresa_Dia 
WHERE Ano &gt;= 2010 AND DATEPART(weekday, Dia) = DATEPART(weekday, @Dia) 
ORDER BY vlrVenda DESC">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="Dia" SessionField="sDIA" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="dsFiveTop" runat="server" 
                                
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SET LANGUAGE 'Portuguese' SELECT TOP 10 Dia, vlrVenda,  LEFT(DATENAME(weekday, Dia),3) As Semana, CASE WHEN vlrVenda=0 THEN 0 WHEN vlrMargem = 0 THEN 0 ELSE ((vlrMargem / vlrVenda) * 100) END AS 'Margem', ROW_NUMBER() OVER(ORDER BY vlrVenda DESC) AS rnk
    FROM viewVendaRealEmpresa_dia
    WHERE Ano &gt;= 2010 AND Codloja=99
    ORDER BY vlrVenda DESC"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="dsMes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                
                            SelectCommand="SELECT TOP 10 viewVendaMargemMes_BaseVendaDia.Ano, viewVendaMargemMes_BaseVendaDia.vlrVenda, viewVendaMargemMes_BaseVendaDia.percMargem, tblCadMes.descMes, ROW_NUMBER() OVER(ORDER BY viewVendaMargemMes_BaseVendaDia.vlrVenda DESC) AS rnk  FROM viewVendaMargemMes_BaseVendaDia INNER JOIN tblCadMes ON viewVendaMargemMes_BaseVendaDia.Mes = tblCadMes.mes ORDER BY viewVendaMargemMes_BaseVendaDia.vlrVenda DESC
 ">
                </asp:SqlDataSource>
                    </td>
                    <td align="left" valign="top" style="font-size: medium; ">

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

                        <asp:SqlDataSource ID="dsVendaPorHora_Secao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerTran_VendasConnectionString %>" 
                            SelectCommand="Vendas.uspBuscarHorasSecao" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top">
                                <cc2:accordion 
                                    ID="Accordion1" 
                                        CssClass="accordion"  
                                        HeaderCssClass="accordionHeader"  
                                        HeaderSelectedCssClass="accordionHeaderSelected"  
                                        ContentCssClass="accordionContent"
                                        runat="server" Width="320px" Height="705px" FramesPerSecond="30" 
                                    TransitionDuration="250">
                                    <Panes>
                                       <cc2:AccordionPane ID="AccordionPane1" runat="server" Height="500px">
                                            <Header> Ranking das 10 Maiores Vendas</Header>
                                            <Content>
                                                <dx:aspxgridview ID="ASPxGridView2" runat="server" 
                                                AutoGenerateColumns="False" 
                                                CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                CssPostfix="Office2003_Blue" DataSourceID="dsFiveTop" KeyFieldName="Dia" 
                                                Width="310px">
                                                <SettingsBehavior AllowFocusedRow="True" />
                                                <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                    CssPostfix="Office2003_Blue">
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                    <AlternatingRow BackColor="#E6F2FF">
                                                    </AlternatingRow>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                </Styles>
                                                <SettingsLoadingPanel Text="Aguarde. Processando...&amp;hellip;" />
                                                <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                                    <CollapsedButton Height="12px" 
                                                        Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                        Width="11px" />
                                                    <ExpandedButton Height="12px" 
                                                        Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" 
                                                        Width="11px" />
                                                    <DetailCollapsedButton Height="12px" 
                                                        Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                        Width="11px" />
                                                    <DetailExpandedButton Height="12px" 
                                                        Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" 
                                                        Width="11px" />
                                                    <FilterRowButton Height="13px" Width="13px" />
                                                </Images>
                                                <SettingsText Title="Ranking das 10 maiores vendas" />
                                                <Columns>
                                                    <dx:gridviewdatadatecolumn FieldName="rnk" VisibleIndex="0" Width="32px" ToolTip="Posição no Ranking" Caption ="Rank" CellStyle-HorizontalAlign="Center">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:gridviewdatadatecolumn>
                                                    <dx:gridviewdatadatecolumn FieldName="Dia" VisibleIndex="1" Width="70px">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:gridviewdatadatecolumn>
                                                    <dx:gridviewdatatextcolumn FieldName="Semana" VisibleIndex="2" Width="37px" ToolTip="Nome do dia na semana" Caption ="Sem." CellStyle-HorizontalAlign="Center">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:gridviewdatatextcolumn>
                                                    <dx:gridviewdatatextcolumn Caption="Venda" FieldName="vlrVenda" 
                                                        ToolTip="As 10 maiores vendas da empresa em ordem decrescente." 
                                                        VisibleIndex="3" Width="65px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:gridviewdatatextcolumn>
                                                    <dx:gridviewdatatextcolumn FieldName="Margem" VisibleIndex="4" Width="45px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                    </dx:gridviewdatatextcolumn> 
                                                
                                                </Columns>
                                                <Settings ShowTitlePanel="False" ShowVerticalScrollBar="False" 
                                                    VerticalScrollableHeight="215" />
                                                <StylesEditors>
                                                    <ProgressBar Height="25px">
                                                    </ProgressBar>
                                                </StylesEditors>
                                            </dx:aspxgridview>
                                            </Content>
                                       </cc2:AccordionPane> 
                                       <cc2:AccordionPane ID="AccordionPane2" runat="server" Height="300px">
                                            <Header> Ranking das 10 Maiores Vendas - Dia da Semana</Header>
                                            <Content>
                                                               <dx:aspxgridview ID="gridTopSemana" runat="server" 
                                                    AutoGenerateColumns="False" 
                                                CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                CssPostfix="Office2003_Blue" DataSourceID="dsTopWeek" KeyFieldName="Dia" 
                                                Width="310px">
                                                <SettingsBehavior AllowFocusedRow="True" />
                                                <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                    CssPostfix="Office2003_Blue">
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                    <AlternatingRow BackColor="#E6F2FF">
                                                    </AlternatingRow>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                </Styles>
                                                <SettingsLoadingPanel Text="Aguarde. Processando...&amp;hellip;" />
                                                <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                                    <CollapsedButton Height="12px" 
                                                        Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                        Width="11px" />
                                                    <ExpandedButton Height="12px" 
                                                        Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" 
                                                        Width="11px" />
                                                    <DetailCollapsedButton Height="12px" 
                                                        Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                        Width="11px" />
                                                    <DetailExpandedButton Height="12px" 
                                                        Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" 
                                                        Width="11px" />
                                                    <FilterRowButton Height="13px" Width="13px" />
                                                </Images>
                                                <Columns>
                                                    <dx:gridviewdatadatecolumn FieldName="rnk" VisibleIndex="0" Width="32px" ToolTip="Posição no Ranking" Caption ="Rank" CellStyle-HorizontalAlign="Center">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:gridviewdatadatecolumn>
                                                    <dx:gridviewdatadatecolumn FieldName="Dia" VisibleIndex="1" Width="70px">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:gridviewdatadatecolumn>
                                                    <dx:gridviewdatatextcolumn FieldName="Semana" VisibleIndex="2" Width="37px" ToolTip="Nome do dia na semana" Caption ="Sem." CellStyle-HorizontalAlign="Center">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:gridviewdatatextcolumn>
                                                    <dx:gridviewdatatextcolumn Caption="Venda" FieldName="vlrVenda" 
                                                        ToolTip="As 10 maiores vendas da empresa em ordem decrescente." 
                                                        VisibleIndex="3" Width="65px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:gridviewdatatextcolumn>
                                                    <dx:gridviewdatatextcolumn FieldName="Margem" VisibleIndex="4" Width="45px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                    </dx:gridviewdatatextcolumn> 
                                                
                                                </Columns>
                                                    <Settings ShowTitlePanel="False" ShowVerticalScrollBar="False" 
                                                    VerticalScrollableHeight="215" />
                                                <StylesEditors>
                                                    <ProgressBar Height="25px">
                                                    </ProgressBar>
                                                </StylesEditors>
                                                </dx:aspxgridview>
                                            </Content>
                                       </cc2:AccordionPane>
                                       <cc2:AccordionPane ID="AccordionPane3" runat="server" Height="300px">
                                            <Header> Ranking das 10 Maiores Vendas por Mês</Header>
                                            <Content>
                                               <dx:aspxgridview ID="gridTopMes" runat="server" AutoGenerateColumns="False" 
                                                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                    CssPostfix="Office2003_Blue" DataSourceID="dsMes" Width="310px" 
                                                    Visible="True">
                                                    <SettingsBehavior AllowFocusedRow="True" />
                                                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                        CssPostfix="Office2003_Blue">
                                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                        </Header>
                                                        <AlternatingRow BackColor="#E6F2FF">
                                                        </AlternatingRow>
                                                        <LoadingPanel ImageSpacing="10px">
                                                        </LoadingPanel>
                                                    </Styles>
                                                    <SettingsLoadingPanel Text="Aguarde. Processando...&amp;hellip;" />
                                                    <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                                        <CollapsedButton Height="12px" 
                                                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                            Width="11px" />
                                                        <ExpandedButton Height="12px" 
                                                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" 
                                                            Width="11px" />
                                                        <DetailCollapsedButton Height="12px" 
                                                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                            Width="11px" />
                                                        <DetailExpandedButton Height="12px" 
                                                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" 
                                                            Width="11px" />
                                                        <FilterRowButton Height="13px" Width="13px" />
                                                    </Images>
                                                    <SettingsText Title="Ranking das 10 Maiores Vendas por Mês" />
                                                    <Columns>
                                                        <dx:gridviewdatadatecolumn FieldName="rnk" VisibleIndex="0" Width="32px" ToolTip="Posição no Ranking" Caption ="Rank" CellStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </dx:gridviewdatadatecolumn>
                                                        <dx:gridviewdatatextcolumn Caption="Ano" FieldName="Ano" VisibleIndex="1" 
                                                            Width="35px">
                                                        </dx:gridviewdatatextcolumn>
                                                        <dx:gridviewdatatextcolumn Caption="Mês" FieldName="descMes" 
                                                            VisibleIndex="2" Width="65px">
                                                        </dx:gridviewdatatextcolumn>
                                                        <dx:gridviewdatatextcolumn Caption="Venda" FieldName="vlrVenda" 
                                                            VisibleIndex="3" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        </dx:gridviewdatatextcolumn>
                                                        <dx:gridviewdatatextcolumn Caption="Margem" FieldName="percMargem" 
                                                            VisibleIndex="4" Width="50px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        </dx:gridviewdatatextcolumn>
                                                    </Columns>
                                                    <Settings ShowTitlePanel="False" ShowVerticalScrollBar="False" 
                                                        VerticalScrollableHeight="215" />
                                                    <StylesEditors>
                                                        <ProgressBar Height="25px">
                                                        </ProgressBar>
                                                    </StylesEditors>
                                                </dx:aspxgridview>
                                            </Content>
                                       </cc2:AccordionPane>
                                    </Panes>
                            
                                </cc2:accordion> 
                            </td>
                </tr>

            </table> 

<%--            <table>
                <tr>
                    <td>
                        <div id="divTitulo_ItensMaisVendidos" runat="server" style="color:gray; font-size :26px; text-align:center">Top 20 - Itens Mais Vendidos na Empresa</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxGridView ID="gridItensMaisVendidos" runat="server" DataSourceID="dsItensMaisVendidos" AutoGenerateColumns="False" Width="910px" Visible="False">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ShowInCustomizationForm="True" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#999999" />
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
                            <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsItensMaisVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Venda_ItemMaisVendido_Top10_Empresa" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>

<%--                <tr>
                    <td>
                        <div id="divTitulo_ItensMenosVendidos" runat="server" style="color:gray; font-size :26px; text-align:center">Top 20 - Volume Mais Vendido na Empresa</div>
                    </td>
                </tr>--%>

<%--                <tr>
                    <td>
                        <dx:ASPxGridView ID="gridItensMenosVendidos" runat="server" DataSourceID="dsItensMenosVendidos" AutoGenerateColumns="False" Width="910px" Visible="False">
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
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ShowInCustomizationForm="True" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
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
                            <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsItensMenosVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Volume_ItemMaisVendido_Top10_Empresa" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>--%>

<%--                <tr>
                    <td>
                        <div id="divTituloItensMaisVendidosLucro" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px">Top 20 - Lucro dos Itens Mais Vendidos na Empresa</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxGridView ID="gridItensMaisVendidosLucro" runat="server" DataSourceID="dsItensMaisVendidosLucro" AutoGenerateColumns="False" Width="910px">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ShowInCustomizationForm="True" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
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
                            <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsItensMaisVendidosLucro" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Lucro_ItemMaisVendido_Top10_Empresa" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>--%>


<%--                <tr>
                    <td>
                        <div id="divTituloItensMenosVendidosEmpresa" runat="server" style="color:red; font-size :26px; text-align:center; padding-top: 20px">Top 20 - Itens Menos Vendidos na Empresa</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxGridView ID="gridItensMenosVendidosEmpresa" runat="server" DataSourceID="dsItensMenosVendidosEmpresa" AutoGenerateColumns="False" Width="910px" EnableTheming="True" Theme="Default">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ShowInCustomizationForm="True" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#999999" />
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
                            <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsItensMenosVendidosEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Venda_ItemMenosVendido_Top10_Empresa" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>--%>


<%--                <tr>
                    <td>
                        <div id="divTitulo_GraficoCidade" runat="server" style="color:gray; font-size :26px; text-align:center">Gráfico por Cidade - Venda e Participação</div>
                    </td>
                </tr>--%>
<%--                <tr>
                    <td>
                        <dxchartsui:WebChartControl ID="grafParticipacaoCidade" runat="server" DataSourceID="dsGraficoParticipacaoCidade" Height="235px" Width="1000px" BackColor="Transparent">
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
                                        <cc1:SideBySideBarSeriesLabel LineVisible="True">
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
                        <asp:SqlDataSource ID="dsGraficoParticipacaoCidade" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Gerencial.uspBuscarGraficoParticipacao_Cidade" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>--%>

<%--                <tr>
                    <td>                   
                       <dxchartsui:WebChartControl ID="grafPaticipacaoCidade_Percentual" runat="server" DataSourceID="dsGraficoParticipacaoCidade" Height="235px" Width="1000px" BackColor="Transparent">
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
                                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
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
                     </td>
                </tr>--%>
<%--                <tr>
                    <td>
                        <div id="divTitulo_GraficoRegiao" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top : 20px">Gráfico por Região - Venda e Participação</div>
                    </td>
                </tr>--%>

<%--                <tr>
                    <td>
                        <dxchartsui:WebChartControl ID="grafParticipacaoRegiao" runat="server" DataSourceID="dsGraficoParticipacaoRegiao" Height="235px" Width="1000px" BackColor="Transparent">
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
                                        <cc1:SideBySideBarSeriesLabel LineVisible="True">
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
                        <asp:SqlDataSource ID="dsGraficoParticipacaoRegiao" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Gerencial.uspBuscarGraficoParticipacao_Regiao" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>--%>

<%--                <tr>
                    <td>                   
                       <dxchartsui:WebChartControl ID="grafPaticipacaoRegiao_Percentual" runat="server" DataSourceID="dsGraficoParticipacaoRegiao" Height="235px" Width="1000px" BackColor="Transparent">
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
                                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
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
                     </td>
                </tr>--%>
                
            </table>--%>

        </ContentTemplate>
    </asp:UpdatePanel>

            <div id="divKPI">
                <uc1:wuc_KPI_Secao_Depto runat="server" ID="KPI" />
            </div>

    </div>

    <p>
        &nbsp;</p>
    <p>
        <br />
    </p>
</asp:Content>

