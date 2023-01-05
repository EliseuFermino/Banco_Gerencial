<%@ Page Title="DashBoard - Pontuacao" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="DashboardPontuacao.aspx.vb" Inherits="MemberPages_Checklist_DashboardPontuacao" %>

<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc1" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>


<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 208px;
        }
        .auto-style3 {
            width: 282px;
        }
        .auto-style4 {
            width: 332px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    
    <asp:UpdatePanel ID="panDash1" runat="server">
        <ContentTemplate>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <uc1:wuciListaLojasComApoio ID="cboFilial" runat="server" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3" style="vertical-align: top">

                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="AccessDataSource1" 
                            EnableTheming="True" Theme="DevEx" AutoGenerateColumns="False" KeyFieldName="myID" 
                            ClientInstanceName="masterGridView">
                           
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="myID" VisibleIndex="0" ReadOnly="True" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Ano" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="2" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="MesDesc" VisibleIndex="3" ReadOnly="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="idFilial" VisibleIndex="4" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataProgressBarColumn FieldName="Pontuacao" ReadOnly="True" VisibleIndex="5">
                                    <PropertiesProgressBar DisplayFormatString="" Height="" Width="">
                                    </PropertiesProgressBar>
                                </dx:GridViewDataProgressBarColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="300" />
                            <SettingsText Title="Pontuação Total - Últimos 12 Meses" />
                            <Styles>
                                <TitlePanel Font-Bold="True" Font-Size="Small">
                                </TitlePanel>
                            </Styles>
                             <ClientSideEvents FocusedRowChanged="function(s, e) {
	if (typeof(detailGridView) != 'undefined') detailGridView.PerformCallback(s.GetFocusedRowIndex());
	if (typeof(subDetailGridView) != 'undefined') subDetailGridView.PerformCallback(s.GetFocusedRowIndex());

}" />
                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="AccessDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Checklist.uspBuscar_TotalPontuacaoAnoMesGeral" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td style="vertical-align: top" class="auto-style4">
                        <dx:ASPxGridView ID="ASPxGridView2" runat="server" 
                            AutoGenerateColumns="False" ClientInstanceName="detailGridView" KeyFieldName="myID" 
                            OnCustomCallback="ASPxGridView2_CustomCallback" EnableTheming="True" Theme="DevEx">
                            
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="myID" ReadOnly="True" VisibleIndex="0" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="listaGrupo" VisibleIndex="5" Caption="Grupos" SortIndex="0" SortOrder="Ascending" Width="200px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataProgressBarColumn Caption="Pontuação" FieldName="Pontuacao" ReadOnly="True" VisibleIndex="6" Width="100px">
                                    <PropertiesProgressBar DisplayFormatString="" Height="" Width="">
                                    </PropertiesProgressBar>
                                </dx:GridViewDataProgressBarColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="300" />
                            <ClientSideEvents Init="function(s, e) {
	s.PerformCallback(masterGridView.GetFocusedRowIndex());
}" FocusedRowChanged="function(s, e) {
	if (typeof(subDetailGridView) != 'undefined') subDetailGridView.PerformCallback(s.GetFocusedRowIndex());
}" />
                            <SettingsText Title="Abertura - Grupos" />
                            <Styles>
                                <TitlePanel Font-Bold="True" Font-Size="Small">
                                </TitlePanel>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="AccessDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Checklist.uspBuscar_TotalPontuacaoAnoMesGrupo" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                    </td>
                    <td style="vertical-align: top">
                        <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" ClientInstanceName="subDetailGridView" EnableTheming="True" KeyFieldName="myID" OnCustomCallback="ASPxGridView2_CustomCallback" Theme="DevEx">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="myID" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Subgrupo" FieldName="listaSubgrupo" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="5" Width="200px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataProgressBarColumn Caption="Pontuação" FieldName="Pontuacao" ReadOnly="True" VisibleIndex="6" Width="100px">
                                    <PropertiesProgressBar DisplayFormatString="" Height="" Width="">
                                    </PropertiesProgressBar>
                                </dx:GridViewDataProgressBarColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="300" />
                            <ClientSideEvents Init="function(s, e) {
	s.PerformCallback(detailGridView.GetFocusedRowIndex());
}" />
                            <SettingsText Title="Abertura - Subgrupos" />
                            <Styles>
                                <TitlePanel Font-Bold="True" Font-Size="Small">
                                </TitlePanel>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="AccessDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Checklist.uspBuscar_TotalPontuacaoAnoMesSubgrupo" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <table cellspacing="1" class="auto-style1">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
<br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

