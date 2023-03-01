<%@ Page Title="Analise Campanha" Language="VB" MasterPageFile="~/MemberPages/Campanhas/Analises/mCampanhas.master" AutoEventWireup="false" CodeFile="c001.aspx.vb" Inherits="MemberPages_Campanhas_Analises_c001" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>



<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type ="text/css" >
        html {            
            overflow-x:hidden;            
        }

        #moldura {
            width:1024px;
            margin: 0 auto ;                  
        }

        #divAno {
           float: left;
           margin-left: 1px;
        }

        #divMes {
           float: left;
           margin-left: 20px;
        }

        #divBordaCampanha {
            float: left;
            width: 210px;
        }

        #divCampanha {
           float: left;          
           margin-left:3px;
        }

        #divTituloCampanha {           
            float: left;
            margin-left:4px;
            padding-top: 1px;
            margin-left: 20px;
        }

        #divTipoBorda {
            float: left;
            width: 170px;
        }

        #divTipoDesc {
            float: left;
            margin-left: 3px;
         
        }

        #divTipo {
            float: left;
            margin-left: 2px;
           
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

        #divGraficoItem1 {
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

        #divDescProdutos {
            float: left;
            padding-top: 2px;
        }

        #divListaProdutos { 
            float: left;           
            margin-left: 2px;                      
        }

        #divTabelaItem1 {
            float: left;           
            margin-left: 2px;           
        }

        #divItemTodasLojas {
            float: left;           
            margin-left: 2px;
            margin-bottom: 20px;   
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
            padding-top: -2px;                                
        }

        .Titulo {
            clear:both;
            color:dimgray;
            padding-top: 10px;
            font-size: 16px;
            text-align: Left;
        }

        #gridTabela1 {
           clear:both;
           float: left;        
        }

        .transparentStyle
        {
             background-color: rgba(252, 248, 227, 0.76)
        }   



    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="moldura">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="divAno" >
                    <uc1:wucAno runat="server" ID="cboAno" />
                </div>

                <div id="divMes" >
                    <uc1:wuciListaMes runat="server" ID="cboMes" />
                </div>

                <div id="divBordaCampanha" >
                    <div id="divTituloCampanha">
                        Campanha
                    </div>

                    <div id="divCampanha" >
                        <dx:ASPxComboBox ID="cboCampanha" runat="server" DataSourceID="dsListaCampanha" HorizontalAlign="Left" ValueField="idCampanha" Width="100px" DropDownRows="20" SettingsLoadingPanel-Text="Carregando. Aguarde&amp;hellip;">
                            <Columns>
                                <dx:ListBoxColumn FieldName="idCampanha" Caption="Código" Width="40px" />
                                <dx:ListBoxColumn FieldName="descCampanha" Caption="Descrição da Campanha" Width="400px" />
                                <dx:ListBoxColumn FieldName="DataInicio" Caption="Dia Inicio" Width="65px" />
                                <dx:ListBoxColumn FieldName="DataFinal" Caption="Dia Final" Width="65px" />
                                <dx:ListBoxColumn FieldName="TipoCampanha" Caption="Tipo" Width="80px" />
                            </Columns>
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsListaCampanha" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Campanha.uspListaCampanha" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                <asp:ControlParameter ControlID="cboTipo" Name="TipoCampanha" PropertyName="SelectedValue" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>

                <div id="divTipoBorda">
                    <div id="divTipoDesc">
                        Tipo
                    </div>

                    <div id="divTipo">
                        <asp:DropDownList ID="cboTipo" runat="server" AutoPostBack="True" Width="120px">

                            <asp:ListItem Value="OFERTATV">Oferta TV</asp:ListItem>
                            <asp:ListItem Value="OFERTATVNORTE">Oferta TV Norte</asp:ListItem>
                            <asp:ListItem Value="OFERTATVSC">Oferta TV Norte</asp:ListItem>
                            <asp:ListItem Value="GERAL">Geral</asp:ListItem>
                            <asp:ListItem Value="ESPECIAL">Especial</asp:ListItem>
                            <asp:ListItem Value="COMPRADOR">Comprador</asp:ListItem>
                            <asp:ListItem Value="ELETRO">Eletro</asp:ListItem>
                            <asp:ListItem Value="FL">FL</asp:ListItem>
                            <asp:ListItem Value="PR">Paraná</asp:ListItem>
                            <asp:ListItem Value="SC">Santa Catarina</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </div>
                
                <div id="divBotaoAtualizar">
                    <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                        <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
                    </dx:ASPxButton>
                </div>

                <div class="Titulo">
                    <asp:Label ID="lblTituloGrafico1" runat="server" BackColor="#FFFF99" Font-Bold="False" Font-Size="X-Large"></asp:Label>   
                </div>

                <div id="divGrid1">
                    <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="1020px" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;">
                        <PanelCollection>
                            <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                               <div id="divTitulo1" runat="server" class="TituloGrafico">
                                   <asp:Label ID="lblTitulo1" runat="server" Text="Analise Diária da Venda dos Itens de Campanha - Últimos 2 Meses"></asp:Label>
                               </div>

                               <div id="divGrafico1">
                    <dxchartsui:WebChartControl ID="grafico1" runat="server" DataSourceID="dsdGrafico1" Height="400px" Width="1000px" BackColor="WhiteSmoke" CssClass="transparentStyle">
                        <borderoptions color="Gainsboro" />
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="-1"><label EnableAntialiasing="True"><resolveoverlappingoptions minindent="1" allowhide="False" /></label><range sidemarginsenabled="True" /></axisx>
                                <axisy visibleinpanesserializable="-1" visible="False"><range sidemarginsenabled="True" /><gridlines visible="False"></gridlines></axisy>
                                <defaultpane backcolor="Transparent" bordervisible="False"></defaultpane>
                            </cc1:XYDiagram>
                        </diagramserializable>
                        <fillstyle>
                            <optionsserializable><cc1:SolidFillOptions /></optionsserializable>
                        </fillstyle>
                        <legend Visibility="False"></legend>
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="meuDia" Name="Series 1" ValueDataMembersSerializable="vlrVenda" LabelsVisibility="True">
                                <viewserializable><cc1:LineSeriesView><linemarkeroptions BorderVisible="True" size="5"></linemarkeroptions></cc1:LineSeriesView></viewserializable>
                                <labelserializable><cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
                                <legendpointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></legendpointoptionsserializable>
                            </cc1:Series>
                        </seriesserializable>
                        <seriestemplate>
                            <viewserializable><cc1:LineSeriesView MarkerVisibility="True"><linemarkeroptions BorderVisible="True"></linemarkeroptions></cc1:LineSeriesView></viewserializable>
                            <labelserializable><cc1:PointSeriesLabel LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
                            <legendpointoptionsserializable><cc1:PointOptions></cc1:PointOptions></legendpointoptionsserializable>
                        </seriestemplate>
                        <crosshairoptions>
                            <commonlabelpositionserializable><cc1:CrosshairMousePosition /></commonlabelpositionserializable>
                        </crosshairoptions>
                        <tooltipoptions>
                            <tooltippositionserializable><cc1:ToolTipMousePosition /></tooltippositionserializable>
                        </tooltipoptions>
                    </dxchartsui:WebChartControl>
                    <asp:SqlDataSource ID="dsdGrafico1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Campanha.c001" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="numCampanha" SessionField="sCAMPANHA" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                               <div id="divTitulo2" runat="server" class="TituloGrafico">
                                   <asp:Label ID="lblTitulo2" runat="server" Text="Analise da  Venda e a Participação da Campanha sobre o Total da Venda"></asp:Label>
                               </div>

                               <div id="divGrafico2">
                                    <dxchartsui:WebChartControl ID="grid2" runat="server" DataSourceID="dsdGrafico2" Height="400px" Width="1000px" SideBySideEqualBarWidth="True" BackColor="WhiteSmoke">
                                        <borderoptions color="Gainsboro" />
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1"><label EnableAntialiasing="True"><resolveoverlappingoptions minindent="1" allowhide="False" /></label><range sidemarginsenabled="True" /></axisx>
                                            <axisy visibleinpanesserializable="-1" visible="False"><range sidemarginsenabled="True" /><gridlines visible="False"></gridlines></axisy>
                                            <secondaryaxesy><cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" Visible="False" VisibleInPanesSerializable="-1"><range sidemarginsenabled="True" /></cc1:SecondaryAxisY><cc1:SecondaryAxisY AxisID="1" Name="Secondary AxisY 2" Visible="False" VisibleInPanesSerializable="-1"><range sidemarginsenabled="True" /></cc1:SecondaryAxisY></secondaryaxesy>
                                            <defaultpane backcolor="Transparent" bordervisible="False"></defaultpane>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable><cc1:SolidFillOptions /></optionsserializable>
                                    </fillstyle>
                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxhorizontalpercentage="60" maxverticalpercentage="10">
                                        <margins bottom="1" top="2" />
                                        </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="meuDia" LabelsVisibility="True" Name="Margem" ValueDataMembersSerializable="percMargem">
                                            <viewserializable><cc1:PointSeriesView AxisYName="Secondary AxisY 2"><pointmarkeroptions size="30"></pointmarkeroptions></cc1:PointSeriesView></viewserializable>
                                            <labelserializable><cc1:PointSeriesLabel Angle="0" Font="Tahoma, 10pt, style=Bold" LineLength="20" LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" /></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
                                            <legendpointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" /></cc1:PointOptions></legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="meuDia" Name="Vendas" ValueDataMembersSerializable="vlrVenda" LabelsVisibility="True">
                                            <viewserializable><cc1:SplineSeriesView AxisYName="Secondary AxisY 1" MarkerVisibility="True"><linestyle thickness="4" /><linemarkeroptions size="5" BorderVisible="True"></linemarkeroptions></cc1:SplineSeriesView></viewserializable>
                                            <labelserializable><cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop" Font="Tahoma, 10pt, style=Bold" LineLength="15"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
                                            <legendpointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="meuDia" LabelsVisibility="True" Name="Participação" ValueDataMembersSerializable="percPart">
                                            <viewserializable><cc1:SideBySideBarSeriesView Transparency="136"></cc1:SideBySideBarSeriesView></viewserializable>
                                            <labelserializable><cc1:SideBySideBarSeriesLabel Font="Tahoma, 12pt" Indent="20" LineVisible="True" Position="BottomInside" TextOrientation="BottomToTop"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" /></cc1:PointOptions></pointoptionsserializable></cc1:SideBySideBarSeriesLabel></labelserializable>
                                            <legendpointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" /></cc1:PointOptions></legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>
                                    <seriestemplate>
                                        <viewserializable><cc1:LineSeriesView MarkerVisibility="True"><linemarkeroptions BorderVisible="True"></linemarkeroptions></cc1:LineSeriesView></viewserializable>
                                        <labelserializable><cc1:PointSeriesLabel LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
                                        <legendpointoptionsserializable><cc1:PointOptions></cc1:PointOptions></legendpointoptionsserializable>
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable><cc1:CrosshairMousePosition /></commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable><cc1:ToolTipMousePosition /></tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                                    <asp:SqlDataSource ID="dsdGrafico2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Campanha.c001_Semana" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="numCampanha" SessionField="sCAMPANHA" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                               </div>

                               <div id="divTituloTabelaItem1" runat="server" class="TituloGrafico">
                                   <asp:Label ID="Label2" runat="server" Text="Detalhamento dos Itens da Campanha Selecionada"></asp:Label>
                               </div>

                               <div id="divTabelaItem1">
                                    <dx:ASPxGridView ID="gridTabela1" runat="server" DataSourceID="dsDadosTabela1" AutoGenerateColumns="False" EnableTheming="True" Theme="DevEx" KeyFieldName="idProduto" Width="1000px">
                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="partVendaCamp" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellOut" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartCliente" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemPerc" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difMargemVlr" SummaryType="Custom" />
                                        </TotalSummary>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="idProduto" VisibleIndex="0" Caption="Código" Width="80px" FixedStyle="Left" ToolTip="Código do produto">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="nomeProduto" VisibleIndex="1" Caption="Descrição do Produto" Width="300px" FixedStyle="Left" ToolTip="Descrição do produto">
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Qtde" ReadOnly="True" VisibleIndex="2" Caption="Volume" Width="80px" ToolTip="Quantidade vendida">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    

                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrVenda" ReadOnly="True" VisibleIndex="3" Caption="R$" SortIndex="0" SortOrder="Descending" Width="85px" ToolTip="Valor da Venda Realizado ">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    

                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewBandColumn Caption="SellOut" ShowInCustomizationForm="True" VisibleIndex="5" ToolTip="Quadro de SellOut">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroSellOut" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" ToolTip="Valor do SellOut">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" ToolTip="Percentual do SellOut">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Participação s/ Venda" ShowInCustomizationForm="True" VisibleIndex="8" ToolTip="Quadro de Participação de Venda">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="% Total" FieldName="percPart" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" ToolTip="Percentual de Participação sobre a Venda Total" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Camp" FieldName="partVendaCamp" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" ToolTip="Percentual de Participação sobre a Venda da Campanha" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" VisibleIndex="4" ToolTip="Quadro de Margem Praticada">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucro" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" ToolTip="Valor do Lucro praticado">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% " FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" ToolTip="Percentual da margem praticada">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn Caption="Num" FieldName="rnk" ShowInCustomizationForm="True" VisibleIndex="10" Width="40px" ToolTip="Quantidade de itens na campanha. Ordem de maior venda.">
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewBandColumn Caption="Clientes" ShowInCustomizationForm="True" ToolTip="Informações sobre o número de clientes" VisibleIndex="9">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Nº " FieldName="numCliente" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" ToolTip="Total de clientes que compraram o produto da campanha.">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartCliente" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" ToolTip="Percentual de participação do número de clientes que comprarm algum item da campanha sobre o total de clientes da vigência da campanha">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" ToolTip="Quadro de Margem Final = Margem Praticada - Margem com SellOut. Exibe Valor e Percentual." VisibleIndex="6">
                                
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="difMargemVlr" ShowInCustomizationForm="True" ToolTip="Lucro Final = Valor do Lucro Praticado - Valor Margem Sellout" UnboundType="Decimal" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle ForeColor="Blue" />
                                                        <CellStyle ForeColor="Blue">                                            
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue"></FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="difMargemPerc" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final = Percentual da Margem Praticad - Percentual da Margem Sellout" VisibleIndex="11" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle ForeColor="Blue" />
                                                        <CellStyle Font-Bold="False" ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>  
                                                <HeaderStyle ForeColor="Blue" />
                                            </dx:GridViewBandColumn>

                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager>
                                            <Summary AllPagesText="Pages: {0} - {1} ({2} produtos)" Text="Page {0} of {1} ({2} produtos)" />
                                        </SettingsPager>
                                        <Settings ShowFooter="True" ShowTitlePanel="True" ShowFilterRow="True" VerticalScrollableHeight="250" VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Visible" />
                                        <Styles>
                                            <Header HorizontalAlign="Center">
                                            </Header>
                                            <AlternatingRow BackColor="#F3F3F3">
                                            </AlternatingRow>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                        </Styles>
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="dsDadosTabela1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Campanha.c001_TabelaItem" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cboCampanha" Name="idCampanha" PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                </div>      

                <div id="divPanelItem">
                    <dx:ASPxCallbackPanel ID="cboPanelItem" runat="server" Width="1000px" ClientInstanceName="cbPanelItem" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando...&amp;hellip;">
                        <PanelCollection>
                            <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                                <div id="divTitulo3" runat="server" class="TituloGrafico">
                                   <asp:Label ID="lblTitulo3" runat="server" Text="Analise Diária da Venda do Item Selecionado - Últimos 2 Meses"></asp:Label>
                               </div>

                                <div id="divDescProdutos">
                                    <asp:Label ID="lblDescProdutos" runat="server" Text="Produtos " Visible="true" Font-Size="20px" Font-Bold="true"  ></asp:Label>
                                </div>

                                <div id="divListaProdutos">
                                        <dx:ASPxComboBox ID="cboProdutos" runat="server" DataSourceID="dsListaProduto" AutoPostBack="true"  HorizontalAlign="Left" Visible="false"  ValueField="idProduto" Width="500px" DropDownRows="15" Font-Size="20px" SettingsLoadingPanel-Text="Carregando. Aguarde&amp;hellip;" ForeColor="#333333" BackColor="#FFFF99" DropDownWidth="800px" Height="40px" IncrementalFilteringMode="Contains">
                                            <Columns>
                                                <dx:ListBoxColumn FieldName="idProduto" Caption="Código" Width="60px" />
                                                <dx:ListBoxColumn FieldName="nomeProduto" Caption="Descrição do Produto" Width="400px" />
                                                <dx:ListBoxColumn FieldName="num" Caption="Nº" Width="20" />
                                            </Columns>
                                        </dx:ASPxComboBox>

                                        <asp:SqlDataSource ID="dsListaProduto" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Campanha.uspListaProdutosPorCampanha" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cboCampanha" Name="idCampanha" PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>



                                <div id="divGraficoItem1">
                                    <dxchartsui:WebChartControl ID="graficoItem1" runat="server" DataSourceID="dsGraficoItem1" Height="400px" Width="1000px" BackColor="WhiteSmoke">
                                        <borderoptions color="Gainsboro" />
                                        <diagramserializable>
                                            <cc1:XYDiagram>
                                                <axisx visibleinpanesserializable="-1"><label EnableAntialiasing="True"><resolveoverlappingoptions minindent="1" allowhide="False" /></label><range sidemarginsenabled="True" /></axisx>
                                                <axisy visibleinpanesserializable="-1" visible="False"><range sidemarginsenabled="True" /><gridlines visible="False"></gridlines></axisy>
                                                <defaultpane backcolor="Transparent" bordervisible="False"></defaultpane>
                                            </cc1:XYDiagram>
                                        </diagramserializable>
                                        <fillstyle>
                                            <optionsserializable><cc1:SolidFillOptions /></optionsserializable>
                                        </fillstyle>
                                        <legend Visibility="False"></legend>
                                        <seriesserializable>
                                            <cc1:Series ArgumentDataMember="meuDia" Name="Series 1" ValueDataMembersSerializable="vlrVenda" LabelsVisibility="True">
                                                <viewserializable><cc1:LineSeriesView><linemarkeroptions BorderVisible="True" size="5"></linemarkeroptions></cc1:LineSeriesView></viewserializable>
                                                <labelserializable><cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
                                                <legendpointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></legendpointoptionsserializable>
                                            </cc1:Series>
                                        </seriesserializable>
                                        <seriestemplate>
                                            <viewserializable><cc1:LineSeriesView MarkerVisibility="True"><linemarkeroptions BorderVisible="True"></linemarkeroptions></cc1:LineSeriesView></viewserializable>
                                            <labelserializable><cc1:PointSeriesLabel LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
                                            <legendpointoptionsserializable><cc1:PointOptions></cc1:PointOptions></legendpointoptionsserializable>
                                        </seriestemplate>
                                        <crosshairoptions>
                                            <commonlabelpositionserializable><cc1:CrosshairMousePosition /></commonlabelpositionserializable>
                                        </crosshairoptions>
                                        <tooltipoptions>
                                            <tooltippositionserializable><cc1:ToolTipMousePosition /></tooltippositionserializable>
                                        </tooltipoptions>
                                    </dxchartsui:WebChartControl>
                                    <asp:SqlDataSource ID="dsGraficoItem1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Campanha.c001_Item" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="numCampanha" SessionField="sCAMPANHA" Type="Int32" />
                                            <asp:SessionParameter Name="idProduto" SessionField="sPRODUTO" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <div id="divTitulo4" runat="server" class="TituloGrafico">
                                   <asp:Label ID="lblTitulo4" runat="server" Text="Analise da Venda e a Participação do Item sobre o Total da Venda"></asp:Label>
                               </div>

                                <div id="divGraficoItem2">

                                    <dxchartsui:WebChartControl ID="graficoItem2" runat="server" DataSourceID="dsGraficoItem2" Height="400px" Width="1000px" SideBySideEqualBarWidth="True" BackColor="WhiteSmoke">
                                        <borderoptions color="Gainsboro" />
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1"><label EnableAntialiasing="True"><resolveoverlappingoptions minindent="1" allowhide="False" /></label><range sidemarginsenabled="True" /></axisx>
                                            <axisy visibleinpanesserializable="-1" visible="False"><range sidemarginsenabled="True" /><gridlines visible="False"></gridlines></axisy>
                                            <secondaryaxesy><cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" Visible="False" VisibleInPanesSerializable="-1"><range sidemarginsenabled="True" /></cc1:SecondaryAxisY><cc1:SecondaryAxisY AxisID="1" Name="Secondary AxisY 2" Visible="False" VisibleInPanesSerializable="-1"><range sidemarginsenabled="True" /></cc1:SecondaryAxisY></secondaryaxesy>
                                            <defaultpane backcolor="Transparent" bordervisible="False"></defaultpane>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable><cc1:SolidFillOptions /></optionsserializable>
                                    </fillstyle>
                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxhorizontalpercentage="60" maxverticalpercentage="10">
                                        <margins bottom="1" top="2" />
                                        </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="meuDia" LabelsVisibility="True" Name="Margem" ValueDataMembersSerializable="percMargem">
                                            <viewserializable><cc1:PointSeriesView AxisYName="Secondary AxisY 2"><pointmarkeroptions size="30"></pointmarkeroptions></cc1:PointSeriesView></viewserializable>
                                            <labelserializable><cc1:PointSeriesLabel Angle="0" Font="Tahoma, 10pt, style=Bold" LineLength="20" LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" /></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
                                            <legendpointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" /></cc1:PointOptions></legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="meuDia" Name="Vendas" ValueDataMembersSerializable="vlrVenda" LabelsVisibility="True">
                                            <viewserializable><cc1:SplineSeriesView AxisYName="Secondary AxisY 1" MarkerVisibility="True"><linestyle thickness="4" /><linemarkeroptions size="5" BorderVisible="True"></linemarkeroptions></cc1:SplineSeriesView></viewserializable>
                                            <labelserializable><cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop" Font="Tahoma, 10pt, style=Bold" LineLength="15"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
                                            <legendpointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" precision="0" /></cc1:PointOptions></legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="meuDia" LabelsVisibility="True" Name="Participação" ValueDataMembersSerializable="percPart">
                                            <viewserializable><cc1:SideBySideBarSeriesView Transparency="136"></cc1:SideBySideBarSeriesView></viewserializable>
                                            <labelserializable><cc1:SideBySideBarSeriesLabel Font="Tahoma, 12pt" Indent="20" LineVisible="True" Position="BottomInside" TextOrientation="BottomToTop"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" /></cc1:PointOptions></pointoptionsserializable></cc1:SideBySideBarSeriesLabel></labelserializable>
                                            <legendpointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" /></cc1:PointOptions></legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>
                                    <seriestemplate>
                                        <viewserializable><cc1:LineSeriesView MarkerVisibility="True"><linemarkeroptions BorderVisible="True"></linemarkeroptions></cc1:LineSeriesView></viewserializable>
                                        <labelserializable><cc1:PointSeriesLabel LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
                                        <legendpointoptionsserializable><cc1:PointOptions></cc1:PointOptions></legendpointoptionsserializable>
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable><cc1:CrosshairMousePosition /></commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable><cc1:ToolTipMousePosition /></tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>

                                    <asp:SqlDataSource ID="dsGraficoItem2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Campanha.c001_SemanaItem" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="numCampanha" SessionField="sCAMPANHA" Type="Int32" />
                                        <asp:SessionParameter Name="idProduto" SessionField="sPRODUTO" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                               </div>

                                <div id="divTitulo5" runat="server" class="TituloGrafico">
                                   <asp:Label ID="lblTitulo5" runat="server" Text="Analise da Venda do Item Loja a Loja"></asp:Label>
                               </div>

                               <div id="divItemTodasLojas">
                                    <dx:ASPxGridView ID="gridItemTodasLojas" runat="server" DataSourceID="dsDadosItemTodasLojas" AutoGenerateColumns="False" EnableTheming="True" Theme="DevEx" KeyFieldName="nomeFilialLista" Width="1000px" Visible="False">
                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="partVendaCamp" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellOut" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartCliente" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemFinal" SummaryType="Sum" />
                                        </TotalSummary>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="nomeFilialLista" VisibleIndex="1" Caption="Filial" Width="150px" FixedStyle="Left" ToolTip="Descrição da Filial">
                                                <Settings AllowAutoFilter="False" />
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Qtde" ReadOnly="True" VisibleIndex="2" Caption="Volume" Width="65px" ToolTip="Quantidade vendida">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    

                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrVenda" ReadOnly="True" VisibleIndex="3" Caption="R$" SortIndex="0" SortOrder="Descending" Width="70px" ToolTip="Valor da Venda Realizado ">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    

                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewBandColumn Caption="SellOut" ShowInCustomizationForm="True" VisibleIndex="5" ToolTip="Quadro de SellOut">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroSellOut" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" ToolTip="Valor do SellOut" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" ToolTip="Percentual do SellOut" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Participação s/ Venda" ShowInCustomizationForm="True" VisibleIndex="8" ToolTip="Quadro de Participação de Venda">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="% Total" FieldName="percPart" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" ToolTip="Percentual de Participação sobre a Venda Total">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Camp" FieldName="partVendaCamp" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px" ToolTip="Percentual de Participação sobre a Venda da Campanha">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" ToolTip="Quadro de Margem" VisibleIndex="4">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucro" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" ToolTip="Valor do Lucro" ReadOnly="True">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% " FieldName="percMargem" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" ToolTip="Percentual do Lucro" ReadOnly="True">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn Caption="Rnk" FieldName="rnk" ShowInCustomizationForm="True" VisibleIndex="10" Width="40px" ToolTip="Ranking. Ordem de maior venda.">
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewBandColumn Caption="Clientes" ShowInCustomizationForm="True" VisibleIndex="9" ToolTip="Informações sobre o número de clientes">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Nº " FieldName="numCliente" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" ToolTip="Total de clientes que compraram o produto da campanha.">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartCliente" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" ToolTip="Percentual de participação do número de clientes que comprarm algum item da campanha sobre o total de clientes da vigência da campanha">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" ToolTip="Quadro de Margem Final = Margem Efetivada - Margem com SellOut. Exibe Valor e Percentual." VisibleIndex="6">
                                
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrMargemFinal" ShowInCustomizationForm="True" ToolTip="Lucro Final = Valor da Margem Praticada - Valor Margem Sellout" UnboundType="Decimal" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle ForeColor="Blue" />
                                                        <CellStyle ForeColor="Blue">                                            
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue"></FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final = Percentual da Margem Praticada - Percentual da Margem Sellout" VisibleIndex="11" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            

                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle ForeColor="Blue" />
                                                        <CellStyle Font-Bold="False" ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>  
                                                <HeaderStyle ForeColor="Blue" />
                                            </dx:GridViewBandColumn>

                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="700" VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Visible" />
                                        <Styles>
                                            <Header HorizontalAlign="Center">
                                            </Header>
                                            <AlternatingRow BackColor="#F3F3F3">
                                            </AlternatingRow>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                        </Styles>
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="dsDadosItemTodasLojas" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Campanha.c001_ItemTodasFiliais" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cboProdutos" Name="idProduto" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="cboCampanha" Name="numCampanha" PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                </div>
                
             </ContentTemplate>
        </asp:UpdatePanel>


    </div>



</asp:Content>

