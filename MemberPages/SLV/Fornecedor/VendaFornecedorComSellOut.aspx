<%@ Page Title="Venda por Fornecedor com SellOut" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaFornecedorComSellOut.aspx.vb" Inherits="MemberPages_SLV_Fornecedor_VendaFornecedorComSellOut" %>

<%--<%@ OutputCache Duration="42000" VaryByParam="none" %>--%>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >
        
        #divDados {
           Clear: both;
           margin-left: 1px;
           padding-right: 5px;
           padding-top: 1px; 
           width: 100%;          
        }

        #divBotaoAtualizar {     
            float: left;       
            margin-left: 20px;
            width: 80px;  
            padding-top: 4px;                                         
        }

        #divSize {     
            float: left;       
            margin-left: 12px;  
                                                               
        }

    
        
        #divPeriodo {    
           float: left;                                
           padding-left: 5px;            
                     
        }

        #divCaptionExibir {    
           float: left;                                
           padding-left: 10px;     
           padding-top: 10px;                      
        }

        #divExibir {    
           float: left;                                
           padding-left: 10px;  
           padding-top: 5px;                         
        }

        #divCNPJ_Principal {    
           float: left;                                
           padding-left: 20px; 
           padding-top: 5px;                               
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 25px;
            margin-left: 1px;  
            margin-top: 2px;          
        }
  </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


        <div id="divPeriodo">
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />            
        </div>

        <div id="divCaptionExibir">
            Exibir:
        </div>

        <div id="divExibir">
            <dx:ASPxComboBox ID="cboExibir" runat="server" SelectedIndex="0" Width="85px" Theme="Mulberry" >
                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
                <Items>
                    <dx:ListEditItem Selected="True" Text="Todos" Value="1" />
                    <dx:ListEditItem Text="Margem" Value="2" />
                    <dx:ListEditItem Text="Lucro" Value="3" />
                </Items>
            </dx:ASPxComboBox>
        </div>

        <div id="divCNPJ_Principal">
            <dx:ASPxCheckBox ID="chkCNPJ_Principal" runat="server" Text ="Base CNPJ" CheckState="Unchecked" Theme="Mulberry">
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>


        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue">
                <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
         </div>

        <div id="divSize">
            <uc1:wucSize runat="server" ID="cboSize" AutoPostBack="false"    />
        </div>

        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
                        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" KeyFieldName="idFornecedor" Visible="False" Width="100%">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AT" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AT" SummaryType="Custom" />
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
                            <Columns>
                                <dx:GridViewBandColumn Caption="Fornecedor" ShowInCustomizationForm="True" ToolTip="Quadrante de Informações do Fornecedor" VisibleIndex="1" FixedStyle="Left">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Código" FieldName="idFornecedor" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" ToolTip="Código do Fornecedor">
                                            <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nome do Fornecedor" FieldName="nomeFornecedor" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px" ToolTip="Nome do Fornecedor">
                                            <Settings AutoFilterCondition="Contains" />
                                            <CellStyle Wrap="False">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>


                                <dx:GridViewBandColumn Caption="Volume" ShowInCustomizationForm="True" ToolTip="Quantidade de itens vendido por fornecedor." VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="QtdeAA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Quantidade de produtos vendidos do fornecedor" VisibleIndex="0" Width="90px" Name="QtdeAA">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="QtdeAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" Name="QtdeAT">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCresc_QtdeAA" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>


                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" ToolTip="Vendas de itens vendido por fornecedor." VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="vlrVendaAA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Quantidade de produtos vendidos do fornecedor" VisibleIndex="0" Width="90px" Name="vlrVendaAA">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" Name="vlrVendaAT">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCresc_vlrVendaAA" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                                <%--Margem--%>
                                <dx:GridViewBandColumn Caption="Margem" ShowInCustomizationForm="True" ToolTip="Percentual de Mergem dos itens vendido por fornecedor." VisibleIndex="3" Name="bandMargem">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="percMargemAA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Margem de produtos vendidos do fornecedor" VisibleIndex="0" Width="65px" Name="percMargemAA">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percMargemAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px" Name="percMargemAT">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="percMargemDif" ShowInCustomizationForm="True" ToolTip="Diferença de Percentual" VisibleIndex="2" Width="55px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>


                                <dx:GridViewBandColumn Caption="Lucro" ShowInCustomizationForm="True" ToolTip="Lucro dos itens vendido por fornecedor." VisibleIndex="3" Name="bandLucro">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="vlrLucroAA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Lucro dos produtos vendidos do fornecedor" VisibleIndex="0" Width="90px" Name="vlrLucroAA">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="vlrLucroAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" Name="vlrLucroAT">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCresc_vlrLucroAA" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                                <%--Margem Sell-Out--%>
                                <dx:GridViewBandColumn Caption="Margem Sell-Out" ShowInCustomizationForm="True" ToolTip="Percentual de Mergem com Sell-Out dos itens vendido por fornecedor." VisibleIndex="3" Name="bandMargemSellOut">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="percMargemSellOutAA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Margem com SellOut de produtos vendidos do fornecedor" VisibleIndex="0" Width="65px" Name="percMargemSellOutAA">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percMargemSellOutAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px" Name="percMargemSellOutAT">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="percMargemSellOutDif" ShowInCustomizationForm="True" ToolTip="Diferença de Percentual" VisibleIndex="2" Width="55px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>


                               <dx:GridViewBandColumn Caption="Lucro Sell-Out" ShowInCustomizationForm="True" ToolTip="Lucro com Sell-Out dos itens vendido por fornecedor." VisibleIndex="3" Name="bandLucroSellOut">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="LucroSellOutAA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Lucro com Sell-Out dos produtos vendidos do fornecedor" VisibleIndex="0" Width="90px" Name="LucroSellOutAA">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="LucroSellOutAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" Name="LucroSellOutAT">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCresc_LucroSellOutAA" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                                <%--Margem Praticada--%>
                               <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" ToolTip="Percentual de Margem Praticada dos itens vendido por fornecedor." VisibleIndex="3" Name="bandMargemPraticada">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="percMargemPraticadaAA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Margem Praticada de produtos vendidos do fornecedor" VisibleIndex="0" Width="65px" Name="percMargemPraticadaAA">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percMargemPraticadaAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px" Name="percMargemPraticadaAT">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="percMargemPraticadaDif" ShowInCustomizationForm="True" ToolTip="Diferença de Percentual" VisibleIndex="2" Width="55px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>


                               <dx:GridViewBandColumn Caption="Lucro Praticado" ShowInCustomizationForm="True" ToolTip="Lucro Praticado dos itens vendido por fornecedor." VisibleIndex="3" Name="bandLucroPraticado">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="vlrLucroPraticadoAA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Lucro Praticado dos produtos vendidos do fornecedor" VisibleIndex="0" Width="90px" Name="vlrLucroPraticadoAA">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="vlrLucroPraticadoAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" Name="vlrLucroPraticadoAT">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCresc_vlrLucroPraticadoAA" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>


                               <dx:GridViewDataTextColumn Caption="Rnk" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Ranking ou Posição do Fornecedor em ordem de maior venda" VisibleIndex="0" Width="35px" FixedStyle="Left">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>

                                <dx:GridViewBandColumn Caption="Valor do CAI" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="vlrCAI_AA" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="vlrCAI_AT" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Percentual do CAI" ShowInCustomizationForm="True" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="percCAI_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="65px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percCAI_AT" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager PageSize="15">
                            </SettingsPager>
                            <Settings ShowFilterRow="True" ShowFilterBar="Visible" ShowFilterRowMenuLikeItem="True" HorizontalScrollBarMode="Visible" ShowFooter="True" />
                            <SettingsText FilterBarClear="Limpar" FilterBarCreateFilter="Filtro" />
                            <SettingsLoadingPanel Text="Aguarde&amp;hellip;" />
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#EEEEEE">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFFCC" ForeColor="Blue">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Fornecedor.uspBuscarVendaComSellOut_Work" SelectCommandType="StoredProcedure"  >
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIAINICIAL" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIAFINAL" />
                                <asp:SessionParameter Name="BaseCNPJ" SessionField="sBASE_CNPJ" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

    

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Banco: gerManager" Anotacao2="Stored Procedure: Fornecedor.uspBuscarVendaComSellOut_Work" />

</asp:Content>

