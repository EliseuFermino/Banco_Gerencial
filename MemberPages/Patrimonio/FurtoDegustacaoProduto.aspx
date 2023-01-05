<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Patrimonio/Patrimonio_Preventica_Reativa.master" AutoEventWireup="false" CodeFile="FurtoDegustacaoProduto.aspx.vb" Inherits="MemberPages_Patrimonio_FurtoDegustacaoProduto" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>


<%@ Register Src="~/Controles/wucAnoMes.ascx" TagPrefix="uc1" TagName="wucAnoMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>


<asp:Content ID="Content2" ContentPlaceHolderID="PatrimonioContent" Runat="Server">

                                        <div class="divFilial" style="float:left; margin-left:9px " >
                                            <uc1:wucLista_Filial_Empresa runat="server" ID="cboFilial"  />
                                        </div>

                                        <div id="divDia_Produto_Furto_Degustacao" style="float:left; margin-left:5px ">
                                            <uc1:wucListaDiaIniFin runat="server" ID="cboDia_Produto" />
                                        </div>                                        

                                        <div class="divBotaoAtualizar" style="float:left; margin-left:10px; margin-top: -4px ">
                                            <dx:ASPxButton ID="btnAtualizar_Produto_Furto_Degustacao" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                                                <ClientSideEvents Click="function(s, e) {cbpPanel_Produto_Furto_Degustacao.PerformCallback();}" />
                                            </dx:ASPxButton>
                                        </div>

                                        <dx:ASPxCallbackPanel ID="cbpPanel_Produto_Furto_Degustacao" ClientInstanceName="cbpPanel_Produto_Furto_Degustacao" runat="server" Width="100%" SettingsLoadingPanel-Text="Aguarde. Atualizando" Theme="Metropolis">
                                            <PanelCollection>
                                                <dx:PanelContent>

                                        <div class="divDados1" style="clear:both; margin-left:10px; padding-top: 5px  ">

                                        
                                        <dx:ASPxGridView ID="grid_Produto_AreaVenda" runat="server" DataSourceID="dsProduto_AreaVenda" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="idProduto" Theme="SoftOrange" Width="950px">
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="Qtde" ShowInGroupFooterColumn="Valor" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
                                            </TotalSummary>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="Total de Itens: R$ {0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
                                            </GroupSummary>
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                                                <dx:GridViewDataTextColumn Caption="Ranking" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px" SortIndex="0" SortOrder="Ascending">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="LessOrEqual" />
                                                    <CellStyle HorizontalAlign="Center">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Codigo" FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="2" Width="65px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Seção" FieldName="Secao" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Grupo" ShowInCustomizationForm="True" VisibleIndex="5" Width="100px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Familia" ShowInCustomizationForm="True" VisibleIndex="6" Width="100px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Qtde" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                            <SettingsPager PageSize="20">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" ShowGroupPanel="True" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Auto" />
                                            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" Title="Furto e Degustação  - Área de Vendas" />
                                            <Styles>
                                                <Header HorizontalAlign="Center">
                                                </Header>
                                                <AlternatingRow BackColor="#EAEAEA">
                                                </AlternatingRow>
                                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                </FocusedRow>
                                                <Footer Font-Bold="True">
                                                </Footer>
                                            </Styles>
                                            </dx:ASPxGridView>

                                            <asp:SqlDataSource ID="dsProduto_AreaVenda" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.usp_Furto_Degustacao_porProduto_Loja_AreaVenda" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                                    <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                        <br />

                                        <dx:ASPxGridView ID="grid_Produto_Deposito" runat="server" DataSourceID="dsProduto_Deposito" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="idProduto" Theme="PlasticBlue" Width="950px">
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="Qtde" ShowInGroupFooterColumn="Valor" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
                                            </TotalSummary>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="Total de Itens: R$ {0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
                                            </GroupSummary>
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                                                <dx:GridViewDataTextColumn Caption="Ranking" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px" SortIndex="0" SortOrder="Ascending">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="LessOrEqual" />
                                                    <CellStyle HorizontalAlign="Center">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Codigo" FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="2" Width="65px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Seção" FieldName="Secao" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Grupo" ShowInCustomizationForm="True" VisibleIndex="5" Width="100px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Familia" ShowInCustomizationForm="True" VisibleIndex="6" Width="100px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Qtde" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Width="70px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                            <SettingsPager PageSize="20">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" ShowGroupPanel="True" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Auto" />
                                            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" Title="Furto e Degustação  - Área de Depósito" />
                                            <Styles>
                                                <Header HorizontalAlign="Center">
                                                </Header>
                                                <AlternatingRow BackColor="#EAEAEA">
                                                </AlternatingRow>
                                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                </FocusedRow>
                                                <Footer Font-Bold="True">
                                                </Footer>
                                            </Styles>
                                            </dx:ASPxGridView>

                                            <asp:SqlDataSource ID="dsProduto_Deposito" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.usp_Furto_Degustacao_porProduto_Loja_Deposito" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                                    <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                        </div>


                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>



</asp:Content>

