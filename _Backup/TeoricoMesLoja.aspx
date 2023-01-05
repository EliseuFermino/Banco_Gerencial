<%@ Page Title="Resultado Teórico" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="TeoricoMesLoja.aspx.vb" Inherits="MemberPages_TeoricoMesLoja" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>



<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc5" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc6" %>

<%@ Register src="../../Controles/wuciListaMesPeriodo.ascx" tagname="wuciListaMesPeriodo" tagprefix="uc1" %>

<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc3" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server" >    
   
<style type="text/css">
    
a { 
	text-decoration:none; 
	color:#00c6ff;
}

.container {width: 960px; margin: 0 auto; overflow: hidden; padding-top: 10px}

#content {	float: left; width: 100%;}

.post { margin: 0 auto; padding-bottom: 50px; float: left; width: 960px; }

.btn-sign {
	width:260px;
	margin-bottom:20px;
	margin:0 auto;
	padding:20px;
	border-radius:5px;
	background: -moz-linear-gradient(center top, #00c6ff, #018eb6);
    background: -webkit-gradient(linear, left top, left bottom, from(#00c6ff), to(#018eb6));
	background:  -o-linear-gradient(top, #00c6ff, #018eb6);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#00c6ff', EndColorStr='#018eb6');
	text-align:center;
	font-size:16px;
	color:gray;
	text-transform:uppercase;
}

.btn-sign a { color:#fff; text-shadow:0 1px 2px #161616; }

#mask {
	display: none;
	background: #000; 
	position: fixed; left: 0; top: 0; 
	z-index: 10;
	width: 100%; height: 100%;
	opacity: 0.8;
	z-index: 999;
}

.login-popup{
	display:none;
	background: #333;
	padding: 10px; 	
	border: 2px solid #ddd;
	float: left;
	font-size: 1.2em;
	position: fixed;
	top: 50%; left: 50%;
	z-index: 99999;
	box-shadow: 0px 0px 20px #999;
	-moz-box-shadow: 0px 0px 20px #999; /* Firefox */
    -webkit-box-shadow: 0px 0px 20px #999; /* Safari, Chrome */
	border-radius:3px 3px 3px 3px;
    -moz-border-radius: 3px; /* Firefox */
    -webkit-border-radius: 3px; /* Safari, Chrome */
}

img.btn_close {
	float: right; 
	margin: -28px -28px 0 0;
}

fieldset { 
	border:none; 
}

form.signin .textbox label { 
	display:block; 
	padding-bottom:7px; 
}

form.signin .textbox span { 
	display:block;
}

form.signin p, form.signin span { 
	color:#999; 
	font-size:11px; 
	line-height:18px;
} 

form.signin .textbox input { 
	background:#666666; 
	border-bottom:1px solid #333;
	border-left:1px solid #000;
	border-right:1px solid #333;
	border-top:1px solid #000;
	color:#fff; 
	border-radius: 3px 3px 3px 3px;
	-moz-border-radius: 3px;
    -webkit-border-radius: 3px;
	font:13px Arial, Helvetica, sans-serif;
	padding:6px 6px 4px;
	width:200px;
}

form.signin input:-moz-placeholder { color:#bbb; text-shadow:0 0 2px #000; }
form.signin input::-webkit-input-placeholder { color:#bbb; text-shadow:0 0 2px #000;  }

.button { 
	background: -moz-linear-gradient(center top, #f3f3f3, #dddddd);
	background: -webkit-gradient(linear, left top, left bottom, from(#f3f3f3), to(#dddddd));
	background:  -o-linear-gradient(top, #f3f3f3, #dddddd);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#f3f3f3', EndColorStr='#dddddd');
	border-color:#000; 
	border-width:1px;
	border-radius:4px 4px 4px 4px;
	-moz-border-radius: 4px;
    -webkit-border-radius: 4px;
	color:#333;
	cursor:pointer;
	display:inline-block;
	padding:6px 6px 4px;
	margin-top:10px;
	font:12px; 
	width:214px;
}

.button:hover { background:#ddd; }

        
        html {            
            overflow-x:hidden ;
        }

        #moldura {
            width:1024px;
            margin:0 auto;           
        }

        #Ano {
            float: left;
        }

        #Mes {
            float: left;
            margin-top: 3px;
            margin-left: 5px;
            padding-top: 4px;
        }

        #BotaoAtualizar {
            float: left;
            margin-left: 5px;
            margin-top: 3px;
            padding-top: 6px;
            padding-left: 3px;
        }

        #Tamanho {
            float: left;
            margin-left: 2px;
            margin-top: 2px;
        }

        #Grid {
            clear:both;
            float: left;
            padding-top: 2px;
        }       

        #Periodo {
            float: left;
            margin-left: 2px;
            margin-top: 10px;
            padding-top: 5px;
           
        }

    
        
        #MostrarCabecalho {
            float: left;
            margin-left: 2px;
            width: 155px;            
        }         

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 28px;
            margin-left: 1px;            
        }

         #divCheckGroup {
            clear: both;
            float: left;
            border: 1px dashed #C0C0C0;     
            margin-top: 2px;                          
         }

         #divCheckGroup1 {
            margin-left: 30px;
            float: left;
            border: 1px dashed #C0C0C0;     
            margin-top: 2px;                          
         }

         .divCheck {
            float: left;
            width: 150px;
         }

    #divTituloGrafico24Meses_UltimaLinha {
        clear: both;        
        padding-top: 20px;       
        text-align: center;  
        font-size : 24px;   
    }

    #divTituloGraficoUltimaLinha_Quadrimestres {
        clear: both;        
        padding-top: 20px;       
        text-align: center;  
        font-size : 20px;
        width:600px;   
    }

    #divTituloGraficoUltimaLinha_Acumulado {
        float: left;        
        padding-top: 20px;       
        text-align: center;  
        font-size : 20px;
        width:390px; 
        margin-top: -50px;  
    }

    #divGraficoUltimaLinha_UltimaLinha {
        float: left;
    }

    #divGraficoUltimaLinha_Quadrimestres {
        float: left;
    }

    #divGraficoUltimaLinha_Acumulado {
        float: left;
        margin-left: 30px;
    }

