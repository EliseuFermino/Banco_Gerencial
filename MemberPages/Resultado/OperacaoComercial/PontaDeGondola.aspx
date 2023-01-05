<%@ Page Title="Ponta de Gondola" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="PontaDeGondola.aspx.vb" Inherits="MemberPages_Resultado_OperacaoComercial_PontaDeGondola" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divFilial {            
            float: left;
            margin-left: 10px;
            margin-top: 2px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divSize {            
            float: left;           
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    
    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" Visible="False" />
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divBotaoExcel">
        <dx:ASPxButton ID="Exportar" runat="server" Text="Exportar Excel" Theme="Metropolis" Width="130px">
            <Image Url="~/image/Excel-icon.png">
            </Image>
        </dx:ASPxButton>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" ASPxPivotGridID="grid"></dx:ASPxPivotGridExporter>
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>



    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                    
                    <dx:ASPxPivotGrid ID="grid" runat="server" DataSourceID="dsDados" Height="100%" Width="100%">
                        <Fields>
                            <dx:PivotGridField ID="fieldFilialDesc" AreaIndex="0" Caption="Filial" FieldName="FilialDesc">
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <ValueStyle Wrap="False">
                                </ValueStyle>
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldAno" AreaIndex="0" FieldName="Ano" Area="RowArea">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldvlrOriginal" Area="DataArea" AreaIndex="0" Caption="Valor" CellFormat-FormatString="{0:n0}" CellFormat-FormatType="Custom" FieldName="vlrOriginal">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldMesDesc" Area="ColumnArea" AreaIndex="0" Caption="Mês" FieldName="MesDesc">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldnomeFornecedor" AreaIndex="1" Caption="Fornecedor" FieldName="nomeFornecedor">
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <ValueStyle Wrap="False">
                                </ValueStyle>
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldnumCondicao" AreaIndex="2" Caption="Nº Condição" FieldName="numCondicao">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldnumParcela" AreaIndex="3" Caption="Parcela" FieldName="numParcela">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldDiaEntrada" AllowedAreas="RowArea, ColumnArea, FilterArea" AreaIndex="6" Caption="Dia Entrada" CellFormat-FormatString="&nbsp;{0:dd/MM/yyyy} " CellFormat-FormatType="Custom" FieldName="DiaEntrada" ValueFormat-FormatString="d" ValueFormat-FormatType="DateTime">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldDiaVencimento" AllowedAreas="RowArea, ColumnArea, FilterArea" AreaIndex="4" Caption="Dia Vencimento" CellFormat-FormatType="DateTime" FieldName="DiaVencimento" ValueFormat-FormatString="{0:dd/MM/yyyy} " ValueFormat-FormatType="DateTime">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fieldDiaPagamento" AllowedAreas="RowArea, ColumnArea, FilterArea" AreaIndex="5" Caption="Dia Pagamento" CellFormat-FormatString="&nbsp;{0:dd/MM/yyyy} " CellFormat-FormatType="DateTime" FieldName="DiaPagamento" ValueFormat-FormatString="{0:dd/MM/yyyy} " ValueFormat-FormatType="DateTime">
                            </dx:PivotGridField>
                            <dx:PivotGridField ID="fielddescAgenda" AreaIndex="1" FieldName="descAgenda" Area="RowArea">
                            </dx:PivotGridField>
                        </Fields>
                        <OptionsPager Position="Top" RowsPerPage="20">
                        </OptionsPager>
                    </dx:ASPxPivotGrid>                        
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerContasReceberConnectionString2 %>" SelectCommand="usp_PontaDeGondola_Todas_por_Ano_Selecionado" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


</asp:Content>
