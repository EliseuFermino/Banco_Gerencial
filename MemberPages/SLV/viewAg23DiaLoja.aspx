<%@ Page Title="Agenda 23 por Dia" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="viewAg23DiaLoja.aspx.vb" Inherits="MemberPages_SLV_viewAg23DiaLoja" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>
<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <table align="left" cellpadding="0" 
        style="border-collapse: collapse; width: 900px; float: left">
        <tr>
            <td>
                <table align="left" cellpadding="0" width="900"  
                    style="border-collapse: collapse; width: 100%; float: left">
                    <tr>
                        <td style="width: 90px">
                            <uc1:wucAno ID="cboAno" runat="server" />
                        </td>
                        <td style="width: 100px">
                            <uc2:wuciListaMes ID="cboMes" runat="server" />
                        </td>
                        <td style="width: 200px">
                            <uc5:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                        </td>
                        <td>
                            <uc4:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
                        </td>
                        <td style="width: 80px ">
                                    <dx:ASPxCheckBox ID="chkVerTudo" runat="server" AutoPostBack="True" 
                                        CheckState="Unchecked" Text="Ver Tudo" Theme="DevEx">
                                    </dx:ASPxCheckBox>
                                </td>
                        <td></td>
                    </tr>
                </table>
                <table align="left" cellpadding="0" 
                    style="border-collapse: collapse; width: 100%; float: left">
                    <tr>
                        <td>
                            <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsAg23Dia" 
                                EnableTheming="True" Theme="DevEx" AutoGenerateColumns="False" 
                                Visible="False" KeyFieldName="Dia">
                                <GroupSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" ShowInGroupFooterColumn="Qtde" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTotal" ShowInGroupFooterColumn="Valor" SummaryType="Sum" />
                                </GroupSummary>
                                <Columns>
                                    <dx:GridViewDataDateColumn FieldName="Dia" VisibleIndex="0" 
                                        ToolTip="Dia do lançamento da agenda 23" Width="100px">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn FieldName="Qtde" VisibleIndex="1" 
                                        ToolTip="Quantidade informada na Agenda 23" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrTotal" VisibleIndex="2" 
                                        Caption="Valor" ToolTip="Valor total informado da Agenda 23" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:c}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda" FieldName="idAgenda" GroupIndex="0" SortIndex="0" SortOrder="Ascending" ToolTip="Agenda 23 = Lixo,  Agenda 51 = Falta de itens no estoque,  Agenda 52 = Sobra de itens no estoque" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" />
                                <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                <Settings ShowVerticalScrollBar="True" 
                                    VerticalScrollableHeight="300" ShowGroupFooter="VisibleAlways" />
                                <Styles>
	                                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                                <Header HorizontalAlign="Center">
                                    </Header>
	                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                    <Footer Font-Bold="True" ForeColor="Blue">
                                    </Footer>
                                    <GroupFooter Font-Bold="True">
                                    </GroupFooter>
                                </Styles>

                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="dsAg23Dia" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" 
                                SelectCommand="Analises.uspConsultaAgendasPerdasPorDia" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <table cellspacing="3" class="auto-style2">
                    <tr>
                        <td style="vertical-align: middle">Clique na
                <img alt="" class="auto-style1" src="../../image/SetaGridView.png" height="24" style="width: 22px" /> para abrir por dia.</td>
                    </tr>
                </table>
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
    </style>
</asp:Content>