</style>

    <script src="../../Scripts/jquery-1.6.2.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function () {
        $('a.login-window').click(function () {

            // Getting the variable's value from a link 
            var loginBox = $(this).attr('href');

            //Fade in the Popup and add close button
            $(loginBox).fadeIn(300);

            //Set the center alignment padding + border
            var popMargTop = ($(loginBox).height() + 24) / 2;
            var popMargLeft = ($(loginBox).width() + 24) / 2;

            $(loginBox).css({
                'margin-top': -popMargTop,
                'margin-left': -popMargLeft
            });

            // Add the mask to body
            $('body').append('<div id="mask"></div>');
            $('#mask').fadeIn(300);

            return false;
        });

        // When clicking on the button close or the mask layer the popup closed
        $('a.close, #mask').live('click', function () {
            $('#mask , .login-popup').fadeOut(300, function () {
                $('#mask').remove();
            });
            return false;
        });
    });
</script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>

                <div id="Filial" >
                    <uc3:wucListaLojasComCorporacao ID="cboFilial" runat="server" AutoPostBack="false" />          
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>


    
    <div id="moldura">
        <div id="Ano" class="BGC_myBorder">
            <uc5:wucAno ID="cboAno" runat="server" />
        </div>

        <div id="Mes" class="BGC_myBorder">
            <uc1:wuciListaMesPeriodo ID="cboMes" runat="server" />
        </div>

        


        <div id="BotaoAtualizar" class="BGC_myBorder">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="MetropolisBlue" AutoPostBack ="False" >
                <ClientSideEvents Click="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="divCheckGroup">
            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkVerOriginal" runat="server" Text="Ver Meta Original" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="false" ForeColor="Orange">
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkVerRevista" runat="server" Text="Ver Meta Revista" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="true" ForeColor="Green">
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkVerRealizado" runat="server" Text="Ver Realizado" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="true" ForeColor="Blue">
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkVerDiferencas" runat="server" Text="Ver Diferenças" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="true" ForeColor="Red">
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox>
            </div>

            <div id="MostrarCabecalho">
                <dx:ASPxCheckBox ID="chkMostrarCabecalho" runat="server" 
                    Checked="False" CheckState="Checked" Text="Fixar cabeçalho" Theme="DevEx">
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox>
            </div>

        </div>
        
        <div id="Grid">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="1020px" Theme ="Metropolis" ClientInstanceName="cbPanel" SettingsLoadingPanel-Text="Atualizando">
                <PanelCollection>
                    <dx:PanelContent>
                        <dx:ASPxGridView ID="gridGrupoMes" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="dsGrupoMes" EnableTheming="True" Theme="SoftOrange" Width="1020px">
                            <Toolbars>
                                <dx:GridViewToolbar EnableAdaptivity="true">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrRev" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRev" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percReal" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercRev" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifReal" SummaryType="Custom" />
                            </TotalSummary>
                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0" Width="10px">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewBandColumn Caption="Crescimento" VisibleIndex="9" 
                                    Name="band_Crescimento">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="% A.A." FieldName="percCresc" 
                                            ShowInCustomizationForm="True" 
                                            ToolTip="Percentual de Crescimento sobre o ano anterior" VisibleIndex="0" 
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="ID" FieldName="idGrupo" VisibleIndex="1" 
                                    Width="40px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Diferenças" VisibleIndex="8" 
                                    Name="band_Diferencas">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" 
                                            ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Meta" FieldName="difPercRev" 
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Real" FieldName="percDifReal" ShowInCustomizationForm="True" ToolTip="Diferença entre o Percentual Real Ano Anterior e Ano Atual" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>    <%--Diferenças--%>

                                <dx:GridViewBandColumn Caption="Realizado" VisibleIndex="7" 
                                    Name="band_Realizado">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="vlrReal" ShowInCustomizationForm="True" Width="100px" Caption="Valor" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                        <HeaderStyle BackColor="#3399FF"></HeaderStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percReal" ShowInCustomizationForm="True" Width="60px" Caption="%" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                        <HeaderStyle BackColor="#3399FF"></HeaderStyle>
                                        <CellStyle><BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px"></BorderRight></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>                               
                                </dx:GridViewBandColumn>    <%--Realizado--%>

                                <dx:GridViewBandColumn Caption="Meta Revista" VisibleIndex="5" 
                                    Name="band_MetaRevista">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrRev" VisibleIndex="0" 
                                            Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle BackColor="#009900" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percRev" VisibleIndex="1" 
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle BackColor="#009900" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>    <%--Meta Revista--%>

                                <dx:GridViewBandColumn Caption="Meta Original" VisibleIndex="4" 
                                    Name="band_MetaOriginal" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrOri" VisibleIndex="0" 
                                            Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle BackColor="#CCCC00" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percOri" VisibleIndex="1" 
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle BackColor="#CCCC00" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>    <%--Meta Original--%>

                                <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="3" 
                                    Name="band_AnoAnterior">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrRealAA" 
                                            VisibleIndex="0" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle BackColor="#CC9900" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percRealAA" VisibleIndex="1" 
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle BackColor="#CC9900" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>   <%-- Ano Anterior--%>
                                <dx:GridViewDataTextColumn Caption="Descrição" FieldName="descConta" 
                                    VisibleIndex="2" Width="200px">
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <Settings ShowTitlePanel="True" 
                                VerticalScrollableHeight="400" ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" />
                            <SettingsText CommandClearFilter="Limpar" EmptyDataRow="Não há informações para este período e loja" FilterBarCreateFilter="Limpar Filtro" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <Footer Font-Bold="True">
                                </Footer>
                            </Styles>
                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="dsGrupoMes" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                        
                        
                            SelectCommand="Resultados.uspBuscarTeoricoMes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <div id="divTituloGrafico24Meses_UltimaLinha">
                            Resultado da Última Linha - Mês a Mês - Último Dois Anos
                        </div>

                        <div id="divGrafico24Meses_UltimaLinha">
                                <dxchartsui:WebChartControl ID="Grafico24Meses_UltimaLinha" runat="server" DataSourceID="dsDados24MesesUltimaLinha" Height="400px" Width="1020px" BackColor="Transparent">
                                    <borderoptions color="Silver" />
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1">
                                                <label angle="90">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" visible="False">
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

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="10">
                                        <margins bottom="0" />
                                    </legend>

                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="DescMes" Name="Meta" ValueDataMembersSerializable="percRev" LabelsVisibility="True">
                                            <datafilters>
                                                <cc1:DataFilter ColumnName="Tipo" DataType="System.Int32" InvariantValueSerializable="1" />
                                            </datafilters>
                                            <viewserializable>
                                                <cc1:SplineAreaSeriesView Color="119, 128, 255, 128" MarkerVisibility="True" Transparency="136">
                                                    <markeroptions size="5" BorderVisible="True">
                                                    </markeroptions>
                                                </cc1:SplineAreaSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="False" Angle="90" TextOrientation="BottomToTop">
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
                                        <cc1:Series ArgumentDataMember="DescMes" ArgumentScaleType="Qualitative" Name="Realizado" ValueDataMembersSerializable="percRea" LabelsVisibility="True">
                                            <datafilters>
                                                <cc1:DataFilter ColumnName="Tipo" DataType="System.Int32" InvariantValueSerializable="1" />
                                            </datafilters>
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Color="175, 30, 144, 255" Transparency="80">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="BottomInside">
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
                                <asp:SqlDataSource ID="dsDados24MesesUltimaLinha" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="Resultados.uspBuscarGrupo_24Meses" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:Parameter DefaultValue="47" Name="idGrupo" Type="Int16" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                        </div>

                        <div id="divTituloGraficoUltimaLinha_Quadrimestres">
                            Quadrimestres - Último Dois Anos
                        </div>

                       
                        <div id="divGraficoUltimaLinha_Quadrimestres">
                                <dxchartsui:WebChartControl ID="GraficoUltimaLinha_Quadrimestres" runat="server" DataSourceID="dsDados24MesesUltimaLinha" Height="200px" Width="600px" BackColor="Transparent">
                                    <borderoptions color="Silver" />
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1">
                                                <label angle="0">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" visible="False">
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

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="20">
                                        <margins bottom="0" />
                                    </legend>

                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="DescMes" Name="Meta" ValueDataMembersSerializable="percRev" LabelsVisibility="True">
                                            <datafilters>
                                                <cc1:DataFilter ColumnName="Tipo" DataType="System.Int32" InvariantValueSerializable="2" />
                                            </datafilters>
                                            <viewserializable>
                                                <cc1:SplineAreaSeriesView Color="119, 128, 255, 128" MarkerVisibility="True" Transparency="136">
                                                    <markeroptions size="5" BorderVisible="True">
                                                    </markeroptions>
                                                </cc1:SplineAreaSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="False" Angle="90" TextOrientation="BottomToTop">
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
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="DescMes" ArgumentScaleType="Qualitative" Name="Realizado" ValueDataMembersSerializable="percRea" LabelsVisibility="True">
                                            <datafilters>
                                                <cc1:DataFilter ColumnName="Tipo" DataType="System.Int32" InvariantValueSerializable="2" />
                                            </datafilters>
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Color="175, 30, 144, 255" Transparency="80">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="BottomInside">
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
                        </div>

                        <div id="divTituloGraficoUltimaLinha_Acumulado">
                            Acumulado - Último Dois Anos
                        </div>

                        <div id="divGraficoUltimaLinha_Acumulado">
                                <dxchartsui:WebChartControl ID="GraficoUltimaLinha_Acumulado" runat="server" DataSourceID="dsDados24MesesUltimaLinha" Height="200px" Width="390px" BackColor="Transparent">
                                    <borderoptions color="Silver" />
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1">
                                                <label angle="0">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" visible="False">
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

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="20">
                                        <margins bottom="0" />
                                    </legend>

                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="DescMes" Name="Meta" ValueDataMembersSerializable="percRev" LabelsVisibility="True">
                                            <datafilters>
                                                <cc1:DataFilter ColumnName="Tipo" DataType="System.Int32" InvariantValueSerializable="3" />
                                            </datafilters>
                                            <viewserializable>
                                                <cc1:SplineAreaSeriesView Color="119, 128, 255, 128" MarkerVisibility="True" Transparency="136">
                                                    <markeroptions size="5" BorderVisible="True">
                                                    </markeroptions>
                                                </cc1:SplineAreaSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="False" Angle="90" TextOrientation="BottomToTop">
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
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="DescMes" ArgumentScaleType="Qualitative" Name="Realizado" ValueDataMembersSerializable="percRea" LabelsVisibility="True">
                                            <datafilters>
                                                <cc1:DataFilter ColumnName="Tipo" DataType="System.Int32" InvariantValueSerializable="3" />
                                            </datafilters>
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Color="175, 30, 144, 255" Transparency="80">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="BottomInside">
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
                        </div>
        
                        
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        
        </div>        

