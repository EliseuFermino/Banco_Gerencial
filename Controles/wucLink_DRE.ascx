<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucLink_DRE.ascx.vb" Inherits="Controles_wucLink_DRE" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<style type="text/css">

.dxbButton_Aqua
{	
    color: #2C4D79;   
    font-size: 9pt;
    font-family: Tahoma;				    
	font-weight:normal;    
    vertical-align: middle;	 		
    border: solid 1px #A3C0E8;	
    background: #E2F0FF url('../App_Themes/Aqua/Editors/edtButtonBack.gif') repeat-x 50% top;
    padding: 1px 1px 1px 1px;
	cursor: pointer;
	cursor: hand;
}
.dxbButton_Aqua div.dxb
{    
    padding: 2px 10px 3px 10px;
	border: 0px;
}
</style>
                        <dxe:ASPxButton ID="link_DRE" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            HorizontalAlign="Left" Text="13 - D.R.E" 
    Width="195px" Theme="DevEx">
                        </dxe:ASPxButton>
                    