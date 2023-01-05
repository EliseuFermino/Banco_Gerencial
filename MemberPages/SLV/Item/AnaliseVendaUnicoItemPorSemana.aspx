<%@ Page Title="Análise Item Semanal - 12 Meses - PGR292" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseVendaUnicoItemPorSemana.aspx.vb" Inherits="MemberPages_SLV_Item_AnaliseVendaUnicoItemPorSemana" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wucProdutoEncontra.ascx" TagPrefix="uc1" TagName="wucProdutoEncontra" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divFilial {            
            float: left;
            margin-left: 10px;
            margin-top: 5px;
            margin-bottom: 2px;            
        }  

        #divProduto {            
            float: left;
            margin-left: 10px;
            margin-top: 3px;
            margin-bottom: 2px;
            width: 550px;
        }                  

        #divBotaoAtualizar {            
            float: left;
            margin-left: 0px;
             margin-top: 2px;
        }

        #divTamanho {            
            float: left;
            margin-left: 10px;
             margin-top: 2px;
        }

        #divManual {            
            float: left;
            margin-left: 5px;
             margin-top: 2px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }


        #divSize {            
            float: left;           
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divTituloGrafico_Depto {
            clear:both;
            padding-top: 10px;
            font-size:30px;
            text-align:center;
            color:darkgray;
        }


    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divProduto">        
        <uc1:wucProdutoEncontra runat="server" ID="cboProduto" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {
cbPanel.PerformCallback();

}" />
        </dx:ASPxButton>
    </div>

    <div id="divTamanho">
        <dx:ASPxComboBox ID="cboTamanho" runat="server" Font-Size="16px" SelectedIndex="0" Theme="Metropolis" Width="70px" Height="27px">
            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
            <Items>
                <dx:ListEditItem Selected="True" Text="100%" Value="100%" />
                <dx:ListEditItem Text="110%" Value="110%" />
                <dx:ListEditItem Text="120%" Value="120%" />
                <dx:ListEditItem Text="130%" Value="130%" />
                <dx:ListEditItem Text="140%" Value="140%" />
                <dx:ListEditItem Text="150%" Value="150%" />
                <dx:ListEditItem Text="160%" Value="160%" />
            </Items>
        </dx:ASPxComboBox>
    </div>

    <div id="divManual" >
        <dx:ASPxButton ID="MostrarBotao" runat="server" Text="Manual" AutoPostBack="False" Theme="Metropolis" >
            <ClientSideEvents Click="function(s, e) {
	cpcManual.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divDados">

        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>

                    <dxchartsui:WebChartControl ID="graph" runat="server" DataSourceID="SqlDataSource1" Height="450px" Width="1000px" Visible="False">
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="1" gridspacingauto="False" minorcount="1">
                                    <autoscalebreaks enabled="True" />
                                    <tickmarks crossaxis="True" />
                                    <label angle="90" font="Tahoma, 7pt">
                                    <resolveoverlappingoptions allowhide="False" />
                                    </label>
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="True" minorvisible="True">
                                    </gridlines>
                                </axisx>
                                <axisy visibleinpanesserializable="-1" title-font="Tahoma, 9pt, style=Bold" title-text="Vendas" title-visible="True">
                                    <tickmarks minorvisible="False" visible="False" />
                                    <label visible="False">
                                    </label>
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="False">
                                    </gridlines>
                                </axisy>
                                <secondaryaxesy>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Lucro AxisY " VisibleInPanesSerializable="0" Title-Antialiasing="False" Title-Font="Tahoma, 9pt, style=Bold" Title-Text="Lucro" Title-Visible="True">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="1" Name="Margem AxisY " VisibleInPanesSerializable="1" Title-Antialiasing="False" Title-Font="Tahoma, 9pt, style=Bold" Title-Text="Margem" Title-Visible="True">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                </secondaryaxesy>
                                <panes>
                                    <cc1:XYDiagramPane Name="Pane 1" PaneID="0">
                                    </cc1:XYDiagramPane>
                                    <cc1:XYDiagramPane Name="Pane 2" PaneID="1">
                                    </cc1:XYDiagramPane>
                                </panes>
                            </cc1:XYDiagram>
                        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="5" Visibility="False"></legend>
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="Dia" Name="vlrVenda" ValueDataMembersSerializable="vlrVenda" LabelsVisibility="True">
                                <viewserializable>
                                    <cc1:LineSeriesView MarkerVisibility="True">
                                        <linemarkeroptions BorderVisible="True" size="5">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="Number" precision="0" />
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:PointSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                        <valuenumericoptions format="Number" precision="0" />
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="Dia" Name="vlrLucroComercial" ValueDataMembersSerializable="vlrLucroComercial" LabelsVisibility="True">
                                <viewserializable>
                                    <cc1:LineSeriesView AxisYName="Lucro AxisY " MarkerVisibility="True" PaneName="Pane 1">
                                        <linemarkeroptions BorderVisible="True" size="5">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="Number" precision="0" />
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:PointSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                        <valuenumericoptions format="Number" precision="0" />
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="Dia" Name="percMargem" ValueDataMembersSerializable="percMargem" LabelsVisibility="True">
                                <viewserializable>
                                    <cc1:LineSeriesView AxisYName="Margem AxisY " MarkerVisibility="True" PaneName="Pane 2">
                                        <linemarkeroptions BorderVisible="True" size="5">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop">
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
                                    </cc1:PointSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                        <valuenumericoptions format="Number" />
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                        </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:LineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:LineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:PointSeriesLabel LineVisible="True">
        <fillstyle>
            <optionsserializable>
                <cc1:SolidFillOptions />
            </optionsserializable>
        </fillstyle>
        <pointoptionsserializable>
            <cc1:PointOptions>
            </cc1:PointOptions>
        </pointoptionsserializable>
    </cc1:PointSeriesLabel>
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                        <titles>
                            <cc1:ChartTitle Font="Tahoma, 12pt" Text="Análise de Vendas, Lucro com Sellout e Margem com Sellout - Ano 2015" />
                        </titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                    </dxchartsui:WebChartControl>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Analises.usp_Unico_Item_porDia_Semanal" SelectCommandType="StoredProcedure">
                        <SelectParameters>                            
                            <asp:SessionParameter Name="idProduto" SessionField="sPRODUTO" Type="Int32" />    
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />                          
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                    <br />
                    
                    <dxchartsui:WebChartControl ID="graph1" runat="server" DataSourceID="SqlDataSource1" Height="450px" Width="1000px" Visible="False">
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="4" gridspacingauto="False" minorcount="1">
                                    <tickmarks crossaxis="True" />
                                    <label angle="90" font="Tahoma, 7pt">
                                    <resolveoverlappingoptions allowhide="False" />
                                    </label>
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="True" minorvisible="True">
                                    </gridlines>
                                </axisx>
                                <axisy visibleinpanesserializable="-1" title-font="Tahoma, 9pt, style=Bold" title-text="Volume" title-visible="True">
                                    <tickmarks minorvisible="False" visible="False" />
                                    <label visible="False">
                                    </label>
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="False">
                                    </gridlines>
                                </axisy>
                                <secondaryaxesy>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Clientes AxisY " VisibleInPanesSerializable="4" Title-Antialiasing="False" Title-Font="Tahoma, 9pt, style=Bold" Title-Text="Clientes" Title-Visible="True">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="1" Name="PrecoMedio AxisY " VisibleInPanesSerializable="3" Title-Antialiasing="False" Title-Font="Tahoma, 9pt, style=Bold" Title-Text="Preço Médio" Title-Visible="True">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                </secondaryaxesy>
                                <defaultpane weight="0.5">
                                </defaultpane>
                                <panes>
                                    <cc1:XYDiagramPane Name="Pane 4" PaneID="3" Weight="0.3">
                                    </cc1:XYDiagramPane>
                                    <cc1:XYDiagramPane Name="Pane 5" PaneID="4" Weight="0.5">
                                    </cc1:XYDiagramPane>
                                </panes>
                            </cc1:XYDiagram>
                        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="5" Visibility="False"></legend>
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="Dia" Name="Volume" ValueDataMembersSerializable="Volume" LabelsVisibility="True">
                                <viewserializable>
                                    <cc1:LineSeriesView MarkerVisibility="True">
                                        <linemarkeroptions BorderVisible="True" size="3">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="Number" precision="0" />
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:PointSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                        <valuenumericoptions format="Number" precision="0" />
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="Dia" Name="numCliente" ValueDataMembersSerializable="numCliente" LabelsVisibility="True">
                                <viewserializable>
                                    <cc1:LineSeriesView AxisYName="Clientes AxisY " MarkerVisibility="True" PaneName="Pane 5">
                                        <linemarkeroptions BorderVisible="True" size="5">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="Number" precision="0" />
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:PointSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                        <valuenumericoptions format="Number" precision="0" />
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="Dia" Name="vlrPrecoMedio" ValueDataMembersSerializable="vlrPrecoMedio" LabelsVisibility="True">
                                <viewserializable>
                                    <cc1:LineSeriesView AxisYName="PrecoMedio AxisY " MarkerVisibility="True" PaneName="Pane 4">
                                        <linemarkeroptions BorderVisible="True" size="5">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop">
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
                                    </cc1:PointSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                        <valuenumericoptions format="Number" />
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                        </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:LineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:LineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:PointSeriesLabel LineVisible="True">
        <fillstyle>
            <optionsserializable>
                <cc1:SolidFillOptions />
            </optionsserializable>
        </fillstyle>
        <pointoptionsserializable>
            <cc1:PointOptions>
            </cc1:PointOptions>
        </pointoptionsserializable>
    </cc1:PointSeriesLabel>
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                        <titles>
                            <cc1:ChartTitle Font="Tahoma, 12pt" Text="Análise Volume, Preço Médio e Número de Clientes - Ano 2015" />
                        </titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                    </dxchartsui:WebChartControl>


                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>




    </div>

    <dx:ASPxPopupControl ID="pcManual" runat="server" CloseAction="OuterMouseClick" PopupElementID="MostrarBotao" ScrollBars="Vertical" 
         PopupVerticalAlign="Below" PopupHorizontalAlign="RightSides" AllowDragging="True" ShowFooter="false" 
         Width="700px" Height="450px" HeaderText="Manual" ClientInstanceName="cpcManual" Theme="Metropolis"  >
            <ContentCollection >

                <dx:PopupControlContentControl >
                    <div>
                        
                        <p>O programa PGR295 - "Análise Semanal - PGR295 - Uma semana vai de Segunda à Domingo" exibe as seguintes informações do produto selecionado:</p>

                        <ul>
                            <li>Venda</li>
                            <li>Lucro com Sell-Out</li>
                            <li>Margem com Sell-Out</li>
                            <li>Volume</li>
                            <li>Preço Médio</li>
                            <li>Número de Clientes</li>
                        </ul>

                        <p>Essas informações são exibidas por Semana, <b>uma Semana começa em segunda e termina no domingo</b>, sempre à partir do dia de ontem.</p>

                        <p>Para exibir as informações primeiro, digite o código do produto...</p>

                        <asp:Image ID="Image1" runat="server" ImageUrl="~/MemberPages/Manual/PGR292/fig_01.png"  />

                        <p>e pressione a tecla <b>Enter</b>, se o produto existir, a descrição do produto será exibida ao lado do código do produto...  </p>

                        <asp:Image ID="Image2" runat="server" ImageUrl="~/MemberPages/Manual/PGR292/fig_02.png"  />

                        <p>Se o produto não existir, será exibido a informação <b>"Produto não existe!!!"</b>, ao lado do código do produto... </p>

                        <asp:Image ID="Image3" runat="server" ImageUrl="~/MemberPages/Manual/PGR292/fig_03.png"  />

                        <p>Se você não souber o código do produto, você pode encontrar o código clicando em <asp:Image ID="Image4" runat="server" ImageUrl="~/MemberPages/Manual/PGR292/fig_04.png" /> </p>

                        <p>Aprecerá uma opção para você consultar o produto pela descrição..</p>

                        <asp:Image ID="Image5" runat="server" ImageUrl="~/MemberPages/Manual/PGR292/fig_05.png"  />

                        <p>Se por exemplo eu quiser pesquisar o código da <b>Banana Caturra</b>, eu digito parte do nome - nesse caso eu digite <b>Catur</b> e me pareceu 2 produtos...</p>

                        <asp:Image ID="Image6" runat="server" ImageUrl="~/MemberPages/Manual/PGR292/fig_06.png"  />

                        <p>Como eu estou procurando a <i>Banana Caturra</i>, eu dou um clique em cima do código da <i>Banana Caturra kg</i> para selecionar, a cor da linha mudará para amarelo... </p>

                        <asp:Image ID="Image7" runat="server" ImageUrl="~/MemberPages/Manual/PGR292/fig_07.png"  />

                        <p>Após selecionar a linha da <i>Banana Caturra kg</i>, eu dou um <b>Clique Duplo</b> em cima do código e pronto.</p>

                        <asp:Image ID="Image8" runat="server" ImageUrl="~/MemberPages/Manual/PGR292/fig_02.png"  />

                        <p>Agora que já achamos o produto, clique em <asp:Image ID="Image9" runat="server" ImageUrl="~/MemberPages/Manual/PGR292/fig_08.png" /> As informações são exibidas em dois gráficos. No primeiro gráfico nós temos as informações de:</p>

                        <ul>
                            <li>Venda</li>
                            <li>Lucro com Sell-Out</li>
                            <li>Margem com Sell-Out</li>                            
                        </ul>
                        
                        <asp:Image ID="Image10" runat="server" ImageUrl="~/MemberPages/Manual/PGR295/fig_01.png"  />

                      <p>No segundo gráfico nós temos as informações de:</p>
                        <ul>                            
                            <li>Volume</li>
                            <li>Preço Médio</li>
                            <li>Número de Clientes</li>
                        </ul>

                        <asp:Image ID="Image11" runat="server" ImageUrl="~/MemberPages/Manual/PGR295/fig_02.png"  />

                        <p>As informações são exibidas por Semana começando na primeira semana do Ano Atual, nesse caso 2015. Teremos o Mês a a Semana dentro do Mês. Um mês pode ter 4 ou 5 semanas.</p>

                        <asp:Image ID="Image13" runat="server" ImageUrl="~/MemberPages/Manual/PGR295/fig_03.png"  />

                        <p>Se você tiver um monitor maior de 15 polegadas, você pode aumentar o tamanho do gráfico usando a opção <asp:Image ID="Image12" runat="server" ImageUrl="~/MemberPages/Manual/PGR292/fig_12.png" /></p>

                        <p>Quaisquer dúvidas ou sugestões, por favor, ligue no 3212-2038 ou 9671-8959 com Eliseu Fermino</p>

                    </div>
                </dx:PopupControlContentControl>

            </ContentCollection>

    </dx:ASPxPopupControl>



</asp:Content>


