﻿<%@ Page Title="Consulta Meta de Venda - Original - Gigante" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Consulta12MesesVendaOriginalGigante.aspx.vb" Inherits="MemberPages_Consulta12MesesGigante" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>



<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc2" %>
<%@ Register src="../../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc3" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc2" TagName="wucSize" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
      
         #divDados {
            float: left;
            margin-left: 2px;
            width: 100%;
        }

        .style6
        {
            width: 131px;
        }
        .style10
        {
            width: 114px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="divDados">
 
    <table cellspacing="1" class="style1">
        <tr>
            <td class="style6">
                <uc2:wucAno ID="cboAno" runat="server" />
            </td>
           
            <td>
                <uc2:wucSize runat="server" ID="cboSize" />
            </td>
            <td>
            </td>
        </tr>
    </table>
    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
        Width="100%" KeyFieldName="Descricao" Theme="DevEx">
        <SettingsBehavior AllowFocusedRow="True" />
         <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
            <Header HorizontalAlign="Center">
            </Header>
            <AlternatingRow BackColor="#F4FCFF">
            </AlternatingRow>
            <Footer Font-Bold="True">
            </Footer>
            <TitlePanel Font-Bold="True" Font-Size="Large">
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
        <TotalSummary>
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Janeiro" 
                SummaryType="Sum" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Fevereiro" 
                SummaryType="Sum" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Março" 
                SummaryType="Sum" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Abril" 
                SummaryType="Sum" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Maio" 
                SummaryType="Sum" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Junho" 
                SummaryType="Sum" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Julho" 
                SummaryType="Sum" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Agosto" 
                SummaryType="Sum" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Setembro" 
                SummaryType="Sum" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Outubro" 
                SummaryType="Sum" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Novembro" 
                SummaryType="Sum" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Dezembro" 
                SummaryType="Sum" />
            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Ano" 
                SummaryType="Sum" />
        </TotalSummary>
        <Toolbars>
                <dxe:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dxe:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dxe:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dxe:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dxe:GridViewToolbar>
            </Toolbars>

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
        <SettingsText EmptyDataRow="Não há nenhuma meta para este Ano e para esta Seção." />
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="1" 
                Caption="Nome da Filial" Width="150px" FixedStyle="Left">
                <CellStyle Wrap="False">
                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </CellStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Janeiro" ReadOnly="True" 
                VisibleIndex="2" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Fevereiro" ReadOnly="True" 
                VisibleIndex="3" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Março" ReadOnly="True" 
                VisibleIndex="4" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Abril" ReadOnly="True" 
                VisibleIndex="5" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <CellStyle>
                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </CellStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Maio" ReadOnly="True" VisibleIndex="6" 
                Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Junho" ReadOnly="True" 
                VisibleIndex="7" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Julho" ReadOnly="True" 
                VisibleIndex="8" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Agosto" ReadOnly="True" 
                VisibleIndex="9" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <CellStyle>
                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </CellStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Setembro" ReadOnly="True" 
                VisibleIndex="10" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Outubro" ReadOnly="True" 
                VisibleIndex="11" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Novembro" ReadOnly="True" 
                VisibleIndex="12" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Dezembro" ReadOnly="True" 
                VisibleIndex="13" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <CellStyle>
                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </CellStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Ano" ReadOnly="True" VisibleIndex="14" 
                Width="100px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <CellStyle Font-Bold="True">
                </CellStyle>
                <FooterCellStyle Font-Bold="True">
                </FooterCellStyle>
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFooter="True" showverticalscrollbar="True" 
            verticalscrollableheight="400" ShowHorizontalScrollBar="True" />
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
        SelectCommand="uspConsulta12Meses_VendaOriginal_Gigante" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="Ano" SessionField="sAno" 
                Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>

   </div>
    </asp:Content>

