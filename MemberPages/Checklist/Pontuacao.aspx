<%@ Page Title="Resultados" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Pontuacao.aspx.vb" Inherits="MemberPages_CheckList_Pontuacao" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc5" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc6" %>

<%@ Register src="../../Controles/wuciAno.ascx" tagname="wuciAno" tagprefix="uc1" %>

<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style7
        {
            width: 100px;
        }
        .style8
        {
            width: 182px;
        }
        .style9
        {
            text-align: right;
            padding-right: 10px;
            width: 200px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
        <table class="style2">
            <tr>
                <td class="style7">
                    <uc1:wuciAno ID="cboAno" runat="server" />
                </td>
                <td class="style8">
                    <uc6:wuciListaMes ID="cboMes" runat="server" />
                </td>
                <td class="style9">
                    <uc3:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <table  class="style2">
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                        KeyFieldName="idGrupo" 
                        CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue">
                        <Templates>
                            <DetailRow>
                                <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" 
                                    AutoGenerateColumns="False" 
                                    CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                    DataSourceID="SqlDataSource2" 
                                    onbeforeperformdataselect="ASPxGridView2_BeforePerformDataSelect">
                                    <Styles CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
                                        CssPostfix="PlasticBlue">
                                        <Header ImageSpacing="10px" SortingImageSpacing="10px"></Header>
                                        <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
                                        <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
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
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="listaSubgrupo" 
                                            VisibleIndex="0">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="Semana 1" ReadOnly="True" 
                                            VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2} %" EncodeHtml="False"></PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Resultado 1" 
                                            ReadOnly="True" VisibleIndex="2">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="Semana 2" ReadOnly="True" 
                                            VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2} %" EncodeHtml="False"></PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Resultado 2" 
                                            ReadOnly="True" VisibleIndex="4">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="Semana 3" ReadOnly="True" 
                                            VisibleIndex="5">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2} %" EncodeHtml="False"></PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Resultado 3" 
                                            ReadOnly="True" VisibleIndex="6">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="Semana 4" ReadOnly="True" 
                                            VisibleIndex="7">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2} %" EncodeHtml="False"></PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Resultado 4" 
                                            ReadOnly="True" VisibleIndex="8">
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="Semana 5" ReadOnly="True" 
                                            VisibleIndex="9">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2} %" EncodeHtml="False"></PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Resultado 5" 
                                            ReadOnly="True" VisibleIndex="10">
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <StylesEditors>
                                        <ProgressBar Height="25px">
                                        </ProgressBar>
                                    </StylesEditors>                                   
                                </dxwgv:ASPxGridView>
                            </DetailRow>
                        </Templates>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
                            CssPostfix="PlasticBlue">
                            <Header ImageSpacing="10px" SortingImageSpacing="10px"></Header>
                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
                            <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>                           
                        </Styles>
                        <SettingsLoadingPanel Text="Aguarde. Processando...&amp;hellip;" />
                        <SettingsPager Mode="ShowAllRecords" ShowDefaultImages="False">
                            <AllButton Text="All">
                            </AllButton>
                            <NextPageButton Text="Next &gt;">
                            </NextPageButton>
                            <PrevPageButton Text="&lt; Prev">
                            </PrevPageButton>
                        </SettingsPager>
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2} %" FieldName="Semana 1" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem FieldName="Resultado 1" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2} %" FieldName="Semana 2" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem FieldName="Resultado 2" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2} %" FieldName="Semana 3" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2} %" FieldName="Semana 4" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2} %" FieldName="Semana 5" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem FieldName="Resultado 3" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem FieldName="Resultado 4" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem FieldName="Resultado 5" SummaryType="Custom" />
                        </TotalSummary>
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
                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e loja" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="listaGrupo" VisibleIndex="0" 
                                Caption="Descrição">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Semana 1" VisibleIndex="1" 
                                ReadOnly="True">
                                <PropertiesTextEdit DisplayFormatString="{0:n2} %" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Resultado 1" VisibleIndex="2" 
                                Caption="Status" ReadOnly="True">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Semana 2" VisibleIndex="3" 
                                ReadOnly="True">
                                <PropertiesTextEdit DisplayFormatString="{0:n2} %" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Resultado 2" VisibleIndex="4" 
                                Caption="Status" ReadOnly="True">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Semana 3" ReadOnly="True" 
                                VisibleIndex="5">
                                <PropertiesTextEdit DisplayFormatString="{0:n2} %" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Resultado 3" ReadOnly="True" 
                                VisibleIndex="6" Caption="Status">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Semana 4" ReadOnly="True" 
                                VisibleIndex="7">
                                <PropertiesTextEdit DisplayFormatString="{0:n2} %" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Resultado 4" ReadOnly="True" 
                                VisibleIndex="8" Caption="Status">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Semana 5" ReadOnly="True" 
                                VisibleIndex="9">
                                <PropertiesTextEdit DisplayFormatString="{0:n2} %" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Resultado 5" ReadOnly="True" 
                                VisibleIndex="10" Caption="Status">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFooter="True" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                        <SettingsDetail ShowDetailRow="True" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <table  class="style2">
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="Checklist.usp_BuscarResultadoPorSemanaGrupo" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
            SelectCommand="Checklist.usp_BuscarResultadoPorSemanaSubgrupo" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="ano" SessionField="sANO" Type="Int16" />
                <asp:SessionParameter Name="mes" SessionField="sMES" Type="Byte" />
                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    
</asp:Content>

