<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Comparativo_Despesa.aspx.vb" Inherits="MemberPages_Despesas_Analises_Comparativo_Despesa" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divFilial {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }

        #divMes {           
            float: left;
            margin-left: 10px;
            margin-top: 3px;
        }

        #divGrupo_Title {           
            float: left;
            margin-left: 10px;
            margin-top: 5px;
        }

        #divGrupo {           
            float: left;
            margin-left: 3px;
            margin-top: 6px;
        }

        #divSubgrupo {           
            float: left;
            margin-left: 3px;
            margin-top: 6px;
        }

        #divSubgrupo_rnd {           
            float: left;
            margin-left: 10px;
            margin-top: 5px;
        }

        #div_rndValor {           
            float: left;
            margin-left: 10px;
            margin-top: 5px;
        }

        #div_rndPercentual {           
            float: left;
            margin-left: 10px;
            margin-top: 5px;
        }

        #div_Comparativo_Title {           
            float: left;
            margin-left: 10px;
            margin-top: 5px;
        }

        #div_Comparativo {           
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }

        #div_FilialOutra {            
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <asp:UpdatePanel ID="cboPanel" runat="server">
        <ContentTemplate>

            <div id="divFilial">
                <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
            </div>

            <div id="divMes">
                <uc1:wuciListaMes runat="server" ID="cboMes" AutoPostBack="true" />
            </div>

            <div id="divGrupo_Title">
                Grupo
            </div>
            
            <div id="divGrupo">
                <dx:ASPxComboBox ID="cboGrupo" runat="server" DataSourceID="dsGrupo" TextField="GrupoDesc" ValueField="KeyCategoriaGrupo" AutoPostBack="True" DropDownRows="15"></dx:ASPxComboBox>
                <asp:SqlDataSource ID="dsGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="usp_Lista_DimCategoriaGrupo" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </div>

            <div id="divSubgrupo_rnd">
                <dx:ASPxCheckBox ID="chkSubgrupo" runat="server" Text="Subgrupo" Checked="false" AutoPostBack="true" Enabled="false" Theme="DevEx"  ></dx:ASPxCheckBox>
            </div>

            <div id="divSubgrupo">
                <dx:ASPxComboBox ID="cboSubgrupo" runat="server" DataSourceID="dsSubgrupo" TextField="SubGrupoDesc" ValueField="KeyCategoriaSubgrupo" Visible="False"></dx:ASPxComboBox>
                <asp:SqlDataSource ID="dsSubgrupo" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="usp_Lista_DimCategoriaSubgrupo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboGrupo" Name="idGrupo" PropertyName="Value" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div id="div_rndValor">
                <dx:ASPxRadioButton ID="rndValor" runat="server" Text="R$ " Checked="true" GroupName="rndTipo" AutoPostBack="true" BackColor="#666666" ForeColor="White" ></dx:ASPxRadioButton>
            </div>

            <div id="div_rndPercentual">
                <dx:ASPxRadioButton ID="rndPerc" runat="server" Text="%" Checked="false" GroupName="rndTipo" AutoPostBack="true" BackColor="#FF6600" ForeColor="White" ></dx:ASPxRadioButton>
            </div>

            <div id="div_Comparativo_Title">
                Comparativo:
            </div>

            <div id="div_Comparativo">
                <dx:ASPxComboBox ID="cboComparativo" runat="server" SelectedIndex="0" AutoPostBack="True" >
                    <Items>
                        <dx:ListEditItem Selected="True" Text="Ela Mesma" Value="1" />
                        <dx:ListEditItem Text="Outra Loja" Value="2" />
                        <dx:ListEditItem Text="Lojas Mesmo Segmento" Value="3" />
                        <dx:ListEditItem Text="Lojas Metragem Parecida" Value="4" />
                        <dx:ListEditItem Text="Empresa" Value="5" />
                    </Items>
                </dx:ASPxComboBox>
            </div>

            <div id="div_FilialOutra">
                <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilialOutra" Visible ="false"  />
            </div>


        <div>
            <dxchartsui:WebChartControl ID="grafico1" runat="server" DataSourceID="dsGrafico1" Height="400px" Width="1000px" Visible="False">
                <diagramserializable>
                    <cc1:XYDiagram>
                        <axisx gridspacingauto="False" visibleinpanesserializable="-1" alignment="Zero">
                            <label>
                            <resolveoverlappingoptions minindent="1" />
                            </label>
                            <range sidemarginsenabled="True" />
                        </axisx>
                        <axisy visibleinpanesserializable="-1" visible="False">
                            <range sidemarginsenabled="True" />
                        </axisy>
                    </cc1:XYDiagram>
                </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="8"></legend>
                <seriesserializable>
                    <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Metas" ValueDataMembersSerializable="vlrMeta">
                        <viewserializable>
                            
                        <cc1:LineSeriesView Color="128, 0, 192, 0"><linemarkeroptions BorderVisible="True"></linemarkeroptions></cc1:LineSeriesView></viewserializable>
                        <labelserializable>
                            
                        <cc1:PointSeriesLabel LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Number" /></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
                        <legendpointoptionsserializable>
                            <cc1:PointOptions>
                                <valuenumericoptions format="Number" />
                            </cc1:PointOptions>
                        </legendpointoptionsserializable>
                    </cc1:Series>
                    <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Realizado Loja" ValueDataMembersSerializable="vlrDesp">
                        <viewserializable>
                            
                        <cc1:SideBySideBarSeriesView Color="Blue"><fillstyle fillmode="Solid"><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle></cc1:SideBySideBarSeriesView></viewserializable>
                        <labelserializable>
                            
                        <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="BottomInside"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions><argumentnumericoptions format="Number" /><valuenumericoptions format="Number" /></cc1:PointOptions></pointoptionsserializable></cc1:SideBySideBarSeriesLabel></labelserializable>
                        <legendpointoptionsserializable>
                            <cc1:PointOptions>
                                <argumentnumericoptions format="Number" />
                                <valuenumericoptions format="Number" />
                            </cc1:PointOptions>
                        </legendpointoptionsserializable>
                    </cc1:Series>
                </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:LineSeriesView>
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
            <asp:SqlDataSource ID="dsGrafico1" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="usp_BuscarDespesaPorConta_Filial" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                    <asp:SessionParameter Name="idTipoDespesa" SessionField="sTIPO" Type="Byte" />
                    <asp:SessionParameter Name="idConta" SessionField="sCONTA" Type="Int32" />
                    <asp:SessionParameter Name="idValorPerc" SessionField="sVALOR_PERC" Type="Byte" />
                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource>
       
        </div>


        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>

