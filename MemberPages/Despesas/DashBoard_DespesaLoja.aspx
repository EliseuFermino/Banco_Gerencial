<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteDespesas.master" AutoEventWireup="false" CodeFile="DashBoard_DespesaLoja.aspx.vb" Inherits="MemberPages_Dashboard" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxhf" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc7" %>
<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMesPeriodo.ascx" tagname="wuciListaMesPeriodo" tagprefix="uc2" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc3" %>

<%@ Register src="../../Controles/wucFixarCabecalho.ascx" tagname="wucFixarCabecalho" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc5" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Src="~/Controles/wucListaGrupo_Subgrupo.ascx" TagPrefix="uc1" TagName="wucListaGrupo_Subgrupo" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <script language ="javascript" type ="text/javascript">       
        function OnGridFocusedRowChanged_Principal() {
            gridGrupoMes.GetRowValues(gridGrupoMes.GetFocusedRowIndex(), 'idGrupo;descConta', OnGetRowValues);
        }
        function OnGetRowValues(values) {                  
            txtIE.SetText(values[0]);            
        }     
    </script>

    <style type="text/css">
        .style4
        {
            width: 347px;
        }
        .style6
        {}
        .style10
        {
            width: 204px;
        }
        .style11
        {
            width: 12px;
        }
        .style12
        {
            width: 189px;
        }
    .dxeTextBox, .dxeMemo
{
    background-color: white;
    border: solid 1px #9f9f9f;
}

