<%@ Page Title="BI - Operação Comercial" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="BI_OperComl.aspx.vb" Inherits="MemberPages_CentroCusto_BI_OperComl" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div>
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1" Height="600px">
            <Fields>
                <dx:PivotGridField ID="fieldAno" AreaIndex="0" FieldName="Ano">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMes" Area="ColumnArea" AreaIndex="0" FieldName="Mes">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFilial" AreaIndex="5" FieldName="Filial">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldidAgenda" AreaIndex="1" Caption="nº Agenda" FieldName="idAgenda">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldidCod" AreaIndex="2" Caption="ID no Resultado" FieldName="idCod">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSeo" AreaIndex="3" FieldName="Seção">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldvlr" Area="DataArea" AreaIndex="0" CellFormat-FormatString="{0:n0}" CellFormat-FormatType="Custom" FieldName="vlr" GrandTotalText="Total">
                    <ValueTotalStyle Font-Bold="False">
                    </ValueTotalStyle>
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAgenda" AreaIndex="4" Caption="Nome Agenda" FieldName="Agenda">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fielddescCod" Area="RowArea" AreaIndex="0" Caption="Nome da Conta" FieldName="descCod">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager Position="Bottom" RowsPerPage="20">
            </OptionsPager>
        </dx:ASPxPivotGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQL18_gerTran_SLV_ConnectionString %>" SelectCommand="Dados.uspBI_OperComl" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>

</asp:Content>

