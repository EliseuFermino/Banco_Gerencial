<%@ Page Title="Venda por Fornecedor com SellOut" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaPorIdFornecedorComSellOut.aspx.vb" Inherits="MemberPages_SLV_Fornecedor_VendaPorIdFornecedorComSellOut" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucFornecedor.ascx" TagPrefix="uc1" TagName="wucFornecedor" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>






<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css" >
        html {            
            overflow-x:hidden;            
        }

        #moldura {
            width:1024px; 
            margin: 0 auto ;                      
        }

        #divDados {
           Clear: both;
           margin-left: 1px;
           padding-top: 1px;           
        }

        #divBotaoAtualizar {     
            float: left;       
            margin-left: 2px;
            width: 80px;  
            padding-top: 2px;                                         
        }

        #divBotaoExcel {     
            float: left;       
            margin-left: -10px;
            width: 80px;  
            padding-top: 2px;                                         
        }

        #divFornecedor {    
           float: left;                                
           padding-left: 2px; 
           width: 480px;   
           padding-bottom: 4px;                              
        }
        
        #divPeriodo {    
           float: left;                                
           padding-left: 2px;  
           width: 330px; 
           padding-top: 4px;                             
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 26px;
            margin-left: 1px;  
            margin-top: 2px;          
        }
  </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="moldura">

        <div id="divFornecedor" class="myBorder ">
            <uc1:wucFornecedor runat="server" ID="cboFornecedor" />
        </div>

        <div id="divPeriodo" class="myBorder">
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />            
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" Height="32px">
                <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
         </div>

        <div id="divBotaoExcel">
            <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
        </div>

        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="1000px" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
                        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" KeyFieldName="CodProduto" Visible="False">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroPraticado" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPraticada" SummaryType="Custom" />
                            </TotalSummary>
                            <Columns>
                                <dx:GridViewBandColumn Caption="Produtos" ShowInCustomizationForm="True" ToolTip="Quadrante de Informações do Produto" VisibleIndex="1">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px" ToolTip="Código do Produto">
                                            <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nome do Fornecedor" FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="1" Width="300px" ToolTip="Descrição do Produto">
                                            <Settings AutoFilterCondition="Contains" />
                                            <CellStyle Wrap="False">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Quantidade de produtos vendidos do fornecedor" VisibleIndex="2" Width="90px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <Settings AllowAutoFilter="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" ToolTip="Valor da venda realizado do Fornecedor" Width="100px" SortIndex="0" SortOrder="Descending">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <Settings AllowAutoFilter="False" />
                                    <EditCellStyle ForeColor="Blue">
                                    </EditCellStyle>
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" ToolTip="Quadrante de Informações de Margem Praticada" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucro" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do lucro praticado" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da margem praticada" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="SellOut" ShowInCustomizationForm="True" ToolTip="Quadrante de Informações de Margem com SellOut" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do SellOut" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <HeaderStyle BackColor="Gray" ForeColor="White" />
                                            <CellStyle ForeColor="#575757">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#575757">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem com SellOut" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <HeaderStyle BackColor="Gray" ForeColor="White" />
                                            <CellStyle ForeColor="#575757">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#575757">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle BackColor="Gray" ForeColor="White" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Rnk" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Ranking ou Posição do Fornecedor em ordem de maior venda" VisibleIndex="0" Width="40px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" ToolTip="Quadrante de Informações da Margem Final" VisibleIndex="7">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroPraticado" ShowInCustomizationForm="True" ToolTip="Valor da Margem Final = Margem Praticada + SellOut" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemPraticada" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final = Margem Praticada + SellOut" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager PageSize="15">
                            </SettingsPager>
                            <Settings ShowFilterRow="True" ShowFilterBar="Visible" ShowFilterRowMenuLikeItem="True" ShowFooter="True" />
                            <SettingsText FilterBarClear="Limpar" FilterBarCreateFilter="Filtro" />
                            <SettingsLoadingPanel Text="Aguarde&amp;hellip;" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#EEEEEE">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFFCC" ForeColor="Blue">
                                </FocusedRow>
                                <Footer Font-Bold="True">
                                </Footer>
                            </Styles>
                        </dx:ASPxGridView>
                       
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Fornecedor.uspBuscarVendaComSellOutPorID" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIAINICIAL" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIAFINAL" />
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />                               
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

    </div>
</asp:Content>

