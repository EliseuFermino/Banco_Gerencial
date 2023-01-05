<%@ Page Title="Distribuição de Vendas" Language="VB" MasterPageFile="~/MemberPages/SiteGerencial.master" AutoEventWireup="false" CodeFile="DistribuicaoVendas.aspx.vb" Inherits="MemberPages_GE_DistribuicaoVendas" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>
<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
    <table class="auto-style1">
        <tr>
            <td style="width: 153px">
                <uc1:wucAno ID="cboAno" runat="server" />
            </td>
            <td style="width: 148px">
                <uc2:wuciListaMes ID="cboMes" runat="server" />
            </td>
            <td style="width: 189px">
                <uc4:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
            </td>
            <td class="auto-style2" style="width: 102px">
                <dx:ASPxRadioButton ID="chkQtde" runat="server" AutoPostBack="True" 
                    Checked="True" GroupName="Grupo" Text="Quantidade" Theme="DevEx">
                </dx:ASPxRadioButton>
            </td>
            <td>
                <dx:ASPxRadioButton ID="chkValor" runat="server" AutoPostBack="True" 
                    GroupName="Grupo" Text="Valor" Theme="DevEx">
                </dx:ASPxRadioButton>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</p>
    <asp:Panel ID="Panel1" runat="server" Width="1000px">
           <table class="auto-style1">
        <tr>
            <td align="left" valign="top" style="width: 305px">
                <dxchartsui:WebChartControl ID="chart50" runat="server" 
                    AppearanceNameSerializable="In A Fog" DataSourceID="dsSecao50" Height="200px" 
                    Width="223px" BackColor="WhiteSmoke">
                    <borderoptions visible="False" />
                    <diagramserializable>
                        <cc1:SimpleDiagram>
                        </cc1:SimpleDiagram>
                    </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" 
                        direction="LeftToRight" equallyspaceditems="False">
                        <margins bottom="0" left="0" right="0" top="0" />
                    </legend>
                    <seriesserializable>
                        <cc1:Series ArgumentDataMember="Desc" ArgumentScaleType="Qualitative" 
                            Name="Series 1" ValueDataMembersSerializable="qtde" 
                            LabelsVisibility="False">
                            <viewserializable>
                                <cc1:PieSeriesView RuntimeExploding="False" ExplodeMode="MinValue" Rotation="1">
                                </cc1:PieSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:PieSeriesLabel LineVisible="True" Position="Inside">
                                    <shadow visible="True" />
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
                                    <pointoptionsserializable>
                                        <cc1:PiePointOptions PointView="ArgumentAndValues" 
                                            PercentOptions-ValueAsPercent="False">
                                            <valuenumericoptions format="Number" Precision="0" />
                                        </cc1:PiePointOptions>
                                    </pointoptionsserializable>
                                </cc1:PieSeriesLabel>
                            </labelserializable>
                            <legendpointoptionsserializable>
                                <cc1:PiePointOptions PointView="ArgumentAndValues" 
                                    PercentOptions-ValueAsPercent="False">
                                    <valuenumericoptions format="Number" Precision="0" />
                                </cc1:PiePointOptions>
                            </legendpointoptionsserializable>
                        </cc1:Series>
                    </seriesserializable>
                    <seriestemplate>
                        <viewserializable>
                            <cc1:PieSeriesView RuntimeExploding="False">
                            </cc1:PieSeriesView>
                        </viewserializable>
                        <labelserializable>
                            <cc1:PieSeriesLabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:SolidFillOptions />
                                    </optionsserializable>
                                </fillstyle>
                                <pointoptionsserializable>
                                    <cc1:PiePointOptions>
                                    </cc1:PiePointOptions>
                                </pointoptionsserializable>
                            </cc1:PieSeriesLabel>
                        </labelserializable>
                        <legendpointoptionsserializable>
                            <cc1:PiePointOptions>
                            </cc1:PiePointOptions>
                        </legendpointoptionsserializable>
                    </seriestemplate>
                    <titles>
                        <cc1:ChartTitle Text="Eletrodomésticos" Font="Tahoma, 12pt" />
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
            </td>
            <td align="left" valign="top">
                <dxchartsui:WebChartControl ID="chart51" runat="server" 
                    DataSourceID="dsSecao51" Height="200px" 
                    Width="223px" BackColor="WhiteSmoke">
                    <borderoptions visible="False" />
                    <diagramserializable>
                        <cc1:SimpleDiagram>
                        </cc1:SimpleDiagram>
                    </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" 
                        direction="LeftToRight" equallyspaceditems="False">
                        <margins bottom="0" left="0" right="0" top="0" />
                    </legend>
                    <seriesserializable>
                        <cc1:Series ArgumentDataMember="Desc" ArgumentScaleType="Qualitative" 
                            Name="Series 1" ValueDataMembersSerializable="qtde" 
                            LabelsVisibility="False">
                            <viewserializable>
                                <cc1:PieSeriesView RuntimeExploding="False" ExplodeMode="MinValue" Rotation="1">
                                </cc1:PieSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:PieSeriesLabel LineVisible="True" Position="Inside">
                                    <shadow visible="True" />
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
                                    <pointoptionsserializable>
                                        <cc1:PiePointOptions PointView="ArgumentAndValues" 
                                            PercentOptions-ValueAsPercent="False">
                                            <valuenumericoptions format="Number" Precision="0" />
                                        </cc1:PiePointOptions>
                                    </pointoptionsserializable>
                                </cc1:PieSeriesLabel>
                            </labelserializable>
                            <legendpointoptionsserializable>
                                <cc1:PiePointOptions PointView="ArgumentAndValues" 
                                    PercentOptions-ValueAsPercent="False">
                                    <valuenumericoptions format="Number" Precision="0" />
                                </cc1:PiePointOptions>
                            </legendpointoptionsserializable>
                        </cc1:Series>
                    </seriesserializable>
                    <seriestemplate>
                        <viewserializable>
                            <cc1:PieSeriesView RuntimeExploding="False">
                            </cc1:PieSeriesView>
                        </viewserializable>
                        <labelserializable>
                            <cc1:PieSeriesLabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:SolidFillOptions />
                                    </optionsserializable>
                                </fillstyle>
                                <pointoptionsserializable>
                                    <cc1:PiePointOptions>
                                    </cc1:PiePointOptions>
                                </pointoptionsserializable>
                            </cc1:PieSeriesLabel>
                        </labelserializable>
                        <legendpointoptionsserializable>
                            <cc1:PiePointOptions>
                            </cc1:PiePointOptions>
                        </legendpointoptionsserializable>
                    </seriestemplate>
                    <titles>
                        <cc1:ChartTitle Text="Eletroportateis" Font="Tahoma, 12pt" />
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
                </td>
            <td align="left" valign="top">
                <dxchartsui:WebChartControl ID="chart52" runat="server" 
                    AppearanceNameSerializable="In A Fog" DataSourceID="dsSecao52" Height="200px" 
                    Width="223px" BackColor="WhiteSmoke" PaletteName="Median">
                    <borderoptions visible="False" />
                    <diagramserializable>
                        <cc1:SimpleDiagram>
                        </cc1:SimpleDiagram>
                    </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" 
                        direction="LeftToRight" equallyspaceditems="False">
                        <margins bottom="0" left="0" right="0" top="0" />
                    </legend>
                    <seriesserializable>
                        <cc1:Series ArgumentDataMember="Desc" ArgumentScaleType="Qualitative" 
                            Name="Series 1" ValueDataMembersSerializable="qtde" 
                            LabelsVisibility="False">
                            <viewserializable>
                                <cc1:PieSeriesView RuntimeExploding="False" ExplodeMode="MinValue" Rotation="1">
                                </cc1:PieSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:PieSeriesLabel LineVisible="True" Position="Inside">
                                    <shadow visible="True" />
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
                                    <pointoptionsserializable>
                                        <cc1:PiePointOptions PointView="ArgumentAndValues" 
                                            PercentOptions-ValueAsPercent="False">
                                            <valuenumericoptions format="Number" Precision="0" />
                                        </cc1:PiePointOptions>
                                    </pointoptionsserializable>
                                </cc1:PieSeriesLabel>
                            </labelserializable>
                            <legendpointoptionsserializable>
                                <cc1:PiePointOptions PointView="ArgumentAndValues" 
                                    PercentOptions-ValueAsPercent="False">
                                    <valuenumericoptions format="Number" Precision="0" />
                                </cc1:PiePointOptions>
                            </legendpointoptionsserializable>
                        </cc1:Series>
                    </seriesserializable>
                    <seriestemplate>
                        <viewserializable>
                            <cc1:PieSeriesView RuntimeExploding="False">
                            </cc1:PieSeriesView>
                        </viewserializable>
                        <labelserializable>
                            <cc1:PieSeriesLabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:SolidFillOptions />
                                    </optionsserializable>
                                </fillstyle>
                                <pointoptionsserializable>
                                    <cc1:PiePointOptions>
                                    </cc1:PiePointOptions>
                                </pointoptionsserializable>
                            </cc1:PieSeriesLabel>
                        </labelserializable>
                        <legendpointoptionsserializable>
                            <cc1:PiePointOptions>
                            </cc1:PiePointOptions>
                        </legendpointoptionsserializable>
                    </seriestemplate>
                    <titles>
                        <cc1:ChartTitle Text="Telefonia" Font="Tahoma, 12pt" />
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
                </td>
            <td align="left" style="width: 22px" valign="top">
                <dxchartsui:WebChartControl ID="chart53" runat="server" 
                    AppearanceNameSerializable="Chameleon" DataSourceID="dsSecao53" Height="200px" 
                    Width="223px" BackColor="WhiteSmoke">
                    <borderoptions visible="False" />
                    <diagramserializable>
                        <cc1:SimpleDiagram>
                        </cc1:SimpleDiagram>
                    </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" 
                        direction="LeftToRight" equallyspaceditems="False">
                        <margins bottom="0" left="0" right="0" top="0" />
                    </legend>
                    <seriesserializable>
                        <cc1:Series ArgumentDataMember="Desc" ArgumentScaleType="Qualitative" 
                            Name="Series 1" ValueDataMembersSerializable="qtde" 
                            LabelsVisibility="False">
                            <viewserializable>
                                <cc1:PieSeriesView RuntimeExploding="False" ExplodeMode="MinValue" Rotation="1">
                                </cc1:PieSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:PieSeriesLabel LineVisible="True" Position="Inside">
                                    <shadow visible="True" />
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
                                    <pointoptionsserializable>
                                        <cc1:PiePointOptions PointView="ArgumentAndValues" 
                                            PercentOptions-ValueAsPercent="False">
                                            <valuenumericoptions format="Number" Precision="0" />
                                        </cc1:PiePointOptions>
                                    </pointoptionsserializable>
                                </cc1:PieSeriesLabel>
                            </labelserializable>
                            <legendpointoptionsserializable>
                                <cc1:PiePointOptions PointView="ArgumentAndValues" 
                                    PercentOptions-ValueAsPercent="False">
                                    <valuenumericoptions format="Number" Precision="0" />
                                </cc1:PiePointOptions>
                            </legendpointoptionsserializable>
                        </cc1:Series>
                    </seriesserializable>
                    <seriestemplate>
                        <viewserializable>
                            <cc1:PieSeriesView RuntimeExploding="False">
                            </cc1:PieSeriesView>
                        </viewserializable>
                        <labelserializable>
                            <cc1:PieSeriesLabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:SolidFillOptions />
                                    </optionsserializable>
                                </fillstyle>
                                <pointoptionsserializable>
                                    <cc1:PiePointOptions>
                                    </cc1:PiePointOptions>
                                </pointoptionsserializable>
                            </cc1:PieSeriesLabel>
                        </labelserializable>
                        <legendpointoptionsserializable>
                            <cc1:PiePointOptions>
                            </cc1:PiePointOptions>
                        </legendpointoptionsserializable>
                    </seriestemplate>
                    <titles>
                        <cc1:ChartTitle Text="Informática" Font="Tahoma, 12pt" />
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
                </td>
            <td align="left" valign="top">
                <dxchartsui:WebChartControl ID="chart54" runat="server" 
                    AppearanceNameSerializable="In A Fog" DataSourceID="dsSecao54" Height="200px" 
                    Width="223px" BackColor="WhiteSmoke" PaletteName="Apex">
                    <borderoptions visible="False" />
                    <diagramserializable>
                        <cc1:SimpleDiagram>
                        </cc1:SimpleDiagram>
                    </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" 
                        direction="LeftToRight" equallyspaceditems="False">
                        <margins bottom="0" left="0" right="0" top="0" />
                    </legend>
                    <seriesserializable>
                        <cc1:Series ArgumentDataMember="Desc" ArgumentScaleType="Qualitative" 
                            Name="Series 1" ValueDataMembersSerializable="qtde" 
                            LabelsVisibility="False">
                            <viewserializable>
                                <cc1:PieSeriesView RuntimeExploding="False" ExplodeMode="MinValue" Rotation="1">
                                </cc1:PieSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:PieSeriesLabel LineVisible="True" Position="Inside">
                                    <shadow visible="True" />
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
                                    <pointoptionsserializable>
                                        <cc1:PiePointOptions PointView="ArgumentAndValues" 
                                            PercentOptions-PercentageAccuracy="4" PercentOptions-ValueAsPercent="False">
                                            <valuenumericoptions format="Number" Precision="0" />
                                        </cc1:PiePointOptions>
                                    </pointoptionsserializable>
                                </cc1:PieSeriesLabel>
                            </labelserializable>
                            <legendpointoptionsserializable>
                                <cc1:PiePointOptions PointView="ArgumentAndValues" 
                                    PercentOptions-PercentageAccuracy="4" PercentOptions-ValueAsPercent="False">
                                    <valuenumericoptions format="Number" Precision="0" />
                                </cc1:PiePointOptions>
                            </legendpointoptionsserializable>
                        </cc1:Series>
                    </seriesserializable>
                    <seriestemplate>
                        <viewserializable>
                            <cc1:PieSeriesView RuntimeExploding="False">
                            </cc1:PieSeriesView>
                        </viewserializable>
                        <labelserializable>
                            <cc1:PieSeriesLabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:SolidFillOptions />
                                    </optionsserializable>
                                </fillstyle>
                                <pointoptionsserializable>
                                    <cc1:PiePointOptions>
                                    </cc1:PiePointOptions>
                                </pointoptionsserializable>
                            </cc1:PieSeriesLabel>
                        </labelserializable>
                        <legendpointoptionsserializable>
                            <cc1:PiePointOptions>
                            </cc1:PiePointOptions>
                        </legendpointoptionsserializable>
                    </seriestemplate>
                    <titles>
                        <cc1:ChartTitle Text="Cine/Foto/Som" Font="Tahoma, 12pt" />
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
                </td>
        </tr>
        <tr>
            <td align="left" valign="top" style="width: 205px">
                <asp:SqlDataSource ID="dsSecao50" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                    
                    SelectCommand="SELECT qtde, [Desc] FROM Dia.ResumoGE_Grafico WHERE (idSecao = 50) AND (Ano =@Ano) AND (Mes = @Mes) AND (idFilial =@Filial)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="Filial" SessionField="sFILIAL" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSecao50v" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                    SelectCommand="SELECT vlr AS 'qtde', [Desc] FROM Dia.ResumoGE_Grafico WHERE (idSecao = 50) AND (Ano =@Ano) AND (Mes = @Mes) AND (idFilial =@Filial)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="Filial" SessionField="sFILIAL" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="left" valign="top">
                <asp:SqlDataSource ID="dsSecao51" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                    SelectCommand="SELECT qtde, [Desc] FROM Dia.ResumoGE_Grafico WHERE (idSecao = 51) AND (Ano =@Ano) AND (Mes = @Mes) AND (idFilial =@Filial)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="Filial" SessionField="sFILIAL" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSecao51v" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                    SelectCommand="SELECT vlr AS 'qtde', [Desc] FROM Dia.ResumoGE_Grafico WHERE (idSecao = 51) AND (Ano =@Ano) AND (Mes = @Mes) AND (idFilial =@Filial)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="Filial" SessionField="sFILIAL" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="left" valign="top">
                <asp:SqlDataSource ID="dsSecao52v" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                    
                    SelectCommand="SELECT vlr As 'qtde', [Desc] FROM Dia.ResumoGE_Grafico WHERE (idSecao = 52) AND (Ano =@Ano) AND (Mes = @Mes) AND (idFilial =@Filial)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="Filial" SessionField="sFILIAL" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSecao52" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                    SelectCommand="SELECT qtde, [Desc] FROM Dia.ResumoGE_Grafico WHERE (idSecao = 52) AND (Ano =@Ano) AND (Mes = @Mes) AND (idFilial =@Filial)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="Filial" SessionField="sFILIAL" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="left" style="width: 22px" valign="top">
                <asp:SqlDataSource ID="dsSecao53v" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                    
                    SelectCommand="SELECT vlr As 'qtde', [Desc] FROM Dia.ResumoGE_Grafico WHERE (idSecao = 53) AND (Ano =@Ano) AND (Mes = @Mes) AND (idFilial =@Filial)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="Filial" SessionField="sFILIAL" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSecao53" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                    SelectCommand="SELECT qtde, [Desc] FROM Dia.ResumoGE_Grafico WHERE (idSecao = 53) AND (Ano =@Ano) AND (Mes = @Mes) AND (idFilial =@Filial)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="Filial" SessionField="sFILIAL" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="left" valign="top">
                <asp:SqlDataSource ID="dsSecao54v" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                    
                    SelectCommand="SELECT vlr As 'qtde', [Desc] FROM Dia.ResumoGE_Grafico WHERE (idSecao = 54) AND (Ano =@Ano) AND (Mes = @Mes) AND (idFilial =@Filial)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="Filial" SessionField="sFILIAL" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSecao54" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                    SelectCommand="SELECT qtde, [Desc] FROM Dia.ResumoGE_Grafico WHERE (idSecao = 54) AND (Ano =@Ano) AND (Mes = @Mes) AND (idFilial =@Filial)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="Filial" SessionField="sFILIAL" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>        
        </table>
    </asp:Panel>
    <p>
        &nbsp;</p>
    <table style="border-collapse: collapse; width: 100%; float: left">
        <tr>
            <td align="left" style="width: 365px" valign="top">
        <dx:ASPxGridView ID="gridSecao" runat="server" AutoGenerateColumns="False" 
            DataSourceID="dsDados" EnableTheming="True" KeyFieldName="ListaReduzida" 
            Theme="DevEx">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeSLV" 
                    SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaSLV" 
                    SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeGE" 
                    SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaGE" 
                    SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescQtde" 
                    SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescVenda" 
                    SummaryType="Custom" />
            </TotalSummary>
            <Columns>
                <dx:GridViewBandColumn Caption="Vendas" VisibleIndex="1">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="qtdeSLV" VisibleIndex="0">
                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrVendaSLV" 
                            VisibleIndex="1">
                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Garantia Estendida" VisibleIndex="5">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrVendaGE" 
                            VisibleIndex="1">
                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="qtdeGE" VisibleIndex="0">
                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Participação" VisibleIndex="7">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="% Qtde" FieldName="percCrescQtde" 
                            VisibleIndex="0">
                            <propertiestextedit displayformatstring="{0:n2}" encodehtml="False"></propertiestextedit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Vlr" FieldName="percCrescVenda" 
                            VisibleIndex="1">
                            <propertiestextedit displayformatstring="{0:n2}" encodehtml="False"></propertiestextedit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn Caption="Seção" FieldName="ListaReduzida" 
                    VisibleIndex="0">
                    <CellStyle Wrap="False">
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" ShowTitlePanel="True" />
            <SettingsText EmptyDataRow="Não há informações disponiveis para este período" 
                Title="Tabela de Informações" />
            <Styles>
                <Header HorizontalAlign="Center"></Header>
                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                <Footer Font-Bold="True">
                </Footer>
                <TitlePanel Font-Size="Medium">
                </TitlePanel>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsDados" runat="server" 
            ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
            
            SelectCommand="SELECT a.vlrVendaGE, a.qtdeGE, a.vlrVendaSLV, a.qtdeSLV, a.percCrescQtde, a.percCrescVenda, b.ListaReduzida FROM Dia.tblVendaGarantiaEstendida_Resumo AS a INNER JOIN gerManager.Cadastros.tblCadSecao AS b ON a.idSecao = b.idSecao WHERE (a.Ano = @Ano) AND (a.Mes = @Mes) AND (a.idFilial = @Filial) ORDER BY a.idSecao">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" />
                <asp:SessionParameter Name="Mes" SessionField="sMES" />
                <asp:SessionParameter Name="Filial" SessionField="sFILIAL" />
            </SelectParameters>
        </asp:SqlDataSource>
                <br />
            </td>
            <td align="left" valign="top">
                <dx:ASPxGridView ID="gridVendedor" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="dsVendedor" EnableTheming="True" Theme="DevEx">
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrPrecoVenda" 
                            SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaGE" 
                            SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrComissao" 
                            SummaryType="Sum" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Vendedor" ToolTip="Nome do vendedor" 
                            VisibleIndex="0" Width="150px">
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrPrecoVenda" 
                            ToolTip="Venda total do vendedor" VisibleIndex="1">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewBandColumn Caption="Garantia Estendida" VisibleIndex="2">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrVendaGE" 
                                    ToolTip="Total de garantia estendida vendida pelo vendedor" VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Comissão" FieldName="vlrComissao" 
                                    ToolTip="Valor da comissão do vendedor" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                    <SettingsText Title="Vendas por Vendedor" />
                    <Styles>
                        <Footer Font-Bold="True">
                        </Footer>
                        <TitlePanel Font-Size="Medium"></TitlePanel>
                    	<Header HorizontalAlign="Center">
                        </Header>
                    	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsVendedor" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                    SelectCommand="SELECT Vendedor, vlrPrecoVenda, vlrVendaGE, vlrComissao FROM Mes.VendaGEporVendedor WHERE (Ano = @Ano) AND (Mes = @Mes) AND (idFilial = @idFilial) ORDER BY vlrVendaGE DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <p>
    <br />
</p>
</asp:Content>

