<%@ Page Title="Meta de Venda Original" Language="VB" MasterPageFile="~/MemberPages/SiteRelatoriosMetas.master" AutoEventWireup="false" CodeFile="viewOri_MetaVendaPorMesEmpresa.aspx.vb" Inherits="MemberPages_viewOri_MetaVendaEmpresaAno" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.XtraReports.v18.2.Web.WebForms, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dxxr" %>

<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc2" %>

<%@ Register src="../../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
    <table cellspacing="1" class="style1">
        <tr>
            <td>
                <uc2:wucAno ID="cboAno" runat="server" />
            </td>
            <td>
                <uc1:wucBotaoExcel ID="btnExcel" runat="server" />
            </td>
        </tr>
    </table>
    <table cellspacing="1" class="style1">
        <tr>
            <td>
                <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False" 
                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                    CssPostfix="Office2003_Blue" DataSourceID="SqlDataSource1" Width="280px" EnableTheming="True" 
                    Theme="DevEx" KeyFieldName="descMes">
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
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
                    <SettingsText Title="Meta Original de Venda - Ano" 
                        emptydatarow="Não há meta de venda para este ano ainda." />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="descMes" 
                            VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlr" VisibleIndex="1">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFooter="True" ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                        VerticalScrollableHeight="400" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                    
                    
                    SelectCommand="SELECT b.descMes, a.vlrOri AS vlr FROM Resultados.tbl_Teorico_Mes_Lojas_Grupo AS a INNER JOIN gerCadastros.dbo.tblCadMes AS b ON a.Mes = b.mes WHERE (a.Ano = @Ano) AND (a.idFilial = '99') AND idGrupo=1 ORDER BY a.Mes">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
    </table>
    <table cellspacing="1" class="style1">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
</p>
</asp:Content>

