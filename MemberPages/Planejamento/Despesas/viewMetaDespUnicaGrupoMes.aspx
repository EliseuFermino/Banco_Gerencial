<%@ Page Language="VB" AutoEventWireup="false" CodeFile="viewMetaDespUnicaGrupoMes.aspx.vb" Inherits="MemberPages_Planejamento_Despesas_viewMetaDespUnicaLojaMes" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../../Controles/wucListaPosicao.ascx" tagname="wucListaPosicao" tagprefix="uc4" %>


<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc6" %>
<%@ Register src="../../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc7" %>
<%@ Register src="../../../Controles/wucListaGrupo_Subgrupo.ascx" tagname="wucListaGrupo_Subgrupo" tagprefix="uc8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style5
        {
            width: 329px;
        }
        .style6
        {
            width: 181px;
        }
        .style7
        {
            width: 294px;
        }
        .style8
        {
            width: 442px;
        }
        .auto-style3 {
            width: 120px;
        }
        .auto-style4 {
            width: 95px;
        }
        .auto-style5 {
            width: 171px;
            font-weight: bold;
            color: #FFFFFF;
            font-family: "Times New Roman", Times, serif;
        }
        .auto-style6 {
            width: 187px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
    
        <table cellspacing="1" class="style1">
            <tr>
                <td class="auto-style3">
                    <uc6:wucAno ID="cboAno" runat="server" />
                </td>
                <td class="auto-style4">
                    <uc7:wuciListaMes ID="cboMes" runat="server" />
                </td>
                <td class="auto-style5">
                    <uc8:wucListaGrupo_Subgrupo ID="cboGrupo" runat="server" />
                </td>
                <td>
        <dxe:ASPxButton ID="ASPxButton1" runat="server" 
            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
            Text="Exportar para excel" Width="200px" Theme="DevEx">
        </dxe:ASPxButton>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <table cellspacing="1" class="style1">
            <tr>
                <td >
                    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                        AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue" DataSourceID="SqlDataSource1" 
                        KeyFieldName="idCod" Theme="DevEx" Width="500px">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue">
                            <Header HorizontalAlign="Center" ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <AlternatingRow BackColor="#ECF5FF">
                            </AlternatingRow>
                            <Footer Font-Bold="True">
                            </Footer>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr" 
                                SummaryType="Sum" />
                            <dxwgv:ASPxSummaryItem FieldName="perc" SummaryType="Custom" />
                        </TotalSummary>
                        <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                            <CollapsedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                Width="11px" />
                            <ExpandedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                            <DetailCollapsedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                Width="11px" />
                            <DetailExpandedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                            <FilterRowButton Height="13px" Width="13px" />
                        </Images>
                        <SettingsText EmptyDataRow="Nenhuma meta cadastrada ainda" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Cod." FieldName="idCod" ReadOnly="True" 
                                VisibleIndex="0" Width="20px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Descrição da Filial" 
                                FieldName="GrupoDesc" VisibleIndex="1" Width="250px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="vlr" VisibleIndex="2" Width="80px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="perc" VisibleIndex="3" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFooter="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="400" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="uspViewMetaDespesaOriginaisGrupo" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="idPosicao" SessionField="sPosicao" 
                                Type="String" />
                            <asp:SessionParameter DefaultValue="" Name="Ano" SessionField="sAno" 
                                Type="String" />
                            <asp:SessionParameter DefaultValue="" Name="Mes" SessionField="sMes" 
                                Type="String" />
                            <asp:SessionParameter Name="idCod" SessionField="sGrupo" 
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <table cellspacing="1" class="style1">
            <tr>
                <td class="auto-style6">
                    <uc4:wucListaPosicao ID="cboPosicao" runat="server" />
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" style="font-weight: 700; color: #808080" 
                        Text="Meta de Venda:"></asp:Label>
&nbsp;<asp:Label ID="lblVenda" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
&nbsp;
        <dxwgv:ASPxGridViewExporter ID="ExporterExcel1" runat="server" 
            GridViewID="ASPxGridView1">
        </dxwgv:ASPxGridViewExporter>
    
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="NewItem" runat="server" BackColor="White" ForeColor="White"></asp:Label>
    
    </div>
    </form>
</body>
</html>
