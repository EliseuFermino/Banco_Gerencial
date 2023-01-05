<%@ Page Title="Nº Clientes Empresa Semana" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="numClientesEmpresaSemana.aspx.vb" Inherits="MemberPages_Gerencial_numClientesEmpresaSemana" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>

<%@ Register src="../../Controles/wuciAno.ascx" tagname="wuciAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaSemana.ascx" tagname="wuciListaSemana" tagprefix="uc2" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 102px;
        }
        .style4
        {
            width: 152px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <table cellspacing="1" class="style2">
            <tr>
                <td class="style3">
                    <uc1:wuciAno ID="cboAno" runat="server" />
                </td>
                <td class="style4">
                    <uc2:wuciListaSemana ID="cboSemana" runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <table cellspacing="1" class="style2">
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="gridNumCliente" runat="server" DataSourceID="dsDados" 
                        AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
                        CssPostfix="PlasticBlue" KeyFieldName="Dia">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
                            CssPostfix="PlasticBlue">
                            <Header ImageSpacing="10px" SortingImageSpacing="10px">
                            </Header>
                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
<AlternatingRow BackColor="#E6F2FF"></AlternatingRow>

                        </Styles>
                        <SettingsPager Mode="ShowAllRecords" ShowDefaultImages="False">
                            <AllButton Text="All">
                            </AllButton>
                            <NextPageButton Text="Next &gt;">
                            </NextPageButton>
                            <PrevPageButton Text="&lt; Prev">
                            </PrevPageButton>
                        </SettingsPager>
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="NumCliente" 
                                SummaryType="Sum" />
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
                        <SettingsText Title="Nº de Clientes" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="Dia" ReadOnly="True" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Nº Clientes" FieldName="NumCliente" 
                                ReadOnly="True" VisibleIndex="1">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Semana" VisibleIndex="2">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFooter="True" ShowTitlePanel="True" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="dsDados" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="Gerencial.uspBuscarNumeroClientesEmpresaSemana" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ano" SessionField="sANO" Type="String" />
                            <asp:SessionParameter Name="idSemana" SessionField="sSEMANA" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="vertical-align: middle">
                    Exportar
                    <asp:ImageButton ID="btnExportar" runat="server" 
                        ImageUrl="~/image/Excel-icon.png" />
                <br />
        <dxwgv:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dxwgv:ASPxGridViewExporter>
    </p>
</asp:Content>

