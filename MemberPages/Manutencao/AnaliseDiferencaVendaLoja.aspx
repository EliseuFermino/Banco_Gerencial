<%@ Page Title="Análise de Diferença de Vendas" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseDiferencaVendaLoja.aspx.vb" Inherits="MemberPages_Manutencao_AnaliseDiferencaVendaLoja" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="../../Controles/wuciAno.ascx" tagname="wuciAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>

<%@ Register src="../../Controles/wucAnoMes.ascx" tagname="wucAnoMes" tagprefix="uc3" %>

<%@ Register src="../../Controles/wuciListaDia.ascx" tagname="wuciListaDia" tagprefix="uc4" %>
<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc5" %>



<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc6" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <table class="auto-style2">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="auto-style2">
                                <tr>
                                    <td>
                                        <uc6:wucAno ID="cboAno" runat="server" />
                                    </td>
                                    <td>
                                        <uc2:wuciListaMes ID="cboMes" runat="server" />
                                    </td>
                                    <td>
                                        <uc5:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
                                            EnableTheming="True" KeyFieldName="Dia" Theme="SoftOrange" Width="350px" DataSourceID="SqlDataSource1">
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaRanking" 
                                                    SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaSLV" 
                                                    SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDif" 
                                                    SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="Dias: {0:n0}" FieldName="Dia" SummaryType="Count" />
                                            </TotalSummary>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Dia" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Ranking" FieldName="vlrVendaRanking" 
                                                    VisibleIndex="1" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="SLV (Oracle)" FieldName="vlrVendaSLV" 
                                                    VisibleIndex="2" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif" FieldName="vlrDif" VisibleIndex="3" 
                                                    Width="70px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" />
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <settings showverticalscrollbar="True" verticalscrollableheight="350" 
                                                ShowFooter="True" />
                                            <Styles>
                                                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                                                </FocusedRow>
                                                <AlternatingRow BackColor="#EEEEEE">
                                                </AlternatingRow>
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQL18_gerTran_VendasConnectionString %>" SelectCommand="Vendas.usp_BuscarDiferencaEntrePROGRESS_x_SQL14" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        * A venda &quot;SLV&quot; é a soma de todos os Subgrupos. A Venda SLV(Oracle) vem direto da tabela do Oracle.<br /> </td>
                                    <td style="vertical-align: top; text-align: left">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Vertical">
                                            <AlternatingRowStyle BackColor="White" />
                                            <Columns>
                                                <asp:CommandField SelectText="S" ShowSelectButton="True" />
                                                <asp:BoundField DataField="descTipo" HeaderText="descTipo" />
                                                <asp:BoundField DataField="Ordem" HeaderText="Ordem" />
                                                <asp:BoundField DataField="Ano" HeaderText="Ano" />
                                                <asp:BoundField DataField="Mes" HeaderText="Mes" />
                                                <asp:BoundField DataField="nomeTabela" HeaderText="nomeTabela" />
                                                <asp:BoundField DataField="VemDo" HeaderText="Vem Do" />
                                                <asp:BoundField DataField="descPeriodo" HeaderText="descPeriodo" />
                                                <asp:BoundField DataField="idFilial" HeaderText="idFilial" />
                                                <asp:BoundField DataField="vlrVenda" DataFormatString="{0:n2}" HeaderText="vlrVenda" />
                                                <asp:BoundField DataField="vlrCheck" DataFormatString="{0:n2}" HeaderText="vlrCheck" />
                                                <asp:BoundField DataField="Diferença" DataFormatString="{0:n2}" HeaderText="Diferença" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCC99" /> 
                                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                            <RowStyle BackColor="#F7F7DE" />
                                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                            <SortedAscendingHeaderStyle BackColor="#848384" />
                                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                            <SortedDescendingHeaderStyle BackColor="#575357" />
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:gerKnowledgeConnectionString %>" SelectCommand="uspCheckarDiferençasVendaSLV_Loja" SelectCommandType="StoredProcedure">
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
                </td>
            </tr>
        </table>
        <br />
    </p>
    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma"  />
</asp:Content>

