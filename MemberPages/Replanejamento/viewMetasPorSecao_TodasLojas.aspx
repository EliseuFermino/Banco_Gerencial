<%@ Page Title="Consulta de Metas por Seção" Language="VB" MasterPageFile="~/MemberPages/SiteMetas.master" AutoEventWireup="false" CodeFile="viewMetasPorSecao_TodasLojas.aspx.vb" Inherits="MemberPages_viewMetasPorSecao_TodasLojas" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>


<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc3" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc3" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style4
        {
            width: 85px;
        }
        .style5
        {
            width: 218px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   
    <table class="style1">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table class="style1">
                            <tr>
                                <td class="style4">
                                    <uc3:wucAno runat="server" ID="cboAno" />
                                </td>
                                <td class="style5">
                                    <uc3:wuciListaMes runat="server" ID="cboMes" />
                                </td>
                                <td>
                                    <uc1:wucListaSecao runat="server" ID="cboSecao" />
                                </td>
                                
                                <td>
                                    <dxwgv:ASPxGridViewExporter ID="ExporterExcel1" runat="server" 
                                        GridViewID="ASPxGridView1">
                                    </dxwgv:ASPxGridViewExporter>
                                </td>
                            </tr>
                        </table>
                        <table class="style1">
                            <tr>
                                <td>
                                    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                                        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                                        KeyFieldName="Ano" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                        CssPostfix="Office2003_Blue" Width="700px" Theme="DevEx">
                                        <SettingsBehavior AllowFocusedRow="True" />
                                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                            CssPostfix="Office2003_Blue">
                                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                            </Header>
                                            <LoadingPanel ImageSpacing="10px">
                                            </LoadingPanel>
                                        </Styles>
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistAA" 
                                                SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr" 
                                                SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" 
                                                SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" 
                                                SummaryType="Custom" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" 
                                                SummaryType="Custom" />
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
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" 
                                                VisibleIndex="0" Caption="Filial" Width="30px">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="DescFilial" VisibleIndex="1" 
                                                Caption="Descrição da Filial" Width="150px">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="vlrHistAA" 
                                                VisibleIndex="2" Caption="Venda A.A" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    

                                                </PropertiesTextEdit>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="percMargemAA" VisibleIndex="3" 
                                                Caption="Margem AA" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    

                                                </PropertiesTextEdit>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="vlr" VisibleIndex="4" Caption="Meta" 
                                                Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    

                                                </PropertiesTextEdit>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="percPart" VisibleIndex="5" 
                                                Caption="% Part." Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    

                                                </PropertiesTextEdit>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="percMargem" VisibleIndex="6" 
                                                Caption="Meta Margem" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    

                                                </PropertiesTextEdit>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="vlrMargem" VisibleIndex="7" 
                                                Visible="False" Width="80px">
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
                                        
                                        
                                        SelectCommand="SELECT Ano, Mes, idFilial, DescFilial, vlrHistAA, percMargemAA, vlr, percPart, percMargem, vlrMargem, idUser FROM Temp.ttConsultaSecao WHERE idUser = @User">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="" Name="User" SessionField="sUser" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
        <dxe:ASPxButton ID="ASPxButton2" runat="server" 
            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
            Text="Exportar para Excel" Width="150px">
        </dxe:ASPxButton>
    <br />

</asp:Content>

