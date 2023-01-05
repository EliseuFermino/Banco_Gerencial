<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuc_KPI_Secao_Depto_TESTE.ascx.vb" Inherits="Controles_wuc_KPI_Secao_Depto_TESTE" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>


<link href="../css/bootstrap.css" rel="stylesheet" />

<%--<script type ="text/javascript">

    var myResolution = screen.width;

    alert(screen.height);
    alert(myResolution);

  
    document.getElementById('<%= hfWidth.ClientID %>').value = myResolution;

  
</script> --%>

<script type="text/javascript">
function SetName() {
    var label = document.getElementById("<%=Label1.ClientID %>");
    var myResolution = screen.width;

    //Set the value of Label.
    label.innerHTML = myResolution;
 
    //Set the value of Label in Hidden Field.
    document.getElementById("<%=hfWidth.ClientID %>").value = label.innerHTML;
}


</script>

<div class="container-fluid" onload="SetValue();">
  
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
              </div>
              <div class="panel-body">
                
                                <dxchartsui:WebChartControl ID="graphCrescimentoVendas" runat="server" DataSourceID="dsCrescimentoVendas" Height="450px" Width="860px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1">
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

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="6" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="2015" ValueDataMembersSerializable="numDadosAAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel Indent="20" LineVisible="True">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" />
                                                            <valuenumericoptions format="Number" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" />
                                                    <valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2016" ValueDataMembersSerializable="numDadosAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="90">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2017" ValueDataMembersSerializable="numDadosAT" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="90">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
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
                                                            <argumentnumericoptions format="Number" /><valuenumericoptions format="Number" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" /><valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
    </LabelSerializable>
    <LegendPointOptionsSerializable>
    <cc1:PointOptions></cc1:PointOptions>
    </LegendPointOptionsSerializable>
    </SeriesTemplate>

    <CrosshairOptions><CommonLabelPositionSerializable>
    <cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
    </CommonLabelPositionSerializable>
    </CrosshairOptions>

    <ToolTipOptions><ToolTipPositionSerializable>
    <cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
    </ToolTipPositionSerializable>
    </ToolTipOptions>
                                </dxchartsui:WebChartControl>
                                <asp:SqlDataSource ID="dsCrescimentoVendas" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarCrescimentoVendas_12Meses" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" DefaultValue="99" />
                                    </SelectParameters>
                                </asp:SqlDataSource>


              </div>
            </div>            
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <div class="panel panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
              </div>
              <div class="panel-body">
                Panel content
              </div>
            </div>            
        </div>

        <div class="col-md-3">
            <div class="panel panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
              </div>
              <div class="panel-body">
                Panel content
              </div>
            </div>            
        </div>

        <div class="col-md-3">
            <div class="panel panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
              </div>
              <div class="panel-body">
                Panel content
              </div>
            </div>            
        </div>

        <div class="col-md-3">
            <div class="panel panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
              </div>
              <div class="panel-body">
                Panel content
              </div>
            </div>            
        </div>
    </div>

    <asp:HiddenField ID="hfWidth" runat="server" />
    <br />
<br />
<asp:Button ID="btnMY" Text="Set Name" runat="server"  />

</div>

