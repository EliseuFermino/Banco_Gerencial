<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuc_KPI_Secao_Depto_OLD.ascx.vb" Inherits="Controles_wuc_KPI_Secao_Depto" %>
<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>



<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<link href="../css/bootstrap.min.css" rel="stylesheet" />

<style type ="text/css" >

        #div_KPI_Vendas {
            clear: both;
            float: left;
            text-align: center;
        }

        #divKPI_Mensal {
            clear: both;
            float: left;
        }

        .divKPI_Todos_Mes {
            float: left;
            text-align: center;
            margin-left: 2px;
            font-size:small;
            
            margin-top: 2px;
            border: 1px solid gray;
            padding: 2px;
            border-radius: 3px;

            background-color: #F5F5DC;
            
        }


        #div_KPI_Semana {
            float: left;
            text-align: center;
        }

        #div_KPI_Mes {
            float: left;
            text-align: center;
        }

        #div_KPI_Ano {
            float: left;
            text-align: center;
        }

        .KPI_Border {
            float: left;
            margin-left: 2px;
            margin-top: 4px;
            border: 1px solid gray;
            padding: 4px;
            border-radius: 3px;
            width: 200px;
        }

        .KPI_New {
            float: left;
            margin-left: 2px;
            margin-top: 4px;
            border: 1px solid gray;
            padding: 4px;           
            width: 200px;
            height: 60px;
            background-color: white;
        }



    </style>

<div>
    <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
</div>

<div style="font-size:large; font-weight:bold; color:dimgray ">Crescimento de Vendas</div>  

<div class="container">

<div id="divKPI_Mensal">

    <dxchartsui:WebChartControl ID="graphMensal" runat="server" DataSourceID="dsGraphMensal" Height="100px" Width="850px" BackColor="Transparent">
        <borderoptions visible="False" />
        <diagramserializable>
            <cc1:XYDiagram>
                <axisx reverse="True" visibleinpanesserializable="-1">
                    <tickmarks minorvisible="False" visible="False" />
                    <label font="Tahoma, 7pt" maxlinecount="2" maxwidth="50">
                    </label>
                    <range sidemarginsenabled="True" />
                </axisx>
                <axisy visible="False" visibleinpanesserializable="-1">
                    <tickmarks visible="False" />
                    <range sidemarginsenabled="True" />
                    <gridlines visible="False">
                    </gridlines>
                </axisy>
                <defaultpane backcolor="Transparent" bordervisible="False">
                </defaultpane>
            </cc1:XYDiagram>
        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

        <legend Visibility="False"></legend>
        <seriesserializable>
            <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                <viewserializable>
                    <cc1:LineSeriesView MarkerVisibility="True">
                        <linemarkeroptions size="4" BorderVisible="True">
                        </linemarkeroptions>
                    </cc1:LineSeriesView>
                </viewserializable>
                <labelserializable>
                    <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
    </dxchartsui:WebChartControl>
    
    <asp:SqlDataSource ID="dsGraphMensal" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="KPI_Vendas.uspVendaMes_Ultimos12Meses" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
        </SelectParameters>

    </asp:SqlDataSource>







</div>


    <div class="row">

        <div class="col-md-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Panel title</h3>
                </div>
                <div class="panel-body">
                    Panel content
                </div>
            </div>
        </div>

        <div class="col-md-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Panel title</h3>
                </div>
                <div class="panel-body">
                    Panel content
                </div>
            </div>
        </div>

        <div class="col-md-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Panel title</h3>
                </div>
                <div class="panel-body">
                    Panel content
                </div>
            </div>
        </div>

    </div>
</div>



<div class="container-fluid">

    <div class="row" style="vertical-align:central">
            
        <div class="col-md-4 KPI_New">

            <div class="container-fluid">
            <div class="row " >

                <div class="col-md-1 " >
                    <asp:Image ID="img_Semana" runat="server"  Height="25px" Width="25px"  />
                </div>

                <div class="col-md-1 " >
                    <asp:Label ID="lblVenda_Semana" runat="server" Text="" Font-Size="Large" ></asp:Label>
                </div>

            </div>
            </div>
        </div>

        <div class="col-md-4 KPI_New">

        </div>

    </div>


</div>

