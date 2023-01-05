<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuciListaDia.ascx.vb" Inherits="wucMes" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache"/>

<style type="text/css">
    .style1
    {
        width: 100%;
    }
    
.dxeButtonEdit_Aqua
{
    background-color: White;
    border: Solid 1px #AECAF0;
    width: 170px;
}
.dxeEditArea_Aqua 
{
	font-family: Tahoma;
	font-size: 9pt;
	border: 1px solid #A0A0A0;
}
.dxeButtonEditButton_Aqua
{
	padding: 5px 2px 5px 2px;
}
.dxeButtonEditButton_Aqua,
.dxeSpinIncButton_Aqua, .dxeSpinDecButton_Aqua, .dxeSpinLargeIncButton_Aqua, .dxeSpinLargeDecButton_Aqua
{
    padding: 1px 2px 3px 2px;
	background-image: url('App_Themes/Aqua/Editors/edtDropDownBack.gif');
    background-repeat: repeat-x;
    background-color: #DBEBFF;
}
.dxeButtonEditButton_Aqua, .dxeCalendarButton_Aqua,
.dxeSpinIncButton_Aqua, .dxeSpinDecButton_Aqua,
.dxeSpinLargeIncButton_Aqua, .dxeSpinLargeDecButton_Aqua
{	
	vertical-align: Middle;
	border: Solid 1px #A3C0E8;
	cursor: pointer;
	cursor: hand;
} 
    .style3
    {
        width: 118px;
        height: 25px;
    }
    .style4
    {
        height: 25px;
        width: 33px;
    }
    .style5
    {
        height: 25px;
        width: 101px;
    }
</style>
<table class="style1">
    <tr>
        <td class="style3">
            Selecione um dia: 
        </td>
        <td class="style4">
                                                &nbsp;</td>
        <td class="style5">
                                                <asp:TextBox ID="cboDia" runat="server" Width="90px" 
                                                    AutoCompleteType="Disabled"></asp:TextBox>
                                                <asp:CalendarExtender ID="cboDia_CalendarExtender" runat="server" 
                                                    Enabled="True" Format="dd/MM/yyyy" TargetControlID="cboDia" 
                                                    TodaysDateFormat="dd/MM/yyyy">
                                                </asp:CalendarExtender>
                                            </td>
        <td align="left">
            &nbsp;</td>
    </tr>
</table>

