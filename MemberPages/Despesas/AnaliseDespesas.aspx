<%@ Page Title="Despesas - Análise" Language="VB" MasterPageFile="~/MemberPages/SiteDespesas.master" AutoEventWireup="false" CodeFile="AnaliseDespesas.aspx.vb" Inherits="MemberPages_Despesas_AnaliseDespesas" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="auto-style2">
    <tr>
        <td>
            <table class="auto-style2">
                <tr>
                    <td>
                        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" 
                            DataSourceID="SqlDataSource1" EnableTheming="True" Theme="DevEx">
                            <Fields>
                                <dx:PivotGridField ID="fieldAno" Area="ColumnArea" AreaIndex="0" 
                                    FieldName="Ano">
                                </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldMes" AreaIndex="0" FieldName="Mes">
                                </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldvlr" Area="DataArea" AreaIndex="0" Caption="Valor" 
                                    CellFormat-FormatString="{0:n0}" CellFormat-FormatType="Numeric" 
                                    FieldName="vlr">
                                </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldperc" AreaIndex="1" FieldName="perc" 
                                    CellFormat-FormatString="{0:n2}" CellFormat-FormatType="Numeric">
                                </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldSubGrupoDesc" AreaIndex="2" Caption="Subgrupo" 
                                    FieldName="SubGrupoDesc">
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldlistaGrupo" Area="RowArea" AreaIndex="0" 
                                    Caption="Grupo" FieldName="listaGrupo">
                                </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldFilialLista" AreaIndex="3" Caption="Filial" 
                                    FieldName="FilialLista">
                                </dx:PivotGridField>
                            </Fields>
                            <OptionsPager RowsPerPage="100">
                            </OptionsPager>
                            <Styles>
                                <FilterItemStyle Font-Bold="False" Font-Size="Smaller" Wrap="False">
                                </FilterItemStyle>
                            </Styles>
                        </dx:ASPxPivotGrid>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            SelectCommand="uspAnaliseDespesas" SelectCommandType="StoredProcedure">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <br />
        </td>
    </tr>
</table>
</asp:Content>

