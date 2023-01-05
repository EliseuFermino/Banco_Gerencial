<%@ Page Title="Consulta Produtividade GC por Filial" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="pgr_Metragem_Total_Todas_Filiais.aspx.vb" Inherits="MemberPages_pgr_Metragem_Total_Todas_Filiais" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >
     
        #divFilial {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">   

     <div id="divFilial">
         <dx:ASPxComboBox ID="cboCategoria" runat="server" EnableTheming="True"  Theme="Mulberry" AutoPostBack="false" >
             <Items>                 
                 <dx:ListEditItem Selected="True" Text="Resfriados" Value="2" />
                 <dx:ListEditItem Text="Congelados" Value="3" />
                 <dx:ListEditItem Text="Sorvetes" Value="4" />
             </Items>

         </dx:ASPxComboBox>
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

                    <dx:ASPxGridView ID="grid" runat="server" ClientInstanceName="grid" DataSourceID="dsDados" AutoGenerateColumns="False" Width="400px" Theme="SoftOrange">

                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" />
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>

                        <Columns>
                            <dx:GridViewDataTextColumn Caption="ID GC" FieldName="idProdutoGC" ShowInCustomizationForm="True" ToolTip="Identificador do GC por Cagtegoria" Width="50px" VisibleIndex="0" Visible="False">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Descrição G.GC" FieldName="FilialDesc" ShowInCustomizationForm="True" ToolTip="Descrição do GC da Categoria" VisibleIndex="1" Width="200px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="MetragemGC" ShowInCustomizationForm="True" ToolTip="Metragem da Categoria" VisibleIndex="2">
                                <CellStyle HorizontalAlign="Right">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n1}" FieldName="MetragemGC" SummaryType="Sum" />
                        </TotalSummary>

                        <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars> 

                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <Footer Font-Bold="True" Font-Size="Large">
                            </Footer>
                        </Styles>

                    </dx:ASPxGridView>
                                  
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="GC.usp_Metragem_Total_Todas_Filiais" SelectCommandType="StoredProcedure">
                        <SelectParameters>   
                            <asp:SessionParameter Name="idCategoria_Pereciveis_Linear" SessionField="sCATEGORIA" DbType="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>


