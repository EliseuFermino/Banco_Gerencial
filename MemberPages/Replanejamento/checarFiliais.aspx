<%@ Page Title="Checar Participoação Filiais" Language="VB" MasterPageFile="~/MemberPages/SiteMetas.master" AutoEventWireup="false" CodeFile="checarFiliais.aspx.vb" Inherits="MemberPages_Replanejamento_checarFiliais" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style2" style="width: 102px">
                <uc1:wucAno ID="cboAno" runat="server" />
            </td>
            <td>
                <uc2:wuciListaMes ID="cboMes" runat="server" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <table class="auto-style1">
        <tr>
            <td>
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1" KeyFieldName="FilialLista" Theme="DevEx" 
                    Width="250px">
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" 
                            SummaryType="Average" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" 
                            VisibleIndex="0" Width="150px">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part." FieldName="percPart" 
                            ReadOnly="True" VisibleIndex="1">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <Styles>
                        	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                    </Styles>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings ShowFooter="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="500" />
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" 
                    SelectCommand="SELECT Ano ,Mes ,b.FilialLista ,SUM(perc) AS percPart  FROM gerMetas.Filial.tblRevSecao_Venda AS a INNER JOIN gerCadastros.Cadastros.tblCadFiliais AS b ON a.idFilial = b.Filial  WHERE Ano=@Ano AND Mes=@Mes AND idFilial<>99  GROUP BY  Ano ,Mes ,b.FilialLista  ORDER BY FilialLista">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
</p>
</asp:Content>

