<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaItemDia_a_Dia.aspx.vb" Inherits="MemberPages_SLV_Item_VendaItemDia_a_Dia" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucProdutoEncontra.ascx" TagPrefix="uc1" TagName="wucProdutoEncontra" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>









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
            margin-top: 3px;
            width: 100%;
        }

        #divSize {            
            float: left;           
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
            margin-top: 2px;
        }

        #divQuadrante {            
            margin-top: 8px;            
            width: 600px;
            line-break:normal
        }

        #divProdutos {
            margin-top: 2px;
            float:left;
            width: 530px;
        }

        #divFilial {
            clear:both;
            margin-top: 2px;
            float:left;
            
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divProdutos">
        <uc1:wucProdutoEncontra runat="server" ID="cboProduto" />
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divQuadrante">
    
        <div id="divPeriodo">
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" Height="15px">
                <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="divSize">
            <uc1:wucSize runat="server" ID="cboSize" />
        </div>

        <div id="divFilial">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>
</div>



    

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent>

                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" KeyFieldName="Descricao" Width="100%">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="QtdVendas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="vlrVendas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAgenda23" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percSellout" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="precoMedio" SummaryType="Average" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemTotal" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAgenda23" SummaryType="Custom" />
                        </TotalSummary>
                        <Columns>
<dx:GridViewDataTextColumn FieldName="Data" ShowInCustomizationForm="True" Width="80px" Caption="Dia" VisibleIndex="0" FixedStyle="Left">
    <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy} " EncodeHtml="False">
    </PropertiesTextEdit>
</dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Descricao" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Dia da Semana" Width="100px" FixedStyle="Left">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="QtdVendas" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Volume" Width="90px">
                                 <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrVendas" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Venda" Width="120px">
                                 <PropertiesTextEdit DisplayFormatString="{0:c}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                 <CellStyle ForeColor="Blue">
                                 </CellStyle>
                                 <FooterCellStyle ForeColor="Blue">
                                 </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Lucro PDV" ShowInCustomizationForm="True" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercial" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="110px">
                                        <PropertiesTextEdit DisplayFormatString="{0:c}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Margem" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Sell-Out" ShowInCustomizationForm="True" VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:c}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percSellout" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Lucro Final" ShowInCustomizationForm="True" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:c}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="#336600">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#336600">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemTotal" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="#336600">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#336600">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Clientes" ShowInCustomizationForm="True" VisibleIndex="8">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="nº Clientes" FieldName="numCliente" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vol_med_cliente" ShowInCustomizationForm="True" VisibleIndex="1" UnboundType="Decimal">
                                        <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="% de Participação" ShowInCustomizationForm="True" VisibleIndex="9">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="percPartQtdVendas" ShowInCustomizationForm="True" ToolTip="Percentual de Participação do Dia sobre o período selecionado - base Volume." VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="percPartVendas" ShowInCustomizationForm="True" ToolTip="Percentual de Participação do Dia sobre o período selecionado - base Venda." VisibleIndex="1" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Preço Médio" FieldName="precoMedio" ShowInCustomizationForm="True" VisibleIndex="4" Width="80px">
                                <PropertiesTextEdit DisplayFormatString="{0:c}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="CAI" ShowInCustomizationForm="True" VisibleIndex="10">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrCAI" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percCAI" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Quebras" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="vlr. Agenda 23" FieldName="vlrAgenda23" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Ag. 23" FieldName="percAgenda23" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" ShowGroupPanel="True" ShowFooter="True" HorizontalScrollBarMode="Visible" />
                        <SettingsText EmptyDataRow="Nenhuma informação disponivel." />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <FocusedRow BackColor="Yellow" Font-Bold="True" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>
                  
                 <%--Arraste seu controle aqui --%>                         
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="uspBuscarVendaItemDia_a_Dia" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idProduto" SessionField="sPRODUTO" Type="Int32" />
                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" DbType="Date" />
                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" DbType="Date" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Banco: gerVendaItem" Anotacao2="Stored Procedure: dbo.uspBuscarVendaItemDia_a_Dia " />

</asp:Content>