.dxeEditArea 
{
	font-family: Tahoma;
	font-size: 9pt;
	border: 1px solid #A0A0A0;
}
        .style13
    {
        width: 141px;
    }
    .style14
    {
        width: 174px;
    }
        .style16
        {
            width: 284px;
            height: 33px;
        }

   .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=70);
        opacity: 0.7;
    }
    .modalPopup
    {   
        padding-top: 1px;
        padding-left: 5px;
        width: 1290px;
        height: 820px;
    }
    .modalPopup1
    {        
        padding-top: 10px;
        padding-left: 10px;
        width: 1240px;
        height: 540px;
    }

     .auto-style1 {
         width: 100%;
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

.container {width: 960px; margin: 0 auto; overflow: hidden;}

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
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID ="btnExcel" />
        </Triggers> 
        <ContentTemplate>
            <table cellspacing="1" class="style1">
                <tr>
                    <td class="style6">
                        <asp:Panel ID="Panel1" runat="server">
                            <table cellspacing="1" class="style1">
                                <tr>
                                    <td class="style13">
                                        <uc3:wucAno ID="cboAno" runat="server" />
                                    </td>
                                    <td class="style14">
                                        <uc2:wuciListaMesPeriodo ID="cboMes" runat="server" />
                                    </td>
                                    <td>
                                        <uc1:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                                    </td>
                                    <td>
                                        <uc4:wucFixarCabecalho ID="chkFixarCabecalho" runat="server" />
                                    </td>
                                    <td>
                                        <uc5:wucBotaoExcel ID="btnExcel" runat="server" />
                                    </td
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
            <table cellspacing="1" class="style1">
                <tr>
                    <td align="left" valign="top">
                        <dxwgv:ASPxGridView ID="gridGrupoMes" runat="server" 
                            AutoGenerateColumns="False" DataSourceID="dsGrupoMes" EnableTheming="True" 
                            KeyFieldName="idGrupo" Theme="Default" Width="1000px">
                            <TotalSummary>
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" 
                                    SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                    SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                                    SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrRev" 
                                    SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAA" 
                                    SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRev" 
                                    SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percReal" 
                                    SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercRev" 
                                    SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMA" SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMA" SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescMA" SummaryType="Custom" />
                            </TotalSummary>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn FieldName="idGrupo" ToolTip="ID do grupo" 
                                    VisibleIndex="0" Caption="ID" Width="30px" SortIndex="0" SortOrder="Ascending">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="descConta" 
                                    VisibleIndex="1" Width="150px" ToolTip="Descrição do grupo.">
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewBandColumn Caption="Ano Atual" VisibleIndex="4" ToolTip="Este quadro exibe informações do ano atual.">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="vlrRev" 
                                            VisibleIndex="0" Width="90px" ToolTip="Valor de meta revista de despesa do ano atual.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percRev" VisibleIndex="1" 
                                            Width="60px" ToolTip="Percentual de meta revista do ano atual.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" 
                                            VisibleIndex="2" Width="90px" ToolTip="Valor realizado do ano atual.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percReal" VisibleIndex="3" 
                                            Width="60px" ToolTip="Percentual realizado do ano atual.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Ano Anterior (AA)" VisibleIndex="2" ToolTip="Este quadro exibe informações do ano anterior.">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealAA" 
                                            VisibleIndex="0" Width="90px" ToolTip="Valor realizado do ano anterior.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percRealAA" 
                                            VisibleIndex="1" Width="60px" ToolTip="Percentual realizado do ano anterior.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Diferenças" VisibleIndex="5" ToolTip="Este quadro exibe informações de diferença entre meta versus realizado e percentual de crescimento.">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" 
                                            VisibleIndex="0" Width="90px" ToolTip="Diferença entre valor de realizado x meta.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle Font-Bold="True">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="difPercRev" 
                                            VisibleIndex="1" Width="60px" ToolTip="Diferença entre percentual de realizado x meta.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle Font-Bold="True">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Mês Anterior (MA)" Name="bandMesAnterior" ToolTip="Este quadro exibe informações do mês anterior." VisibleIndex="3">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealMA" ToolTip="Valor realizado do mês anterior. Quando o mês de janeiro estiver selecionado será exibido o mês de Dezembro do ano anterior." VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percRealMA" ToolTip="Percentual realizado do mês anterior. Quando o mês de janeiro estiver selecionado será exibido o mês de Dezembro do ano anterior." VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Crescimento" Name="bandCrescimento" ToolTip="Exibe informações sobre o crescimento do mês anterior e ano anterior." VisibleIndex="8">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="% AA" FieldName="percCresc" ToolTip="Percentual de crescimento sobre o ano anterior" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="% MA" FieldName="percCrescMA" ToolTip="Percentual de crescimento sobre o mês anterior" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewBandColumn>
                            </Columns>
                            <SettingsBehavior ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowFooter="True" ShowVerticalScrollBar="True" 
                                VerticalScrollableHeight="420" HorizontalScrollBarMode="Visible" />
                            <SettingsDetail ShowDetailRow="True" />
                            <Styles>
                                <Header HorizontalAlign="Center"></Header>                                
                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                <Footer Font-Bold="True">
                                </Footer>
                            </Styles>
                            <Templates>
                                <DetailRow>
                                    <dxwgv:ASPxGridView ID="gridSub" runat="server" AutoGenerateColumns="False" 
                                        DataSourceID="dsDetail" EnableTheming="True" KeyFieldName="idGrupo" 
                                        OnBeforePerformDataSelect="gridSub_BeforePerformDataSelect" 
                                        OnCustomSummaryCalculate="gridSub_CustomSummaryCalculate" 
                                        OnHtmlDataCellPrepared="gridSub_HtmlDataCellPrepared" 
                                        Theme="Default">
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" 
                                                SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                                SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                                                SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrRev" 
                                                SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAA" 
                                                SummaryType="Custom" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRev" 
                                                SummaryType="Custom" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percReal" 
                                                SummaryType="Custom" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercRev" 
                                                SummaryType="Custom" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMA" SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMA" SummaryType="Custom" />
                                        </TotalSummary>
                                        <Columns>
                                            <dxwgv:GridViewBandColumn Caption="Mês Anterior" VisibleIndex="3">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealMA" VisibleIndex="0" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percRealMA" VisibleIndex="1" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                            </dxwgv:GridViewBandColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="idGrupo" VisibleIndex="0" 
                                                Width="30px">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="2">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealAA" 
                                                        VisibleIndex="0" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percRealAA" 
                                                        VisibleIndex="1" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                            </dxwgv:GridViewBandColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Descrição - Subgrupo" 
                                                FieldName="descConta" VisibleIndex="1" Width="150px">
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewBandColumn Caption="Ano Atual" VisibleIndex="4">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="vlrRev" 
                                                        VisibleIndex="0" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percRev" VisibleIndex="1" 
                                                        Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" 
                                                        VisibleIndex="2" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle ForeColor="#009900">
                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percReal" VisibleIndex="3" 
                                                        Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                            </dxwgv:GridViewBandColumn>
                                            <dxwgv:GridViewBandColumn Caption="Diferenças" VisibleIndex="7">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" 
                                                        VisibleIndex="0" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="difPercRev" 
                                                        VisibleIndex="1" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                            </dxwgv:GridViewBandColumn>
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings ShowFooter="True" />
                                        <SettingsDetail ShowDetailRow="True" />
                                        <Styles>
                                            <Header HorizontalAlign="Center"></Header>
	                                        <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                                        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>     
                                        </Styles>
                                        <Templates>
                                            <DetailRow>
                                                <dxwgv:ASPxGridView ID="gridNota" runat="server" AutoGenerateColumns="False" 
                                                    DataSourceID="dsdNota" 
                                                    OnBeforePerformDataSelect="gridNota_BeforePerformDataSelect" Theme="Default" 
                                                    KeyFieldName="CODIGO">
                                                    <TotalSummary>
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="VALOR" 
                                                            SummaryType="Sum" />
                                                    </TotalSummary>
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn FieldName="CODIGO" VisibleIndex="0">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="AGENDA" VisibleIndex="5">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="Descric" ReadOnly="True" 
                                                            VisibleIndex="6">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="NOTA" VisibleIndex="7">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="Observacao" ReadOnly="True" 
                                                            VisibleIndex="8">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataDateColumn Caption="Data" FieldName="DATA" VisibleIndex="10">
                                                        </dxwgv:GridViewDataDateColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="VALOR" 
                                                            VisibleIndex="11">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="CCusto" ReadOnly="True" 
                                                            VisibleIndex="12" Caption="Centro Custo">
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsBehavior AllowFocusedRow="True" />
                                                    <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                                    <Settings ShowFooter="True" ShowGroupPanel="True" />
                                                    <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                                                    <Styles>                                          
	                                                    <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                                                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>                                                         
                                                    </Styles>
                                                </dxwgv:ASPxGridView>
                                            </DetailRow>
                                        </Templates>
                                    </dxwgv:ASPxGridView>
                                </DetailRow>
                            </Templates>
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <table cellspacing="1" class="style1">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:SqlDataSource ID="dsGrupoMes" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                            
                            SelectCommand="Despesas.uspBuscarGrupos" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:SqlDataSource ID="dsDetail" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                            SelectCommand="Despesas.uspBuscarSubgrupos" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                                <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <dxe:ASPxTextBox ID="txtIE" runat="server" ClientInstanceName="txtIE" 
                            Width="0px" Font-Size="Smaller" ForeColor="#3366FF" Visible="False">
                            <Border BorderStyle="None" />
                        </dxe:ASPxTextBox>
                    </td>
                    <td>
                        <asp:SqlDataSource ID="dsdNota" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Despesas.uspBuscarDespesasAnaliticas" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                                <asp:SessionParameter Name="idSubgrupo" SessionField="sSUBGRUPO" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            
            <asp:SqlDataSource ID="dsDespesaTodasFiliais" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="Despesas.uspBuscarGrupo_TodasFiliais" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                    <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" Type="Int16" DefaultValue="15" />
                    <asp:SessionParameter Name="idTipo" SessionField="sTIPO" Type="Int16" DefaultValue="1" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
 

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
        <a href="#" class="close"><img src="../../image/close_pop.png" class="btn_close" title="Fechar Janela" alt="Close" /></a>
          <!--Insera os dados nessa area-->
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>   
                    <asp:Timer ID="Timer1" runat="server"
                         Interval ="2000">
                        
                    </asp:Timer>    

                <table style="width:100%">
                    <tr style="background-color:lightgray">
                        <td>
                            Selecione: <asp:RadioButton ID="rndGrupo" runat="server" GroupName="myGrupo" Checked="true" Text="Grupo" AutoPostBack="true"  />  &nbsp <asp:RadioButton ID="rndSubgrupo" runat="server" GroupName="myGrupo" Checked="false" Text ="Sub-grupo"  AutoPostBack ="true"/>
                        </td>
                    </tr>
                    <tr style="width: 300px; text-align:left">
                        <td style="width: 200px; text-align:left ">
                            <uc1:wucListaGrupo_Subgrupo ID="cboGrupo" runat="server" />
                        </td 
                    </tr>      
                </table>                         
                    
                <%--INICIO GRID--%>
                      <dxwgv:ASPxGridView ID="gridGrupoFiliais" runat="server" AutoGenerateColumns="False" DataSourceID="dsDespesaTodasFiliais" Width="900px" KeyFieldName="idFilial">
        <Columns>
            <dxwgv:GridViewBandColumn Caption="Ano Anterior (AA)" ToolTip="Este quadro exibe informações do ano anterior" VisibleIndex="1">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealAA" ReadOnly="True" ToolTip="Valor realizado do ano anterior" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percRealAA" ReadOnly="True" ToolTip="Percentual realizado do ano anterior" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewDataTextColumn FieldName="descConta" FixedStyle="Left" VisibleIndex="0" Caption="Descrição" Width="150px">
                <CellStyle Wrap="False">
                </CellStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewBandColumn Caption="Ano Atual" ToolTip="Este quadro exibe informações sobre o mês atual" VisibleIndex="3">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="vlrRev" ReadOnly="True" ToolTip="Valor da meta revista de despesa do ano atual" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percRev" ReadOnly="True" ToolTip="Percentual da meta revista de despesa do ano atual" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" ReadOnly="True" ToolTip="Valor realizado do ano atual" VisibleIndex="2" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percReal" ReadOnly="True" ToolTip="Percentual realizado do ano atual" VisibleIndex="3" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Diferenças" ToolTip="Este quadro exibe informações de diferença entre meta versus realizado e percentual de crescimento." VisibleIndex="6">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" ReadOnly="True" ToolTip="Diferença entre valor realizado x meta." VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="difPercRev" ReadOnly="True" ToolTip="Diferença entre percentual realizado x meta." VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Mês Anterior" ToolTip="Este quadro exibe informações sobre o mês anterior" VisibleIndex="2">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealMA" ReadOnly="True" ToolTip="Valor realizado do mês anterior. Quando o mês de janeiro estiver selecionado será exibido o mês de Dezembro do ano anterior." VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percRealMA" ReadOnly="True" ToolTip="Percentual realizado do mês anterior. Quando o mês de janeiro estiver selecionado será exibido o mês de Dezembro do ano anterior." VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Crescimento" ToolTip="Este quadro exibe informações sobre o crescimento sobre o mês anterior e ano anterior" VisibleIndex="11">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="% AA" FieldName="percCresc" ReadOnly="True" ToolTip="Percentual de crescimento sobre o ano anterior" VisibleIndex="0" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="% MA" FieldName="percCrescMA" ReadOnly="True" ToolTip="Percentual de crescimento sobre o mês anterior" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
            <dxwgv:GridViewBandColumn Caption="Indicadores" ToolTip="Este quadro exibe informações sobre indicadores." VisibleIndex="14">
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="Func" FieldName="indFunc" ReadOnly="True" ToolTip="Indcador por Funcionário" VisibleIndex="0" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Metro" FieldName="indMet" ReadOnly="True" ToolTip="Indicador por metro quadrado de área de venda" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
            </dxwgv:GridViewBandColumn>
        </Columns>
        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
        <Settings HorizontalScrollBarMode="Visible" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto"  />
        <Styles>
	        <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	        <Header HorizontalAlign="Center">
            </Header>
	        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
            <HeaderPanel HorizontalAlign="Center">
            </HeaderPanel>
        </Styles>
    </dxwgv:ASPxGridView>
                <%--FIM GRID--%>                                                                                     
                                             
                    <asp:Button ID="Button1" runat="server" Text="Exportar para Excel"  />
                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" GridViewID="ASPxGridView1" runat="server"></dx:ASPxGridViewExporter>

               </ContentTemplate>

                    <Triggers>                                        
                           <asp:PostBackTrigger ControlID ="Button1"  />
                    </Triggers>
            </asp:UpdatePanel>


           
		</div>
    
    </div>
</div>


    <br />



    <br />



</asp:Content>

