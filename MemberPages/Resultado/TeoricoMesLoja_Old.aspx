<%@ Page Title="Resultado Teórico" Language="VB" MasterPageFile="~/MemberPages/SiteResultados.master" AutoEventWireup="false" CodeFile="TeoricoMesLoja_Old.aspx.vb" Inherits="MemberPages_TeoricoMesLoja_Old" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>



<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc5" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc6" %>
<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc7" %>

<%@ Register src="../../Controles/wuciListaMesPeriodo.ascx" tagname="wuciListaMesPeriodo" tagprefix="uc1" %>

<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc3" %>
<%@ Register src="../../Controles/wucOpcoesResultadoOne.ascx" tagname="wucOpcoesResultadoOne" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc2" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server" >    
    <uc4:wucOpcoesResultadoOne ID="optResultados" runat="server" />    

<style type="text/css">
    .auto-style1 {
        border-collapse: collapse;
        width: 200px;
        float: none;
    
    }

a { 
	text-decoration:none; 
	color:#00c6ff;
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

    .auto-style4 {
        width: 16px;
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
    
    <table align="left" cellspacing="1" style=auto-style1 >
        <tr>
            <td class="style5">
                <uc5:wucAno ID="cboAno" runat="server" />
            </td>
            <td class="style6">
                <uc1:wuciListaMesPeriodo ID="cboMes" runat="server" />
            </td>
            <td class="style19">
                <uc3:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
            </td>
            <td>
                                    <dx:ASPxCheckBox ID="chkVerTudo" runat="server" AutoPostBack="True" 
                                        CheckState="Unchecked" Text="Fixar Cabeçalho" 
                    Theme="DevEx" style="margin-left: 0px">
                                    </dx:ASPxCheckBox>
                                </td>
            <td class="auto-style4">
                <uc1:wucBotaoExcel ID="btnExcel" runat="server" CallGridViewID="gridGrupoMes" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
        <table align="left" cellspacing="1" class="style22">
            <tr>
                <td>
                    <dx:ASPxGridView ID="gridGrupoMes" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="dsGrupoMes" EnableTheming="True" Theme="SoftOrange">
                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0" Width="10px">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewBandColumn Caption="Crescimento" VisibleIndex="9" 
                                Name="band_Crescimento">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="% A.A." FieldName="percCresc" 
                                        ShowInCustomizationForm="True" 
                                        ToolTip="Percentual de Crescimento sobre o ano anterior" VisibleIndex="0" 
                                        Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% M.A" FieldName="percCrescMA" 
                                        ToolTip="Percentual de Crescimento sobre o mês anterior" VisibleIndex="1" 
                                        Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="ID" FieldName="idGrupo" VisibleIndex="1" 
                                Width="30px">
                            </dx:GridViewDataTextColumn>
<dx:GridViewBandColumn Caption="Mês Anterior" VisibleIndex="6" Name="band_MesAnterior" Visible="False"><Columns>
<dx:GridViewDataTextColumn FieldName="vlrRealMA" Width="80px" Caption="Valor" 
        VisibleIndex="0">
<PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
    <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
    <HeaderStyle BackColor="#FF9900" />
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="percRealMA" Width="50px" Caption="%" 
        VisibleIndex="1">
<PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>

    <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />

    <HeaderStyle BackColor="#FF9900" />
</dx:GridViewDataTextColumn>
</Columns>
</dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Diferenças" VisibleIndex="8" 
                                Name="band_Diferencas">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" 
                                        ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="difPercRev" 
                                        ShowInCustomizationForm="True" VisibleIndex="1" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>    <%--Diferenças--%>

                            <dx:GridViewBandColumn Caption="Realizado" VisibleIndex="7" 
                                Name="band_Realizado">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrReal" ShowInCustomizationForm="True" Width="80px" Caption="Valor" VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                    <HeaderStyle BackColor="#3399FF"></HeaderStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percReal" ShowInCustomizationForm="True" Width="50px" Caption="%" VisibleIndex="1">
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
                                        Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                        <HeaderStyle BackColor="#009900" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percRev" VisibleIndex="1" 
                                        Width="50px">
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
                                        Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                        <HeaderStyle BackColor="#CCCC00" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percOri" VisibleIndex="1" 
                                        Width="50px">
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
                                        VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                        <HeaderStyle BackColor="#CC9900" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percRealAA" VisibleIndex="1" 
                                        Width="50px">
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
                        <Settings ShowTitlePanel="True" 
                            VerticalScrollableHeight="400" ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                        </Styles>
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="dsGrupoMes" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                        
                        
                        SelectCommand="SELECT idGrupo, descConta, vlrRealAA, percRealAA, vlrOri, percOri, vlrRev, percRev, vlrReal, percReal, difVlrRev, difPercRev, percCresc, vlrRealMA, percRealMA, percCrescMA FROM Resultados.tbl_Teorico_Mes_Lojas_Grupo WHERE (Ano = @Ano) AND (Mes = @Mes) AND (idFilial = @idFilial) AND (idGrupo NOT IN(46,49,11)) AND ISNULL(Ordem,0)&lt;&gt;0 ORDER BY Ordem">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </td>
            </tr>
        </table>
        <table align="left" cellspacing="1" class="style1">
            <tr>
                <td>
                    <dx:ASPxTextBox ID="txtIE" runat="server" ClientInstanceName="txtIE" 
                        Width="170px" Visible="False">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <table align="left" cellspacing="1" class="style1" width: 70%;>
            <tr>
                <td>
                    <asp:SqlDataSource ID="dsGrafico_UltimaLinha" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="  SELECT percRealAA, percRev, percReal,
CASE WHEN Mes = 1 THEN 'Jan' 
	   WHEN Mes = 2 THEN 'Fev' 
	   WHEN Mes = 3 THEN 'Mar' 
	   WHEN Mes = 4 THEN 'Abr' 
	  WHEN Mes = 5 THEN 'Mai' 
	    WHEN Mes = 6 THEN 'Jun' 
	   WHEN Mes = 7 THEN 'Jul' 
	   WHEN Mes = 8 THEN 'Ago' 
	   WHEN Mes = 9 THEN 'Set' 
	    WHEN Mes = 10 THEN 'Out' 
	   WHEN Mes = 11 THEN 'Nov' 
	    WHEN Mes = 12 THEN 'Dez' 
WHEN Mes=99 THEN 'Ano' 
END AS 'DescMes'  
  FROM [gerBI].[Resultados].[tbl_Teorico_Mes_Lojas_Grupo]
  WHERE Ano=@Ano AND idFilial = @idFilial AND idGrupo = 47
ORDER BY Mes ">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="dsGrafico_Despesas" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="  SELECT percRealAA, percRev, percReal,
CASE WHEN Mes = 1 THEN 'Jan' 
	   WHEN Mes = 2 THEN 'Fev' 
	   WHEN Mes = 3 THEN 'Mar' 
	   WHEN Mes = 4 THEN 'Abr' 
	  WHEN Mes = 5 THEN 'Mai' 
	    WHEN Mes = 6 THEN 'Jun' 
	   WHEN Mes = 7 THEN 'Jul' 
	   WHEN Mes = 8 THEN 'Ago' 
	   WHEN Mes = 9 THEN 'Set' 
	    WHEN Mes = 10 THEN 'Out' 
	   WHEN Mes = 11 THEN 'Nov' 
	    WHEN Mes = 12 THEN 'Dez' 
WHEN Mes=99 THEN 'Ano' 
END AS 'DescMes'  
  FROM [gerBI].[Resultados].[tbl_Teorico_Mes_Lojas_Grupo]
  WHERE Ano=@Ano AND idFilial = @idFilial AND idGrupo = 14
ORDER BY Mes ">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="dsGrafico_Margem" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="  SELECT percRealAA, percRev, percReal,
CASE WHEN Mes = 1 THEN 'Jan' 
	   WHEN Mes = 2 THEN 'Fev' 
	   WHEN Mes = 3 THEN 'Mar' 
	   WHEN Mes = 4 THEN 'Abr' 
	  WHEN Mes = 5 THEN 'Mai' 
	    WHEN Mes = 6 THEN 'Jun' 
	   WHEN Mes = 7 THEN 'Jul' 
	   WHEN Mes = 8 THEN 'Ago' 
	   WHEN Mes = 9 THEN 'Set' 
	    WHEN Mes = 10 THEN 'Out' 
	   WHEN Mes = 11 THEN 'Nov' 
	    WHEN Mes = 12 THEN 'Dez' 
WHEN Mes=99 THEN 'Ano' 
END AS 'DescMes'  
  FROM [gerBI].[Resultados].[tbl_Teorico_Mes_Lojas_Grupo]
  WHERE Ano=@Ano AND idFilial = @idFilial AND idGrupo = 5
ORDER BY Mes ">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="dsGrafico_Quebra" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="  SELECT percRealAA, percRev, percReal,
CASE WHEN Mes = 1 THEN 'Jan' 
	   WHEN Mes = 2 THEN 'Fev' 
	   WHEN Mes = 3 THEN 'Mar' 
	   WHEN Mes = 4 THEN 'Abr' 
	  WHEN Mes = 5 THEN 'Mai' 
	    WHEN Mes = 6 THEN 'Jun' 
	   WHEN Mes = 7 THEN 'Jul' 
	   WHEN Mes = 8 THEN 'Ago' 
	   WHEN Mes = 9 THEN 'Set' 
	    WHEN Mes = 10 THEN 'Out' 
	   WHEN Mes = 11 THEN 'Nov' 
	    WHEN Mes = 12 THEN 'Dez' 
WHEN Mes=99 THEN 'Ano' 
END AS 'DescMes'  
  FROM [gerBI].[Resultados].[tbl_Teorico_Mes_Lojas_Grupo]
  WHERE Ano=@Ano AND idFilial = @idFilial AND idGrupo = 6
ORDER BY Mes ">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    <br />

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
                                                                                    
                                             
                    <asp:Button ID="Button1" runat="server" Text="Exportar para Excel"  />
                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" GridViewID="ASPxGridView1" runat="server"></dx:ASPxGridViewExporter>

                         <asp:SqlDataSource ID="dsCadastroGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SELECT [idGrupo], [listaGrupo] FROM [Cadastros].[tblCategoriaLinha]"></asp:SqlDataSource>
 
                      <asp:SqlDataSource ID="dsAnalisePorConta" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="usp_Buscar_TeoricoAnaliseTodasLojas" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:ControlParameter ControlID="cboGrupo" DefaultValue="47" Name="idGrupo" PropertyName="Value" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>  

                    </ContentTemplate>

                    <Triggers>                                        
                           <asp:PostBackTrigger ControlID ="Button1"  />
                    </Triggers>
            </asp:UpdatePanel>


           
		</div>
    
    </div>
</div>
        
           
                                                            
                              
   
  
</asp:Content>

