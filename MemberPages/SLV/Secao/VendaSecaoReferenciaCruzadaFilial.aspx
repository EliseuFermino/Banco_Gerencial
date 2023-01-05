<%@ Page Title="Venda por Seção - Todas as Lojas e Empresa - PGR232" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaSecaoReferenciaCruzadaFilial.aspx.vb" Inherits="MemberPages_SLV_Secao_VendaSecaoReferenciaCruzadaFilial" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >    
       
        #divDia {        
            clear: both;    
            float: left;
            margin-left: 10px;
            margin-bottom: 2px;
        }

        #divTipoDadosDesc {
            float: left;
            margin-left: 15px;
            margin-top: 7px;
        }

        #divTipoDados {            
            float: left;
            margin-left: 10px;
            margin-top: 3px;
            margin-top: 4px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
            margin-top: 7px;
        }

        #divSize {            
            float: left;
            margin-left: 10px;
        }        

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            width:100%;
            padding-right:3px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div id="divDia">
        <uc1:wucListaDiaIniFin runat="server" ID="cboDia" />
    </div>

    <div id="divTipoDadosDesc">
        Tipo de Dados
    </div>
    
    <div id="divTipoDados">
        <dx:ASPxComboBox ID="cboTipoDados" runat="server" Width="150px" Native="False" SelectedIndex="0"  Theme="Mulberry" >
            <Items>
                <dx:ListEditItem Text="Vendas" Value="0" Selected="True" />
                <dx:ListEditItem Text="Margem Final" Value="1" />
                <dx:ListEditItem Text="Número de Clientes" Value="2" />
                <dx:ListEditItem Text="Quantidade" Value="3" />
            </Items>
        </dx:ASPxComboBox>
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
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="descProdutoSecaoLista" Width="100%">
                        <Toolbars>
                            <dx:GridViewToolbar EnableAdaptivity="true">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação"  />
                                </Items>
                            </dx:GridViewToolbar>
                        </Toolbars>
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 3" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 4" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 5" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 6" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 7" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 8" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 9" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 10" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 11" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 13" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 14" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 15" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 17" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 18" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 19" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 20" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 21" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 22" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 23" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 24" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 25" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 26" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 27" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 28" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 29" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 30" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 31" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 32" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 33" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 34" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 36" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 37" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 38" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 39" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 40" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 41" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 42" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 43" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 44" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 45" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 46" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 47" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 48" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 49" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 50" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 51" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 52" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 53" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 54" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 55" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 56" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 57" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 58" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Loja 59" SummaryType="Sum" />
                            <%--<dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTotal" SummaryType="Sum" />--%>
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Seção" FieldName="descProdutoSecaoLista" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px" SortIndex="0" SortOrder="Ascending">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 3" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 4" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 5" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 6" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 7" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 8" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 9" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 10" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 11" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 13" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="11">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 14" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="12">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 15" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="13">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 17" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="14">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 18" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="15">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 19" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="16">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 20" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="17">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 21" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="18">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 22" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="19">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 23" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="20">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 24" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="21">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 25" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="22">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 26" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="23">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 27" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="24">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 28" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="25">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 29" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="26">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 30" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="27">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 31" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="28">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 32" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="29">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 33" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="30">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 34" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="31">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 36" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="32">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 37" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="33">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 38" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="34">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 39" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="35">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 40" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="36">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 41" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="37">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 42" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="38">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 43" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="39">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 44" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="40">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 45" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="41">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 46" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="42">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 47" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="43">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 48" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="44">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 49" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="45">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 50" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="46">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 51" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="47">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 52" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="48">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 53" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="49">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Loja 54" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="50">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Loja 55" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="51">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Loja 56" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="52">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Loja 57" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="53">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Loja 58" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="54">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Loja 59" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="55">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Loja 60" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="56">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Loja 603" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="57">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Loja 604" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="58">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Loja 605" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="59">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Loja 606" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="60">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" ShowTitlePanel="True" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EFEFEF">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="#0066FF">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>                    
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Mes.uspFactSecao_ReferenciaCruzadaFilial" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" DbType="Date"  />
                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" DbType="Date" />                    
                            <asp:SessionParameter Name="tipoDados" SessionField="sTipoDados" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


</asp:Content>



