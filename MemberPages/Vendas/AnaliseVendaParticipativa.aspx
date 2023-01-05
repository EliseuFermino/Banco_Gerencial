<%@ Page Title="Analise da Participação" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="AnaliseVendaParticipativa.aspx.vb" Inherits="MemberPages_Vendas_AnaliseVendaParticipativa" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <table style="border-collapse: collapse; width: 100%; float: left">
    <tr>
        <td>
            <table style="border-collapse: collapse; width: 100%; float: left">
                <tr>
                    <td style="width: 118px">
                        <uc1:wucAno ID="cboAno" runat="server" />
                    </td>
                    <td>
                        <uc2:wuciListaMes ID="cboMes" runat="server" />
                    </td>
                </tr>
            </table>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="descFilial" 
                Theme="Default">
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" 
                        SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" 
                        SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAT" SummaryType="Sum" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Dia" FieldName="descFilial" 
                        VisibleIndex="0" Width="60px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="1">
                        <Columns>
                            <dx:GridViewBandColumn Caption="Participação em %" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Dia" FieldName="percPartAA" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Acum" FieldName="percPartMA" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaAA" 
                                VisibleIndex="0" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle>
                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                    </dx:GridViewBandColumn>
                    <dx:GridViewBandColumn Caption="Ano Atual" VisibleIndex="5">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaAT" 
                                VisibleIndex="0" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle>
                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Participação em %" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Dia" FieldName="percPartAT" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Acum" FieldName="percCrescLucro" ToolTip="% Part. Acum" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                    </dx:GridViewBandColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowFooter="True" ShowVerticalScrollBar="True" 
                    VerticalScrollableHeight="400" />
                <Styles>
                    <Header HorizontalAlign="Center"></Header>
                    <AlternatingRow BackColor="#F9F9F9"></AlternatingRow>
                    <Footer Font-Bold="True"></Footer>
                    <GroupFooter Font-Bold="False"></GroupFooter>
                    <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                SelectCommand="Vendas.uspBuscarAnaliseVendaParticipativa" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

