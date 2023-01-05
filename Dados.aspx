<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Dados.aspx.vb" Inherits="Dados" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    
        <div>
            <asp:FileUpload ID="fuImage" runat="server" />
            <asp:Button Text="Save" ID="btnSave" runat="server" OnClick="Save" />
            <br />
            <asp:Image ID="Image1" runat="server" Visible="false" />

            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ContentType" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataBinaryImageColumn FieldName="Data" VisibleIndex="2">
                        <PropertiesBinaryImage>
                            <EditingSettings Enabled="True">
                            </EditingSettings>
                        </PropertiesBinaryImage>
                    </dx:GridViewDataBinaryImageColumn>
                </Columns>
            </dx:ASPxGridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="SELECT [Name], [ContentType], [Data] FROM [tblFiles]"></asp:SqlDataSource>

        </div>

    </form>
</body>
</html>
