<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Uso_Consumo_Produto.aspx.vb" Inherits="MemberPages_Quebras_Uso_Consumo_Produto" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>


<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

            #divDados{
                clear:both ;
                width: 100%;
            }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divDados">

        a

        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="dsDados" Width="100%">
            <Fields>
                <dx:PivotGridField ID="fieldMes" Area="ColumnArea" AreaIndex="1" FieldName="Mes">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAno" Area="ColumnArea" AreaIndex="0" FieldName="Ano" SortOrder="Descending">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fielddescProdutoGrupoLista" Area="RowArea" AreaIndex="0" Caption="Grupo de Familia" FieldName="descProdutoGrupoLista">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:PivotGridField>
                <dx:PivotGridField ID="fielddescProdutoSubgrupoLista" Area="RowArea" AreaIndex="1" Caption="Familia" FieldName="descProdutoSubgrupoLista">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldvlrUsoConsumo" Area="DataArea" AreaIndex="0" FieldName="vlrUsoConsumo">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProduto" Area="RowArea" AreaIndex="2" Caption="Produto" FieldName="Produto">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:PivotGridField>
            </Fields>
            <OptionsPager EnableAdaptivity="True">
            </OptionsPager>
            <OptionsData AutoExpandGroups="False" />
        </dx:ASPxPivotGrid>
        <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="usp_UsuoConsumo_Ano_Mes" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="6" Name="idFilial" SessionField="sFILIAL" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

</asp:Content>

