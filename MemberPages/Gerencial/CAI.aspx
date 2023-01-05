<%@ Page Title="Total de Enxoval" Language="VB" MasterPageFile="~/MemberPages/SiteGerencial.master" AutoEventWireup="false" CodeFile="CAI.aspx.vb" Inherits="MemberPages_Gerencial_CAI" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      
    <table style="margin-left:2px">
        <tr >
            <td>
      
    <dx:ASPxPivotGrid ID="pivotGrid" runat="server" ClientIDMode="AutoID" 
        DataSourceID="SqlDataSource1" EnableTheming="True" Theme="DevEx">
        <Fields>
            <dx:PivotGridField ID="fieldAno" AreaIndex="0" Caption="Ano" FieldName="Ano">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fielddescMesCompleto" AreaIndex="0" Caption="Mês" 
                ExpandedInFieldsGroup="False" FieldName="descMesCompleto" Area="RowArea" SortMode="None">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fielddescQuadrimestre" AreaIndex="6" 
                Caption="Quadrimestre" ExpandedInFieldsGroup="False" 
                FieldName="descQuadrimestre">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldvlrCAI" Area="DataArea" AreaIndex="1" 
                Caption="vlr. CAI" FieldName="vlrCAI" CellFormat-FormatString="{0:n0}" CellFormat-FormatType="Numeric">
                <ValueTotalStyle Font-Bold="False">
                </ValueTotalStyle>
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldFilialLista" AreaIndex="1" Caption="Filial" 
                FieldName="FilialLista">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldvlrCAICalculado" Area="DataArea" AreaIndex="2" FieldName="vlrCAI_Calculado" Caption="vlrCAI Calculado" CellFormat-FormatString="{0:n0}" CellFormat-FormatType="Numeric">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldvlrVenda" Area="DataArea" AreaIndex="0" FieldName="vlrVenda" CellFormat-FormatString="{0:n0}" CellFormat-FormatType="Numeric">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldDepto" AreaIndex="2" FieldName="Depto">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldSecao" AreaIndex="3" FieldName="Secao">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldComprador" AreaIndex="4" FieldName="Comprador">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldGestor" AreaIndex="5" FieldName="Gestor">
            </dx:PivotGridField>
        </Fields>
        <OptionsPager RowsPerPage="50">
        </OptionsPager>
        <OptionsLoadingPanel Text="Aguarde. Atualizando...&amp;hellip;">
        </OptionsLoadingPanel>
        <OptionsData DataFieldUnboundExpressionMode="UseSummaryValues" />
    </dx:ASPxPivotGrid>
   
            </td>
        </tr>
    </table>
    <br />
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        SelectCommand="Gerencial.uspBuscarCAI" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
</asp:Content>

