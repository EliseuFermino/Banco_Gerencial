<%@ Page Title="Consultar Quadro de Lotes" Language="VB" MasterPageFile="~/MemberPages/Inventario/Programa/SiteInventario.master" AutoEventWireup="false" CodeFile="viewQuadroDeLotes.aspx.vb" Inherits="MemberPages_Inventario_Programa_viewQuadroDeLotes" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>






<%@ Register src="../../../Controles/wucEstatistica.ascx" tagname="wucEstatistica" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="border-collapse: collapse; width: 100%; float: left">
        <tr>
            <td align="left" style="width: 517px" valign="top">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="Lote" 
    Theme="PlasticBlue" Width="500px">
    <Columns>
        <dx:GridViewDataTextColumn Caption="Nivel" FieldName="descNivel" 
            VisibleIndex="1" Width="60">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="2"  Width="45">
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="1º Cont." FieldName="Cont1" ReadOnly="True" 
            VisibleIndex="3">
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="2º Cont." FieldName="Cont2" ReadOnly="True" 
            VisibleIndex="4">
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="3º Cont." FieldName="Cont3" ReadOnly="True" 
            VisibleIndex="5">
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Equipe" FieldName="CodEquipe" 
            VisibleIndex="6"  Width="60">
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
    </Columns>
        <SettingsText Title="Consultar Quadro de Lotes" />
    <Styles>
	    <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	    <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
    </Styles>

    <SettingsBehavior AllowFocusedRow="True" />
    <SettingsPager Mode="ShowAllRecords">
    </SettingsPager>
    <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
            ShowTitlePanel="True" />
</dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerInvConnectionString %>" 
        SelectCommand="Programa.uspViewLotesPorNivel" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="numInv" SessionField="sNUMINV" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
            <td align="left" valign="top">
                <asp:Panel ID="Panel1" runat="server">
                    <uc1:wucEstatistica ID="wucEstatistica1" runat="server" />
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>