<%--Aqui começa a caixa modal--%>
    <div class="container">
	    <div id="content">
    
		<div runat="server" id="theDiv" class="post">    	
        	<div class="btn-sign">
				<a href="#login-box" class="login-window">Ver loja a loja</a>
                <%--<asp:HyperLink ID="btnVerAnaliseLojaLoja" runat="server" href="#login-box" class="login-window">Ver loja a loja</asp:HyperLink>--%>
        	</div>
		</div>
        
        <div id="login-box" class="login-popup">
        <a href="#" class="close"><img src="../../image/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
          <!--Insera os dados nessa area-->
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                <ContentTemplate>
                    
                            <asp:Label runat="server" ID="lblLabelTodasLojas" ForeColor="White" Text="Selecione: "></asp:Label> 
                    <dx:ASPxComboBox ID="cboGrupo" runat="server" AutoPostBack ="true"  ValueType="System.String" DataSourceID="dsCadastroGrupo" Native="True" TextField="listaGrupo" ValueField="idGrupo"></dx:ASPxComboBox>
                        
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsAnalisePorConta" Width="700px" Theme="Office2010Black" KeyFieldName="Descricao">
                               <Columns>
                                   <dx:GridViewDataTextColumn FieldName="idFilial" VisibleIndex="0" Visible="False" Width="50"></dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="1" Caption="Filial" Width="190px">
                                       <CellStyle Wrap="False">
                                       </CellStyle>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewBandColumn Caption="Ano Anterior" Name="bandAnoAnterior" VisibleIndex="2">
                                       <Columns>
                                           <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle>
                                                   <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="%" FieldName="percRealAA" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                           </dx:GridViewDataTextColumn>
                                       </Columns>
                                   </dx:GridViewBandColumn>
                                   <dx:GridViewBandColumn Caption="Realizado" Name="bandAnoAtual" VisibleIndex="4">
                                       <Columns>
                                           <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrReal" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle ForeColor="Blue">
                                                   <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="%" FieldName="percReal" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle ForeColor="Blue">
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                       </Columns>
                                   </dx:GridViewBandColumn>
                                   <dx:GridViewBandColumn Caption="Dif. Meta" VisibleIndex="5" ToolTip="Diferença entre Meta e Realizado">
                                       <Columns>
                                           <dx:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle>
                                                   <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="%" FieldName="difPercRev" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                           </dx:GridViewDataTextColumn>
                                       </Columns>
                                   </dx:GridViewBandColumn>
                                   <dx:GridViewBandColumn Caption="Meta Revista" VisibleIndex="3">
                                       <Columns>
                                           <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrRev" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle ForeColor="#009900">
                                                   <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="%" FieldName="percRev" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle ForeColor="#009900">
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                       </Columns>
                                   </dx:GridViewBandColumn>
                                   <dx:GridViewBandColumn Caption="Dif. Ano.Ant." ToolTip="Diferença entre Realiazado versus Realizado Ano Anterior" VisibleIndex="8">
                                       <Columns>
                                           <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrDifAA" VisibleIndex="0" Width="80px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle>
                                                   <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="%" FieldName="percCrescAA" VisibleIndex="1" Width="60px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                           </dx:GridViewDataTextColumn>
                                       </Columns>
                                   </dx:GridViewBandColumn>
                               </Columns>
                               <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                               <SettingsPager Mode="ShowAllRecords">
                               </SettingsPager>
                               <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" ShowTitlePanel="True" />
                               <SettingsText Title="Comparativo loja a loja da conta selecionada" />
                               <Styles>
                                   <Header HorizontalAlign="Center"></Header>
	                                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                   <TitlePanel Font-Size="Medium">
                                   </TitlePanel>
                               </Styles>
                            </dx:ASPxGridView>                               
                                                                                    

                    
                         <asp:SqlDataSource ID="dsCadastroGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SELECT [idGrupo], [listaGrupo] FROM [Cadastros].[tblCategoriaLinha]"></asp:SqlDataSource>
 
                      <asp:SqlDataSource ID="dsAnalisePorConta" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="usp_Buscar_TeoricoAnaliseTodasLojas" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:ControlParameter ControlID="cboGrupo" DefaultValue="47" Name="idGrupo" PropertyName="Value" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>  

                    </ContentTemplate>

                 
            </asp:UpdatePanel>


           
		</div>
    
    </div>
    </div>
        
  </div>     
</asp:Content>

