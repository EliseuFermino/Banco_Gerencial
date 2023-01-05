<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DashboardView.aspx.vb" Inherits="MemberPages_PDCA_DashboardView" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/bootstrap.css" rel="stylesheet" />

    <style type="text/css">

        .bordas{
            border: 1px solid gray;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" Font-Size="Large">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="idFilial" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="numCausa" VisibleIndex="1">
                    <CellStyle CssClass="badge bg-green bordas">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQL14_gerProjetosConnectionString %>" SelectCommand="SELECT [idFilial], [numCausa] FROM [PDCA].[vw_TotalDeProblemaCausa] ORDER BY [idFilial]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
