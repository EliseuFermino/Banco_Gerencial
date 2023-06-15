<%@ Page Title="Consulta Meta de Venda por Seção Original" Language="VB" MasterPageFile="~/MemberPages/SiteDespesas.master" AutoEventWireup="false" CodeFile="Consulta12Meses_Grupo.aspx.vb" Inherits="MemberPages_Consulta12Meses" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>



<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc2" %>

<%@ Register src="../../Controles/wucListaGrupo_Subgrupo.ascx" tagname="wucListaGrupo_Subgrupo" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc1" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table cellspacing="1" >
        <tr>
            <td >
                <uc2:wucAno ID="cboAno" runat="server" />
            </td>
            <td >
                <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />                
            </td>
            <td style="width: 301px" >
                <uc4:wucListaGrupo_Subgrupo ID="cboGrupo" runat="server" />
            </td>
            <td >
                <uc1:wucBotaoExcel ID="btnExcel" runat="server" />
            </td>
            <td >
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
            </td>
        </tr>
    </table>
    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
        Width="1100px" KeyFieldName="idFilial" Theme="DevEx">
        <SettingsBehavior AllowFocusedRow="True" />
        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
            <Header HorizontalAlign="Center">
            </Header>
            <AlternatingRow BackColor="#EEEEEE">
            </AlternatingRow>
            <TitlePanel Font-Bold="True">
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
        <SettingsText EmptyDataRow="Não há nenhum realizado para este ano." />
        <Columns>
            <dxwgv:GridViewDataTextColumn FieldName="idFilial" VisibleIndex="2" 
                Caption="Cod" Width="40px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="3" 
                Caption="Nome da Filial" Width="150px">
                <CellStyle Wrap="False">
                </CellStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Janeiro" ReadOnly="True" 
                VisibleIndex="4">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Fevereiro" ReadOnly="True" 
                VisibleIndex="5">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Março" ReadOnly="True" 
                VisibleIndex="6">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Abril" ReadOnly="True" 
                VisibleIndex="7">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Maio" ReadOnly="True" VisibleIndex="8">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Junho" ReadOnly="True" 
                VisibleIndex="9">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Julho" ReadOnly="True" 
                VisibleIndex="10">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Agosto" ReadOnly="True" 
                VisibleIndex="11">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Setembro" ReadOnly="True" 
                VisibleIndex="12">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Outubro" ReadOnly="True" 
                VisibleIndex="13">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Novembro" ReadOnly="True" 
                VisibleIndex="14">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Dezembro" ReadOnly="True" 
                VisibleIndex="15">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Ano" ReadOnly="True" VisibleIndex="16" 
                Width="100px" Caption="Total Ano">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <CellStyle Font-Bold="True">
                </CellStyle>
                <FooterCellStyle Font-Bold="True">
                </FooterCellStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn ExportWidth="30" FieldName="Loja" 
                VisibleIndex="0" Width="0px">
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Ano" ExportWidth="30" FieldName="Anos" 
                VisibleIndex="1" Width="0px">
            </dxwgv:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFooter="True" showverticalscrollbar="True" 
            verticalscrollableheight="500" />
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
        SelectCommand="uspConsulta12Meses_SubGrupo_Filial" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="Ano" SessionField="sANO" 
                Type="Int16" />
            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
            <asp:SessionParameter Name="idCod" SessionField="sGRUPO" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <table cellspacing="1" class="style1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                <dxwgv:ASPxComboBox ID="ASPxComboBox1" runat="server" ValueType="System.String">
                </dxwgv:ASPxComboBox>
            </td>
        </tr>
    </table>
</asp:Content>

