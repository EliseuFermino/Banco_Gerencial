<%@ Page Title="Total de Enxoval" Language="VB" MasterPageFile="~/MemberPages/SiteGerencial.master" AutoEventWireup="false" CodeFile="Enxoval.aspx.vb" Inherits="MemberPages_Gerencial_Enxoval" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
      
    <table style="margin-left:2px">
        <tr >
            <td>
      
    <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" 
        DataSourceID="SqlDataSource1" EnableTheming="True" Theme="DevEx">
        <Fields>
            <dx:PivotGridField ID="fieldAno" AreaIndex="0" Caption="Ano" FieldName="Ano">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fielddescMesCompleto" AreaIndex="2" Caption="Mês" 
                ExpandedInFieldsGroup="False" FieldName="descMesCompleto">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fielddescQuadrimestre" Area="RowArea" AreaIndex="0" 
                Caption="Quadrimestre" ExpandedInFieldsGroup="False" 
                FieldName="descQuadrimestre">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldvlr" Area="DataArea" AreaIndex="0" 
                Caption="vlr. Enxoval" FieldName="vlr">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldFilialLista" AreaIndex="1" Caption="Filial" 
                FieldName="FilialLista">
            </dx:PivotGridField>
        </Fields>
        <OptionsPager RowsPerPage="50">
        </OptionsPager>
        <OptionsLoadingPanel Text="Aguarde. Atualizando...&amp;hellip;">
        </OptionsLoadingPanel>
    </dx:ASPxPivotGrid>
   
            </td>
        </tr>
    </table>
    <br />
   
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        SelectCommand="Gerencial.uspBuscarTotalEnxoval" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
</asp:Content>

