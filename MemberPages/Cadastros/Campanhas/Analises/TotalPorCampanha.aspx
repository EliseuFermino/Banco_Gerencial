    <%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Campanhas/Analises/mCampanhas.master" AutoEventWireup="false" CodeFile="TotalPorCampanha.aspx.vb" Inherits="MemberPages_Campanhas_Analises_TotalPorCampanha" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>



<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>



<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">


       <style type ="text/css" >
            

        #divTipoBorda {
            float: left;
            width: 170px;
            margin-top: -3px;
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

        #gridContainer {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 100%;
            height: 100%;
            margin-left: 5px;    
            margin-right: 5px;         
        }

        #divGrafico1 {
           clear:both;
           float: left;
        }

        #divGrafico2 {
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

        #divBotaoAtualizar {
            float: left;
            margin-left: 2px;
            width: 80px;  
            margin-top: -4px;                                
        }

        .Titulo {
            clear:both;
            color:dimgray;
            padding-top: 10px;
            font-size: 16px;
            text-align: Left;
        }

        #divSize {
            float: left;
            margin-left: -10px;       
        }

        .transparentStyle
        {
             background-color: rgba(252, 248, 227, 0.86)
        }        

    </style>

</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">   
        
    <div id="divBotaoAtualizar" class="margem_left_5px margem_left_5px" >
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" visible="false" >
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divSize">
        <uc1:wucsize runat="server" ID="cboSize" Visible="false"  />
    </div>

    <div id="gridContainer" >
        <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Atualizando">
