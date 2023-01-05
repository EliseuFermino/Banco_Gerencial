<%@ Page Title="Estoque CD" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="EstoqueCD_Classif_Giro.aspx.vb" Inherits="MemberPages_Estoque_EstoqueCD_Classif_Giro" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

      <style type ="text/css" >

        #divFilial {            
            float: left;
            margin-left: 10px;
            margin-top: 4px;
        }
       
        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }


        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
            margin-bottom: 1px;
            margin-top: 1px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 1px;
            width: 100%;
        }

        #divSize {            
            float: left;     
            margin-top: 2px;      
        }


    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server"> 

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>


    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />

    </div>

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent>


                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="Depto" Width="100%" EnableTheming="True" Theme="SoftOrange">
                        
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeEstoque" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalEstoque" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Valor" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Cobertura" SummaryType="Custom" />
                        </TotalSummary>
                        <GroupSummary>                            
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Qtde" SummaryType="Sum" ShowInGroupFooterColumn="MDV_Qtde"/>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Valor" SummaryType="Sum" ShowInGroupFooterColumn="MDV_Valor"/>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeEstoque" ShowInGroupFooterColumn="Qtde. em &lt;br /&gt; Estoque" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Cobertura" SummaryType="Custom" ShowInGroupFooterColumn="Cobertura"/>
                        </GroupSummary>


                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn FieldName="Depto" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px" Caption="Departamento" FixedStyle="Left">
                                <Settings AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="QtdeEstoque" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Qtde. em &lt;br /&gt; Estoque">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Cobertura" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Dias de &lt;br /&gt; Cobertura" ToolTip="Cobertura de Quantidade de Vendas. (Quantidade de Vendas / Quantidade de Estoque)" UnboundType="Decimal">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="GreaterOrEqual" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Custo &lt;br /&gt; Condor" FieldName="vlrCustoCondor" ShowInCustomizationForm="True" VisibleIndex="8">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Total em &lt;br /&gt; Estoque" FieldName="TotalEstoque" ShowInCustomizationForm="True" VisibleIndex="9" ReadOnly="True">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Embalagem" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Estoque por &lt;br /&gt; Embalagem" FieldName="Caixa" ShowInCustomizationForm="True" ToolTip="Estoque por tipo de Embalagem." VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="Silver" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="Silver" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="MDV - 120 Dias" ShowInCustomizationForm="True" ToolTip="Média de Vendas por Dia por Quantidade com base nos últimos 120 dias - 4 Meses." VisibleIndex="4">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="MDV_Qtde" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="MDV_Valor" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsDetail ShowDetailRow="True" />
                        <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit">
                        </SettingsAdaptivity>
                        <Templates>
                            <DetailRow>
                                <br />
                                <dx:ASPxGridView ID="gridDetail_Secao" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados_Secao" EnableTheming="True" KeyFieldName="Depto" Theme="SoftOrange" Width="100%" ClientInstanceName="gridDetail_Secao" OnBeforePerformDataSelect="gridDetail_Secao_BeforePerformDataSelect">
                                    <SettingsDetail ShowDetailRow="True" />
                                    <Templates>
                                        <DetailRow>
                                            <br />
                                            <dx:ASPxGridView ID="gridDetail_Grupo" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridDetail_Grupo" DataSourceID="dsDados_Grupo" EnableTheming="True" KeyFieldName="Secao" OnBeforePerformDataSelect="gridDetail_Grupo_BeforePerformDataSelect" Theme="SoftOrange" Width="100%">
                                                <SettingsDetail ShowDetailRow="True" />
                                                <SettingsPager PageSize="17">
                                                </SettingsPager>
                                                <Settings HorizontalScrollBarMode="Auto" ShowFilterRow="True" ShowFooter="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" ShowTitlePanel="True" VerticalScrollableHeight="150" VerticalScrollBarMode="Auto" />
                                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                                <SettingsResizing ColumnResizeMode="Control" />
                                                <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                                                <SettingsText EmptyDataRow="Não há informação de Estoque" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                                                <Columns>
                                                    <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn Caption="Grupo" FieldName="Grupo" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                                                        <Settings AutoFilterCondition="Contains" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Qtde. em &lt;br /&gt; Estoque" FieldName="QtdeEstoque" ShowInCustomizationForm="True" VisibleIndex="7" Width="85px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dias de &lt;br /&gt; Cobertura" FieldName="Cobertura" ShowInCustomizationForm="True" ToolTip="Cobertura de Quantidade de Vendas. (Quantidade de Vendas / Quantidade de Estoque)" UnboundType="Decimal" VisibleIndex="6" Width="70px">
                                                        <Settings AllowAutoFilter="True" AutoFilterCondition="GreaterOrEqual" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Custo &lt;br /&gt; Condor" FieldName="vlrCustoCondor" ShowInCustomizationForm="True" VisibleIndex="8" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Total em &lt;br /&gt; Estoque" FieldName="TotalEstoque" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewBandColumn Caption="Embalagem" ShowInCustomizationForm="True" VisibleIndex="11">
                                                        <HeaderStyle BackColor="Silver" />
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="Estoque por &lt;br /&gt; Embalagem" FieldName="Caixa" ShowInCustomizationForm="True" ToolTip="Estoque por tipo de Embalagem." VisibleIndex="0" Width="90px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <HeaderStyle BackColor="Silver" />
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>
                                                    <dx:GridViewBandColumn Caption="MDV - 120 Dias" ShowInCustomizationForm="True" ToolTip="Média de Vendas por Dia por Quantidade com base nos últimos 120 dias - 4 Meses." VisibleIndex="4">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="Qtde" FieldName="MDV_Qtde" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                                </PropertiesTextEdit>
                                                                <Settings AllowAutoFilter="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Valor" FieldName="MDV_Valor" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <Settings AllowAutoFilter="False" />
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>
                                                </Columns>
                                                <TotalSummary>
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeEstoque" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalEstoque" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Qtde" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Valor" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Cobertura" SummaryType="Custom" />
                                                </TotalSummary>
                                                <GroupSummary>
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Qtde" ShowInGroupFooterColumn="MDV_Qtde" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Valor" ShowInGroupFooterColumn="MDV_Valor" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeEstoque" ShowInGroupFooterColumn="Qtde. em &lt;br /&gt; Estoque" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Cobertura" ShowInGroupFooterColumn="Cobertura" SummaryType="Custom" />
                                                </GroupSummary>
                                                <Styles>
                                                    <Header HorizontalAlign="Center">
                                                    </Header>
                                                    <AlternatingRow BackColor="#F3F3F3">
                                                    </AlternatingRow>
                                                    <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                                                    </FocusedRow>
                                                    <Footer Font-Bold="True">
                                                    </Footer>
                                                </Styles>



                                            </dx:ASPxGridView>
                                        </DetailRow>
                                    </Templates>
                                    <SettingsPager PageSize="17">
                                    </SettingsPager>
                                    <Settings HorizontalScrollBarMode="Auto" ShowFilterRow="True" ShowFooter="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" ShowTitlePanel="True" VerticalScrollableHeight="150" VerticalScrollBarMode="Auto" />
                                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                    <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                                    <SettingsText EmptyDataRow="Não há informação de Estoque" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn Caption="Secao" FieldName="Secao" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                                            <Settings AutoFilterCondition="Contains" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Qtde. em &lt;br /&gt; Estoque" FieldName="QtdeEstoque" ShowInCustomizationForm="True" VisibleIndex="7" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dias de &lt;br /&gt; Cobertura" FieldName="Cobertura" ShowInCustomizationForm="True" ToolTip="Cobertura de Quantidade de Vendas. (Quantidade de Vendas / Quantidade de Estoque)" UnboundType="Decimal" VisibleIndex="6" Width="70px">
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="GreaterOrEqual" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Custo &lt;br /&gt; Condor" FieldName="vlrCustoCondor" ShowInCustomizationForm="True" VisibleIndex="8" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Total em &lt;br /&gt; Estoque" FieldName="TotalEstoque" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewBandColumn Caption="Embalagem" ShowInCustomizationForm="True" VisibleIndex="11">
                                            <HeaderStyle BackColor="Silver" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Estoque por &lt;br /&gt; Embalagem" FieldName="Caixa" ShowInCustomizationForm="True" ToolTip="Estoque por tipo de Embalagem." VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="Silver" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="MDV - 120 Dias" ShowInCustomizationForm="True" ToolTip="Média de Vendas por Dia por Quantidade com base nos últimos 120 dias - 4 Meses." VisibleIndex="4">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Qtde" FieldName="MDV_Qtde" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="MDV_Valor" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                    <TotalSummary>
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeEstoque" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalEstoque" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Qtde" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Valor" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Cobertura" SummaryType="Custom" />
                                    </TotalSummary>
                                    <GroupSummary>
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Qtde" ShowInGroupFooterColumn="MDV_Qtde" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Valor" ShowInGroupFooterColumn="MDV_Valor" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeEstoque" ShowInGroupFooterColumn="Qtde. em &lt;br /&gt; Estoque" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Cobertura" ShowInGroupFooterColumn="Cobertura" SummaryType="Custom" />
                                    </GroupSummary>
                                    <Styles>
                                        <Header HorizontalAlign="Center">
                                        </Header>
                                        <AlternatingRow BackColor="#F3F3F3">
                                        </AlternatingRow>
                                        <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                                        </FocusedRow>
                                        <Footer Font-Bold="True">
                                        </Footer>
                                    </Styles>
                                </dx:ASPxGridView>
                            </DetailRow>
                        </Templates>
                        <SettingsPager PageSize="17">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="600" VerticalScrollBarMode="Auto" ShowFilterRow="True" ShowGroupPanel="True" ShowGroupFooter="VisibleAlways" />
                        <SettingsText EmptyDataRow="Não há informação de Estoque" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <SettingsResizing ColumnResizeMode="Control" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>  
                    
                    
