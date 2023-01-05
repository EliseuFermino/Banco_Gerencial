<%@ Page Title="Análise de Supermercadistas" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseConc.aspx.vb" Inherits="MemberPages_Concorrrentes_AnaliseConc" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="auto-style2">
    <tr>
        <td>
            <table class="auto-style2">
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <table class="auto-style2">
                <tr>
                    <td>
                        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" 
                            DataSourceID="SqlDataSource1" Theme="DevEx">
                            <Fields>
                                <dx:PivotGridField ID="fieldNomeEstabFantasia" AreaIndex="0" 
                                    Caption="Supermercado" FieldName="NomeEstabFantasia" Area="RowArea">
                                </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldAno" AreaIndex="0" FieldName="Ano" 
                                    Area="ColumnArea">
                                </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldMes" AreaIndex="0" FieldName="Mes">
                                </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldvlr" AreaIndex="0" FieldName="vlr" Area="DataArea" 
                                    CellFormat-FormatString="{0:n0}" CellFormat-FormatType="Numeric" 
                                    TotalCellFormat-FormatString="{0:n0}" TotalCellFormat-FormatType="Numeric" 
                                    TotalValueFormat-FormatString="{0:n0}" TotalValueFormat-FormatType="Numeric" 
                                    ValueFormat-FormatString="{0:n0}" ValueFormat-FormatType="Numeric">
                                </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldTipoDesc" AreaIndex="1" Caption="Tipo" 
                                    FieldName="TipoDesc">
                                </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldBAINO" AreaIndex="2" Caption="Bairro" 
                                    FieldName="BAI_NO">
                                </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldcidregDesc" AreaIndex="3" Caption="Cidade" 
                                    FieldName="cidregDesc">
                                </dx:PivotGridField>
                                <dx:PivotGridField ID="fieldRua" AreaIndex="4" Caption="Rua" FieldName="Rua">
                                </dx:PivotGridField>
                            </Fields>
                            <OptionsPager RowsPerPage="100">
                            </OptionsPager>
                        </dx:ASPxPivotGrid>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerConcorConnectionString %>" 
                            SelectCommand="SELECT [NomeEstabFantasia], [Ano], [Mes], [vlr], [TipoDesc], [BAI_NO], [cidregDesc], [Rua] FROM [viewDadosConcorrentes]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <br />
        </td>
    </tr>
</table>
</asp:Content>

