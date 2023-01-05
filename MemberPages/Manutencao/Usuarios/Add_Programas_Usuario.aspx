<%@ Page Title="Adiciona Programa aos Usuarios" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Add_Programas_Usuario.aspx.vb" Inherits="MemberPages_Manutencao_Usuarios_Add_Programas_Usuario" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divFuncionarios">
        <dx:ASPxComboBox ID="cboMenuprincipal" runat="server" ValueType="System.String" IncrementalFilteringMode="Contains">

        </dx:ASPxComboBox>
    </div>

    <div id="divMenuPrincipal">

        <dx:ASPxGridView ID="gridMenuPrincipal" runat="server" DataSourceID="dsMenuPrincipal" AutoGenerateColumns="False" Width="500px">
            <Columns>
                <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width="50px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1" Width="60px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Text" VisibleIndex="2" Width="150px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ToolTip" VisibleIndex="3" Width="250px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="menuOrdem" VisibleIndex="4" Width="60px">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" ColumnResizeMode="Control" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Styles>
                <AlternatingRow BackColor="#E1E1E1">
                </AlternatingRow>
                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>

        <asp:SqlDataSource ID="dsMenuPrincipal" runat="server" ConnectionString="<%$ ConnectionStrings:ApplicationServices %>" SelectCommand="Menu.sp_USU_Menu_Principal" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

        <br />
        <strong>Total de Menu Principal:</strong>
        <asp:Label ID="lblCount_MenuPrincipal" runat="server" Font-Size="Medium"></asp:Label>

    </div>

</asp:Content>

