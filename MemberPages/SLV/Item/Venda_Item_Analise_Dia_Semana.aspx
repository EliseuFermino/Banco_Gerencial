<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Venda_Item_Analise_Dia_Semana.aspx.vb" Inherits="MemberPages_SLV_Item_Venda_Item_Analise_Dia_Semana" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>

<%@ Register Src="~/Controles/wuciListaSemana.ascx" TagPrefix="uc1" TagName="wuciListaSemana" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>
<%@ Register Src="~/Controles/wucListaComprador.ascx" TagPrefix="uc1" TagName="wucListaComprador" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

         #divRegiao {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divAno {            
            float: left;
            margin-left: 10px;
        }

        .divSecao_Comprador {
            float: left;
            margin-left: 10px;
        }

        #divSecao {            
            float: left;
            margin-left: 10px;
        }

         #divComprador {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 30px;
        }

        #divSize {            
            float: left;           
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            padding-right: 3px;
            width: 100%;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divRegiao">
        <dx:ASPxComboBox ID="cboRegiao" runat="server" DropDownWidth="40px" Native="True" SelectedIndex="0" Width="140px">
            <Items>
                <dx:ListEditItem Selected="True" Text="Empresa" Value="199" />
                <dx:ListEditItem Text="Curitiba" Value="200" />
                <dx:ListEditItem Text="Centro-Oeste" Value="202" />
                <dx:ListEditItem Text="Norte" Value="203" />
                <dx:ListEditItem Text="Santa-Catarina" Value="213" />
                <dx:ListEditItem Text="Campo Mourão" Value="217" />
            </Items>
        </dx:ASPxComboBox>
    </div>

    <div id="divAno">
        <uc1:wuciListaSemana runat="server" ID="cboSemana" CallSemana="2"  />
    </div>

    <div Class="divSecao_Comprador">
        <dx:ASPxRadioButton ID="grpSecao" runat="server" GroupName="grp" Text="Seção" AutoPostBack="True"></dx:ASPxRadioButton>        
    </div>

    <div Class="divSecao_Comprador">
        <dx:ASPxRadioButton ID="grpComprador" runat="server" GroupName="grp" Text="Comprador" AutoPostBack="True"></dx:ASPxRadioButton>
    </div>

    <div Class="divSecao_Comprador">
        <dx:ASPxRadioButton ID="grpGeral" runat="server" GroupName="grp" Text="Geral" AutoPostBack="True"></dx:ASPxRadioButton>
    </div>

    <div id="divSecao">
        <uc1:wucListaSecao runat="server" ID="cboSecao" />
    </div>

    <div id="divComprador">
        <uc1:wucListaComprador runat="server" ID="cboComprador" />
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
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" Width="100%" KeyFieldName="idProduto">
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
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrNR1" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="nomeDiaSemana" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Semana" FixedStyle="Left">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Agenda 23" ShowInCustomizationForm="True" VisibleIndex="15">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrAgenda23" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="Red" ForeColor="White" />
                                        <CellStyle ForeColor="Red">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% s/<br>Venda" FieldName="percAg23" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                         <HeaderStyle BackColor="Red" ForeColor="White" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                        </PropertiesTextEdit>                                   
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn Caption="Média<br>Agenda 23" FieldName="media_Agenda23" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                         <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="Red" ForeColor="White" />
                                        <CellStyle ForeColor="Red">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% s/<br>Venda" FieldName="media_percAg23" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                         <HeaderStyle BackColor="Red" ForeColor="White" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                        </PropertiesTextEdit>                                   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part<br>Agenda 23" FieldName="partAgenda23" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">                                  
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="Red" ForeColor="White" />
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ranking<br>Agenda 23" FieldName="rnk_vlrAgenda23" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="Red" ForeColor="White" />
                                        <CellStyle Font-Bold="True" HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="Red" ForeColor="White" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="% Margem &lt;br&gt; Total" FieldName="percMargemTotal" ShowInCustomizationForm="True" VisibleIndex="14" Width="80px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle BackColor="#0066FF" Font-Bold="True" ForeColor="White" />
                                <CellStyle Font-Bold="True" ForeColor="#0066FF">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Mercadológico" ShowInCustomizationForm="True" VisibleIndex="16">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Grupo de Familia" FieldName="descProdutoGrupoLista" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                        <Settings AllowAutoFilter="True" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Familia" FieldName="descProdutoSubgrupoLista" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                        <Settings AllowAutoFilter="True" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Média<br>Venda" FieldName="media_Venda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                    
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Preco &lt;br&gt; Médio" FieldName="PrecoMedio" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                        <PropertiesTextEdit DisplayFormatString="{0:c}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part&lt;br&gt; Venda" FieldName="partVenda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ranking &lt;br&gt; Vendas" FieldName="rnk_Venda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Width="60px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle Font-Bold="True" HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Número de Clientes" ShowInCustomizationForm="True" VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Nº de &lt;br&gt; Clientes" FieldName="numCliente" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Média Nº<br>de Clientes" FieldName="media_Clientes" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part. &lt;br&gt; Clientes" FieldName="partClientes" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ranking &lt;br&gt; Clientes" FieldName="rnk_numCliente" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle Font-Bold="True" HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="LucroTotal" ShowInCustomizationForm="True" VisibleIndex="12">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Lucro &lt;br&gt; Total" FieldName="vlrLucroTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Média<br>Lucro Total" FieldName="media_LucroTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part &lt;br&gt; Lucro" FieldName="partLucroTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ranking&lt;br&gt;Lucro" FieldName="rnk_vlrLucroTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle Font-Bold="True" HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Quantidade" ShowInCustomizationForm="True" VisibleIndex="2">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdVendas" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Média<br>Qtde" FieldName="media_Qtde" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part &lt;br&gt; Qtde" FieldName="partQtde" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ranking &lt;br&gt; Qtde" FieldName="rnk_QtdVendas" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle Font-Bold="True" HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Produto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <Settings AllowAutoFilter="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nome do Produto" FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px">
                                        <Settings AllowAutoFilter="True" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager NumericButtonCount="18" PageSize="18">
                        </SettingsPager>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" ></SettingsExport>
                        <Settings HorizontalScrollBarMode="Auto" ShowTitlePanel="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowFilterRow="True" ShowGroupPanel="True" />
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
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="dbo.usp_BuscarAnaliseVendaItemPorSecaoSemana" SelectCommandType="StoredProcedure" CacheExpirationPolicy="Sliding" EnableCaching="True">
                        <SelectParameters>
                            <asp:SessionParameter Name="numDiaSemana" SessionField="sNumDiaSemana" Type="Byte" />
                            <asp:SessionParameter Name="idProdutoSecao" SessionField="sProdutoSecao" Type="Byte" />                         
                            <asp:SessionParameter Name="idComprador" SessionField="sComprador" Type="String" DefaultValue="0"  />
                            <asp:SessionParameter Name="tipo_Secao_Comprador" SessionField="sTipo_Secao_Comprador" Type="Byte" />
                            <asp:SessionParameter Name="idRegiao" SessionField="sRegiao" Type="Byte" DefaultValue="200" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: DW" Anotacao2="Stored Procedure: dbo.usp_BuscarAnaliseVendaItemPorSecaoSemana" />
    
</asp:Content>

