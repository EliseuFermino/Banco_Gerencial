x'<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PainelAtualizaOperacaoComercial.aspx.vb" Inherits="MemberPages_Resultado_OperacaoComercial_PainelAtualizaOperacaoComercial" %>

<%@ Register Src="~/Controles/wucAnoMes.ascx" TagPrefix="uc1" TagName="wucAnoMes" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="../../../css/bootstrap.css" rel="stylesheet" />    
    <link href="../../../css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    
        <div class="container">
    
            <div class="row">
                <div class="col-md-1">
                    <uc1:wucAno runat="server" ID="cboAno" />
                </div>

                <div class="col-md-1">
                    <uc1:wuciListaMes runat="server" ID="wuciListaMes" />
                </div>
            </div>

            <div class="row">

            </div>


        </div>
    </form>
</body>
</html>
