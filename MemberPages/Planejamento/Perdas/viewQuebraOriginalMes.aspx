<%@ Page Language="VB" AutoEventWireup="false" CodeFile="viewQuebraOriginalMes.aspx.vb" Inherits="MemberPages_Planejamento_Quebras_viewQuebraOriginalMes" Theme="" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>



<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc5" %>
<%@ Register src="../../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc6" %>


<%@ Register src="../../../Controles/wucListaPosicao.ascx" tagname="wucListaPosicao" tagprefix="uc1" %>

<%@ Register src="../../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Meta Original de Quebra Total - Mês</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 167px;
        }
        .style4
        {
            width: 253px;
        }
        .style5
        {
            color: #FFFFFF;
            height: 29px;
        }
        .style6
        {
            width: 266px;
        }
        .style7
        {
            font-size: x-large;
            font-weight: bold;
        }
        .style8
        {
            color: #FFFFFF;
            width: 169px;
        }
        .style9
        {
            width: 216px;
        }
        .style10
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table cellspacing="1" class="style10">
            <tr>
                <td>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table cellspacing="1" class="style1">
                                <tr>
                                    <td align="left" bgcolor="#62B0FF" class="style5" colspan="4">
                                        <span class="style7">&nbsp;Meta de Quebra por Seção - por Mês</span>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td bgcolor="#99CCFF" class="style8">
                                        <uc5:wucAno ID="cboAno" runat="server" />
                                    </td>
                                    <td bgcolor="#99CCFF" class="style9">
                                        <uc6:wuciListaMes ID="cboMes" runat="server" />
                                    </td>
                                    <td bgcolor="#99CCFF" class="style6">
                                        <uc2:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                                    </td>
                                    <td bgcolor="#99CCFF" align="left">
                                        <uc1:wucListaPosicao ID="cboPosicao" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td bgcolor="#99CCFF" colspan="4" style="padding: 4px 0px 4px 4px">
                                        <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    Width="400px" KeyFieldName="ListaReduzida" EnableTheming="True" Theme="DevEx">
                                            <SettingsBehavior AllowFocusedRow="True" />
                                            <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                                                <AlternatingRow BackColor="AliceBlue">
                                                </AlternatingRow>
                                                <TitlePanel Font-Size="Medium">
                                                </TitlePanel>
                                            </Styles>
                                            <SettingsLoadingPanel Text="" />
                                            <SettingsPager Mode="ShowAllRecords">
                                                <AllButton>
                                                    <Image Height="19px" Width="27px" />
                                                </AllButton>
                                                <FirstPageButton>
                                                    <Image Height="19px" Width="23px" />
                                                </FirstPageButton>
                                                <LastPageButton>
                                                    <Image Height="19px" Width="23px" />
                                                </LastPageButton>
                                                <NextPageButton>
                                                    <Image Height="19px" Width="19px" />
                                                </NextPageButton>
                                                <PrevPageButton>
                                                    <Image Height="19px" Width="19px" />
                                                </PrevPageButton>
                                            </SettingsPager>
                                            <Images ImageFolder="~/App_Themes/Aqua/{0}/">
                                                <CollapsedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvCollapsedButton.png" Width="15px" />
                                                <ExpandedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvExpandedButton.png" Width="15px" />
                                                <DetailCollapsedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvDetailCollapsedButton.png" Width="15px" />
                                                <DetailExpandedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvDetailExpandedButton.png" Width="15px" />
                                                <HeaderFilter Height="19px" Url="~/App_Themes/Aqua/GridView/gvHeaderFilter.png" 
                            Width="19px" />
                                                <HeaderActiveFilter Height="19px" 
                            Url="~/App_Themes/Aqua/GridView/gvHeaderFilterActive.png" Width="19px" />
                                                <HeaderSortDown Height="5px" 
                            Url="~/App_Themes/Aqua/GridView/gvHeaderSortDown.png" Width="7px" />
                                                <HeaderSortUp Height="5px" Url="~/App_Themes/Aqua/GridView/gvHeaderSortUp.png" 
                            Width="7px" />
                                                <FilterRowButton Height="13px" Width="13px" />
                                                <WindowResizer Height="13px" Url="~/App_Themes/Aqua/GridView/WindowResizer.png" 
                            Width="13px" />
                                            </Images>
                                            <SettingsText Title="Meta de Quebra Total por Seção - Mês" />
                                            <TotalSummary>
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrQuebra" SummaryType="Sum" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percQuebra" SummaryType="Custom" />
                                            </TotalSummary>
                                            <Columns>
                                                <dxwgv:GridViewDataTextColumn FieldName="ListaReduzida" VisibleIndex="0" 
                            Caption="Seção" Width="150px">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="vlrVenda" ReadOnly="True" 
                            VisibleIndex="1" Caption="Venda" Width="100px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="vlrQuebra" ReadOnly="True" 
                            VisibleIndex="2" Caption="Quebra" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="percQuebra" ReadOnly="True" 
                            VisibleIndex="3" Caption="%" Width="50px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </dxwgv:GridViewDataTextColumn>
                                            </Columns>
                                            <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" ShowFooter="True" />
                                            <StylesEditors>
                                                <ProgressBar Height="25px">
                                                </ProgressBar>
                                            </StylesEditors>
                                            <ImagesEditors>
                                                <CalendarFastNavPrevYear Height="19px" 
                            Url="~/App_Themes/Aqua/Editors/edtCalendarFNPrevYear.png" Width="19px" />
                                                <CalendarFastNavNextYear Height="19px" 
                            Url="~/App_Themes/Aqua/Editors/edtCalendarFNNextYear.png" Width="19px" />
                                                <DropDownEditDropDown Height="7px" 
                            Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                            Width="9px" />
                                                <SpinEditIncrement Height="6px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditIncrementImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditIncrementDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                            Width="7px" />
                                                <SpinEditDecrement Height="7px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditDecrementImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditDecrementDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                            Width="7px" />
                                                <SpinEditLargeIncrement Height="9px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                            Width="7px" />
                                                <SpinEditLargeDecrement Height="9px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                            Width="7px" />
                                            </ImagesEditors>
                                        </dxwgv:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                    SelectCommand="viewOriLoja_QuebraMes" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sAno" Type="String" />
                                                <asp:SessionParameter DefaultValue="" Name="Mes" SessionField="sMes" Type="String" />
                                                <asp:SessionParameter DefaultValue="" Name="idFilial" SessionField="sFilial" Type="String" />
                                                <asp:SessionParameter DefaultValue="" Name="idPosicao" SessionField="sPOSICAO" Type="String" />
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
    
    </div>
    </form>
</body>
</html>
