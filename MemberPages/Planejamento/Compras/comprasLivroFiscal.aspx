<%@ Page Title="Conferência - Livro Fiscal / Compras" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="comprasLivroFiscal.aspx.vb" Inherits="MemberPages_Planejamento_Compras_comprasLivroFiscal" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <aspxcallbackpanel id="cbPanel" runat="server" width="100%" theme="Metropolis" clientinstancename="cbPanel" settingsloadingpanel-text="Aguarde...">
        <panelcollection>
            <panelcontent>
                <div class="container justify-content-center" style="max-width: 98%">
                    <br />
                    <div class="row col-12 justify-content-center" runat="server" id="divFiltros">
                        <div class="col-md-10 justify-content-sm-center">
                            <span class="input-group-text justify-content-sm-center" style="height: 45px">Conferência - Livro Fiscal
                        <br />
                            </span>
                            <br />
                            <div class="row col-auto justify-content-center sm">
                                <div class="col-auto xs">
                                    <span class="input-group-text justify-content-center sm">Visão</span>
                                    <asp:DropDownList ID="selVisao" runat="server" OnSelectedIndexChanged="selVisao_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control justify-content-center">
                                        <asp:ListItem Text="Dia" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Mês" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Ano" Value="3" Selected="True"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="col-auto xs" id="divDia" runat="server">
                                    <span class="input-group-text justify-content-center sm" id="spanData" runat="server">Data</span>
                                    <input type="date" class="form-control xs" name="daterange" runat="server" id="txtData" />
                                </div>

                                <div class="col-auto xs" id="divMes" runat="server">
                                    <span class="input-group-text justify-content-center sm" id="span1" runat="server">Mês</span>
                                    <asp:DropDownList ID="selMes" runat="server" CssClass="form-control justify-content-center">
                                        <asp:ListItem Text="01" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="02" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="03" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="04" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="05" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="06" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="07" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="08" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="09" Value="9"></asp:ListItem>
                                        <asp:ListItem Text="10" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="11" Value="11"></asp:ListItem>
                                        <asp:ListItem Text="12" Value="12"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="col-auto xs" id="divAno" runat="server">
                                    <span class="input-group-text justify-content-center sm">Ano</span>
                                    <asp:DropDownList ID="selAno" runat="server" CssClass="form-control justify-content-center">
                                    </asp:DropDownList>
                                </div>

                                <%--                                <div class="col-auto xs" id="divFornecedor" runat="server">
                                    <span class="input-group-text justify-content-center sm">Fornecedor</span>
                                    <input type="text" id="txtFornecedor" class="form-control justify-content-center" runat="server" />
                                </div>--%>

                                <div class="col-auto" id="divUnidade" runat="server">
                                    <span class="input-group-text justify-content-center">Unidade</span>
                                    <asp:DropDownList ID="selUnidade" runat="server" CssClass="form-control justify-content-center">
                                    </asp:DropDownList>
                                </div>

                                <div class="col-auto justify-content-center" style="padding: 13px 0px 13px 20px;">
                                    <asp:Button type="btnFiltro" class="btn btn-info" runat="server" ID="btnFiltro" OnClientClick="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Gerando dados! Aguarde... ');}" Style="height: 50px; width: 110px" OnClick="btnFiltrar_Click" Text="Aplicar filtro" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="col-auto justify-content-center" runat="server" id="divDados">
                        <br />

                        <dx:ASPxCallbackPanel ID="gridPanelDia" runat="server" ClientInstanceName="gridPanelDia" Visible="false" Theme="Metropolis" CssClass="col-auto justify-content-center" SettingsLoadingPanel-Text="Aguarde. Atualizando">
                            <PanelCollection>
                                <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
                                    <dx:ASPxGridView ID="grvDadosDia" DataSourceID="SqlDataSourceDia" Width="100%" runat="server" EnableTheming="True" Theme="SoftOrange">
                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTotalNota" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrUnitario" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrPrecoConf" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
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

                                            <dx:GridViewBandColumn Caption="" ShowInCustomizationForm="True" ToolTip="">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Dia" FieldName="DiaMovimento" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="false" Width="85px" ToolTip="Dia">
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" ShowInCustomizationForm="True" Width="200px">
                                                        <Settings AutoFilterCondition="BeginsWith" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Agenda" FieldName="idAgenda" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="65px">
                                                        <Settings AutoFilterCondition="Equals" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Nota" FieldName="numNota" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="75px">
                                                        <Settings AutoFilterCondition="Equals" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Total Nota" FieldName="vlrTotalNota" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="false" Width="85px" ToolTip="Dia">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Código Fornecedor" HeaderStyle-Wrap="True" FieldName="idFornecedor" ShowInCustomizationForm="True" Width="90px">
                                                        <Settings AutoFilterCondition="Equals" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Fornecedor" FieldName="nomeFornecedor" ShowInCustomizationForm="True" Width="300px" ToolTip="Nome do Fornecedor">
                                                        <Settings AutoFilterCondition="Contains" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="CNPJ" FieldName="cgcPrincipal" ShowInCustomizationForm="True" Width="150px">
                                                        <Settings AutoFilterCondition="BeginsWith" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Nome Fornecedor Principal" HeaderStyle-Wrap="True" FieldName="NomeFornecedorPrincipal" ShowInCustomizationForm="True" Width="300px">
                                                        <Settings AutoFilterCondition="BeginsWith" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Codigo" FieldName="idProduto" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="70px">
                                                        <Settings AutoFilterCondition="Equals" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Valor Unitário"  HeaderStyle-Wrap="True" FieldName="vlrUnitario" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Valor Preço Conferência" FieldName="vlrPrecoConf" HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Valor Total" FieldName="vlrTotal" HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>                                           

                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager PageSize="70">
                                        </SettingsPager>
                                        <Settings ShowFilterRow="True" ShowFilterBar="Visible" ShowFilterRowMenu="false" HorizontalScrollBarMode="Visible" ShowFooter="True" />
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
                                    <asp:SqlDataSource ID="SqlDataSourceDia" runat="server" ConnectionString="<%$ ConnectionStrings:SQL18_gerTran_SLV_ConnectionString %>"
                                        SelectCommand="dbo.PR_COMPRA_ITEM_LISTAGEM" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter DbType="String" Name="paramTipo" DefaultValue="1" />
                                            <asp:SessionParameter DbType="Date" Name="paramData" SessionField="sData" />
                                            <asp:SessionParameter DbType="Int16" Name="paramMes" DefaultValue="0" />
                                            <asp:SessionParameter DbType="Int16" Name="paramAno" DefaultValue="0" />
                                            <asp:SessionParameter DbType="Int16" Name="ParamFilial" SessionField="sFilial" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>

                        <dx:ASPxCallbackPanel ID="gridPanelMes" runat="server" ClientInstanceName="gridPanelMes" Theme="Metropolis" Visible="false" CssClass="col-auto align-center" SettingsLoadingPanel-Text="Aguarde. Atualizando">
                            <PanelCollection>
                                <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
                                    <dx:ASPxGridView ID="grvDadosMes" DataSourceID="SqlDataSourceMes" runat="server" AutoGenerateColumns="true" EnableTheming="True" Theme="SoftOrange">
                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrUnitario" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrPrecoConf" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
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

                                            <dx:GridViewBandColumn Caption="" ShowInCustomizationForm="True" ToolTip="">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Ano" FieldName="Ano" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="false" Width="85px" ToolTip="Dia">
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Mes" FieldName="Mes" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="false" Width="85px" ToolTip="Dia">
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" ShowInCustomizationForm="True" Width="250px">
                                                        <Settings AutoFilterCondition="BeginsWith" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Agenda" FieldName="idAgenda" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="65px">
                                                        <Settings AutoFilterCondition="Equals" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Código Fornecedor" HeaderStyle-Wrap="True" FieldName="idFornecedor" ShowInCustomizationForm="True" Width="90px">
                                                        <Settings AutoFilterCondition="Equals" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Fornecedor" FieldName="nomeFornecedor" ShowInCustomizationForm="True" Width="300px" ToolTip="Nome do Fornecedor">
                                                        <Settings AutoFilterCondition="Contains" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="CNPJ" FieldName="cgcPrincipal" ShowInCustomizationForm="True" Width="150px">
                                                        <Settings AutoFilterCondition="BeginsWith" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Nome Fornecedor Principal" FieldName="NomeFornecedorPrincipal" HeaderStyle-Wrap="True" ShowInCustomizationForm="True" Width="300px">
                                                        <Settings AutoFilterCondition="BeginsWith" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Valor Unitário" FieldName="vlrUnitario" HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False" />
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Valor Preço Conferência" FieldName="vlrPrecoConf" HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Valor Total" FieldName="vlrTotal" HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>                                           

                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager PageSize="70">
                                        </SettingsPager>
                                        <Settings ShowFilterRow="True" ShowFilterBar="Visible" ShowFilterRowMenu="false" HorizontalScrollBarMode="Visible" ShowFooter="True" />
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
                                    <asp:SqlDataSource ID="SqlDataSourceMes" runat="server" ConnectionString="<%$ ConnectionStrings:SQL18_gerTran_SLV_ConnectionString %>"
                                        SelectCommand="PR_COMPRA_ITEM_LISTAGEM"
                                        SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter DbType="String" Name="paramTipo" DefaultValue="2" />
                                            <asp:SessionParameter DbType="String" Name="paramData" DefaultValue="0" />
                                            <asp:SessionParameter DbType="Int16" Name="paramMes" SessionField="sMes" />
                                            <asp:SessionParameter DbType="Int16" Name="paramAno" SessionField="sAno" />
                                            <asp:SessionParameter DbType="Int16" Name="ParamFilial" SessionField="sFilial" DefaultValue="99" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>

                        <dx:ASPxCallbackPanel ID="gridPanelAno" runat="server" ClientInstanceName="gridPanelAno" Theme="Metropolis" Visible="false" CssClass="col-auto align-center" SettingsLoadingPanel-Text="Aguarde. Atualizando">
                            <PanelCollection>
                                <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
                                    <dx:ASPxGridView ID="grvDadosAno" DataSourceID="SqlDataSourceAno" runat="server" AutoGenerateColumns="true" EnableTheming="True" Theme="SoftOrange">
                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrUnitario" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrPrecoConf" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
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

                                            <dx:GridViewBandColumn Caption="" ShowInCustomizationForm="True" ToolTip="">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Ano" FieldName="Ano" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="false" Width="85px" ToolTip="Dia">
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" ShowInCustomizationForm="True" Width="200px">
                                                        <Settings AutoFilterCondition="BeginsWith" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Agenda" FieldName="idAgenda" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="65px">
                                                        <Settings AutoFilterCondition="Equals" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Código Fornecedor" HeaderStyle-Wrap="True" FieldName="idFornecedor" ShowInCustomizationForm="True" Width="90px">
                                                        <Settings AutoFilterCondition="Equals" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Fornecedor" FieldName="nomeFornecedor" ShowInCustomizationForm="True" Width="300px" ToolTip="Nome do Fornecedor">
                                                        <Settings AutoFilterCondition="Contains" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="CNPJ" FieldName="cgcPrincipal" ShowInCustomizationForm="True" Width="120px">
                                                        <Settings AutoFilterCondition="BeginsWith" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Nome Fornecedor Principal" HeaderStyle-Wrap="True"  FieldName="NomeFornecedorPrincipal" ShowInCustomizationForm="True" Width="300px">
                                                        <Settings AutoFilterCondition="BeginsWith" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Valor Unitário" FieldName="vlrUnitario" HeaderStyle-Wrap="True"  CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Valor Preço Conferência" FieldName="vlrPrecoConf" HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Valor Total" FieldName="vlrTotal" HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" ShowInCustomizationForm="True" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False" />
                                                        <Settings AllowAutoFilter="False" />
                                                        <CellStyle Wrap="False">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>                                           

                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager PageSize="70">
                                        </SettingsPager>
                                        <Settings ShowFilterRow="True" ShowFilterBar="Visible" ShowFilterRowMenu="false" HorizontalScrollBarMode="Visible" ShowFooter="True" />
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
                                    <asp:SqlDataSource ID="SqlDataSourceAno" runat="server" ConnectionString="<%$ConnectionStrings:SQL18_gerTran_SLV_ConnectionString %>"
                                        SelectCommand="PR_COMPRA_ITEM_LISTAGEM" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter DbType="String" Name="paramTipo" DefaultValue="3" />
                                            <asp:SessionParameter DbType="String" Name="paramData" DefaultValue="0" />
                                            <asp:SessionParameter DbType="Int16" Name="paramMes" DefaultValue="0" />
                                            <asp:SessionParameter DbType="Int16" Name="paramAno" SessionField="sAno" />
                                            <asp:SessionParameter DbType="Int16" Name="ParamFilial" SessionField="sFilial" DefaultValue="99" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>

                    </div>
                </div>

            </panelcontent>
        </panelcollection>
    </aspxcallbackpanel>

    <script src="../../assets/bootstrap-5.0.2-dist/Modal/jquery.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/bootstrap.min.js"></script>

    <style>
        .modal-dialog {
            margin-left: auto;
            margin-right: auto;
            max-width: 850px;
        }

        .gwFormat td {
            padding: 8px 13px 8px 13px;
        }
    </style>

    <script src="../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/jquery.min.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/moment.min.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../assets/datepickerRange/daterangepicker.css" />

    <script type="text/javascript"> 
        function maxData() {

            try {

                const date = new Date();
                const theDayOfTheMonthOnNextWeek = date.getDate() - 1;
                date.setDate(theDayOfTheMonthOnNextWeek)

                MainContent_txtData.max = date.toISOString().split("T")[0];

            } catch (e) {
                console.log(e.message)
            }
        };


        function lastData() {

            try {

                const date = new Date();
                const theDayOfTheMonthOnNextWeek = date.getDate() - 1;
                date.setDate(theDayOfTheMonthOnNextWeek)

                document.getElementById('MainContent_txtData').valueAsDate = date;

                maxdata();
            }
            catch {
                console.log(e.message)

            };
        };

        maxData();


    </script>


</asp:Content>

