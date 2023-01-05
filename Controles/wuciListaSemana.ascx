<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuciListaSemana.ascx.vb" Inherits="Controles_wuciListaSemana" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<div style="float:left; margin-left:2px">
    <dx:ASPxComboBox ID="cboSemana" runat="server" Native="True" Width="80px" Caption="Semana " DataSourceID="SqlDataSource1" TextField="desc_Semana" ValueField="id_Semana">
       
        <CaptionSettings VerticalAlign="Middle" />
    </dx:ASPxComboBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="SELECT [id_Semana], [desc_Semana] FROM [tblCadSemana] ORDER BY [id_Semana]"></asp:SqlDataSource>
</div>
