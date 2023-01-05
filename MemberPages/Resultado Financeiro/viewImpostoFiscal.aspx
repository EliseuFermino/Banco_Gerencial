<%@ Page Title="Imposto Fiscal - Resultado Financeiro" Language="VB" MasterPageFile="~/MemberPages/Resultado Financeiro/mpResultadoFinanceiro.master" AutoEventWireup="false" CodeFile="viewImpostoFiscal.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_viewImpostoFiscal" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 100%;
        border-collapse: collapse;
    }
    .style3
    {
        width: 41px;
    }
    .style4
    {
        width: 106px;
    }
    .style5
    {
        width: 39px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <table class="style1">
        <tr>
            <td align="left" class="style3">
                Ano:
            </td>
            <td align="left" class="style4">
                <dxe:ASPxComboBox runat="server" ValueType="System.String" Width="70px" 
                    AutoPostBack="True" BackColor="#FFFFCC" ID="cboAno"><Items>
<dxe:ListEditItem Text="2016" Value="2016"></dxe:ListEditItem>
<dxe:ListEditItem Text="2017" Value="2017"></dxe:ListEditItem>
<dxe:ListEditItem Text="2018" Value="2018"></dxe:ListEditItem>
<dxe:ListEditItem Text="2019" Value="2019"></dxe:ListEditItem>
<dxe:ListEditItem Text="2020" Value="2020"></dxe:ListEditItem>
</Items>
</dxe:ASPxComboBox>

            </td>
            <td align="left" class="style5">
                Mês:
            </td>
            <td align="left">
                <dxe:ASPxComboBox runat="server" ValueType="System.String" Width="101px" 
                    Height="16px" AutoPostBack="True" BackColor="#FFFFCC" ID="cboMes"><Items>
<dxe:ListEditItem Text="Janeiro" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Fevereiro" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="Mar&#231;o" Value="3"></dxe:ListEditItem>
<dxe:ListEditItem Text="Abril" Value="4"></dxe:ListEditItem>
<dxe:ListEditItem Text="Maio" Value="5"></dxe:ListEditItem>
<dxe:ListEditItem Text="Junho" Value="6"></dxe:ListEditItem>
<dxe:ListEditItem Text="Julho" Value="7"></dxe:ListEditItem>
<dxe:ListEditItem Text="Agosto" Value="8"></dxe:ListEditItem>
<dxe:ListEditItem Text="Setembro" Value="9"></dxe:ListEditItem>
<dxe:ListEditItem Text="Outubro" Value="10"></dxe:ListEditItem>
<dxe:ListEditItem Text="Novembro" Value="11"></dxe:ListEditItem>
<dxe:ListEditItem Text="Dezembro" Value="12"></dxe:ListEditItem>
</Items>

<ClientSideEvents SelectedIndexChanged="function(s, e) {

}" ValueChanged="function(s, e) {
	lp.Show();
}"></ClientSideEvents>
</dxe:ASPxComboBox>

            </td>
            <td align="left">
                <dxe:ASPxButton ID="ASPxButton1" runat="server" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    Text="btnExportar">
                </dxe:ASPxButton>
            </td>
            <td align="left">
                &nbsp;</td>
        </tr>
    </table>
    <table cellpadding="0" class="style2">
        <tr>
            <td>
                <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="800px" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                    <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                        <AlternatingRow BackColor="#F4FCFF">
                        </AlternatingRow>
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
                    <GroupSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat=" {0:n0}" FieldName="vlrCompras" 
                            ShowInGroupFooterColumn="Compras" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrICMS" 
                            ShowInGroupFooterColumn="ICMS" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCOFINS" 
                            ShowInGroupFooterColumn="COFINS" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrPIS" 
                            ShowInGroupFooterColumn="PIS" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Total" 
                            ShowInGroupFooterColumn="Total" SummaryType="Sum" />
                    </GroupSummary>
                    <TotalSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCompras" 
                            ShowInGroupFooterColumn="Compras" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCOFINS" 
                            ShowInGroupFooterColumn="COFINS" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrPIS" 
                            ShowInGroupFooterColumn="PIS" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrICMS" 
                            ShowInGroupFooterColumn="ICMS" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Total" 
                            ShowInGroupFooterColumn="Total" SummaryType="Sum" />
                    </TotalSummary>
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
                    <Columns>
                        <dxwgv:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" 
                            VisibleIndex="0" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Agendas" VisibleIndex="1" 
                            ReadOnly="True" Width="300px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Left" Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrCompras" VisibleIndex="2" 
                            Caption="Compras">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Right">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrICMS" VisibleIndex="3" 
                            Caption="ICMS">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Right">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="COFINS" FieldName="vlrCOFINS" 
                            VisibleIndex="4">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Right">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="PIS" FieldName="vlrPIS" VisibleIndex="5">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Right">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Total" 
                            ReadOnly="True" VisibleIndex="6">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle Font-Bold="True" HorizontalAlign="Right">
                            </CellStyle>
                            <FooterCellStyle Font-Bold="True">
                            </FooterCellStyle>
                            <GroupFooterCellStyle Font-Bold="True">
                            </GroupFooterCellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Ano" Visible="False" VisibleIndex="7">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Mes" Visible="False" VisibleIndex="7">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowGroupPanel="True" ShowTitlePanel="True" 
                        ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                        showfooter="True" showgroupfooter="VisibleAlways" />
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
                    ConnectionString="<%$ ConnectionStrings:conn_relReuniao %>" 
                    
                    SelectCommand="SELECT tblCadFiliais.FilialLista, viewComprasImpostos.Ano, viewComprasImpostos.Mes, viewComprasImpostos.vlrCOFINS, viewComprasImpostos.vlrPIS, viewComprasImpostos.vlrICMS, viewComprasImpostos.vlrCompras, viewComprasImpostos.vlrCOFINS + viewComprasImpostos.vlrPIS + viewComprasImpostos.vlrICMS AS Total, CAST(viewComprasImpostos.idAgenda AS VARCHAR(4)) + ' - ' + CAST(tblCadAgendas.descAgenda AS VARCHAR(50)) AS Agendas FROM viewComprasImpostos INNER JOIN tblCadAgendas ON viewComprasImpostos.idAgenda = tblCadAgendas.idAgenda INNER JOIN tblCadFiliais ON viewComprasImpostos.idFilial = tblCadFiliais.Filial WHERE (viewComprasImpostos.Ano = @Ano) AND (viewComprasImpostos.Mes = @Mes) AND (viewComprasImpostos.vlrCOFINS + viewComprasImpostos.vlrPIS + viewComprasImpostos.vlrICMS &lt;&gt; 0)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboAno" Name="Ano" PropertyName="Value" />
                        <asp:ControlParameter ControlID="cboMes" Name="Mes" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
</p>
</asp:Content>