<%--                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="idProduto" Width="100%" EnableTheming="True" Theme="SoftOrange">
                        
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeEstoque" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalEstoque" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Valor" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Cobertura" SummaryType="Custom" />
                        </TotalSummary>
                        <GroupSummary>                            
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Qtde" SummaryType="Sum" ShowInGroupFooterColumn="MDV_Qtde"/>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MDV_Valor" SummaryType="Sum" ShowInGroupFooterColumn="MDV_Valor"/>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeEstoque" ShowInGroupFooterColumn="Qtde. em &lt;br /&gt; Estoque" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Cobertura" SummaryType="Custom" ShowInGroupFooterColumn="Cobertura"/>
                        </GroupSummary>


                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px" Caption="Código" FixedStyle="Left">
                                <Settings AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="3" Width="290px" Caption="Nome do Produto" FixedStyle="Left">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="QtdeEstoque" ShowInCustomizationForm="True" VisibleIndex="7" Width="85px" Caption="Qtde. em &lt;br /&gt; Estoque">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Cobertura" ShowInCustomizationForm="True" VisibleIndex="6" Width="70px" Caption="Dias de &lt;br /&gt; Cobertura" ToolTip="Cobertura de Quantidade de Vendas. (Quantidade de Vendas / Quantidade de Estoque)">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="GreaterOrEqual" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Custo &lt;br /&gt; Condor" FieldName="vlrCustoCondor" ShowInCustomizationForm="True" VisibleIndex="8" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Total em &lt;br /&gt; Estoque" FieldName="TotalEstoque" ShowInCustomizationForm="True" VisibleIndex="9" Width="90px" ReadOnly="True">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="Dia Última &lt;br /&gt; Entrada" FieldName="DiaUltimaEntrada" ShowInCustomizationForm="True" VisibleIndex="16" Width="80px" ToolTip="Data da última entrada no Estoque">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="Classificação&lt;br /&gt; Giro Valor" FieldName="Classif_Giro_Valor" ShowInCustomizationForm="True" VisibleIndex="10" Width="80px">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle HorizontalAlign="Center" ForeColor="Blue">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Departamento" FieldName="Depto" ShowInCustomizationForm="True" VisibleIndex="12" Width="100px" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Seção" FieldName="Secao" ShowInCustomizationForm="True" VisibleIndex="13" Width="150px" GroupIndex="1" SortIndex="1" SortOrder="Ascending">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Marca Própria" FieldName="MarcaPropria" ShowInCustomizationForm="True" VisibleIndex="17" Width="90px">
                                <CellStyle HorizontalAlign="Center" Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Embalagem" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Tipo" FieldName="CODUNIDADE" ShowInCustomizationForm="True" VisibleIndex="1" Width="40px">
                                        <HeaderStyle BackColor="Silver" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Estoque por &lt;br /&gt; Embalagem" FieldName="Caixa" ShowInCustomizationForm="True" ToolTip="Estoque por tipo de Embalagem." VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="Silver" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Unidades &lt;br /&gt; na Emb." FieldName="QTDEMBALAGEM" ShowInCustomizationForm="True" ToolTip="Quantidade de item dentro da Embalagem." VisibleIndex="2" Width="60px">
                                        <HeaderStyle BackColor="Silver" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="Silver" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Importado" FieldName="Importado" ShowInCustomizationForm="True" VisibleIndex="18" Width="80px">
                                <CellStyle HorizontalAlign="Center" Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Siste&lt;br&gt;mática" FieldName="Sistematica" FixedStyle="Left" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Subgrupo" FieldName="Subgrupo" GroupIndex="3" ShowInCustomizationForm="True" SortIndex="3" SortOrder="Ascending" VisibleIndex="15">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="Grupo" GroupIndex="2" ShowInCustomizationForm="True" SortIndex="2" SortOrder="Ascending" VisibleIndex="14">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="MDV - 120 Dias" ShowInCustomizationForm="True" ToolTip="Média de Vendas por Dia por Quantidade com base nos últimos 120 dias - 4 Meses." VisibleIndex="4">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="MDV_Qtde" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="MDV_Valor" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager PageSize="17">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="392" VerticalScrollBarMode="Auto" ShowFilterRow="True" ShowGroupPanel="True" ShowGroupFooter="VisibleAlways" />
                        <SettingsText EmptyDataRow="Não há informação de Estoque" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>                    --%>
                  
                    
		            <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="uspBuscar_Classif_Giro_Departamento" SelectCommandType="StoredProcedure">
                        <SelectParameters>                         
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>

                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="dsDados_Secao" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="uspBuscar_Classif_Giro_Secao" SelectCommandType="StoredProcedure">
                        <SelectParameters>                         
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="Depto" SessionField="sDEPTO" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="dsDados_Grupo" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="uspBuscar_Classif_Giro_Grupo" SelectCommandType="StoredProcedure">
                        <SelectParameters>                         
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="Secao" SessionField="sSECAO" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>

