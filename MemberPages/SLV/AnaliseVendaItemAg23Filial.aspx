<%@ Page Title="Análise de Vendas e Agenda 23 por Seção" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseVendaItemAg23Filial.aspx.vb" Inherits="MemberPages_SLV_AnaliseVendaItemAg23Filial" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc8" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc4" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc4" TagName="wucObsPrograma" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        #divDados {
            clear:both;
            float: left;
            margin-top: 2px;
            margin-left: 2px;
            width: 100%;
        }

        #divFilial{
            clear: both;
            float: left;
            margin-left: 4px;
            margin-top: 4px;
        }

        #divAno{
            float: left;
            margin-left: 10px;
            margin-top: 7px;
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 10px;
            margin-top: 4px;
        }

        #divBotaoExcel {
            float: left;
            margin-left: 10px;
            margin-top: 4px;
        }

#divSize {            
            float: left;           
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divFilial" style="float:left">
        <uc8:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
    </div>

    <div id="divAno" style="float:left">
        <uc4:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
    </div>    

    <div id="divBotaoAtualizar" style="float:left">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme ="Metropolis" AutoPostBack ="False" >
            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxButton>        
    </div>

    <div id="divBotaoExcel" style="float:left">
        <uc4:wucBotaoExcel ID="btnExcel" runat="server" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%"  Theme="Metropolis" ClientInstanceName ="cbPanel" SettingsLoadingPanel-Text="Aguarde. Processando...&amp;hellip;">
            <PanelCollection>
                <dx:PanelContent> 

                    <dx:ASPxGridView ID="grid" runat="server"  
                        DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                        EnableTheming="True" Theme="SoftOrange" Width="100%" 
                        KeyFieldName="idProduto" >
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAg23" 
                                SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrAg23" 
                                SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" 
                                SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="Total de Produtos =&gt; {0:n0}" FieldName="idProduto" 
                                SummaryType="Count" ShowInColumn="descProduto" />
                        </TotalSummary>
                        <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="Total de Produtos: {0:n0}" 
                                FieldName="idProduto" SummaryType="Count" />
                            <dx:ASPxSummaryItem DisplayFormat="vlr. Agenda 23: {0:c}" FieldName="vlrAg23" 
                                SummaryType="Sum" />
                        </GroupSummary>
                        <Columns>                                           
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn FieldName="descProduto" VisibleIndex="2" 
                                Caption="Descrição do Produto" Width="180px" 
                                ToolTip="Descrição do produto" FixedStyle="Left">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="QtdeAg23" VisibleIndex="3" Caption="Qtd Ag 23" 
                                ToolTip="Quantidade de itens na agemda 23" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <HeaderStyle BackColor="#CC9900" />
                                <CellStyle ForeColor="#990000">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrAg23" VisibleIndex="4" 
                                Caption="vlr Ag 23" ToolTip="Valor da agenda 23" 
                                Width="90px" SortIndex="0" SortOrder="Descending" >
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <HeaderStyle BackColor="#CC9900" />
                                <CellStyle ForeColor="#990000" Font-Bold="True">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                                <FooterCellStyle Font-Bold="True">
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                                           
                            <dx:GridViewDataTextColumn FieldName="percCresc" VisibleIndex="5" 
                                Caption="% Part Total"                                          
                                ToolTip="Percentual de Participação da Agenda em relação ao Total da Agenda 23" 
                                Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <HeaderStyle BackColor="Red" />
                                <CellStyle Wrap="False">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                                                                                      
                            <dx:GridViewDataTextColumn Caption="% Part Depto" FieldName="percCrescDepto" ShowInCustomizationForm="True" VisibleIndex="6" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <HeaderStyle BackColor="Red" />
                            </dx:GridViewDataTextColumn>
                                                                                      
                            <dx:GridViewDataTextColumn FieldName="descDepto" 
                                VisibleIndex="12" Caption="Departamento" Width="100px" 
                                ToolTip="Descrição do Departamento">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                                           
                            <dx:GridViewDataTextColumn FieldName="descSecao" VisibleIndex="13" 
                                Width="100px" Caption="Seção" ToolTip="Descrição da Seção">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="descGrupo" VisibleIndex="14" 
                                Width="100px" Caption="Grupo" ToolTip="Descrição do Grupo">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="descSubgrupo" VisibleIndex="16" 
                                Width="100px" Caption="Sub-grupo" ToolTip="Descrição do Sub-grupo">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                                           
                            <dx:GridViewDataTextColumn FieldName="idProduto" VisibleIndex="1" 
                                Caption="Código" ToolTip="Código do produto" Width="50px" FixedStyle="Left">
                                <PropertiesTextEdit EncodeHtml="False"></PropertiesTextEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                                           
                            <dx:GridViewDataTextColumn Caption="% Part Seção" FieldName="percCrescSecao" ShowInCustomizationForm="True" VisibleIndex="7" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <HeaderStyle BackColor="Red" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% Part Grupo" FieldName="percCrescGrupo" ShowInCustomizationForm="True" VisibleIndex="8" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <HeaderStyle BackColor="Red" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% Part Familia" FieldName="percCrescSubGrupo" ShowInCustomizationForm="True" VisibleIndex="9" Width="95px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <HeaderStyle BackColor="Red" />
                            </dx:GridViewDataTextColumn>
                                           
                            <dx:GridViewDataTextColumn FieldName="CODMOTIVOMOVTO" ShowInCustomizationForm="True" VisibleIndex="10" Width="200px" Caption="Tipo">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                                           
                            <dx:GridViewDataTextColumn FieldName="idFornecedor" ShowInCustomizationForm="True" VisibleIndex="18" Width="100px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nomeFornecedor" ShowInCustomizationForm="True" VisibleIndex="20" Width="200px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                                           
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsLoadingPanel Text="Aguarde. Processando...&amp;hellip;" />
                        <Styles>
	                        <FocusedRow BackColor="#CCFFFF" ForeColor="#333333"> </FocusedRow>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                        </Styles>                                       
                        <SettingsPager PageSize="20">
                            <Summary AllPagesText="Paginas: {0} - {1} ({2} items)" Text="Pagina {0} of {1} ({2} produtos)" />
                        </SettingsPager>
                        <Settings ShowGroupPanel="True" ShowFooter="True" 
                            ShowVerticalScrollBar="True" VerticalScrollableHeight="400" ShowFilterRow="True" HorizontalScrollBarMode="Visible" ShowFilterBar="Visible" />
                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e fornecedor" 
                            GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar"                                             />
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" 
                        SelectCommand="dbo.uspBuscarAnaliseVendaItemAgenda23_porFilial" SelectCommandType="StoredProcedure" >
                        <SelectParameters>                       
                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" Type="DateTime" />
                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

    </div>  

    <br />

    <uc4:wucObsPrograma runat="server" ID="wucObsPrograma"  Anotacao1="Banco: gerPerdas" Anotacao2="Stored Procedure: dbo.uspBuscarAnaliseVendaItemAgenda23_porFilial "/>
</asp:Content>

