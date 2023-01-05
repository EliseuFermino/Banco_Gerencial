<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="MapaPontuacaoSemanal_OLD.aspx.vb" Inherits="MemberPages_Checklist_MapaPontuacaoSemanal" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucListaDia.ascx" TagPrefix="uc1" TagName="wucListaDia" %>


<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>



<%@ Register Src="~/Controles/wucAnoMes.ascx" TagPrefix="uc1" TagName="wucAnoMes" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divFilial {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        } 

        #divPeriodo {
           
            float: left;
            margin-left: 10px;   
            margin-top: 5px;        
        }   
        
        #divGrupoSubgrupo {
            float: left;
            margin-left: 10px;
            margin-top: 4px;
        }     

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 1px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divDadosDepartamento {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divSize {            
            float: left;  
             margin-top: 2px;         
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        .divGrupoLegenda {
            clear: both;
            float: left;
            margin-left: 2px;
            font-weight: bold;
        }

        .divGrupo {            
            float: left;
            margin-left: 2px;
        }

        .divSubgrupoLegenda {           
            float: left;
            margin-left: 15px;
            font-weight: bold;
        }

        .divSubgrupo {           
            float: left;
            margin-left: 2px;
        }
        
        #divDadosNaoConforme {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-bottom: 20px;
        }

        #divPontuacao {
            padding: 15px;
            margin: 15px;
        }

        #div_Pontuacao_Mensal {
            margin-top: 20px;
            padding-top: 20px;
        }

    </style>

    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>

    <script type="text/javascript">
        function updateProgress(percentage) {
            document.getElementById('ProgressBar').style.width = percentage + "%";
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server" >

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divPeriodo">
        <uc1:wucAnoMes runat="server" id="cboAnoMes" />
    </div>

    <div id="divGrupoSubgrupo">
        <dx:ASPxCheckBox ID="chkGrupoSub" runat="server" Theme="DevEx" Text="por Grupo" ForeColor="Blue" CheckState="Unchecked" >
            <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanel.PerformCallback();
    cbPanelNaoConforme.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">            
           <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback(); cbPanelNaoConforme.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>



    <div id="divDados" >

        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando" >
            <PanelCollection>
                <dx:PanelContent>

                    <div id="div_Pontuacao">

                        <dxchartsui:WebChartControl ID="graph_Pontuacao_Mensal" runat="server" BackColor="Transparent" DataSourceID="dsPontuacao_Dados_Mensal" Height="150px" Width="1000px">

                            <borderoptions visible="False" />
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1">
                                        <tickmarks minorvisible="False" />
                                        <label font="Tahoma, 10pt">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines color="Gray" visible="True">
                                        </gridlines>
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
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
                                <cc1:Series ArgumentDataMember="descMesRed" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Font="Tahoma, 10pt" LineVisible="True">
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
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <argumentnumericoptions format="Number" />
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
                                <cc1:ChartTitle Text="Pontuacão por Mes e Quadrimestre" />
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
                        <asp:SqlDataSource ID="dsPontuacao_Dados_Mensal" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="uspBuscarNotaLoja_Mes_a_Mes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" Width="1000px" KeyFieldName="descPergunta">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Conforme" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Validos" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Nota" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia1" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia2" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia3" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia4" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia5" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia6" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia7" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia8" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia9" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia10" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia11" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia12" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia13" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia14" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia15" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia16" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia17" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia18" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia19" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia20" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia21" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia22" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia23" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia24" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia25" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia26" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia27" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia28" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia29" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia30" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia31" SummaryType="Custom" />

                        </TotalSummary>
                        <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Conforme" ShowInGroupFooterColumn="Conforme" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Validos" ShowInGroupFooterColumn="Validos" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Nota" ShowInGroupFooterColumn="Nota" SummaryType="Custom" />
                        </GroupSummary>
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn FieldName="listaGrupo" ShowInCustomizationForm="True" VisibleIndex="33" Width="115px" Caption="Grupo" Visible="True" >
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="listaSubgrupo" ShowInCustomizationForm="True" VisibleIndex="34" Width="115px" Caption="Sub-grupo" Visible="true" >
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descPergunta" ShowInCustomizationForm="True" VisibleIndex="1" Width="260px" Caption="Questão" FixedStyle="Left">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Pontuação" ShowInCustomizationForm="True" VisibleIndex="2" FixedStyle="Left">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Conforme" ShowInCustomizationForm="True" VisibleIndex="0" Width="65px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Validos" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle Font-Bold="True" ForeColor="#009900" HorizontalAlign="Center">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="#009900" HorizontalAlign="Center">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Peso" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px" Caption="Peso">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Equals" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Nota" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle Font-Bold="True" HorizontalAlign="Center">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" HorizontalAlign="Center">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>


                            <dx:GridViewDataCheckColumn FieldName="Dia1" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Seg" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Ter" FieldName="Dia2" ShowInCustomizationForm="True" ToolTip="Terça-Feira" VisibleIndex="4" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qua" FieldName="Dia3" ShowInCustomizationForm="True" ToolTip="Quarta-Feira" VisibleIndex="5" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qui" FieldName="Dia4" ShowInCustomizationForm="True" ToolTip="Quinta-Feira" VisibleIndex="6" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sex" FieldName="Dia5" ShowInCustomizationForm="True" ToolTip="Sexta-Feira" VisibleIndex="7" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia6" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="8" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>

                            <dx:GridViewDataCheckColumn FieldName="Dia7" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Seg" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Ter" FieldName="Dia8" ShowInCustomizationForm="True" ToolTip="Terça-Feira" VisibleIndex="10" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qua" FieldName="Dia9" ShowInCustomizationForm="True" ToolTip="Quarta-Feira" VisibleIndex="11" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qui" FieldName="Dia10" ShowInCustomizationForm="True" ToolTip="Quinta-Feira" VisibleIndex="12" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sex" FieldName="Dia11" ShowInCustomizationForm="True" ToolTip="Sexta-Feira" VisibleIndex="13" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia12" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="14" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>

                            <dx:GridViewDataCheckColumn FieldName="Dia13" ShowInCustomizationForm="True" VisibleIndex="15" Caption="Seg" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Ter" FieldName="Dia14" ShowInCustomizationForm="True" ToolTip="Terça-Feira" VisibleIndex="16" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qua" FieldName="Dia15" ShowInCustomizationForm="True" ToolTip="Quarta-Feira" VisibleIndex="17" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qui" FieldName="Dia16" ShowInCustomizationForm="True" ToolTip="Quinta-Feira" VisibleIndex="18" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sex" FieldName="Dia17" ShowInCustomizationForm="True" ToolTip="Sexta-Feira" VisibleIndex="19" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia18" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="20" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>

                            <dx:GridViewDataCheckColumn FieldName="Dia19" ShowInCustomizationForm="True" VisibleIndex="21" Caption="Seg" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Ter" FieldName="Dia20" ShowInCustomizationForm="True" ToolTip="Terça-Feira" VisibleIndex="22" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qua" FieldName="Dia21" ShowInCustomizationForm="True" ToolTip="Quarta-Feira" VisibleIndex="23" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qui" FieldName="Dia22" ShowInCustomizationForm="True" ToolTip="Quinta-Feira" VisibleIndex="24" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sex" FieldName="Dia23" ShowInCustomizationForm="True" ToolTip="Sexta-Feira" VisibleIndex="25" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia24" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="26" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>

                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia25" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="27" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia26" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="28" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia27" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="29" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia28" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="30" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia29" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="31" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>

                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia30" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="32" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>

                           <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia31" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="32" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>



                            <dx:GridViewDataTextColumn FieldName="idGrupo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="32">
                            </dx:GridViewDataTextColumn>



                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Auto" ShowFilterRow="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" ShowFooter="True" />
                        <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F0F0F0">
                            </AlternatingRow>
                            <FocusedRow BackColor="Yellow" ForeColor="Blue">
                            </FocusedRow>
                            <GroupFooter Font-Bold="True">
                            </GroupFooter>
                        </Styles>
                    </dx:ASPxGridView>
                  
                        <%--Arraste seu controle aqui --%>                         
                    
            		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspMapaSemanalLoja" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <br />


                    <dx:ASPxPageControl ID="pcDados" runat="server" ActiveTabIndex="0">

                        <TabPages>
                            <dx:TabPage Text="Todas Filiais">
                                <TabStyle BackColor="#CCFFCC">
                                </TabStyle>
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblTodasFiliais" runat="server" Text=""></asp:Label></h5> 

                                        <dxchartsui:WebChartControl ID="graph_PontuacaoTodas" runat="server" AppearanceNameSerializable="Nature Colors" DataSourceID="dsTodas" Height="450px" Width="990px">
                                            <diagramserializable>
                                                <cc1:XYDiagram>
                                                    <axisx visibleinpanesserializable="-1">
                                                        <label angle="90">
                                                        </label>
                                                        <range sidemarginsenabled="True" />
                                                    </axisx>
                                                    <axisy visibleinpanesserializable="-1" visible="False">
                                                        <range sidemarginsenabled="True" />
                                                    </axisy>
                                                </cc1:XYDiagram>
                                            </diagramserializable>
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <legend Visibility="False"></legend>
                                            <seriesserializable>
                                                <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota">
                                                    <viewserializable>
                                                        <cc1:SideBySideBarSeriesView Transparency="25">
                                                        </cc1:SideBySideBarSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True" Font="Tahoma, 7pt">
                                                            <fillstyle>
                                                                <optionsserializable>
                                                                    <cc1:SolidFillOptions />
                                                                </optionsserializable>
                                                            </fillstyle>
                                                            <pointoptionsserializable>
                                                                <cc1:PointOptions>
                                                                    <valuenumericoptions format="Number" precision="1" />
                                                                </cc1:PointOptions>
                                                            </pointoptionsserializable>
                                                        </cc1:SideBySideBarSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Number" precision="1" />
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

                                        <div id="div1" runat="server">
                                            <asp:SqlDataSource ID="dsTodas" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal" SelectCommandType="StoredProcedure" >
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>



                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>

                            <dx:TabPage Text="Super">
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblSuper" runat="server" Text=""></asp:Label></h5> 

                                        <dxchartsui:WebChartControl ID="graph_PontuacaoTotal" runat="server" AppearanceNameSerializable="Nature Colors" DataSourceID="dsPontuacaoTotal" Height="450px" Width="990px">
                                            <diagramserializable>
                                                <cc1:XYDiagram>
                                                    <axisx visibleinpanesserializable="-1">
                                                        <label angle="90">
                                                        </label>
                                                        <range sidemarginsenabled="True" />
                                                    </axisx>
                                                    <axisy visibleinpanesserializable="-1" visible="False">
                                                        <range sidemarginsenabled="True" />
                                                    </axisy>
                                                </cc1:XYDiagram>
                                            </diagramserializable>
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <legend Visibility="False"></legend>
                                            <seriesserializable>
                                                <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota">
                                                    <viewserializable>
                                                        <cc1:SideBySideBarSeriesView Transparency="25">
                                                        </cc1:SideBySideBarSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
                                                            <fillstyle>
                                                                <optionsserializable>
                                                                    <cc1:SolidFillOptions />
                                                                </optionsserializable>
                                                            </fillstyle>
                                                            <pointoptionsserializable>
                                                                <cc1:PointOptions>
                                                                    <valuenumericoptions format="Number" precision="1" />
                                                                </cc1:PointOptions>
                                                            </pointoptionsserializable>
                                                        </cc1:SideBySideBarSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Number" precision="1" />
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

                                        <div id="divGraph_PontuacaoTotal_Super" runat="server">
                                            <asp:SqlDataSource ID="dsPontuacaoTotal" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Super" SelectCommandType="StoredProcedure" >
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>

                            <dx:TabPage Text="Super E">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblSuperE" runat="server" Text=""></asp:Label></h5> 


                                            <div id="divGraph_PontuacaoTotal_SuperE" runat="server">

                                                    <dxchartsui:WebChartControl ID="graph_SuperE" runat="server" DataSourceID="dsPontuacaoSuperE" AppearanceNameSerializable="Nature Colors" Height="450px" Width="990px">
                                                        <diagramserializable>
                                                            <cc1:XYDiagram>
                                                                <axisx visibleinpanesserializable="-1">
                                                                    <label angle="90">
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

                                                        <legend Visibility="False"></legend>
                                                        <seriesserializable>
                                                            <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota">
                                                                <viewserializable>
                                                                    <cc1:SideBySideBarSeriesView Transparency="25">
                                                                    </cc1:SideBySideBarSeriesView>
                                                                </viewserializable>
                                                                <labelserializable>
                                                                    <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
                                                                        <fillstyle>
                                                                            <optionsserializable>
                                                                                <cc1:SolidFillOptions />
                                                                            </optionsserializable>
                                                                        </fillstyle>
                                                                        <pointoptionsserializable>
                                                                            <cc1:PointOptions>
                                                                                <valuenumericoptions format="Number" precision="1" />
                                                                            </cc1:PointOptions>
                                                                        </pointoptionsserializable>
                                                                    </cc1:SideBySideBarSeriesLabel>
                                                                </labelserializable>
                                                                <legendpointoptionsserializable>
                                                                    <cc1:PointOptions>
                                                                        <valuenumericoptions format="Number" precision="1" />
                                                                    </cc1:PointOptions>
                                                                </legendpointoptionsserializable>
                                                            </cc1:Series>
                                                        </seriesserializable>

                            <SeriesTemplate><ViewSerializable>
                            <cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
                            </ViewSerializable>
                            <LabelSerializable>
                            <cc1:SideBySideBarSeriesLabel LineVisible="True">
                            <FillStyle><OptionsSerializable>
                            <cc1:SolidFillOptions></cc1:SolidFillOptions>
                            </OptionsSerializable>
                            </FillStyle>
                            <PointOptionsSerializable>
                            <cc1:PointOptions></cc1:PointOptions>
                            </PointOptionsSerializable>
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

                                                    <asp:SqlDataSource ID="dsPontuacaoSuperE" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_SuperE" SelectCommandType="StoredProcedure" >
                                                        <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                            </div>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                            <dx:TabPage Text="Hiper">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblHiper" runat="server" Text=""></asp:Label></h5> 


                                        <div id="divGraph_PontuacaoTotal_Hiper">
                                            <dxchartsui:WebChartControl ID="graph_Hiper" runat="server" DataSourceID="dsPontuacaoHiper" AppearanceNameSerializable="Nature Colors" Height="450px" Width="990px">
                                                <diagramserializable>
                                                    <cc1:XYDiagram>
                                                        <axisx visibleinpanesserializable="-1">
                                                            <label angle="90">
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

                                                <legend Visibility="False"></legend>
                                                <seriesserializable>
                                                    <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota">
                                                        <viewserializable>
                                                            <cc1:SideBySideBarSeriesView Transparency="25">
                                                            </cc1:SideBySideBarSeriesView>
                                                        </viewserializable>
                                                        <labelserializable>
                                                            <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
                                                                <fillstyle>
                                                                    <optionsserializable>
                                                                        <cc1:SolidFillOptions />
                                                                    </optionsserializable>
                                                                </fillstyle>
                                                                <pointoptionsserializable>
                                                                    <cc1:PointOptions>
                                                                        <valuenumericoptions format="Number" precision="1" />
                                                                    </cc1:PointOptions>
                                                                </pointoptionsserializable>
                                                            </cc1:SideBySideBarSeriesLabel>
                                                        </labelserializable>
                                                        <legendpointoptionsserializable>
                                                            <cc1:PointOptions>
                                                                <valuenumericoptions format="Number" precision="1" />
                                                            </cc1:PointOptions>
                                                        </legendpointoptionsserializable>
                                                    </cc1:Series>
                                                </seriesserializable>

                    <SeriesTemplate><ViewSerializable>
                    <cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
                    </ViewSerializable>
                    <LabelSerializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                    <FillStyle><OptionsSerializable>
                    <cc1:SolidFillOptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>
                    <PointOptionsSerializable>
                    <cc1:PointOptions></cc1:PointOptions>
                    </PointOptionsSerializable>
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
                                            <asp:SqlDataSource ID="dsPontuacaoHiper" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Hiper" SelectCommandType="StoredProcedure" >
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                            <%--REGIONAL--%>

                            <dx:TabPage Text="Regional Edison">
                                <TabStyle BackColor="#FFFFCC">
                                </TabStyle>
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl3" runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblRegional205" runat="server" Text=""></asp:Label></h5> 
                                        
                                        <div id="div2">
                                            <dxchartsui:WebChartControl ID="graph_Regional205" runat="server" DataSourceID="dsPontuacaoRegional205" AppearanceNameSerializable="Nature Colors" Height="450px" Width="990px">
                                                <diagramserializable>
                                                    <cc1:XYDiagram>
                                                        <axisx visibleinpanesserializable="-1">
                                                            <label angle="90">
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

                                                <legend Visibility="False"></legend>
                                                <seriesserializable>
                                                    <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota">
                                                        <viewserializable>
                                                            <cc1:SideBySideBarSeriesView Transparency="25">
                                                            </cc1:SideBySideBarSeriesView>
                                                        </viewserializable>
                                                        <labelserializable>
                                                            <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
                                                                <fillstyle>
                                                                    <optionsserializable>
                                                                        <cc1:SolidFillOptions />
                                                                    </optionsserializable>
                                                                </fillstyle>
                                                                <pointoptionsserializable>
                                                                    <cc1:PointOptions>
                                                                        <valuenumericoptions format="Number" precision="1" />
                                                                    </cc1:PointOptions>
                                                                </pointoptionsserializable>
                                                            </cc1:SideBySideBarSeriesLabel>
                                                        </labelserializable>
                                                        <legendpointoptionsserializable>
                                                            <cc1:PointOptions>
                                                                <valuenumericoptions format="Number" precision="1" />
                                                            </cc1:PointOptions>
                                                        </legendpointoptionsserializable>
                                                    </cc1:Series>
                                                </seriesserializable>

                    <SeriesTemplate><ViewSerializable>
                    <cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
                    </ViewSerializable>
                    <LabelSerializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                    <FillStyle><OptionsSerializable>
                    <cc1:SolidFillOptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>
                    <PointOptionsSerializable>
                    <cc1:PointOptions></cc1:PointOptions>
                    </PointOptionsSerializable>
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
                                            <asp:SqlDataSource ID="dsPontuacaoRegional205" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Regional" SelectCommandType="StoredProcedure" >
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                    <asp:SessionParameter Name="idRegional"  Type="Byte" DefaultValue="205" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                            <dx:TabPage Text="Regional João">
                                <TabStyle BackColor="#FFFFCC">
                                </TabStyle>
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl4" runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblRegional214" runat="server" Text=""></asp:Label></h5> 


                                        <div id="div3">
                                            <dxchartsui:WebChartControl ID="graph_Regional214" runat="server" DataSourceID="dsPontuacaoRegional214" AppearanceNameSerializable="Nature Colors" Height="450px" Width="990px">
                                                <diagramserializable>
                                                    <cc1:XYDiagram>
                                                        <axisx visibleinpanesserializable="-1">
                                                            <label angle="90">
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

                                                <legend Visibility="False"></legend>
                                                <seriesserializable>
                                                    <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota">
                                                        <viewserializable>
                                                            <cc1:SideBySideBarSeriesView Transparency="25">
                                                            </cc1:SideBySideBarSeriesView>
                                                        </viewserializable>
                                                        <labelserializable>
                                                            <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
                                                                <fillstyle>
                                                                    <optionsserializable>
                                                                        <cc1:SolidFillOptions />
                                                                    </optionsserializable>
                                                                </fillstyle>
                                                                <pointoptionsserializable>
                                                                    <cc1:PointOptions>
                                                                        <valuenumericoptions format="Number" precision="1" />
                                                                    </cc1:PointOptions>
                                                                </pointoptionsserializable>
                                                            </cc1:SideBySideBarSeriesLabel>
                                                        </labelserializable>
                                                        <legendpointoptionsserializable>
                                                            <cc1:PointOptions>
                                                                <valuenumericoptions format="Number" precision="1" />
                                                            </cc1:PointOptions>
                                                        </legendpointoptionsserializable>
                                                    </cc1:Series>
                                                </seriesserializable>

                    <SeriesTemplate><ViewSerializable>
                    <cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
                    </ViewSerializable>
                    <LabelSerializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                    <FillStyle><OptionsSerializable>
                    <cc1:SolidFillOptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>
                    <PointOptionsSerializable>
                    <cc1:PointOptions></cc1:PointOptions>
                    </PointOptionsSerializable>
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
                                            <asp:SqlDataSource ID="dsPontuacaoRegional214" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Regional" SelectCommandType="StoredProcedure" >
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                    <asp:SessionParameter Name="idRegional" Type="Byte" DefaultValue="214" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                            <dx:TabPage Text="Regional Mauricio">
                                <TabStyle BackColor="#FFFFCC">
                                </TabStyle>
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl5" runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblRegional206" runat="server" Text=""></asp:Label></h5> 


                                        <div id="div4">
                                            <dxchartsui:WebChartControl ID="graph_Regional206" runat="server" DataSourceID="dsPontuacaoRegional206" AppearanceNameSerializable="Nature Colors" Height="450px" Width="990px">
                                                <diagramserializable>
                                                    <cc1:XYDiagram>
                                                        <axisx visibleinpanesserializable="-1">
                                                            <label angle="90">
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

                                                <legend Visibility="False"></legend>
                                                <seriesserializable>
                                                    <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota">
                                                        <viewserializable>
                                                            <cc1:SideBySideBarSeriesView Transparency="25">
                                                            </cc1:SideBySideBarSeriesView>
                                                        </viewserializable>
                                                        <labelserializable>
                                                            <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
                                                                <fillstyle>
                                                                    <optionsserializable>
                                                                        <cc1:SolidFillOptions />
                                                                    </optionsserializable>
                                                                </fillstyle>
                                                                <pointoptionsserializable>
                                                                    <cc1:PointOptions>
                                                                        <valuenumericoptions format="Number" precision="1" />
                                                                    </cc1:PointOptions>
                                                                </pointoptionsserializable>
                                                            </cc1:SideBySideBarSeriesLabel>
                                                        </labelserializable>
                                                        <legendpointoptionsserializable>
                                                            <cc1:PointOptions>
                                                                <valuenumericoptions format="Number" precision="1" />
                                                            </cc1:PointOptions>
                                                        </legendpointoptionsserializable>
                                                    </cc1:Series>
                                                </seriesserializable>

                    <SeriesTemplate><ViewSerializable>
                    <cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
                    </ViewSerializable>
                    <LabelSerializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                    <FillStyle><OptionsSerializable>
                    <cc1:SolidFillOptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>
                    <PointOptionsSerializable>
                    <cc1:PointOptions></cc1:PointOptions>
                    </PointOptionsSerializable>
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
                                            <asp:SqlDataSource ID="dsPontuacaoRegional206" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Regional" SelectCommandType="StoredProcedure" >
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                    <asp:SessionParameter Name="idRegional"  Type="Byte" DefaultValue="206" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>



                            <dx:TabPage Text="Regional Claudinei">
                                <TabStyle BackColor="#FFFFCC">
                                </TabStyle>
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">

                                <h5><asp:Label ID="lblRegional204" runat="server" Text=""></asp:Label></h5> 


                                        <div id="div5">
                                            <dxchartsui:WebChartControl ID="graph_Regional204" runat="server" DataSourceID="dsPontuacaoRegional204" AppearanceNameSerializable="Nature Colors" Height="450px" Width="990px">
                                                <diagramserializable>
                                                    <cc1:XYDiagram>
                                                        <axisx visibleinpanesserializable="-1">
                                                            <label angle="90">
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

                                                <legend Visibility="False"></legend>
                                                <seriesserializable>
                                                    <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota">
                                                        <viewserializable>
                                                            <cc1:SideBySideBarSeriesView Transparency="25">
                                                            </cc1:SideBySideBarSeriesView>
                                                        </viewserializable>
                                                        <labelserializable>
                                                            <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
                                                                <fillstyle>
                                                                    <optionsserializable>
                                                                        <cc1:SolidFillOptions />
                                                                    </optionsserializable>
                                                                </fillstyle>
                                                                <pointoptionsserializable>
                                                                    <cc1:PointOptions>
                                                                        <valuenumericoptions format="Number" precision="1" />
                                                                    </cc1:PointOptions>
                                                                </pointoptionsserializable>
                                                            </cc1:SideBySideBarSeriesLabel>
                                                        </labelserializable>
                                                        <legendpointoptionsserializable>
                                                            <cc1:PointOptions>
                                                                <valuenumericoptions format="Number" precision="1" />
                                                            </cc1:PointOptions>
                                                        </legendpointoptionsserializable>
                                                    </cc1:Series>
                                                </seriesserializable>

                    <SeriesTemplate><ViewSerializable>
                    <cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
                    </ViewSerializable>
                    <LabelSerializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                    <FillStyle><OptionsSerializable>
                    <cc1:SolidFillOptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>
                    <PointOptionsSerializable>
                    <cc1:PointOptions></cc1:PointOptions>
                    </PointOptionsSerializable>
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
                                            <asp:SqlDataSource ID="dsPontuacaoRegional204" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Regional" SelectCommandType="StoredProcedure" >
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                    <asp:SessionParameter Name="idRegional"  Type="Byte" DefaultValue="204" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>


                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>



                        </TabPages>

                    </dx:ASPxPageControl>



                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div> <%--PONTUACAO--%>



    <div id="divDadosDepartamento">
<%--        <dx:ASPxCallbackPanel ID="cboPanelDepartamento" runat="server" Width="100%" ClientInstanceName="cbPanelDepartamento" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>--%>

                        <br />

                        <h5><asp:Label ID="lblDepartamento" runat="server" Text="" Font-Bold="true"></asp:Label></h5> 

                        <div class="divGrupoLegenda" >
                            Grupo:
                        </div>

                        <div class="divGrupo">
                            <dx:ASPxComboBox ID="cboGrupo" runat="server" DataSourceID="dsGrupo" TextField="listaGrupo" Theme="Default" ValueField="idGrupo" Width="200px" AutoPostBack="True">
                                                               
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="dsGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="SELECT [idGrupo], [listaGrupo] FROM [Cadastro].[tblCadGrupo] ORDER BY [idGrupo]" EnableCaching="True"></asp:SqlDataSource>
                        </div>

                        <div class="divSubgrupoLegenda">
                            Subgrupo:
                        </div>

                        <div class="divSubgrupo">
                            <dx:ASPxComboBox ID="cboSubgrupo" runat="server" DataSourceID="dsSubgrupoLista" TextField="descSubgrupo" Theme="Default" ValueField="idSubgrupo" Width="200px" ClientInstanceName="cboSubgrupo" AutoPostBack="True">

                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="dsSubgrupoLista" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="SELECT [idSubgrupo], [descSubgrupo] FROM [Cadastro].[tblCadSubgrupo] WHERE ([idGrupo] = @idGrupo)" >
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="cboGrupo" Name="idGrupo" PropertyName="Value" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>

                        <dxchartsui:WebChartControl ID="graph_Subgrupo" runat="server" AppearanceNameSerializable="Nature Colors" DataSourceID="dsSubgrupoDados" Height="450px" Width="1020px">
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1">
                                        <label angle="90">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </axisx>
                                    <axisy visibleinpanesserializable="-1" visible="False">
                                        <range sidemarginsenabled="True" />
                                    </axisy>
                                </cc1:XYDiagram>
                            </diagramserializable>
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                            <legend Visibility="False"></legend>
                            <seriesserializable>
                                <cc1:Series LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota" ArgumentDataMember="Descricao">
                                    <viewserializable>
                                        <cc1:SideBySideBarSeriesView Transparency="25">
                                        </cc1:SideBySideBarSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True" Font="Tahoma, 7pt">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" precision="1" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:SideBySideBarSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" precision="1" />
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

                        <div id="dsSubgrupo" runat="server">
                            <asp:SqlDataSource ID="dsSubgrupoDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspBuscar_Subgrupo" SelectCommandType="StoredProcedure" >
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" Type="Byte" />
                                    <asp:SessionParameter Name="idSubgrupo" SessionField="sSUBGRUPO" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                    <br />

                    <%--LEGENDAS--%>

                    <span class="label label-danger">Péssimo - Entre 0 e 70</span>
                    <span class="label label-warning">Ruim - Entre 70,1 e 90</span>
                    <span class="label label-info">Regular - Entre 90,1 e 95</span>
                    <span class="label label-primary">Bom - Entre 95,1 e 97</span>                
                    <span class="label label-success">Ótimo - Entre 97,1 e 100</span>


<%--                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>--%>
    </div> <%--DEPARTAMENTO--%>



    <div id="divDadosNaoConforme">
<%--        <dx:ASPxCallbackPanel ID="cboPanelNaoConforme" runat="server" Width="100%" ClientInstanceName="cbPanelNaoConforme" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>--%>

                        <br />

                    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="2" >

                        <TabPages>
                            <dx:TabPage Text="Todas Filiais">
                                <TabStyle BackColor="#CCFFCC">
                                </TabStyle>
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl6" runat="server" SupportsDisabledAttribute="True">

                                       <br />

                                        <h5><asp:Label ID="lblNaoConforme" runat="server" Text="" Font-Bold="true"></asp:Label></h5> 

                                        <dxchartsui:WebChartControl ID="graphNaoConforme" runat="server" AppearanceNameSerializable="Northern Lights" DataSourceID="dsNaoConforme" Height="450px" Width="1020px" PaletteName="Black and White">
                                            <diagramserializable>
                                                <cc1:XYDiagram>
                                                    <axisx visibleinpanesserializable="-1">
                                                        <label angle="90">
                                                        </label>
                                                        <range sidemarginsenabled="True" />
                                                    </axisx>
                                                    <axisy visibleinpanesserializable="-1" visible="False">
                                                        <range sidemarginsenabled="True" />
                                                    </axisy>
                                                </cc1:XYDiagram>
                                            </diagramserializable>
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <legend Visibility="False"></legend>
                                            <seriesserializable>
                                                <cc1:Series LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota" ArgumentDataMember="Descricao">
                                                    <viewserializable>
                                                        <cc1:SideBySideBarSeriesView Transparency="25">
                                                        </cc1:SideBySideBarSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
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
                                                        </cc1:SideBySideBarSeriesLabel>
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
                        
                                        <asp:SqlDataSource ID="dsNaoConforme" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarQtdeNaoConforme" SelectCommandType="StoredProcedure" EnableCaching="True">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>

                            <dx:TabPage Text="por Departamento" >
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl7" runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblNaoConformePorDepartamento" runat="server" Text="" Font-Bold="true"></asp:Label></h5> 

                                        <div class="divGrupoLegenda">
                                            Grupo:
                                        </div>

                                        <div class="divGrupo">
                                            <dx:ASPxComboBox ID="cboGrupo_NA" runat="server" DataSourceID="dsGrupo" TextField="listaGrupo" Theme="Default" ValueField="idGrupo" Width="200px" AutoPostBack="True" DropDownRows="10">

                                            </dx:ASPxComboBox>
                                            
                                        </div>

                                        <div class="divSubgrupoLegenda">
                                            Subgrupo:
                                        </div>

                                        <div class="divSubgrupo">
                                            <dx:ASPxComboBox ID="cboSubgrupo_NA" runat="server" DataSourceID="dsSubgrupoLista_NA" TextField="descSubgrupo" Theme="Default" ValueField="idSubgrupo" Width="200px" ClientInstanceName="cboSubgrupo" AutoPostBack="True" DropDownRows="10">

                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="dsSubgrupoLista_NA" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="SELECT [idSubgrupo], [descSubgrupo] FROM [Cadastro].[tblCadSubgrupo] WHERE ([idGrupo] = @idGrupo)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="cboGrupo_NA" Name="idGrupo" PropertyName="Value" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                        </div>


                                        <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" AppearanceNameSerializable="Northern Lights" DataSourceID="dsNaoConformeSubgrupo" Height="450px" Width="1020px" PaletteName="Black and White">
                                            <diagramserializable>
                                                <cc1:XYDiagram>
                                                    <axisx visibleinpanesserializable="-1">
                                                        <label angle="90">
                                                        </label>
                                                        <range sidemarginsenabled="True" />
                                                    </axisx>
                                                    <axisy visibleinpanesserializable="-1" visible="False">
                                                        <range sidemarginsenabled="True" />
                                                    </axisy>
                                                </cc1:XYDiagram>
                                            </diagramserializable>
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <legend Visibility="False"></legend>
                                            <seriesserializable>
                                                <cc1:Series LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota" ArgumentDataMember="Descricao">
                                                    <viewserializable>
                                                        <cc1:SideBySideBarSeriesView Transparency="25">
                                                        </cc1:SideBySideBarSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
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
                                                        </cc1:SideBySideBarSeriesLabel>
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
                        
                                        <asp:SqlDataSource ID="dsNaoConformeSubgrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspBuscar_QtdeNaoConforme_Subgrupo" SelectCommandType="StoredProcedure" EnableCaching="True">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO_NA" Type="Byte" />
                                                <asp:SessionParameter Name="idSubgrupo" SessionField="sSUBGRUPO_NA" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>

                            <dx:TabPage Text="por Filial" >
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl8" runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblNaoConformePorFilial" runat="server" Text="" Font-Bold="true"></asp:Label></h5> 
                                        

                                        <div class="divGrupo">
                                            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial_NA" />

                                        </div>


                                        <dxchartsui:WebChartControl ID="graphNaoConformeDepartamentoFilial" runat="server" AppearanceNameSerializable="Northern Lights" DataSourceID="dsQtdeNaoConforme_Subgrupo_porFilial" Height="450px" Width="1020px" PaletteName="Black and White">
                                            <diagramserializable>
                                                <cc1:XYDiagram>
                                                    <axisx visibleinpanesserializable="-1">
                                                        <label angle="90">
                                                        </label>
                                                        <range sidemarginsenabled="True" />
                                                    </axisx>
                                                    <axisy visibleinpanesserializable="-1" visible="False">
                                                        <range sidemarginsenabled="True" />
                                                    </axisy>
                                                </cc1:XYDiagram>
                                            </diagramserializable>
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <legend Visibility="False"></legend>
                                            <seriesserializable>
                                                <cc1:Series LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota" ArgumentDataMember="Descricao">
                                                    <viewserializable>
                                                        <cc1:SideBySideBarSeriesView Transparency="25">
                                                        </cc1:SideBySideBarSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
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
                                                        </cc1:SideBySideBarSeriesLabel>
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
                        
                                        <asp:SqlDataSource ID="dsQtdeNaoConforme_Subgrupo_porFilial" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspBuscar_QtdeNaoConforme_Subgrupo_porFilial" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_NA" Type="Byte" />                                               
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                        </TabPages>

                    </dx:ASPxPageControl>




   
<%--                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>--%>

    </div>

    

    <div id="div_Pontuacao_Mensal">
        <br />

                <dx:ASPxGridView ID="grid_Notas" runat="server" AutoGenerateColumns="False" DataSourceID="dsGrid_Nota" EnableTheming="True" Theme="SoftOrange" KeyFieldName="idFilial" Width="1000px">

                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Filial" FieldName="Descricao" VisibleIndex="0" FixedStyle="Left" Width="200px">
                            <HeaderStyle BackColor="#999999" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Jan" FieldName="mes1" VisibleIndex="1" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Fev " FieldName="mes2" VisibleIndex="2" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Mar" FieldName="mes3" VisibleIndex="3" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Abr" FieldName="mes4" VisibleIndex="4" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="1º Quad" FieldName="mes1Q" VisibleIndex="5" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#666666" />
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Mai" FieldName="mes5" VisibleIndex="6" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Jun" FieldName="mes6" VisibleIndex="7" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Jul" FieldName="mes7" VisibleIndex="8" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ago" FieldName="mes8" VisibleIndex="9" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2º Quad" FieldName="mes2Q" VisibleIndex="10" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#666666" />
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Set" FieldName="mes9" VisibleIndex="11" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Out" FieldName="mes10" VisibleIndex="12" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Nov" FieldName="mes11" VisibleIndex="13" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Dez" FieldName="mes12" VisibleIndex="14" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="3º Quad" FieldName="mes3Q" VisibleIndex="15" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#666666" />
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings HorizontalScrollBarMode="Visible" VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" />
                    <Styles>
                        <Header HorizontalAlign="Center">
                        </Header>
                        <AlternatingRow BackColor="#E2E2E2">
                        </AlternatingRow>
                    </Styles>

                </dx:ASPxGridView>
                
                  
   
                <asp:SqlDataSource ID="dsGrid_Nota" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="uspBuscarNotaLoja_Mes_a_Mes_TodasLojas" SelectCommandType="StoredProcedure">
                    <SelectParameters>                        
                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>


    </div>

    <asp:Label ID="lblError" runat="server" Text="Label" ForeColor="Red" Visible="false" ></asp:Label>

</asp:Content>

