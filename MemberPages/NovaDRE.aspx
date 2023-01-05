<%@ Page Title="Nova D.R.E." Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="NovaDRE.aspx.vb" Inherits="MemberPages_NovaDRE" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxpc" %>


<%@ Register src="../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>
<%@ Register src="../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style4
        {
            width: 100%;
            border-collapse: collapse;
        }
        .style5
        {
            width: 93px;
            font-family: Tahoma;
            font-size: 11px;
            font-weight: normal;
            text-align: center;
            white-space: nowrap;
        }
        .style6
        {
            width: 229px;
        }
        .style7
        {
            width: 368px;
        }
        .style8
        {
            width: 129px;
        color: #FFFFFF;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <table cellpadding="0" class="style4">
            <tr>
                <td>
                    <table cellspacing="1" class="style1" style="width: 90%">
                        <tr>
                            <td class="style5">
                                <uc1:wucAno ID="cboAno" runat="server" />
                            </td>
                            <td class="style6">
                                <uc2:wuciListaMes ID="cboMes" runat="server" />
                            </td>
                            <td class="style7">
                                <uc3:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                            </td>
                            <td class="style8">
                                Centro de Custo</td>
                            <td>
                                <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    ImageFolder="~/App_Themes/Aqua/{0}/" SettingsLoadingPanel-Text="" ShowShadow="False" 
                                    ValueType="System.String" Width="150px">
                                    <Items>
                                        <dxe:ListEditItem Text="01 - Seca Pesada" Value="01 - Seca Pesada" />
                                        <dxe:ListEditItem Text="02 - Seca Salgada" Value="02 - Seca Salgada" />
                                        <dxe:ListEditItem Text="03 - Seca Leve" Value="03 - Seca Leve" />
                                        <dxe:ListEditItem Text="04 - Seca Doce" Value="04 - Seca Doce" />
                                        <dxe:ListEditItem Text="05 - Limpeza" Value="05 - Limpeza" />
                                        <dxe:ListEditItem Text="06 - Perfumaria" Value="06 - Perfumaria" />
                                        <dxe:ListEditItem Text="07 - Bebidas Quentes" Value="07 - Bebidas Quentas" />
                                        <dxe:ListEditItem Text="08 - Bebidas Frias" Value="08 - Bebidas Frias" />
                                        <dxe:ListEditItem Text="Depto - Mercearia" Value="Depto - Mercearia" />
                                        <dxe:ListEditItem Text="Gerencia - Loja" Value="Gerencia - Loja" />
                                        <dxe:ListEditItem Text="Frente de Caixa" Value="Frente de Caixa" />
                                        <dxe:ListEditItem Text="CPD" Value="CPD" />
                                        <dxe:ListEditItem Text="Recebimento" Value="Recebimento" />
                                    </Items>
                                    <ButtonEditEllipsisImage Height="3px" 
                                        Url="~/App_Themes/Aqua/Editors/edtEllipsis.png" 
                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtEllipsisDisabled.png" 
                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtEllipsisHottracked.png" 
                                        UrlPressed="~/App_Themes/Aqua/Editors/edtEllipsisPressed.png" Width="12px" />
                                    <DropDownButton>
                                        <Image Height="7px" Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                                            UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                                            UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                                            UrlPressed="~/App_Themes/Aqua/Editors/edtDropDownPressed.png" Width="9px" />
                                    </DropDownButton>
                                    <ValidationSettings>
                                        <ErrorImage Height="14px" Url="~/App_Themes/Aqua/Editors/edtError.png" 
                                            Width="14px" />
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dxe:ASPxComboBox>
                            </td>
                            <td>
                                <dxe:ASPxButton ID="btnSecao" runat="server" Text="Depto" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    PostBackUrl="~/MemberPages/AcompanhamentoSLV.aspx">
                                </dxe:ASPxButton>
                            </td>
                            <td>
                                <dxe:ASPxButton ID="ASPxButton1" runat="server" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    PostBackUrl="~/MemberPages/DashBoard_DespesaLoja.aspx" Text="Despesas">
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="margin-left: 40px">
                    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                        KeyFieldName="idG1" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue" Width="1000px">
                        <Templates>
                            <DetailRow>
                                <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" 
                                    AutoGenerateColumns="False" 
                                    CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                    DataSourceID="SqlDataSource2" KeyFieldName="idG2" 
                                    onbeforeperformdataselect="ASPxGridView2_BeforePerformDataSelect" 
                                    onhtmldatacellprepared="ASPxGridView2_HtmlDataCellPrepared">
                                    <Templates>
                                        <DetailRow>
                                            <dxwgv:ASPxGridView ID="ASPxGridView3" runat="server" 
                                                AutoGenerateColumns="False" CssFilePath="~/App_Themes/Red Wine/{0}/styles.css" 
                                                CssPostfix="RedWine" DataSourceID="SqlDataSource3" KeyFieldName="idG3" 
                                                onbeforeperformdataselect="ASPxGridView3_BeforePerformDataSelect">
                                                <Templates>
                                                    <DetailRow>
                                                        <dxwgv:ASPxGridView ID="ASPxGridView4" runat="server" 
                                                            AutoGenerateColumns="False" 
                                                            CssFilePath="~/App_Themes/BlackGlass/{0}/styles.css" CssPostfix="BlackGlass" 
                                                            DataSourceID="SqlDataSource4" KeyFieldName="idG4" 
                                                            onbeforeperformdataselect="ASPxGridView4_BeforePerformDataSelect">
                                                            <Styles CssFilePath="~/App_Themes/BlackGlass/{0}/styles.css" 
                                                                CssPostfix="BlackGlass">
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                            </Styles>
                                                            <Images ImageFolder="~/App_Themes/BlackGlass/{0}/">
                                                                <FilterRowButton Height="13px" Width="13px" />
                                                            </Images>
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="Código" FieldName="idG4" ReadOnly="True" 
                                                                    VisibleIndex="0">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Descrição da Conta" FieldName="idG4Desc" 
                                                                    VisibleIndex="1">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Ano Anterior" FieldName="vlrAA" 
                                                                    VisibleIndex="2">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percAA" VisibleIndex="3">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Mês Anterior" FieldName="vlrMA" 
                                                                    VisibleIndex="4">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percMA" VisibleIndex="5">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" 
                                                                    VisibleIndex="6">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percMeta" VisibleIndex="7">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlr" 
                                                                    VisibleIndex="8">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="%" FieldName="perc" VisibleIndex="9">
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                            <SettingsDetail IsDetailGrid="True" />
                                                        </dxwgv:ASPxGridView>
                                                    </DetailRow>
                                                </Templates>
                                                <SettingsBehavior AllowFocusedRow="True" />
                                                <Styles CssFilePath="~/App_Themes/Red Wine/{0}/styles.css" CssPostfix="RedWine">
                                                    <AlternatingRow BackColor="#FFEEEA">
                                                    </AlternatingRow>
                                                    <FocusedRow BackColor="#FFFFCC" ForeColor="#666666">
                                                    </FocusedRow>
                                                </Styles>
                                                <SettingsLoadingPanel Text="" />
                                                <SettingsPager>
                                                    <AllButton>
                                                        <Image Height="19px" Width="24px" />
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
                                                <Images ImageFolder="~/App_Themes/Red Wine/{0}/">
                                                    <CollapsedButton Height="15px" 
                                                        Url="~/App_Themes/Red Wine/GridView/gvCollapsedButton.png" Width="15px" />
                                                    <ExpandedButton Height="15px" 
                                                        Url="~/App_Themes/Red Wine/GridView/gvExpandedButton.png" Width="15px" />
                                                    <DetailCollapsedButton Height="12px" 
                                                        Url="~/App_Themes/Red Wine/GridView/gvDetailCollapsedButton.png" Width="11px" />
                                                    <DetailExpandedButton Height="12px" 
                                                        Url="~/App_Themes/Red Wine/GridView/gvDetailExpandedButton.png" Width="11px" />
                                                    <HeaderFilter Height="19px" 
                                                        Url="~/App_Themes/Red Wine/GridView/gvHeaderFilter.png" Width="19px" />
                                                    <HeaderActiveFilter Height="19px" 
                                                        Url="~/App_Themes/Red Wine/GridView/gvHeaderFilterActive.png" Width="19px" />
                                                    <HeaderSortDown Height="15px" 
                                                        Url="~/App_Themes/Red Wine/GridView/gvHeaderSortDown.png" Width="11px" />
                                                    <HeaderSortUp Height="15px" 
                                                        Url="~/App_Themes/Red Wine/GridView/gvHeaderSortUp.png" Width="11px" />
                                                    <FilterRowButton Height="13px" Width="13px" />
                                                    <CustomizationWindowClose Height="19px" Width="19px" />
                                                    <PopupEditFormWindowClose Height="19px" Width="19px" />
                                                    <WindowResizer Height="13px" 
                                                        Url="~/App_Themes/Red Wine/GridView/WindowResizer.png" Width="13px" />
                                                    <FilterBuilderClose Height="19px" Width="19px" />
                                                </Images>
                                                <ClientSideEvents RowDblClick="function(s, e) {
		
	pop.ShowAtPos(50);	
}" />
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="Código" FieldName="idG3" ReadOnly="True" 
                                                        VisibleIndex="0">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Descrição da Conta" FieldName="idG3Desc" 
                                                        VisibleIndex="1">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataHyperLinkColumn Caption="L x L" 
                                                        ToolTip="Ánalise da conta selecionada Loja por Loja" VisibleIndex="2" 
                                                        Width="20px">
                                                        <PropertiesHyperLinkEdit Text="L">
                                                            <Style Font-Size="X-Small">
                                                            </Style>
                                                        </PropertiesHyperLinkEdit>
                                                        <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataHyperLinkColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Ano Anterior" FieldName="vlrAA" 
                                                        VisibleIndex="3" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="% A.A" FieldName="percAA" 
                                                        VisibleIndex="4" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Mês Anterior" FieldName="vlrMA" 
                                                        VisibleIndex="5" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="% M.A." FieldName="percMA" 
                                                        VisibleIndex="6" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" 
                                                        VisibleIndex="7" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="% Meta" FieldName="percMeta" 
                                                        VisibleIndex="8" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlr" 
                                                        VisibleIndex="9" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="% Real." FieldName="perc" 
                                                        VisibleIndex="10" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                                <StylesEditors>
                                                    <ProgressBar Height="25px">
                                                    </ProgressBar>
                                                </StylesEditors>
                                                <SettingsDetail IsDetailGrid="True" ShowDetailRow="True" />
                                                <ImagesEditors>
                                                    <CalendarFastNavPrevYear Height="19px" 
                                                        Url="~/App_Themes/Red Wine/Editors/edtCalendarFNPrevYear.png" Width="19px" />
                                                    <CalendarFastNavNextYear Height="19px" 
                                                        Url="~/App_Themes/Red Wine/Editors/edtCalendarFNNextYear.png" Width="19px" />
                                                    <DropDownEditDropDown Height="7px" 
                                                        Url="~/App_Themes/Red Wine/Editors/edtDropDown.png" 
                                                        UrlDisabled="~/App_Themes/Red Wine/Editors/edtDropDownDisabled.png" 
                                                        UrlHottracked="~/App_Themes/Red Wine/Editors/edtDropDownHottracked.png" 
                                                        Width="7px" />
                                                    <SpinEditIncrement Height="6px" 
                                                        Url="~/App_Themes/Red Wine/Editors/edtSpinEditIncrementImage.png" 
                                                        UrlDisabled="~/App_Themes/Red Wine/Editors/edtSpinEditIncrementDisabledImage.png" 
                                                        UrlHottracked="~/App_Themes/Red Wine/Editors/edtSpinEditIncrementHottrackedImage.png" 
                                                        Width="7px" />
                                                    <SpinEditDecrement Height="7px" 
                                                        Url="~/App_Themes/Red Wine/Editors/edtSpinEditDecrementImage.png" 
                                                        UrlDisabled="~/App_Themes/Red Wine/Editors/edtSpinEditDecrementDisabledImage.png" 
                                                        UrlHottracked="~/App_Themes/Red Wine/Editors/edtSpinEditDecrementHottrackedImage.png" 
                                                        Width="7px" />
                                                    <SpinEditLargeIncrement Height="9px" 
                                                        Url="~/App_Themes/Red Wine/Editors/edtSpinEditLargeIncImage.png" 
                                                        UrlDisabled="~/App_Themes/Red Wine/Editors/edtSpinEditLargeIncDisabledImage.png" 
                                                        UrlHottracked="~/App_Themes/Red Wine/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                                                        Width="7px" />
                                                    <SpinEditLargeDecrement Height="9px" 
                                                        Url="~/App_Themes/Red Wine/Editors/edtSpinEditLargeDecImage.png" 
                                                        UrlDisabled="~/App_Themes/Red Wine/Editors/edtSpinEditLargeDecDisabledImage.png" 
                                                        UrlHottracked="~/App_Themes/Red Wine/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                                                        Width="7px" />
                                                </ImagesEditors>
                                            </dxwgv:ASPxGridView>
                                        </DetailRow>
                                    </Templates>
                                    <Styles CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
                                        CssPostfix="PlasticBlue">
                                        <Header ImageSpacing="10px" SortingImageSpacing="10px">
                                        </Header>
                                        <AlternatingRow BackColor="#E8F4FF">
                                        </AlternatingRow>
                                    </Styles>
                                    <SettingsPager ShowDefaultImages="False">
                                        <AllButton Text="All">
                                        </AllButton>
                                        <NextPageButton Text="Next &gt;">
                                        </NextPageButton>
                                        <PrevPageButton Text="&lt; Prev">
                                        </PrevPageButton>
                                    </SettingsPager>
                                    <Images ImageFolder="~/App_Themes/Plastic Blue/{0}/">
                                        <CollapsedButton Height="10px" 
                                            Url="~/App_Themes/Plastic Blue/GridView/gvCollapsedButton.png" Width="9px" />
                                        <ExpandedButton Height="9px" 
                                            Url="~/App_Themes/Plastic Blue/GridView/gvExpandedButton.png" Width="9px" />
                                        <HeaderFilter Height="15px" 
                                            Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilter.png" Width="13px" />
                                        <HeaderActiveFilter Height="15px" 
                                            Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilterActive.png" 
                                            Width="13px" />
                                        <HeaderSortDown Height="11px" 
                                            Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortDown.png" Width="11px" />
                                        <HeaderSortUp Height="11px" 
                                            Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortUp.png" Width="11px" />
                                        <FilterRowButton Height="13px" Width="13px" />
                                        <CustomizationWindowClose Height="14px" Width="14px" />
                                        <PopupEditFormWindowClose Height="14px" Width="14px" />
                                        <FilterBuilderClose Height="14px" Width="14px" />
                                    </Images>
                                    <ClientSideEvents RowDblClick="function(s, e) {
	popNovo.ShowAtPos(10);	
}" />
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Código" FieldName="idG2" ReadOnly="True" 
                                            VisibleIndex="0">
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Descrição da Conta" FieldName="idG2Desc" 
                                            VisibleIndex="1">
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataHyperLinkColumn Caption="L x L" 
                                            ToolTip="Ánalise da conta selecionada loja por Loja" VisibleIndex="2" 
                                            Width="20px">
                                            <PropertiesHyperLinkEdit Text="L">
                                                <Style Font-Size="X-Small">
                                                </Style>
                                            </PropertiesHyperLinkEdit>
                                            <HeaderStyle Font-Size="X-Small" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dxwgv:GridViewDataHyperLinkColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Ano Anterior" FieldName="vlrAA" 
                                            VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="% vA.A." FieldName="percAA" 
                                            VisibleIndex="4" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Mês Anterior" FieldName="vlrMA" 
                                            VisibleIndex="5" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="% M.A." FieldName="percMA" 
                                            VisibleIndex="6" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" 
                                            VisibleIndex="7" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="% Meta" FieldName="percMeta" 
                                            VisibleIndex="8" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlr" 
                                            VisibleIndex="9" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="% Real." FieldName="perc" 
                                            VisibleIndex="10" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <StylesEditors>
                                        <ProgressBar Height="25px">
                                        </ProgressBar>
                                    </StylesEditors>
                                    <SettingsDetail IsDetailGrid="True" ShowDetailRow="True" />
                                </dxwgv:ASPxGridView>
                            </DetailRow>
                        </Templates>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue">
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager Mode="ShowAllRecords" PageSize="20">
                        </SettingsPager>
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
                            <dxwgv:GridViewDataTextColumn FieldName="idG1" ReadOnly="True" VisibleIndex="0" 
                                Caption="Código">
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="idG1Desc" VisibleIndex="1" 
                                Caption="Descrição da Conta">
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataHyperLinkColumn Caption="L x L" 
                                ToolTip="Ánalise da conta selecionada loja por loja." VisibleIndex="2" 
                                Width="10px">
                                <PropertiesHyperLinkEdit Text="L">
                                    <Style Font-Bold="True" Font-Size="XX-Small">
                                    </Style>
                                </PropertiesHyperLinkEdit>
                                <HeaderStyle Font-Size="X-Small" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dxwgv:GridViewDataHyperLinkColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Ano Anterior" FieldName="vlrAA" 
                                VisibleIndex="3" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="% A.A" FieldName="percAA" 
                                VisibleIndex="4" Width="50px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Mês Anterior" FieldName="vlrMA" 
                                VisibleIndex="5" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="% M.A." FieldName="percMA" 
                                VisibleIndex="6" Width="50px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" 
                                VisibleIndex="7" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#009900" />
                                <CellStyle ForeColor="#009900">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="% Meta" FieldName="percMeta" 
                                VisibleIndex="8" Width="50px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="#009900" />
                                <CellStyle ForeColor="#009900">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlr" 
                                VisibleIndex="9" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="Blue" />
                                <CellStyle ForeColor="Blue">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="% Real" FieldName="perc" 
                                VisibleIndex="10" Width="50px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="Blue" />
                                <CellStyle ForeColor="Blue">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                        <SettingsDetail ShowDetailRow="True" />
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        
                        SelectCommand="SELECT [idG1], [idG1Desc], [vlrAA], [percAA], [vlrMA], [percMA], [vlrMeta], [percMeta], [vlr], [perc] FROM [viewDespG1]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        
                        SelectCommand="SELECT [idG2], [idG2Desc], [vlrAA], [percAA], [vlrMA], [percMA], [vlrMeta], [percMeta], [vlr], [perc] FROM [viewDespG2] WHERE ([idG1] = @idG1)">
                        <SelectParameters>
                            <asp:SessionParameter Name="idG1" SessionField="KEY1" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        
                        SelectCommand="SELECT [idG3], [idG3Desc], [vlrAA], [percAA], [vlrMA], [percMA], [vlrMeta], [percMeta], [vlr], [perc] FROM [viewDespG3] WHERE ([idG2] = @idG2)">
                        <SelectParameters>
                            <asp:SessionParameter Name="idG2" SessionField="KEY2" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="SELECT [idG4], [idG4Desc], [vlrAA], [percAA], [vlrMA], [percMA], [vlrMeta], [percMeta], [vlr], [perc] FROM [viewDespG4] WHERE ([idG3] = @idG3)">
                        <SelectParameters>
                            <asp:SessionParameter Name="idG3" SessionField="KEY3" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
    <dxpc:ASPxPopupControl ID="pop" runat="server" ClientInstanceName="pop" 
        CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
        Height="73px" ImageFolder="~/App_Themes/Plastic Blue/{0}/" Modal="True" 
        Width="845px" AllowDragging="True" 
        HeaderText="Despesas Analiticas do Sub-grupo Selecionado" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Above">
        <ContentStyle>
            <BorderBottom BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" />
        </ContentStyle>
        <SizeGripImage Height="16px" Url="~/App_Themes/Plastic Blue/Web/pcSizeGrip.gif" 
            Width="16px" />
        <CloseButtonStyle>
            <Paddings Padding="0px" />
        </CloseButtonStyle>
        <ContentCollection>
