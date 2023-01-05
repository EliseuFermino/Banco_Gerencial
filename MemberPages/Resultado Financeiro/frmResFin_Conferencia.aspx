<%@ Page Language="VB" MasterPageFile="~/MemberPages/Resultado Financeiro/mpResultadoFinanceiro.master" AutoEventWireup="false" CodeFile="frmResFin_Conferencia.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_frmResFin_Conferencia" title="Conferência do Resultado Financeiro" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxp" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxlp" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxcb" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
        .style2
        {
            color: #666666;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td>
                <dxp:ASPxPanel ID="ASPxPanel1" runat="server" Width="670px">
                    <PanelCollection>
<dxp:PanelContent runat="server">
    <table cellpadding="0" class="style1">
        <tr>
            <td class="style2">
                <b>Ano:</b></td>
            <td>
                <dxe:ASPxComboBox ID="cboAno" runat="server" AutoPostBack="True" 
                    BackColor="#FFFFCC" ValueType="System.String" Width="70px">
                    <Items>
                        <dxe:ListEditItem Text="2016" Value="2016" />
                        <dxe:ListEditItem Text="2017" Value="2017" />
                        <dxe:ListEditItem Text="2018" Value="2018" />
                        <dxe:ListEditItem Text="2019" Value="2019" />
                    </Items>
                </dxe:ASPxComboBox>
            </td>
            <td class="style2">
                <b>Mês: </b>
            </td>
            <td>
                <dxe:ASPxComboBox ID="cboMes" runat="server" AutoPostBack="True" 
                    BackColor="#FFFFCC" Height="16px" ValueType="System.String" Width="100px">
                    <Items>
                        <dxe:ListEditItem Text="Janeiro" Value="1" />
                        <dxe:ListEditItem Text="Fevereiro" Value="2" />
                        <dxe:ListEditItem Text="Março" Value="3" />
                        <dxe:ListEditItem Text="Abril" Value="4" />
                        <dxe:ListEditItem Text="Maio" Value="5" />
                        <dxe:ListEditItem Text="Junho" Value="6" />
                        <dxe:ListEditItem Text="Julho" Value="7" />
                        <dxe:ListEditItem Text="Agosto" Value="8" />
                        <dxe:ListEditItem Text="Setembro" Value="9" />
                        <dxe:ListEditItem Text="Outubro" Value="10" />
                        <dxe:ListEditItem Text="Novembro" Value="11" />
                        <dxe:ListEditItem Text="Dezembro" Value="12" />
                    </Items>
                    <ClientSideEvents SelectedIndexChanged="function(s, e) {

}" ValueChanged="function(s, e) {
	lp.Show();
}" />
                </dxe:ASPxComboBox>
            </td>
            <td class="style2">
                <b>Filial: </b>
            </td>
            <td>
                <dxe:ASPxComboBox ID="cboFilial" runat="server" AutoPostBack="True" 
                    BackColor="#FFFFCC" TextField="Desc" ValueField="Filial" 
                    ValueType="System.Int32" Width="200px" DropDownHeight="200px">
                    <ClientSideEvents ValueChanged="function(s, e) {
	lp.Show();
}" />
                    <LoadingPanelStyle BackColor="#FFFFCC">
                    </LoadingPanelStyle>
                </dxe:ASPxComboBox>
            </td>
            <td>
                <dxe:ASPxButton ID="ASPxButton1" runat="server" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    Text="Exportar para Excel" Width="150px">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
                        </dxp:PanelContent>
