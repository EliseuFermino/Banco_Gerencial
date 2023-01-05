<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="NumClienteBI.aspx.vb" Inherits="MemberPages_Projetos_NumClienteBI" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1" Theme="DevEx">
        <Fields>
            <dx:PivotGridField ID="fieldAno" Area="ColumnArea" AreaIndex="0" FieldName="Ano">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldDescMes" Area="RowArea" AreaIndex="0" FieldName="DescMes">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldFilialLista" AreaIndex="0" FieldName="FilialLista">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldNumCliente" Area="DataArea" AreaIndex="0" CellFormat-FormatString="{0:n0}" CellFormat-FormatType="Numeric" FieldName="NumCliente" GrandTotalCellFormat-FormatString="{0:n0}" GrandTotalCellFormat-FormatType="Numeric" GrandTotalText="Total" TotalCellFormat-FormatString="{0:n0}" TotalCellFormat-FormatType="Numeric" TotalValueFormat-FormatString="{0:n0}" TotalValueFormat-FormatType="Numeric" ValueFormat-FormatString="{0:n0}" ValueFormat-FormatType="Numeric">
                <ValueTotalStyle Font-Bold="True">
                </ValueTotalStyle>
            </dx:PivotGridField>
        </Fields>
        <OptionsPager RowsPerPage="20">
        </OptionsPager>
    </dx:ASPxPivotGrid>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Gerencial.uspViewNumeroClientesLoja_Mes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>