<div id="div_KPI_Vendas" class="KPI_Border" title ="Compara com o mesmo dia da semana do ano passado. Exemplo: Segunda com Segunda, Terça com Terça e etc.">

    <div style="font-weight:bold">
        Ontem
    </div>

    <div style="clear:both; margin-top: 5px">
        <asp:Image ID="img_Ontem" runat="server"  Height="25px" Width="25px"  />
    </div>    

    <asp:Label ID="lblVenda_Ontem" runat="server" Text="" Font-Size="Large" ></asp:Label>
   
    <asp:Label ID="lblPerc_Ontem" runat="server" Text="%" Font-Size="Large"></asp:Label>   

<%--    <div style="clear:both; margin-top: 5px">
        <asp:HyperLink ID="link_Ontem" runat="server" Text="Ver Detalhe">Ver Detalhe</asp:HyperLink>
    </div>--%>
 </div>

<div id="div_KPI_Semana" class="KPI_Border" title="A Semana compreende de Segunda à Domingo. A comparação é com os mesmos dias da semana do ano passado. Exemplo: Segunda com Segunda, Terça com Terça e etc.">

    <div style="font-weight:bold">
        Semana
    </div>

    <div style="clear:both; margin-top: 5px">
        
    </div>    

    
   
    <asp:Label ID="lblPerc_Semana" runat="server" Text="%" Font-Size="Large"></asp:Label>   

<%--    <div style="clear:both; margin-top: 5px">
        <asp:HyperLink ID="link_Semana" runat="server" Text="Ver Detalhe">Ver Detalhe</asp:HyperLink>
    </div>  --%>
    

</div>

<div id="div_KPI_Mes" class="KPI_Border" title="Desde o dia 1 do Mês atual até ontem.">

    <div style="font-weight:bold">
        <asp:Label ID="lblMes" runat="server" Text=""></asp:Label>
    </div>

    <div style="clear:both; margin-top: 5px">
        <asp:Image ID="img_Mes" runat="server"  Height="25px" Width="25px"  />
    </div>    

    <asp:Label ID="lblVenda_Mes" runat="server" Text="" Font-Size="Large" ></asp:Label>
   
    <asp:Label ID="lblPerc_Mes" runat="server" Text="%" Font-Size="Large"></asp:Label>   

<%--    <div style="clear:both; margin-top: 5px">
        <asp:HyperLink ID="link_Mes" runat="server" Text="Ver Detalhe">Ver Detalhe</asp:HyperLink>
    </div> --%> 
    

</div>

<div id="div_KPI_Ano" class="KPI_Border" title="Desde o dia 1 do Ano atual até ontem.">

    <div style="font-weight:bold">
        <asp:Label ID="lblAno" runat="server" Text=""></asp:Label>
    </div>

    <div style="clear:both; margin-top: 5px">
        <asp:Image ID="img_Ano" runat="server"  Height="25px" Width="25px"  />
    </div>    

    <asp:Label ID="lblVenda_Ano" runat="server" Text="" Font-Size="Large" ></asp:Label>
   
    <asp:Label ID="lblPerc_Ano" runat="server" Text="%" Font-Size="Large"></asp:Label>   

<%--    <div style="clear:both; margin-top: 5px">
        <asp:HyperLink ID="link_Ano" runat="server" Text="Ver Detalhe">Ver Detalhe</asp:HyperLink>
    </div>  --%>
    

</div>


<asp:HiddenField ID="hFilial" runat="server" />
<asp:Label ID="lblFilial" runat="server" Text="Filial"></asp:Label>

<%--<div id="divDados">
    <dx:ASPxGridView ID="grid_KPI_Secao" runat="server" DataSourceID="dsKPI_Secao" AutoGenerateColumns="False">
        <Columns>
            <dx:GridViewDataTextColumn FieldName="idSecao" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="descSecao" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="vlrVendaOntemAT" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="vlrVendaOntemAA" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCresc_VendaOntem" ReadOnly="True" ToolTip="Percentual de Crescimento sobre o Ano Anterior" VisibleIndex="4" Width="60px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}%">
                </PropertiesTextEdit>
                <CellStyle>
                    <BorderRight BorderColor="White" BorderStyle="Solid" BorderWidth="1px" />
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="Status" FieldName="idStatusAting_Ontem" VisibleIndex="6" Width="30px">
                <PropertiesCheckEdit>
                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                    </DisplayImageChecked>
                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                    </DisplayImageUnchecked>
                </PropertiesCheckEdit>
                <CellStyle>
                    <BorderLeft BorderColor="White" BorderStyle="Solid" BorderWidth="1px" />
                </CellStyle>
            </dx:GridViewDataCheckColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsKPI_Secao" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.usp_KPI_Secao" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="21" Name="idFilial" SessionField="sFILIAL" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>--%>
