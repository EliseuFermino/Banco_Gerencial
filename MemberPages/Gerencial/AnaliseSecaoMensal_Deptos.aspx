<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseSecaoMensal_Deptos.aspx.vb" Inherits="MemberPages_Gerencial_AnaliseSecao_Deptos" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaSecao_Depto5.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>







<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divSecao {            
            float: left;
            margin-left: 10px;
        }

        #divFilial {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divSize {            
            float: left;           
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divNumCliente {
            clear: both;
            float: left;
            margin-left: 1px;
            margin-top: 5px;
        }

        #divTicketMedio {
            clear: both;
            float: left;
            margin-left: 1px;
            margin-top: 5px;
        }

        #divVolumeCliente {
            clear: both;
            float: left;
            margin-left: 1px;
            margin-top: 5px;
        }

        #divCrescimentoClientes {
            clear: both;
            float: left;
            margin-left: 1px;
            margin-top: 5px;
        }

        #divEstatistica {
            clear: both;
            float: left;
            margin-left: 1px;
            margin-top: 5px;
        }


        #divPerdidos {
            clear: both;
            float: left;
            margin: 5px; 
            padding: 5px;           
            border: 1px solid gray;
            border-radius: 6px;
            width: 320px;          
        }

        #divGanhos {            
            float: left;
            margin: 5px;  
            padding: 5px;
            border: 1px solid gray;
            border-radius: 6px;
            width: 300px;
        }

        #divCaption_ClientesPerdidos {
            clear: both;
            float: left;           
            font-size:large
        }

        #divCaption_TicketMedio {
            clear: both;
            float: left;            
            font-size:large
        }
        
        #divCaption_vlrVendaPerdida {
            clear: both;
            float: left;            
            font-size:large
        }   
        
        

        #divCaption_ClientesPerdidosGanhos {      
            clear: both;      
            float: left;          
            font-size:large
        }

        #divCaption_TicketMedioGanhos {   
            clear: both;         
            float: left;            
            font-size:large
        }
        
        #divCaption_vlrVendaPerdidaGanhos {   
            clear: both;         
            float: left;            
            font-size:large
        }                
        
        #divCrescimentoVenda {
            clear: both;
            float: left;
            margin-left: 1px;
            margin-top: 5px;
        }
        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>
    
    <div id="divSecao">
        <uc1:wucListaSecao runat="server" ID="cboSecao" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>


    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="idGrupo" Width="1000px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrNR1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeDif" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="qtdeCresc" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vendaAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vendaAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vendaDif" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vendaCresc" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesDif" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="clientesCresc" SummaryType="Custom" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Mes" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="40px" Caption="Mês">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="MesDesc" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px" Caption="Descrição">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Volume" ShowInCustomizationForm="True" VisibleIndex="2">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="qtdeAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="qtdeAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="qtdeDif" ShowInCustomizationForm="True" ToolTip="Diferença" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="qtdeCresc" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda" ShowInCustomizationForm="True" VisibleIndex="3">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="vendaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="vendaAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="vendaDif" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="vendaCresc" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" VisibleIndex="3" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Clientes" ShowInCustomizationForm="True" VisibleIndex="4">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="clientesAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="clientesAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="clientesDif" ShowInCustomizationForm="True" ToolTip="Diferença" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="clientesCresc" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Ticket Médio" ShowInCustomizationForm="True" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="tmvAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="tmvAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Unidades por Cliente" Name="bandEmbalagem" ShowInCustomizationForm="True" VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="numPorClienteAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="numPorClienteAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowTitlePanel="True" VerticalScrollableHeight="275" VerticalScrollBarMode="Auto" ShowFooter="True" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>                    
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspTicketMedioSecao" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>


    <div id="divEstatistica">

        <div id="divPerdidos">

            <div id="divCaption_ClientesPerdidos">
                <asp:Label ID="lblCaption_ClientesPerdidos" runat="server" Text="" ForeColor="Red" ></asp:Label>
            </div>

            <div id="divCaption_TicketMedio">
                <asp:Label ID="lblCaption_TicketMedio" runat="server" Text="" ForeColor="Red" ></asp:Label>
            </div>

            <div id="divCaption_vlrVendaPerdida">
                <asp:Label ID="lblCaption_vlrVendaPerdida" runat="server" Text="" ForeColor="Red" ></asp:Label>
            </div>

        </div>


        <div id="divGanhos">
            <div id="divCaption_ClientesPerdidosGanhos">
                <asp:Label ID="lblCaption_ClientesPerdidosGanhos" runat="server" Text="" ForeColor="Blue" ></asp:Label>
            </div>

            <div id="divCaption_TicketMedioGanhos">
                <asp:Label ID="lblCaption_TicketMedioGanhos" runat="server" Text="" ForeColor="Blue" ></asp:Label>
            </div>

            <div id="divCaption_vlrVendaPerdidaGanhos">
                <asp:Label ID="lblCaption_vlrVendaPerdidaGanhos" runat="server" Text="" ForeColor="Blue" ></asp:Label>
            </div>
        </div>

       

    </div>


    <div id="divCrescimentoVenda">
        <dxchartsui:WebChartControl ID="graphCrescimentoVenda" runat="server" DataSourceID="dsCrescVenda" Height="300px" Width="1000px">
            <diagramserializable>
                <cc1:XYDiagram>
                    <axisx visibleinpanesserializable="-1" interlaced="True">
                        <label angle="90">
                        </label>
                        <range sidemarginsenabled="True" />
                        <gridlines visible="True">
                        </gridlines>
                    </axisx>
                    <axisy visibleinpanesserializable="-1">
                        <range sidemarginsenabled="True" AlwaysShowZeroLevel="False" />
                        <gridlines visible="False">
                        </gridlines>
                    </axisy>
                    <defaultpane backcolor="Transparent">
                    </defaultpane>
                </cc1:XYDiagram>
            </diagramserializable>
            <fillstyle>
                <optionsserializable>
                    <cc1:SolidFillOptions />
                </optionsserializable>
            </fillstyle>
            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" Visibility="False"></legend>
            <seriesserializable>
                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="% de Crescimento de Vendas" ValueDataMembersSerializable="percCresc" ArgumentScaleType="Qualitative" SeriesPointsSorting="Ascending">
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
                                    <valuenumericoptions format="Number" />
                                </cc1:PointOptions>
                            </pointoptionsserializable>
                        </cc1:SideBySideBarSeriesLabel>
                    </labelserializable>
                    <legendpointoptionsserializable>
                        <cc1:PointOptions>
                            <valuenumericoptions format="Number" />
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
                <cc1:ChartTitle Text="Percentual de Crescimento de Vendas" />
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
        
        <asp:SqlDataSource ID="dsCrescVenda" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspTicketMedio_VolumeCliente_porSecao_Ultimos25Meses" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div id="divNumCliente">
        <dxchartsui:WebChartControl ID="graphNumCliente" runat="server" DataSourceID="dsGraphTicket" Height="300px" Width="1000px">
            <diagramserializable>
                <cc1:XYDiagram>
                    <axisx visibleinpanesserializable="-1">
                        <label angle="90">
                        </label>
                        <range sidemarginsenabled="True" />
                        <gridlines visible="True">
                        </gridlines>
                    </axisx>
                    <axisy visible="False" visibleinpanesserializable="-1">
                        <range sidemarginsenabled="True" />
                        <gridlines visible="False">
                        </gridlines>
                    </axisy>
                </cc1:XYDiagram>
            </diagramserializable>
            <fillstyle>
                <optionsserializable>
                    <cc1:SolidFillOptions />
                </optionsserializable>
            </fillstyle>
            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" Visibility="False"></legend>
            <seriesserializable>
                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="Nº de Clientes" ValueDataMembersSerializable="numCliente">
                    <viewserializable>
                        <cc1:StackedLineSeriesView MarkerVisibility="True">
                            <linemarkeroptions size="5" BorderVisible="True">
                            </linemarkeroptions>
                        </cc1:StackedLineSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:StackedLineSeriesLabel Angle="90" LineVisible="True" Font="Tahoma, 7pt">
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
                        </cc1:StackedLineSeriesLabel>
                    </labelserializable>
                    <legendpointoptionsserializable>
                        <cc1:PointOptions>
                            <valuenumericoptions format="Number" precision="0" />
                        </cc1:PointOptions>
                    </legendpointoptionsserializable>
                </cc1:Series>
            </seriesserializable>
            <seriestemplate>
                <viewserializable>
                    <cc1:StackedLineSeriesView MarkerVisibility="True">
                        <linemarkeroptions BorderVisible="True">
                        </linemarkeroptions>
                    </cc1:StackedLineSeriesView>
                </viewserializable>
                <labelserializable>
                    <cc1:StackedLineSeriesLabel LineVisible="True">
                        <fillstyle>
                            <optionsserializable>
                                <cc1:SolidFillOptions />
                            </optionsserializable>
                        </fillstyle>
                        <pointoptionsserializable>
                            <cc1:PointOptions>
                            </cc1:PointOptions>
                        </pointoptionsserializable>
                    </cc1:StackedLineSeriesLabel>
                </labelserializable>
                <legendpointoptionsserializable>
                    <cc1:PointOptions>
                    </cc1:PointOptions>
                </legendpointoptionsserializable>
            </seriestemplate>
            <titles>
                <cc1:ChartTitle Text="Número de Clientes" />
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
        
    </div>


    <div id="divCrescimentoClientes">
        <dxchartsui:WebChartControl ID="graphNCrescimentoClientes" runat="server" DataSourceID="dsCrescCliente" Height="300px" Width="1000px" AppearanceNameSerializable="Nature Colors">
            <diagramserializable>
                <cc1:XYDiagram>
                    <axisx visibleinpanesserializable="-1" reverse="True">
                        <label angle="90">
                        </label>
                        <range sidemarginsenabled="True" />
                        <gridlines visible="True">
                        </gridlines>
                    </axisx>
                    <axisy visibleinpanesserializable="-1">
                        <range sidemarginsenabled="True" AlwaysShowZeroLevel="False" />
                        <gridlines visible="False">
                        </gridlines>
                    </axisy>
                    <defaultpane backcolor="Transparent">
                    </defaultpane>
                </cc1:XYDiagram>
            </diagramserializable>
            <fillstyle>
                <optionsserializable>
                    <cc1:SolidFillOptions />
                </optionsserializable>
            </fillstyle>
            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" Visibility="False"></legend>
            <seriesserializable>
                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="% de Crescimento de Clientes" ValueDataMembersSerializable="percCresc" ArgumentScaleType="Qualitative">
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
                                    <valuenumericoptions format="Number" />
                                </cc1:PointOptions>
                            </pointoptionsserializable>
                        </cc1:SideBySideBarSeriesLabel>
                    </labelserializable>
                    <legendpointoptionsserializable>
                        <cc1:PointOptions>
                            <valuenumericoptions format="Number" />
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
                <cc1:ChartTitle Text="Percentual de Crescimento de Clientes" />
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
        
        <asp:SqlDataSource ID="dsCrescCliente" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspNumeroClientes_PercentualCrescimento_porSecao_Ultimos25Meses" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>



    <div id="divTicketMedio">
        <dxchartsui:WebChartControl ID="graphVolumeCliente" runat="server" DataSourceID="dsGraphTicket" Height="300px" Width="1000px" PaletteName="Equity">
            <diagramserializable>
                <cc1:XYDiagram>
                    <axisx visibleinpanesserializable="-1">
                        <label angle="90">
                        </label>
                        <range sidemarginsenabled="True" />
                        <gridlines visible="True">
                        </gridlines>
                    </axisx>
                    <axisy visibleinpanesserializable="-1" visible="False">
                        <range sidemarginsenabled="True" />
                        <gridlines visible="False">
                        </gridlines>
                    </axisy>
                </cc1:XYDiagram>
            </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" Visibility="False"></legend>

            <seriesserializable>
                <cc1:Series ArgumentDataMember="Periodo" Name="Volume por Cliente" ValueDataMembersSerializable="VolumeCliente" LabelsVisibility="True">
                    <viewserializable>
                        <cc1:StackedLineSeriesView>
                            <linemarkeroptions BorderVisible="True" size="5">
                            </linemarkeroptions>
                        </cc1:StackedLineSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:StackedLineSeriesLabel LineVisible="True" Angle="90" Font="Tahoma, 7pt">
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                            <pointoptionsserializable>
                                <cc1:PointOptions>
                                    <valuenumericoptions format="Number" precision="3" />
                                </cc1:PointOptions>
                            </pointoptionsserializable>
                        </cc1:StackedLineSeriesLabel>
                    </labelserializable>
                    <legendpointoptionsserializable>
                        <cc1:PointOptions>
                            <valuenumericoptions format="Number" precision="3" />
                        </cc1:PointOptions>
                    </legendpointoptionsserializable>
                </cc1:Series>
            </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:StackedLineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:StackedLineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:StackedLineSeriesLabel LineVisible="True">
        <fillstyle>
            <optionsserializable>
                <cc1:SolidFillOptions />
            </optionsserializable>
        </fillstyle>
        <pointoptionsserializable>
            <cc1:PointOptions>
            </cc1:PointOptions>
        </pointoptionsserializable>
    </cc1:StackedLineSeriesLabel>
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

            <titles>
                <cc1:ChartTitle Text="Unidades por Cliente" />
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
        <asp:SqlDataSource ID="dsGraphTicket" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspTicketMedio_VolumeCliente_porSecao_Ultimos25Meses" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>


    <div id="divVolumeCliente">
        <dxchartsui:WebChartControl ID="graphTicketMedio" runat="server" DataSourceID="dsGraphTicket" Height="300px" Width="1000px">
            <diagramserializable>
                <cc1:XYDiagram>
                    <axisx visibleinpanesserializable="-1">
                        <label angle="90">
                        </label>
                        <range sidemarginsenabled="True" />
                        <gridlines visible="True">
                        </gridlines>
                    </axisx>
                    <axisy visible="False" visibleinpanesserializable="-1">
                        <range sidemarginsenabled="True" />
                        <gridlines visible="False">
                        </gridlines>
                    </axisy>
                </cc1:XYDiagram>
            </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" Visibility="False"></legend>
            <seriesserializable>
                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="Ticket Médio" ValueDataMembersSerializable="TicketMedio">
                    <viewserializable>
                        <cc1:StackedLineSeriesView MarkerVisibility="True">
                            <linemarkeroptions size="5" BorderVisible="True">
                            </linemarkeroptions>
                        </cc1:StackedLineSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:StackedLineSeriesLabel Angle="90" LineVisible="True" Font="Tahoma, 7pt">
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
                        </cc1:StackedLineSeriesLabel>
                    </labelserializable>
                    <legendpointoptionsserializable>
                        <cc1:PointOptions>
                            <valuenumericoptions format="Number" />
                        </cc1:PointOptions>
                    </legendpointoptionsserializable>
                </cc1:Series>
            </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:StackedLineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:StackedLineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:StackedLineSeriesLabel LineVisible="True">
        <fillstyle>
            <optionsserializable>
                <cc1:SolidFillOptions />
            </optionsserializable>
        </fillstyle>
        <pointoptionsserializable>
            <cc1:PointOptions>
            </cc1:PointOptions>
        </pointoptionsserializable>
    </cc1:StackedLineSeriesLabel>
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

            <titles>
                <cc1:ChartTitle Text="Ticket Médio" />
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
    </div>




                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>