<SettingsLoadingPanel Text="Atualizando"></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent runat="server" SupportsDisabledAttributes="both">


    <dx:ASPxGridView ID="gridTabelaSintetica" runat="server" DataSourceID="dsDadosTabelaSintetica" AutoGenerateColumns="False" ClientInstanceName="grid" EnableTheming="True" Theme="SoftOrange" KeyFieldName="idCampanha" Width="99.5%" >
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaTotal" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellOut" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difMargemVlr" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemPerc" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" SummaryType="Custom" />
                
            </TotalSummary>
                            <GroupSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalProdutos" ShowInGroupFooterColumn="TotalProdutos" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" ShowInGroupFooterColumn="Qtde" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaTotal" ShowInGroupFooterColumn="vlrVendaTotal" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro" ShowInGroupFooterColumn="vlrLucro" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellOut" ShowInGroupFooterColumn="vlrLucroSellOut" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difMargemVlr" ShowInGroupFooterColumn="difMargemVlr" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" ShowInGroupFooterColumn="numCliente" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="percMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" ShowInGroupFooterColumn="percMargemSellOut" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemPerc" ShowInGroupFooterColumn="difMargemPerc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" ShowInGroupFooterColumn="percPart" SummaryType="Custom" />
                            </GroupSummary>

                <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>

           
            <Columns>
                <dx:GridViewDataTextColumn FieldName="idCampanha" VisibleIndex="0" Caption="Campanha" Width="70px" FixedStyle="Left">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descCampanha" VisibleIndex="1" Caption="Descrição da Campanha" Width="320px" FixedStyle="Left">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="vlrVenda" ReadOnly="True" VisibleIndex="4" Caption="Venda &lt;br&gt; Campanha" SortIndex="2" SortOrder="Descending" Width="100px" ToolTip="Venda dos Itens que estão em Campanha.">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <CellStyle ForeColor="Blue">
                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                    <FooterCellStyle ForeColor="Blue">
                    </FooterCellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Qtde" ReadOnly="True" VisibleIndex="3" Caption="Volume" Width="100px" ToolTip="Volume dos itens vendidos na Campanha selecionada.">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Lucro PDV" ShowInCustomizationForm="True" ToolTip="Quadro de Lucro PDV" VisibleIndex="5">
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
                <dx:GridViewBandColumn Caption="Lucro SellOut" ShowInCustomizationForm="True" ToolTip="Quadro de Lucro com SellOut" VisibleIndex="6">
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

                <dx:GridViewBandColumn Caption="Campanha" ShowInCustomizationForm="True" VisibleIndex="12">
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
                        <dx:GridViewDataTextColumn Caption="Tipo" FieldName="TipoCampanha" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px" Visible="False">
                            <PropertiesTextEdit DisplayFormatString="&nbsp;{0:dd/MM/yyyy} " EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>

                <dx:GridViewBandColumn Caption="Clientes" ShowInCustomizationForm="True" ToolTip="Informações sobre o número do clientes" VisibleIndex="10">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Nº" FieldName="numCliente" ShowInCustomizationForm="True" ToolTip="Total de clientes que compraram algum produto da campanha." VisibleIndex="0" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" ShowInCustomizationForm="True" ToolTip="Percentual de participação do número de clientes que compraram algum item da campanha sobre o total de clientes do período da vigência da campanha." VisibleIndex="1" Width="60px" Visible="False">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>

                <dx:GridViewDataTextColumn Caption="Rank" ShowInCustomizationForm="True" VisibleIndex="11" Width="50px" Visible="False">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>

                <dx:GridViewBandColumn Caption="Lucro Total" ShowInCustomizationForm="True" ToolTip="Quadro de Lucro Total = Lucro PDV - Lucro com SellOut. Exibe Valor e Percentual" VisibleIndex="7">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="R$" FieldName="difMargemVlr" ShowInCustomizationForm="True" ToolTip="Valor da Margem Efetiva - Valor da Margem com SellOut" VisibleIndex="0" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <HeaderStyle ForeColor="Blue" BackColor="#CCCCCC" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="%" FieldName="difMargemPerc" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Liquida = Percentual da Margem Efetiva - Percentual da Margem com SellOut" VisibleIndex="1" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <HeaderStyle ForeColor="Blue" BackColor="#CCCCCC" />
                            <CellStyle ForeColor="Blue">
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle ForeColor="Blue" BackColor="#CCCCCC" />
                </dx:GridViewBandColumn>

                <dx:GridViewDataTextColumn Caption="Venda &lt;br&gt;Total" FieldName="vlrVendaTotal" ShowInCustomizationForm="True" ToolTip="Venda geral da Empresa" VisibleIndex="8" Width="90px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Part." FieldName="percPart" ShowInCustomizationForm="True" ToolTip="Percentual de participação da campanha no total da venda da vigência do período da campanha." VisibleIndex="9" Width="70px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Itens" FieldName="TotalProdutos" ShowInCustomizationForm="True" ToolTip="Total de itens na campanha" VisibleIndex="2" Width="70px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <CellStyle HorizontalAlign="Right">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ano" ShowInCustomizationForm="True" VisibleIndex="13" SortIndex="0" SortOrder="Descending">
                    <Settings AllowAutoFilter="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Mes" FieldName="Mes" ShowInCustomizationForm="True" VisibleIndex="14" SortIndex="1" SortOrder="Descending">
                    <Settings AllowAutoFilter="True" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
            <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="780" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

            <SettingsPager PageSize="25">
                <Summary AllPagesText="Pages: {0} - {1} ({2} Campanhas)" Text="Page {0} of {1} ({2} Campanhas)" />
            </SettingsPager>
            <Settings HorizontalScrollBarMode="Auto" ShowFilterRow="True" ShowGroupPanel="True" ShowGroupFooter="VisibleAlways"  VerticalScrollableHeight="0" />
            
            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <GroupRow BackColor="#DDDDDD">
                </GroupRow>
                <AlternatingRow BackColor="#F3F3F3" >
                </AlternatingRow>
                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                </FocusedRow>
                <Footer Font-Bold="True">
                </Footer>
                <GroupFooter BackColor="#E9E9E9" Font-Bold="True">
                </GroupFooter>
                            
            </Styles>
        </dx:ASPxGridView>
  
                        <asp:SqlDataSource ID="dsDadosTabelaSintetica" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Campanha.usp_TotalPorCampanha" SelectCommandType="StoredProcedure" EnableCaching="true" >
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    <dx:ASPxGlobalEvents ID="ge" runat="server">
                        <ClientSideEvents ControlsInitialized="OnControlsInitialized" />
                    </dx:ASPxGlobalEvents>

                  

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

        <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: DW_Condor_One" Anotacao2="Stored Procedure: Campanha.usp_TotalPorCampanha " />

    </div>      
                

</asp:Content>

