<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucSize.ascx.vb" Inherits="Controles_wucSize" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

    <style type ="text/css" >

        #divSize_wuc {
            float:left ;  
            margin-left: 5px;
            margin-top: 2px;
        }



    </style>



        <div id="divSize_wuc" >         

            <dx:ASPxComboBox ID="cboSize" runat="server" Caption="Zoom" Theme="Mulberry" AutoPostBack="True" ClientInstanceName="cboSize" ValueType="System.String" Width="75px">
                <Items>
                    <dx:ListEditItem Text="80%" Value="80" />
                    <dx:ListEditItem Text="90%" Value="90" />
                    <dx:ListEditItem Text="100%" Value="100" />
                    <dx:ListEditItem Text="110%" Value="110" />
                    <dx:ListEditItem Text="120%" Value="120" />
                    <dx:ListEditItem Text="130%" Value="130" />
                    <dx:ListEditItem Text="140%" Value="140" />
                    <dx:ListEditItem Text="150%" Value="150" />
                    <dx:ListEditItem Text="160%" Value="160" />
                    <dx:ListEditItem Text="170%" Value="170" />
                    <dx:ListEditItem Text="180%" Value="180" />
                </Items>
                
            </dx:ASPxComboBox>
        </div>