<dxpc:PopupControlContentControl runat="server">
    <dxwgv:ASPxGridView ID="ASPxGridView5" runat="server" 
        AutoGenerateColumns="False" 
        SummaryText="Total das Despesas " 
        CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
        CssPostfix="PlasticBlue" KeyFieldName="MES" DataSourceID="SqlDataSource5" 
        Width="800px">
        <ClientSideEvents EndCallback="function(s, e) {
	lp.Hide();
}" />
        <TotalSummary>
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VALOR" 
                ShowInGroupFooterColumn="Vlr" SummaryType="Sum" />
        </TotalSummary>
        <GroupSummary>
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlr" 
                SummaryType="Sum" />
        </GroupSummary>
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="DATA" VisibleIndex="0" Caption="Data" 
                ToolTip="Dia da efetivação da despesa." Width="80px">
                <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy}">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="FONTE" VisibleIndex="1" 
                Caption="Origem" 
                
                ToolTip="Fonte de quem lançou a despesa, pode ser RH, loja, caixa-matriz, manutenção, patrimônio e etc." 
                Width="80px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="AGENDA" VisibleIndex="2" 
                Caption="Agenda" ToolTip="Agenda" Width="50px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="NOTA" VisibleIndex="3" Caption="Doc." 
                ToolTip="Nota fiscal, fatura, duplicata, recibo, darf e outros tipos de documentos que comprovem o gasto com a despesa." 
                Width="60px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="VALOR" VisibleIndex="4" Caption="Vlr" 
                ToolTip="Valor da despesa que consta no documento." Width="60px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="DESCRICAO" VisibleIndex="5" 
                Caption="Descrição" ToolTip="Descrição da despesa" Width="200px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="OBSERVACOES" VisibleIndex="6" 
                Caption="Observação" ToolTip="Informações adicionais da despesa." 
                Width="100px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="CCUSTO" VisibleIndex="7" 
                Caption="Centro de Custo" ToolTip="Seção que vai receber a despesa." 
                Width="120px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Mês" FieldName="MES" VisibleIndex="8" 
                Width="30px">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <SettingsPager Mode="ShowAllRecords" ShowDefaultImages="False">
            <AllButton Text="All">
            </AllButton>
            <NextPageButton Text="Next &gt;">
            </NextPageButton>
            <PrevPageButton Text="&lt; Prev">
            </PrevPageButton>
        </SettingsPager>
        <Settings ShowFooter="True" ShowVerticalScrollBar="True" 
            ShowGroupPanel="True" />
        <SettingsText GroupPanel="Arraste aqui um cabeçalho de qualquer coluna abaixo para agrupar." />
        <Images ImageFolder="~/App_Themes/Plastic Blue/{0}/">
            <CollapsedButton Height="10px" 
                Url="~/App_Themes/Plastic Blue/GridView/gvCollapsedButton.png" Width="9px" />
            <ExpandedButton Height="9px" 
                Url="~/App_Themes/Plastic Blue/GridView/gvExpandedButton.png" Width="9px" />
            <HeaderFilter Height="15px" 
                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilter.png" Width="13px" />
            <HeaderActiveFilter Height="15px" 
                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilterActive.png" 
                Width="13px" />
            <HeaderSortDown Height="11px" 
                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortDown.png" Width="11px" />
            <HeaderSortUp Height="11px" 
                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortUp.png" Width="11px" />
            <FilterRowButton Height="13px" Width="13px" />
            <CustomizationWindowClose Height="14px" Width="14px" />
            <PopupEditFormWindowClose Height="14px" Width="14px" />
            <FilterBuilderClose Height="14px" Width="14px" />
        </Images>
        <Styles CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
            CssPostfix="PlasticBlue">
            <Header ImageSpacing="10px" SortingImageSpacing="10px">
            </Header>
        </Styles>
        <StylesEditors>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
    </dxwgv:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        SelectCommand="SELECT CODIGO, AGENDA, LOJA, FONTE, VALOR, DATA, MES, ANO, DESCRICAO, NOTA, OBSERVACOES, CCUSTO FROM Despesas.viewDespesaBase WHERE (ANO = @ANO) AND (MES = @MES) AND (LOJA = @LOJA) AND (CODIGO = @CODIGO)">
        <SelectParameters>
            <asp:Parameter DefaultValue="2011" Name="ANO" />
            <asp:Parameter DefaultValue="7" Name="MES" />
            <asp:Parameter DefaultValue="21" Name="LOJA" />
            <asp:Parameter DefaultValue="556" Name="CODIGO" />
        </SelectParameters>
    </asp:SqlDataSource>
            <br />
            </dxpc:PopupControlContentControl>
</ContentCollection>
        <CloseButtonImage Height="14px" Width="14px" />
        <HeaderStyle HorizontalAlign="Center">
        <Paddings PaddingBottom="4px" PaddingLeft="10px" PaddingRight="4px" 
            PaddingTop="4px" />
        </HeaderStyle>
    </dxpc:ASPxPopupControl>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </p>
</asp:Content>

