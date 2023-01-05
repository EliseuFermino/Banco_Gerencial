<%@ Page Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="menuRankingDiario.aspx.vb" Inherits="Ranking_menuRankingDiario" title="Vendas por Dia" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>

<%@ Register src="../../Controles/wuciListaDia.ascx" tagname="wuciListaDia" tagprefix="uc1" %>
<%@ Register src="../../Controles/wucListaDia.ascx" tagname="wucListaDia" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
              <table class="style1">
        <tr>
            <td style="width: 309px">
                <uc2:wucListaDia ID="cboDia" runat="server" />
            </td>
            <td>
                <dxe:ASPxCheckBox ID="chkFixar" runat="server" AutoPostBack="True" 
                    Checked="True" CheckState="Checked" Text="Fixar cabeçalho" Theme="DevEx">
                </dxe:ASPxCheckBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
        <td valign="top" style="width: 647px" colspan="3">
            <dxwgv:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
                DataSourceID="dsVendasDiarias" EnableTheming="True" KeyFieldName="FilialLista" 
                Theme="DevEx">
                <TotalSummary>
                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" 
                        SummaryType="Sum" />
                </TotalSummary>
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" 
                        VisibleIndex="0" Width="150px">
                        <CellStyle HorizontalAlign="Left" Wrap="False">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" 
                        ToolTip="Valor da venda da loja no dia selecionado" VisibleIndex="1" 
                        Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem" 
                        ToolTip="Percentual de margem da loja do dia selecionado" VisibleIndex="2" 
                        Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowFooter="True" ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                    VerticalScrollableHeight="400" />
                <SettingsText Title="Consulta Venda por Dia" 
                    EmptyDataRow="Não há vendas para este dia." />
                <Styles>
                    <Footer Font-Bold="True">
                    </Footer>
                    <TitlePanel Font-Size="Small"></TitlePanel>
	                <FocusedRow ForeColor="#0066FF"> </FocusedRow>
	                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                </Styles>
            </dxwgv:ASPxGridView>
            <asp:SqlDataSource ID="dsVendasDiarias" runat="server" 
                ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                SelectCommand="uspRankingDiarioBusca" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DbType="Date" Name="dia" SessionField="sDIA" />
                </SelectParameters>
            </asp:SqlDataSource>
            </td>
    </tr>
    </table>
        </ContentTemplate>
    </asp:UpdatePanel>
 
</asp:Content>

