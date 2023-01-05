<%@ Page Title="Quebra Top 10 - por Mês" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Quebra_Agenda23_Top10_Mes.aspx.vb" Inherits="MemberPages_Quebras_Quebra_Agenda23_Top10_Mes" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divMes {            
            float: left;
            margin-left: 10px;
        }


        #divBotaoAtualizar {            
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
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>

    <div id="divFilial" class="BGC_Filial BGC_myBorder ">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
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
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="idProduto" Width="1000px" Theme="SoftOrange" >
                        <Toolbars>
                            <dx:GridViewToolbar EnableAdaptivity="true" >
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />                             
                                </Items>

                            </dx:GridViewToolbar>
                        </Toolbars>
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTotal" SummaryType="Sum" ShowInGroupFooterColumn="vlrTotal" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc" SummaryType="Custom" ShowInGroupFooterColumn="perc" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" ShowInGroupFooterColumn="Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeVenda" ShowInGroupFooterColumn="QtdeVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percQtde" ShowInGroupFooterColumn="percQtde" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percVenda" ShowInGroupFooterColumn="percVenda" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" ShowInGroupFooterColumn="vlrLucroComercial" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="percMargem" SummaryType="Custom" />
                        </TotalSummary>
                        <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTotal" ShowInGroupFooterColumn="vlrTotal" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc" ShowInGroupFooterColumn="perc" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" ShowInGroupFooterColumn="Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeVenda" ShowInGroupFooterColumn="QtdeVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percQtde" ShowInGroupFooterColumn="percQtde" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percVenda" ShowInGroupFooterColumn="percVenda" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" ShowInGroupFooterColumn="vlrLucroComercial" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="percMargem" SummaryType="Custom" />
                        </GroupSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="rnk" Caption="Ranking" ShowInCustomizationForm="True" VisibleIndex="0" Width="55px" FixedStyle="Left">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="idProduto"  ShowInCustomizationForm="True" VisibleIndex="1" Width="70px" Caption="Produto" FixedStyle="Left">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nomeProduto"  ShowInCustomizationForm="True" VisibleIndex="2" Width="250px" Caption="Descrição do Produto" FixedStyle="Left">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Valor em R$" ShowInCustomizationForm="True" VisibleIndex="4">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrTotal" ShowInCustomizationForm="True" ToolTip="Valor em R$ da Agenda 23 (lixo)" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle Font-Bold="True" ForeColor="Red">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Red">
                                        </FooterCellStyle>
                                        <GroupFooterCellStyle Font-Bold="True" ForeColor="Red">
                                        </GroupFooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                        <GroupFooterCellStyle ForeColor="Blue">
                                        </GroupFooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percVenda" ShowInCustomizationForm="True" ToolTip="Percentual do Valor Lançado na Agenda 23 x o Valor Vendida" VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="6" Width="80px" Caption="Valor &lt;br&gt; Lucro" ToolTip="Valor do Lucro">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% &lt;br&gt; Margem" FieldName="percMargem" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Frente de Caixa" VisibleIndex="5" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle ForeColor="Blue">
                                </CellStyle>
                                <FooterCellStyle ForeColor="Blue">
                                </FooterCellStyle>
                                <GroupFooterCellStyle ForeColor="Blue">
                                </GroupFooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn Caption="KPI" FieldName="KPI" ShowInCustomizationForm="True" VisibleIndex="8" Width="40px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" ToolTip="Valor do Lucro acima do valor da Agenda 23" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" ToolTip="Valor do Lucro abaixo dos 50% do valor da Agenda 23" Url="~/image/Orange-Ball-icon_16.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" ToolTip="Valor do Lucro menor que o valor da Agenda 23. " Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" ToolTip="Valor do Lucro menor que o valor da Agenda 23. " Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataTextColumn Caption="Seção" FieldName="descProdutoSecaoLista" ShowInCustomizationForm="True" VisibleIndex="7" Width="150px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descProdutoGrupoLista" ShowInCustomizationForm="True" Width="200px" VisibleIndex="9" Caption="Grupo de Familia">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Quantidade" Name="Quadrante da Agenda 23" ShowInCustomizationForm="True" VisibleIndex="3">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="Qtde" ShowInCustomizationForm="True" ToolTip="Quantidade da Agenda 23 (lixo)" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle Font-Bold="True" ForeColor="Red">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Red">
                                        </FooterCellStyle>
                                        <GroupFooterCellStyle Font-Bold="True" ForeColor="Red">
                                        </GroupFooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Qtde." FieldName="QtdeVenda" ShowInCustomizationForm="True" ToolTip="Quantidade Vendida" VisibleIndex="1" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                        <GroupFooterCellStyle ForeColor="Blue">
                                        </GroupFooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% " FieldName="percQtde" ShowInCustomizationForm="True" ToolTip="Percentual da Quantidade Lançada na Agenda 23 x Quantidade Vendida" VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="500" VerticalScrollBarMode="Auto" ShowGroupFooter="VisibleAlways" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" ></SettingsExport>
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
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.usp_Top10_Agenda23_Mes" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


</asp:Content>


