<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucChkMesmosDias.ascx.vb" Inherits="Controles_wucChkMesmosDias" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<div>
    <dx:ASPxCheckBox ID="chkMesmosDias" runat="server" Text="Mesmos Dias" ForeColor ="Blue"  
        Theme="DevEx" AutoPostBack="False" ToolTip="Quando esta opção estiver selecionada o programa compara os mesmos dias da semana, Segunda com Segunda, Terça com Terça, Quarta com Quarta e assim por diante.">                 
    </dx:ASPxCheckBox>
</div>

