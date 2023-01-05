<%@ Page Language="VB"  MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="ConsultaVendaMes.aspx.vb" Inherits="Ranking_ConsultaVendaMes" title="Venda por Mês" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="ASPxGridView1" GuiaNome="Venda Historica"  />
            </td>
        </tr>
        <tr>

            <td>
                <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="dsVendaMes" EnableTheming="True" 
                    KeyFieldName="Codloja" Theme="DevEx">
                    <GroupSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="Venda Total: {0:n0}" FieldName="vlrVenda" 
                            SummaryType="Sum" />
                    </GroupSummary>
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="Ano" GroupIndex="0" SortIndex="0" 
                            SortOrder="Descending" VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Mes" GroupIndex="1" SortIndex="1" 
                            SortOrder="Ascending" VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Filial" FieldName="Codloja" 
                            VisibleIndex="2">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" 
                            VisibleIndex="4">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="Descricao" 
                            VisibleIndex="3">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Styles>
	                    <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                    </Styles>
                    <Settings ShowGroupPanel="True" />
                    <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="dsVendaMes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                    
                    
                    SelectCommand="SELECT Ano ,Mes, Codloja, vlrVenda, Descricao FROM gerVendas.dbo.VendasMesAte2008  UNION ALL 
                                    SELECT Ano, Mes, Codloja, vlrVenda, Descricao 
									FROM [viewVendaRealMesSemApoio] AS a INNER JOIN DW.dbo.DimFilial AS b
									ON a.Codloja = b.idFilial
									WHERE b.IsLoja = 1">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

