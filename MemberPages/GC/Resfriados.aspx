
<%@ Page Title="Gerenciamento de Categorias" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Resfriados.aspx.vb" Inherits="MemberPages_GC_Resfriados" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divPeriodo {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }        

        #divGC {
            float: left;
            margin-left: 10px;
            margin-top: 10px;
        }

        #cboCategoriaGC {
            float: left;
            margin-left: 10px;
            margin-top: 9px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 10px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            width: 100%;
        }

        #divSize {            
            float: left;    
            margin-top: 4px;       
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


    <div id="divGC">
         <dx:ASPxComboBox ID="cboCategoria" runat="server" EnableTheming="True"  Theme="Mulberry" AutoPostBack="false" >
             <ClientSideEvents SelectedIndexChanged="function(s, e) {
	cboDetalhe.PerformCallback();

}" />
             <Items>                 
                 <dx:ListEditItem Selected="True" Text="Resfriados" Value="2" />
                 <dx:ListEditItem Text="Congelados" Value="3" />
                 <dx:ListEditItem Text="Sorvetes" Value="4" />
                 <dx:ListEditItem Text="Picolés" Value="5" />
             </Items>

         </dx:ASPxComboBox>
    </div>


    <div id="cboCategoriaGC">
        <dx:ASPxComboBox ID="cboDetalhe" runat="server" ClientInstanceName="cboDetalhe" Caption="Categorias: " EnableTheming="True"  Theme="Mulberry" DataSourceID="SqlDataSource1" TextField="descProdutoGC" ValueField="idProdutoGC" DropDownRows="15" AutoPostBack="False" >
             
         </dx:ASPxComboBox>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>"                                       
        SelectCommand="GC.usp_LIsta" SelectCommandType="StoredProcedure" >
        <SelectParameters>
            <asp:ControlParameter ControlID="cboCategoria" Name="idCategoria_Pereciveis_Linear" PropertyName="SelectedItem.Value" />
                 
        </SelectParameters>
    </asp:SqlDataSource>
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
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" Width="100%" Theme="SoftOrange" Visible="false">
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" />
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsResizing ColumnResizeMode="Control" />
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="FilialDesc" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Filial" Width="150px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="metragem_linear_atual" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Metragem &lt;br&gt; Linear Atual">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="volume_vendas" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Volume &lt;br&gt; Vendas">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Vendas">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Volume_Linear" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Volume &lt;br&gt; Linear">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Venda_Linear" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Venda &lt;br&gt; Linear">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="parametro" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Parâmetro">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                             <dx:GridViewDataTextColumn FieldName="Diferenca_Venda" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Diferença &lt;br&gt; Vendas">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Venda_Projetada" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Venda &lt;br&gt; Projetada">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Metro_Linear_Venda_Atual" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Metro Linear &lt;br&gt; Venda Atual">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Red_50_Perc" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Redução &lt;br&gt; 50%">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Diferenca_Metro_Linear" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Diferença &lt;br&gt; Metro Linear">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Lucro Total e Margem" ShowInCustomizationForm="True" VisibleIndex="13">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ShowInCustomizationForm="True" ToolTip="Percentual de Margem Total" VisibleIndex="1" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Perdas" ShowInCustomizationForm="True" VisibleIndex="14">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Divergência" FieldName="vlrDivergencia" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percDivergencia" ShowInCustomizationForm="True" VisibleIndex="1" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrAgenda23" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaTotal" ShowInCustomizationForm="True" VisibleIndex="5" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Perda Total" FieldName="vlrPerdaTotal" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAgenda23" ShowInCustomizationForm="True" VisibleIndex="3" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                        </Columns>
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="metragem_linear_atual" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="volume_vendas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Volume_Linear" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDivergencia" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAgenda23" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrPerdaTotal" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda_Linear" SummaryType="Average" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDivergencia" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAgenda23" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaTotal" SummaryType="Custom" />
                            
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Diferenca_Venda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda_Projetada" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Metro_Linear_Venda_Atual" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Diferenca_Metro_Linear" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Red_50_Perc" SummaryType="Sum" />
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
                            <AlternatingRow BackColor="#E2E2E2">
                            </AlternatingRow>
                            <FocusedRow BackColor="Yellow" ForeColor="Blue">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>                                  
                    
                    <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="GC.usp_Resfriados" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" Type="DateTime"  />
                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" Type="DateTime"  />   
                            <asp:SessionParameter Name="idCategoria" SessionField="sCATEGORIA" DbType="Byte"  /> 
                            <asp:SessionParameter Name="idProdutoGC" SessionField="sCATEGORIA_GC" DbType="Int16"  />       
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <br />
                    <br />

                    <dx:ASPxGridView ID="gridParametro" runat="server" AutoGenerateColumns="False" DataSourceID="dsParametro" Width="100%" Theme="SoftOrange" Visible="false">
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="110" VerticalScrollBarMode="Visible" ShowTitlePanel="True" />
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsResizing ColumnResizeMode="Control" />
                        <SettingsText Title="Paraâmetros" />
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="FilialDesc" ShowInCustomizationForm="True" VisibleIndex="1">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="metragem_linear_atual" ShowInCustomizationForm="True" VisibleIndex="2">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="volume_vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="4">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Volume_Linear" ShowInCustomizationForm="True" VisibleIndex="5">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Venda_Linear" ShowInCustomizationForm="True" VisibleIndex="6">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="parametro" ShowInCustomizationForm="True" VisibleIndex="7">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                             <dx:GridViewDataTextColumn FieldName="Diferenca_Venda" ShowInCustomizationForm="True" VisibleIndex="8">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Venda_Projetada" ShowInCustomizationForm="True" VisibleIndex="9">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Metro_Linear_Venda_Atual" ShowInCustomizationForm="True" VisibleIndex="10">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Red_50_Perc" ShowInCustomizationForm="True" VisibleIndex="12">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Diferenca_Metro_Linear" ShowInCustomizationForm="True" VisibleIndex="11">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Lucro Total e Margem" ShowInCustomizationForm="True" VisibleIndex="14">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ShowInCustomizationForm="True" ToolTip="Percentual de Margem Total" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                        </Columns>
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="metragem_linear_atual" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="volume_vendas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Volume_Linear" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda_Linear" SummaryType="Average" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                            
                      
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Diferenca_Venda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda_Projetada" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Metro_Linear_Venda_Atual" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Diferenca_Metro_Linear" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Red_50_Perc" SummaryType="Sum" />
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
                            <AlternatingRow BackColor="#E2E2E2">
                            </AlternatingRow>
                            <FocusedRow BackColor="Yellow" ForeColor="Blue">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>                                  
                    
                    <asp:SqlDataSource ID="dsParametro" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="GC.usp_Parametros" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" Type="DateTime"  />
                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" Type="DateTime"  />   
                            <asp:SessionParameter Name="idCategoria" SessionField="sCATEGORIA" DbType="Byte"  /> 
                            <asp:SessionParameter Name="idProdutoGC" SessionField="sCATEGORIA_GC" DbType="Int16"  />       
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:Label ID="lblError" runat="server" Text="TESTEEE" Visible ="true" ></asp:Label>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>


