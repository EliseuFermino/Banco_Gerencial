<%@ Page Title="Margem Negativa por Loja" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Margem_Negativa_Item.aspx.vb" Inherits="MemberPages_SLV_Margem_Margem_Negativa_Item" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divPeriodo {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }        

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 1px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divSize {            
            float: left;           
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }



    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divPeriodo">
        <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>


    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Setting-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

                                         <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False"                       
                        DataSourceID="dsItem" Width="100%" Font-Size="Medium" 
                        KeyFieldName="CodProduto" Theme="PlasticBlue" EnableTheming="True">
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                         <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Styles>                             
                            <Header ImageSpacing="5px" SortingImageSpacing="5px" Font-Size="Small" HorizontalAlign="Center"></Header>
                            <FocusedRow BackColor="Yellow" ForeColor="#0066FF"> </FocusedRow>
                            <AlternatingRow BackColor="#EAEAEA"></AlternatingRow>
                            <FilterRow Font-Size="Small">
                            </FilterRow>
                            
                            <Cell Font-Size="Small">
                            </Cell>
                            <GroupPanel Font-Size="Medium">
                            </GroupPanel>
                            <FilterCell Font-Size="Small">
                            </FilterCell>
                            <TitlePanel Font-Bold="True" Font-Size="Larger">
                            </TitlePanel>
                            <FilterBar Font-Size="Small">
                            </FilterBar>
                        </Styles>

                                             

                        <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="Itens c/ margem negativa {0:n0}" 
                                FieldName="CodProduto" SummaryType="Count" />
                        </GroupSummary>

                         <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>



                        <Images >
                            <FilterRowButton Height="13px" Width="13px" />
                        </Images>
                        <SettingsText Title="Consulta itens com margem negativa - por Filial" 
                            GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="FilialDesc" VisibleIndex="0" 
                                Caption="Filial">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="idProduto" VisibleIndex="1" 
                                Caption="Produto">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="percSellOut" VisibleIndex="6" 
                                Caption="% Mrg Final">
                                <Settings AllowAutoFilter="False" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="percPDV" VisibleIndex="5" 
                                Caption="% Mrg PDV">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <HeaderStyle HorizontalAlign="Center" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nomeProduto" ReadOnly="True" 
                                VisibleIndex="2" Caption="Nome do Produto">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="R$ Lucro PDV" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="4">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                        </Columns>
                                                        <SettingsPager PageSize="25">
                                                            <Summary AllPagesText="Páginas: {0} - {1} ({2} produtoss)" Text="Paginá {0} of {1} ({2} produtos)" />
                                                            <PageSizeItemSettings Caption="Tamanho da Página:">
                                                            </PageSizeItemSettings>
                                                        </SettingsPager>
                        <Settings ShowVerticalScrollBar="True" ShowFilterRow="True" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dx:ASPxGridView>
                       
                    
                                        <asp:SqlDataSource ID="dsItem" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Margem.usp_Itens_Com_Margem_Negativa_Todas_Lojas" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" Type="DateTime"  />
                                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" Type="DateTime"  />                            
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>

