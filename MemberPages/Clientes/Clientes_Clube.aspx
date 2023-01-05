<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Clientes_Clube.aspx.vb" Inherits="MemberPages_Clientes_Clientes_Clube" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%--<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web.Designer" TagPrefix="dxchartdesigner" %>--%>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divFilial {
            clear: both;
            float: left;
            margin-left: 2px;
        }        

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }       

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<div id="divFilial">
    <uc1:wucLista_Filial_Empresa runat="server" ID="cboFilial" AutoPostBack="false" />    
</div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>


    <div id="divDados"> 

        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

                    <dx:WebChartControl ID="graf_Clientes_12_Meses" runat="server" AppearanceNameSerializable="Northern Lights" CrosshairEnabled="True" DataSourceID="dsGrafico_12_Meses" Height="400px" PaletteName="Office" Width="1000px">
                        <DiagramSerializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="-1">
                                </axisx>
                                <axisy visibleinpanesserializable="-1" visibility="False">
                                </axisy>
                                <secondaryaxesy>
                                    <cc1:SecondaryAxisY AxisID="0" Name="percCresc" VisibleInPanesSerializable="-1" Visibility="False">
                                    </cc1:SecondaryAxisY>
                                </secondaryaxesy>
                            </cc1:XYDiagram>
                        </DiagramSerializable>
            <Legend Name="Default Legend" Visibility="True" AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="LeftToRight"></Legend>
                        <SeriesSerializable>
                            <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="Nº de Clientes Clube" ValueDataMembersSerializable="numClientesAT">
                                <viewserializable>
                                    <cc1:SideBySideBarSeriesView AxisYName="percCresc">
                                    </cc1:SideBySideBarSeriesView>
                            </viewserializable>
                                <labelserializable>
                                    <cc1:SideBySideBarSeriesLabel Position="Top" ResolveOverlappingMode="Default" TextPattern="{V:n0}" Font="Tahoma, 9pt">
                                    </cc1:SideBySideBarSeriesLabel>
                                </labelserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="% de Crescimento Sobre o Ano Passado" ValueDataMembersSerializable="percCrescLoja ">
                                <viewserializable>
                                    <cc1:LineSeriesView MarkerVisibility="True" Color="118, 146, 60">
                                        <linestyle thickness="4" />
                                        <linemarkeroptions size="5" color="155, 187, 89">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel TextPattern="{V:n2}" Font="Tahoma, 9pt">
                                    </cc1:PointSeriesLabel>
                                </labelserializable>
                            </cc1:Series>
                        </SeriesSerializable>
                    </dx:WebChartControl>
                    <asp:SqlDataSource ID="dsGrafico_12_Meses" runat="server" ConnectionString="<%$ ConnectionStrings:gerTempConnectionString %>" SelectCommand="usp_BuscarClientesClube_Ultimos_12Mes" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="4" Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>


         </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

    </div>

</asp:Content>

