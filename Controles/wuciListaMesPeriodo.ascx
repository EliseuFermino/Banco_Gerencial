<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuciListaMesPeriodo.ascx.vb" Inherits="wucMes" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:UpdatePanel ID="upMes" runat="server">
    <ContentTemplate>


<table align="left" cellspacing="1" >
    <tr>
        <td align="left" >

            <dx:ASPxRadioButton ID="rndMes" runat="server" AutoPostBack="True" 
                Checked="True" GroupName="grpPeriodo" Height="22px" Text="Mês" 
                Width="55px" Theme="DevEx">
            </dx:ASPxRadioButton>

        </td>
        <td align="left" >

            <dx:ASPxRadioButton ID="rndPeriodo" runat="server" AutoPostBack="True" 
                GroupName="grpPeriodo" Text="Período" Height="21px" Width="86px" Theme="DevEx">
            </dx:ASPxRadioButton>

        </td>
        <td>
            <dx:ASPxComboBox ID="cboMes" runat="server" EnableTheming="True" 
                    Theme="Mulberry" Width="130px" DropDownRows="12"  
                    AutoPostBack="True" Caption="Mês" TextField="descMes" ValueField="mes" ValueType="System.Byte">                 
            </dx:ASPxComboBox>            
                           

        </td>   
        
    </tr>
</table>

            </ContentTemplate>
</asp:UpdatePanel>




