<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Lista_Programas.aspx.vb" Inherits="MemberPages_Manutencao_Lista_Programas" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" Theme="SoftOrange" Width="100%" AutoGenerateColumns="False">
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings HorizontalScrollBarMode="Visible" ShowFilterRow="True" ShowGroupPanel="True" VerticalScrollableHeight="600" VerticalScrollBarMode="Visible" />
        <SettingsResizing ColumnResizeMode="Control" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            
            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1">
                <Settings AllowAutoFilter="True" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>            

            <dx:GridViewDataTextColumn FieldName="MenuPrincipal" VisibleIndex="2" Width="150px" Caption="Menu Principal">
                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Sub-Menu" VisibleIndex="3" Width="150px" Caption="Sub-Menu">
                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Text" VisibleIndex="4" Width="300px" Caption="Nome do Programa (PGR)">
                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataHyperLinkColumn FieldName="NavigateURL" VisibleIndex="5" Caption="Programa">
                <PropertiesHyperLinkEdit Text="Abrir">
                </PropertiesHyperLinkEdit>
                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataHyperLinkColumn>

            <dx:GridViewDataTextColumn FieldName="IdPGR" VisibleIndex="6" Caption="PGR" ToolTip="Número do Programa">
                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="descPGR" VisibleIndex="7" Width="400px" Caption="Descrição do Programa">
                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Local" VisibleIndex="8">
                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            
        </Columns>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
        </Styles>
    </dx:ASPxGridView>

    		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" SelectCommand="Menu.usp_Lista_de_Programas" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>


</asp:Content>

