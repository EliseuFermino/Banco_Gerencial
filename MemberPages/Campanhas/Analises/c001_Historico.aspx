<%@ Page Title="Analise Campanha" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="c001_Historico.aspx.vb" Inherits="MemberPages_Campanhas_Analises_c001_Historico" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>



<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMesPeriodo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css" >
       
        #divAno {
           float: left;
           margin-left: 1px;
        }

        #divMes {
           float: left;
           margin-left: 1px;
        }

        #divTipoBorda {
            float: left;
            width: 170px;
        }

        #divTipoDesc {
            float: left;
            margin-left: 3px;
            padding-top: 4px;
        }

        #divTipo {
            float: left;
            margin-left: 2px;
            padding-top: 3px;
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 30px;
            margin-left: 1px;  
            margin-top: 2px;          
        }

        #divGrid1 {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 1015px;
            margin-left: 1px;            
        }

        #divGrafico1 {
           clear:both;
           float: left;
        }

        #divGrafico2 {
           clear:both;
           float: left;
        }

        #divTabelaSintetico {
            clear:both;
           float: left;        
        }

       #divGraficoItem2 {
            clear:both;
           float: left;        
        }

        #divTodasCampanhas {
            clear:both;
           float: left;        
        }

  

        .TituloGrafico {
           clear:both; 
           float:left  ;      
           font-size: 30px;
           background-color:lightgray;
           margin-top: 10px;
           text-align: center; 
           width: 1000px;   
           color:GrayText; 
           border-top-left-radius: 5px;     
           border-top-right-radius: 5px;     
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 2px;
            width: 80px;  
            padding-top: 2px;                                
        }

        .Titulo {
            clear:both;
            color:dimgray;
            padding-top: 10px;
            font-size: 16px;
            text-align: Left;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    

                <div id="divAno" class="myBorder">
                    <uc1:wucAno runat="server" ID="cboAno" />
                </div>

                <div id="divMes" class="myBorder">
                    <uc1:wuciListaMes runat="server" ID="cboMes" />
                </div>

                <div id="divTipoBorda" class="myBorder">

                    <div id="divTipoDesc" >
                        Tipo
                    </div>
                    <div id="divTipo">
                        <asp:DropDownList ID="cboTipo" runat="server" Width="120px">

                            <asp:ListItem Value="OFERTATV">Oferta TV</asp:ListItem>
                            <asp:ListItem Value="OFERTATVNORTE">Oferta TV Norte</asp:ListItem>
                            <asp:ListItem Value="GERAL">Geral</asp:ListItem>
                            <asp:ListItem Value="ESPECIAL">Especial</asp:ListItem>
                            <asp:ListItem Value="COMPRADOR">Comprador</asp:ListItem>

                        </asp:DropDownList>
                    </div>

                </div>

                <div id="divBotaoAtualizar">
                    <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                        <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
                    </dx:ASPxButton>
                </div>

                <div id="divGrid1">
                    <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="1020px" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Atualizando">
                        <PanelCollection>
                            <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                               <div id="divTituloSintetico" runat="server" class="TituloGrafico">
                                   <asp:Label ID="lblTituloSintetico" runat="server" Text="Analise do Total de Todas Campanhas"></asp:Label>
                               </div>

                               <div id="divTabelaSintetico">
                                   <dx:ASPxGridView ID="gridTabelaSintetica" runat="server" DataSourceID="dsDadosTabelaSintetica" AutoGenerateColumns="False" EnableTheming="True" Theme="Default" KeyFieldName="idCampanha" Width="1000px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellOut" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difMargemVlr" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemPerc" SummaryType="Custom" />
                        </TotalSummary>
                                       <GroupSummary>
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalProdutos" ShowInGroupFooterColumn="TotalProdutos" SummaryType="Sum" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" ShowInGroupFooterColumn="Qtde" SummaryType="Sum" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro" ShowInGroupFooterColumn="vlrLucro" SummaryType="Sum" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellOut" ShowInGroupFooterColumn="vlrLucroSellOut" SummaryType="Sum" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difMargemVlr" ShowInGroupFooterColumn="difMargemVlr" SummaryType="Sum" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" ShowInGroupFooterColumn="numCliente" SummaryType="Sum" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="percMargem" SummaryType="Custom" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" ShowInGroupFooterColumn="percMargemSellOut" SummaryType="Custom" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemPerc" ShowInGroupFooterColumn="difMargemPerc" SummaryType="Custom" />
                                       </GroupSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="idCampanha" VisibleIndex="0" Caption="Código" Width="70px" FixedStyle="Left">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descCampanha" VisibleIndex="1" Caption="Descrição da Campanha" Width="250px" FixedStyle="Left">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrVenda" ReadOnly="True" VisibleIndex="4" Caption="R$" SortIndex="0" SortOrder="Descending" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <CellStyle>
                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Qtde" ReadOnly="True" VisibleIndex="3" Caption="Volume" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Margem" ShowInCustomizationForm="True" ToolTip="Quadro de Margem" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucro" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do Lucro" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Margem SellOut" ShowInCustomizationForm="True" ToolTip="Quadro de Margem com SellOut" VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do SellOut" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do SellOut" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Campanha" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Data Inicio" FieldName="DataInicio" ShowInCustomizationForm="True" VisibleIndex="0" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="&nbsp;{0:dd/MM/yyyy} " EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="DataFinal" ShowInCustomizationForm="True" VisibleIndex="1" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="&nbsp;{0:dd/MM/yyyy} ">
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Tipo" FieldName="TipoCampanha" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="&nbsp;{0:dd/MM/yyyy} " EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Mes" FieldName="Mes" ShowInCustomizationForm="True" ToolTip="Mes da campanha " VisibleIndex="5" Width="70px">
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Clientes" ShowInCustomizationForm="True" ToolTip="Informações sobre o número do clientes" VisibleIndex="9">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Nº" FieldName="numCliente" ShowInCustomizationForm="True" ToolTip="Total de clientes que compraram algum produto da campanha." VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartCliente" ShowInCustomizationForm="True" ToolTip="Percentual de participação do número de clientes que compraram algum item da campanha sobre o total de clientes do período da vigência da campanha." VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewDataTextColumn Caption="Rank" FieldName="rnk" ShowInCustomizationForm="True" VisibleIndex="10" Width="50px">
                                <Settings AllowAutoFilter="False" />
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Margem Liquida" ShowInCustomizationForm="True" ToolTip="Quadro de Margem Liquida = Margem Real - Margem com SellOut. Exibe Valor e Percentual" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="difMargemVlr" ShowInCustomizationForm="True" ToolTip="Valor da Margem Efetiva - Valor da Margem com SellOut" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle ForeColor="Blue" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="difMargemPerc" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Liquida = Percentual da Margem Efetiva - Percentual da Margem com SellOut" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle ForeColor="Blue" />
                                        <CellStyle ForeColor="Blue">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle ForeColor="Blue" />
                            </dx:GridViewBandColumn>

                            <dx:GridViewDataTextColumn Caption="% Part." FieldName="percPart" ShowInCustomizationForm="True" ToolTip="Percentual de participação da campanha no total da venda da vigência do período da campanha." VisibleIndex="8" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Itens" FieldName="TotalProdutos" ShowInCustomizationForm="True" ToolTip="Total de itens na campanha" VisibleIndex="2" Width="50px">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager PageSize="15">
                        </SettingsPager>
                        <Settings ShowFooter="True" HorizontalScrollBarMode="Auto" UseFixedTableLayout="True" ShowFilterRow="True" ShowGroupPanel="True" ShowGroupFooter="VisibleAlways" />
                                       <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <GroupRow BackColor="#DDDDDD">
                            </GroupRow>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <Footer Font-Bold="True">
                            </Footer>
                            <GroupFooter BackColor="#E9E9E9" Font-Bold="True">
                            </GroupFooter>
                        </Styles>
                    </dx:ASPxGridView>
  
                                   <asp:SqlDataSource ID="dsDadosTabelaSintetica" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Campanha.usp_TotalPorCampanha" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                        </SelectParameters>
                                   </asp:SqlDataSource>
                               </div>


                               <div id="divTituloTodosItens" runat="server" class="TituloGrafico">
                                   <%--<dx:ASPxGridView ID="gridTabela1" runat="server" AutoGenerateColumns="False" DataSourceID="dsDadosTabela1" EnableTheming="True" KeyFieldName="idProduto" OnBeforePerformDataSelect="gridTabela1_BeforePerformDataSelect" OnCustomSummaryCalculate="gridTabela1_CustomSummaryCalculate" OnHtmlDataCellPrepared="gridTabela1_HtmlDataCellPrepared" OnHtmlFooterCellPrepared="gridTabela1_HtmlFooterCellPrepared" Theme="DevEx" Visible="False" Width="950px">
                                       <TotalSummary>
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro" SummaryType="Sum" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" SummaryType="Sum" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="partVendaCamp" SummaryType="Sum" />
                                           <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                       </TotalSummary>
                                       <Columns>
                                           <dx:GridViewDataTextColumn Caption="Código" FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="1" Width="300px">
                                               <CellStyle Wrap="False">
                                                   <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Descending" VisibleIndex="3" Width="100px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucro" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn FieldName="vlrLucroSellOut" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" Width="90px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewBandColumn Caption="Participação" ShowInCustomizationForm="True" VisibleIndex="7">
                                               <Columns>
                                                   <dx:GridViewDataTextColumn Caption="% Venda Total" FieldName="percPart" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Participação sobre a Venda Total" VisibleIndex="0">
                                                       <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                                       </PropertiesTextEdit>
                                                   </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn Caption="% Venda Camp" FieldName="partVendaCamp" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Participação sobre a Venda da Campanha" VisibleIndex="1">
                                                       <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                                       </PropertiesTextEdit>
                                                   </dx:GridViewDataTextColumn>
                                               </Columns>
                                           </dx:GridViewBandColumn>
                                           <dx:GridViewDataTextColumn FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                               <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="Num" FieldName="rnk" ShowInCustomizationForm="True" VisibleIndex="9">
                                           </dx:GridViewDataTextColumn>
                                       </Columns>
                                       <SettingsBehavior AllowFocusedRow="True" />
                                       <SettingsPager Mode="ShowAllRecords">
                                       </SettingsPager>
                                       <Settings ShowFooter="True" VerticalScrollableHeight="250" VerticalScrollBarMode="Auto" />
                                       <Styles>
                                           <Header HorizontalAlign="Center">
                                           </Header>
                                           <AlternatingRow BackColor="#F3F3F3">
                                           </AlternatingRow>
                                           <Footer Font-Bold="True">
                                           </Footer>
                                       </Styles>
                                   </dx:ASPxGridView>--%>
                                   <%--<asp:SqlDataSource ID="dsDadosTabela1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Campanha.c001_TabelaItem" SelectCommandType="StoredProcedure">
                                       <SelectParameters>
                                           <asp:SessionParameter Name="idCampanha" SessionField="sCAMPANHA" Type="Int32" />
                                       </SelectParameters>
                                   </asp:SqlDataSource>--%>
                               </div>

                               <div id="divTabelaTodosItens">
                    <%--<dx:ASPxGridView ID="gridTabelaTodosItens" runat="server" DataSourceID="dsDadosTabelaTodosItens" AutoGenerateColumns="False" EnableTheming="True" Theme="DevEx" KeyFieldName="idProduto" Width="1000px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellOut" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difMargemVlr" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemPerc" SummaryType="Custom" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="idProduto" VisibleIndex="0" Caption="Código" Width="70px" FixedStyle="Left">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nomeProduto" VisibleIndex="1" Caption="Descrição do Produto" Width="250px" FixedStyle="Left">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Qtde" ReadOnly="True" VisibleIndex="2" Caption="Volume" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrVenda" ReadOnly="True" VisibleIndex="3" Caption="R$" SortIndex="0" SortOrder="Descending" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Margem" ShowInCustomizationForm="True" ToolTip="Quadro de Margem" VisibleIndex="4">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucro" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do Lucro" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Margem SellOut" ShowInCustomizationForm="True" ToolTip="Quadro de Margem com SellOut" VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do SellOut" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do Sellout" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Margem Liquida" ShowInCustomizationForm="true" ToolTip="Quadro de Margem Liquida" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="difMargemVlr" ShowInCustomizationForm="True" ToolTip="Valor da Margem Efetiva - Valor da Margem com SellOut" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle ForeColor="Blue" />
                                        <CellStyle ForeColor="Blue"></CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="difMargemPerc" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Liquida = Percentual da Margem Efetiva - Percentual da Margem com SellOut" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle ForeColor="Blue" />
                                        <CellStyle ForeColor="Blue">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Campanha" ShowInCustomizationForm="True" VisibleIndex="10">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Campanha" FieldName="idCampanha" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Data Inicio" FieldName="DataInicio" ShowInCustomizationForm="True" VisibleIndex="1" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="&nbsp;{0:dd/MM/yyyy} " EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="DataFinal" ShowInCustomizationForm="True" VisibleIndex="2" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="&nbsp;{0:dd/MM/yyyy} " EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Tipo" FieldName="TipoCampanha" ShowInCustomizationForm="True" VisibleIndex="3" Width="100px">
                                        <Settings AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewDataTextColumn Caption="Rank" FieldName="rnk" ShowInCustomizationForm="True" VisibleIndex="9" Width="50px">
                                <Settings AllowAutoFilter="False" />
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Participação s/ Venda" ShowInCustomizationForm="True" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Total" FieldName="percPart" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" ReadOnly="True" ToolTip="Percentual de Participação sobre a Venda Total">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Camp" FieldName="partVendaCamp" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px" ReadOnly="True" ToolTip="Percentual de Participação sobre a Venda da Campanha">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Clientes" ShowInCustomizationForm="true" VisibleIndex="15" ToolTip="Informações sobre o número de clientes">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Nº" FieldName="numCliente" ShowInCustomizationForm="True" VisibleIndex="20" Width="70px" ToolTip="Total de clientes que compraram algum produto da campanha">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartCliente" ShowInCustomizationForm="True" VisibleIndex="21" Width="70px" ToolTip="Percentual de participação do número de clientes que compraram este produto da campanha sobre o total de clientes do período da vigência da campanha.">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager PageSize="15">
                        </SettingsPager>
                        <Settings ShowFooter="True" HorizontalScrollBarMode="Auto" UseFixedTableLayout="True" ShowFilterRow="True" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>

                    </dx:ASPxGridView>--%>
<%--                    <asp:SqlDataSource ID="dsDadosTabelaTodosItens" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Campanha.c001_TabelaTodosItem" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>--%>
                               </div>

                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                </div>      
                

   
</asp:Content>

