<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucAno_2_Anos.ascx.vb" Inherits="Controles_wuciAno_2_Anos" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:UpdatePanel ID="updAno" runat="server">
    <ContentTemplate>
        <div id="divAno">
                <dx:ASPxComboBox ID="cboAno" runat="server" 
                    EnableTheming="True" Theme="Mulberry" 
                    Width="80px" DropDownRows="10" AutoPostBack="True" Caption="Ano">
                </dx:ASPxComboBox>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>    


        
