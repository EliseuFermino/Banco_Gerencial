<%@ Page Title="Comparativo Venda por Seção - Todas Lojas" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ComparativoVendaSecaoTodas.aspx.vb" Inherits="MemberPages_Gerencial_ComparativoVendaSecaoTodas" %>

<%@ Register src="../../Controles/wuciAno.ascx" tagname="wuciAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc2" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../Controles/wucAguarde.ascx" tagname="wucAguarde" tagprefix="uc3" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 108px;
        }
        .style4
        {
            width: 70px;
        }
        .style5
        {
            width: 310px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <table cellspacing="1" class="style2">
            <tr>
                <td class="style3" valign="middle">
                    <uc1:wuciAno ID="cboAno" runat="server" />
                </td>
                <td class="style5" valign="middle">
                    <asp:Panel ID="Panel1" runat="server" Height="42px" Width="300px">
                        <asp:CheckBox ID="chkMes1" runat="server" Text="Jan" TabIndex="1" />
                        &nbsp;<asp:CheckBox ID="chkMes2" runat="server" Text="Fev" TabIndex="2" />
                        &nbsp;<asp:CheckBox ID="chkMes3" runat="server" Text="Mar" TabIndex="3" />
                        &nbsp;<asp:CheckBox ID="chkMes4" runat="server" Text="Abr" TabIndex="4" />
                        &nbsp;<asp:CheckBox ID="chkMes5" runat="server" Text="Mai" TabIndex="5" />
                        &nbsp;<asp:CheckBox ID="chkMes6" runat="server" Text="Jun" TabIndex="6" />
                        &nbsp;&nbsp;<br />
                        <asp:CheckBox ID="chkMes7" runat="server" Text="Jul" TabIndex="7" />
                        &nbsp;
                        <asp:CheckBox ID="chkMes8" runat="server" Text="Ago" TabIndex="8" />
                        <asp:CheckBox ID="chkMes9" runat="server" Text="Set" TabIndex="9" />
                        &nbsp;
                        <asp:CheckBox ID="chkMes10" runat="server" Text="Out" TabIndex="10" />
                        &nbsp;<asp:CheckBox ID="chkMes11" runat="server" Text="Nov" TabIndex="11" />
&nbsp;<asp:CheckBox ID="chkMes12" runat="server" Text="Dez" TabIndex="12" />
&nbsp;
                    </asp:Panel>
                </td>
                <td class="style4" valign="middle">
                    <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar" />
                    <asp:Label ID="lblDesc" runat="server" Text="6"></asp:Label>
                </td>
                <td>
                    
                </td>
                <td>
                    <dxwgv:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                        FileName="Comparativo Venda Grupo" GridViewID="gridDados">
                    </dxwgv:ASPxGridViewExporter>
                </td>
            </tr>
        </table>
        <dxwgv:ASPxGridView ID="gridDados" runat="server" AutoGenerateColumns="False" 
            DataSourceID="dsDados" Width="800px" 
            CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
            CssPostfix="PlasticBlue" KeyFieldName="Ano">
            <SettingsBehavior AllowFocusedRow="True" />
            <Styles CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
                CssPostfix="PlasticBlue">
                <Header ImageSpacing="10px" SortingImageSpacing="10px" HorizontalAlign="Center">
                </Header>
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
            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" 
                Title="Comparativo de Vendas por Seção Acumulado" />
            <Columns>
                <dxwgv:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True"/>
                <dxwgv:GridViewDataTextColumn FieldName="Ano" VisibleIndex="1" Width="50px">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Filial" FieldName="descFilial" 
                    VisibleIndex="2" Width="100px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Depto" FieldName="descDepto" 
                    VisibleIndex="3" GroupIndex="0" SortIndex="0" SortOrder="Ascending" 
                    Width="100px">
                    <CellStyle Wrap="False">
                        <BorderLeft BorderColor="#6699FF" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Secão" FieldName="descSecao" 
                    VisibleIndex="4" GroupIndex="1" SortIndex="1" SortOrder="Ascending" 
                    Width="100px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                
                <dxwgv:GridViewDataTextColumn FieldName="QtdeAA" VisibleIndex="6" Width="80px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle>
                        <BorderLeft BorderColor="#6699FF" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Venda AA" FieldName="vlrVendaAA" 
                    VisibleIndex="7" Width="80px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAA" 
                    VisibleIndex="8" Width="60px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeAT" 
                    VisibleIndex="9" Width="80px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle>
                        <BorderLeft BorderColor="#6699FF" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaAT" 
                    VisibleIndex="10" Width="80px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAT" 
                    VisibleIndex="11" Width="60px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="Cresc" 
                    VisibleIndex="12" Width="60px" 
                    ToolTip="Diferença de crescimento entre venda atual e venda do ano anterior em %">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle>
                        <BorderLeft BorderColor="#6699FF" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dxwgv:GridViewDataTextColumn>
            </Columns>
            <Settings ShowGroupPanel="True" ShowTitlePanel="True" />
            <StylesEditors>
                <ProgressBar Height="25px">
                </ProgressBar>
            </StylesEditors>
        </dxwgv:ASPxGridView>
        <asp:SqlDataSource ID="dsDados" runat="server" 
            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
            SelectCommand="SLV.uspBuscarComparativoVendaSecaoTodas" 
            SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        Exportar
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="~/image/Excel-icon.png" />
    </p>
    </asp:Content>


