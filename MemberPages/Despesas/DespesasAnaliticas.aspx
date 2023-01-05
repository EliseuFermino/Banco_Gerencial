<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="DespesasAnaliticas.aspx.vb" Inherits="MemberPages_Despesas_DespesasAnaliticas" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="SqlDataSource1">
        <Fields>
            <dx:PivotGridField ID="fieldANO" AreaIndex="0" FieldName="ANO">
            </dx:PivotGridField>
        </Fields>
    </dx:ASPxPivotGrid>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="SELECT [ANO], [FilialDesc], [CODIGO], [AGENDA], [SECAO], [FONTE], [VALOR], [DESCRICAO], [DATA], [NOTA], [OBSERVACOES], [CCUSTO], [GrupoDesc], [idGrupo], [idSubgrupo], [SubGrupoDesc], [MesDesc], [MesDescReduzido], [desc_AnoMes] FROM [vw_DespersasJair]"></asp:SqlDataSource>
</asp:Content>