</PanelCollection>
                </dxp:ASPxPanel>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td>
                <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                    CssFilePath="~/App_Themes/Soft Orange/{0}/styles.css" 
                    CssPostfix="Soft_Orange" Theme="Aqua">
                    <Styles CssFilePath="~/App_Themes/Soft Orange/{0}/styles.css" 
                        CssPostfix="Soft_Orange" GroupButtonWidth="28">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <AlternatingRow BackColor="#F4FCFF">
                        </AlternatingRow>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <SettingsLoadingPanel Text="" />
                    <SettingsPager Mode="ShowAllRecords">
                        <AllButton>
                            <Image Height="19px" Width="28px" />
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
                    <GroupSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlr" 
                            ShowInGroupFooterColumn="vlr" SummaryType="Sum" />
                    </GroupSummary>
                    <TotalSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlr" 
                            ShowInGroupFooterColumn="vlr" SummaryType="Sum" />
                    </TotalSummary>
                    <Images ImageFolder="~/App_Themes/Soft Orange/{0}/">
                        <CollapsedButton Height="14px" 
                            Url="~/App_Themes/Soft Orange/GridView/gvCollapsedButton.png" Width="13px" />
                        <ExpandedButton Height="13px" 
                            Url="~/App_Themes/Soft Orange/GridView/gvExpandedButton.png" Width="13px" />
                        <DetailCollapsedButton Height="13px" 
                            Url="~/App_Themes/Soft Orange/GridView/gvDetailCollapsedButton.png" 
                            Width="13px" />
                        <DetailExpandedButton Height="13px" 
                            Url="~/App_Themes/Soft Orange/GridView/gvDetailExpandedButton.png" 
                            Width="13px" />
                        <HeaderFilter Height="19px" 
                            Url="~/App_Themes/Soft Orange/GridView/gvHeaderFilter.png" Width="19px" />
                        <HeaderActiveFilter Height="19px" 
                            Url="~/App_Themes/Soft Orange/GridView/gvHeaderFilterActive.png" Width="19px" />
                        <HeaderSortDown Height="3px" 
                            Url="~/App_Themes/Soft Orange/GridView/gvHeaderSortDown.png" Width="6px" />
                        <HeaderSortUp Height="3px" 
                            Url="~/App_Themes/Soft Orange/GridView/gvHeaderSortUp.png" Width="6px" />
                        <FilterRowButton Height="13px" Width="13px" />
                        <CustomizationWindowClose Height="18px" Width="18px" />
                        <PopupEditFormWindowClose Height="18px" Width="18px" />
                        <WindowResizer Height="12px" 
                            Url="~/App_Themes/Soft Orange/GridView/WindowResizer.png" Width="12px" />
                        <FilterBuilderClose Height="18px" Width="18px" />
                    </Images>
                    <ClientSideEvents Init="function(s, e) {

}" EndCallback="function(s, e) {

}" />
                    <Columns>
                        <dxwgv:GridViewCommandColumn VisibleIndex="0">
                        </dxwgv:GridViewCommandColumn>
                        <dxwgv:GridViewDataDateColumn FieldName="Dia" VisibleIndex="1">
                            <PropertiesDateEdit DateOnError="Null" DisplayFormatString="{0:dd/MM/yyyy}">
                            </PropertiesDateEdit>
                        </dxwgv:GridViewDataDateColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlr" VisibleIndex="2">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Contas" VisibleIndex="3" 
                            ReadOnly="True" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                            <Settings AllowGroup="True" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Agendas" VisibleIndex="4" 
                            ReadOnly="True" GroupIndex="1" SortIndex="1" SortOrder="Ascending">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="DescFonte" VisibleIndex="5">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Sistema" VisibleIndex="6">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Agrupamento" VisibleIndex="7">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Paddings Padding="1px" />
                    <Settings ShowFilterBar="Visible" 
                        ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" 
                        showtitlepanel="True" />
                    <StylesEditors>
                        <ProgressBar Height="29px">
                        </ProgressBar>
                    </StylesEditors>
                    <ImagesEditors>
                        <CalendarPrevYear Height="19px" 
                            Url="~/App_Themes/Soft Orange/Editors/edtCalendarPrevYear.png" Width="23px" />
                        <CalendarPrevMonth Height="19px" 
                            Url="~/App_Themes/Soft Orange/Editors/edtCalendarPrevMonth.png" Width="19px" />
                        <CalendarNextMonth Height="19px" 
                            Url="~/App_Themes/Soft Orange/Editors/edtCalendarNextMonth.png" Width="19px" />
                        <CalendarNextYear Height="19px" 
                            Url="~/App_Themes/Soft Orange/Editors/edtCalendarNextYear.png" Width="23px" />
                    </ImagesEditors>
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:conn_relReuniao %>" 
                    
                    
                    SelectCommand="SELECT Dia, vlr, Contas, Agendas, DescFonte, Sistema, Agrupamento FROM viewResFin_Cubo WHERE userName = @userName">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblUserName" Name="userName" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblUserName" runat="server" Text="Label" Visible="False"></asp:Label>
            &nbsp;</td>
        </tr>
        <tr>
            <td>
                <dxwgv:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    GridViewID="ASPxGridView1">
                </dxwgv:ASPxGridViewExporter>
            </td>
        </tr>
    </table>
    <br />
</p>
</asp:Content>

