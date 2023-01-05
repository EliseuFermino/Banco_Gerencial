<%@ Page Title="Vendas por Loja" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ClientesLojaAnalise.aspx.vb" Inherits="MemberPages_Clientes_ClientesLoja_Analise" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>
<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>






<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >           
    
        #divAno {
            float: left;            
        }

        #divMes {
            float: left;
        }

        #divDados {
            clear:both;
            float: left;
        }       

        #divBotaoAtualizar {
            float: left;
            padding-left: 3px;
            padding-top: 2px;
        }

        .clsRnds {   
             float: left;          
            padding-left: 10px;
            padding-top: 4px;
        }    

        .clsChecks {            
            float: left;  
            padding-left: 20px;          
        }      
        
        #divSize {            
            float: left;  
            padding-left: 5px; 
            margin-top: -3px;         
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
            
        <div id="divAno" class="myBorder ">
            <uc1:wucAno ID="cboAno" runat="server" AutoPostBack="False" />
        </div>

        <div id="divMes" class="myBorder ">
            <uc2:wuciListaMes ID="cboMes" runat="server" AutoPostBack="False" />
        </div>
        
        <div id="divFilial" class="BGC_Filial BGC_myBorder">
            <uc1:wucListaLojasComCorporacao runat="server" id="cboFilial" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
            </dx:ASPxButton>
        </div>

        <div class="clsRnds">
            <dx:ASPxRadioButton ID="rndMesFechado" runat="server" Text="Mês Fechado" AutoPostBack="false" GroupName="meuGrupo" Theme="DevEx" Visible ="false"  >
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxRadioButton>
        </div>

        <div class="clsRnds">
            <dx:ASPxRadioButton ID="rndAteOntem" runat="server" Text="Até Ontem" AutoPostBack="false" GroupName="meuGrupo" Theme="DevEx" Checked="True" >
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxRadioButton>
        </div>

        <div class="clsRnds">
            <dx:ASPxRadioButton ID="rndAteHoje" runat="server" Text="Até Hoje" AutoPostBack="false" GroupName="meuGrupo" Theme="DevEx" ForeColor="Green">
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxRadioButton>
        </div>

        <div style="clear: left" class="clsChecks" >
            <dx:ASPxCheckBox ID="chkFixar" runat="server" AutoPostBack="False" 
                Text="Fixar Cabeçalho" Theme="DevEx" Checked ="true" >
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>

        <div class="clsChecks">
            <dx:ASPxCheckBox ID="chkMesmosDias" runat="server" Text="Mesmos Dias" ForeColor ="Blue"  
                Theme="DevEx" AutoPostBack="False" ToolTip="Quando esta opção estiver selecionada o programa compara os mesmos dias da semana, Segunda com Segunda, Terça com Terça, Quarta com Quarta e assim por diante." Checked="True" CheckState="Checked">
                 <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>

        <div id="divSize">
            <uc1:wucSize runat="server" ID="cboSize" />
        </div>



        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="1000px" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Atualizando">
                <PanelCollection>
                    <dx:PanelContent> 

                        <div id="divDados_Tabela">

                                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
                                        AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Dia" 
                                        Theme="SoftOrange" style="margin-bottom: 0px" Width="1010px" DataSourceID="dsDadosVendas">
                                        <TotalSummary>                                            
                                            <dx:ASPxSummaryItem FieldName="vlrVendaAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem FieldName="vlrVendaAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAA" SummaryType="Sum" />                                 
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difClientes" SummaryType="Sum" />
                                                                                    
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescClientes" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedioAA" SummaryType="Custom"  />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedioAT" SummaryType="Custom"  />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedCheckoutAA" SummaryType="Average" />                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedCheckoutAT" SummaryType="Average" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difTicket" SummaryType="Sum" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescTicket" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difCheck" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCheck" SummaryType="Custom" />
                                        </TotalSummary>
                                        <GroupSummary>
                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" ShowInGroupFooterColumn="vlrMetaVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" ShowInGroupFooterColumn="vlrVendaAT" SummaryType="Sum" />   
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAA" ShowInGroupFooterColumn="clientesAA" SummaryType="Sum" />                          
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAT" ShowInGroupFooterColumn="clientesAT" SummaryType="Sum" />                                                                             
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difClientes" ShowInGroupFooterColumn="difClientes" SummaryType="Sum" />
                                             
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAA" ShowInGroupFooterColumn="vlrMargemAA" SummaryType="Sum" />                          
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAT" ShowInGroupFooterColumn="vlrMargemAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrMargem" ShowInGroupFooterColumn="difVlrMargem" SummaryType="Sum" />    
                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrMedCheckoutAT" ShowInGroupFooterColumn="vlrMedCheckoutAT" SummaryType="Average" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedFuncAA" ShowInGroupFooterColumn="vlrMedFuncAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedFuncAT" ShowInGroupFooterColumn="vlrMedFuncAT" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedioAA" ShowInGroupFooterColumn="ticketMedioAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedioAT" ShowInGroupFooterColumn="ticketMedioAT" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" ShowInGroupFooterColumn="percMargemAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" ShowInGroupFooterColumn="percMargemAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" ShowInGroupFooterColumn="difMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" ShowInGroupFooterColumn="percAting" SummaryType="Custom" />
                                        </GroupSummary>

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
                                            <dx:GridViewBandColumn Caption="Clientes" ShowInCustomizationForm="True" ToolTip="Exibe as informações de número de clientes deste ano com o ano passado." VisibleIndex="2">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="clientesAT" ShowInCustomizationForm="True" ToolTip="Número de clientes que passou na loja nesse período." VisibleIndex="1" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle Wrap="True" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="clientesAA" ShowInCustomizationForm="True" ToolTip="Número de clientes que passou na loja nesse período." VisibleIndex="0" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difClientes" ShowInCustomizationForm="True" ToolTip="Diferença entre o número de entre os clientes deste ano e do ano anterior" VisibleIndex="2" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescClientes" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento do número de clientes em relação ao ano passado." VisibleIndex="3" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Ticket Médio" ShowInCustomizationForm="True" VisibleIndex="5">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="ticketMedioAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="ticketMedioAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difTicket" ShowInCustomizationForm="True" ToolTip="Diferença entre o Ticket Médio desse  ano com o Ticket Médio do ano passado." UnboundType="Decimal" VisibleIndex="2" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescTicket" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" UnboundType="Decimal" VisibleIndex="3" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Valor Check-Out" ShowInCustomizationForm="True" VisibleIndex="6">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrMedCheckoutAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="vlrMedCheckoutAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difCheck" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescCheck" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" UnboundType="Decimal" VisibleIndex="3" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataDateColumn FieldName="Dia" ReadOnly="True" VisibleIndex="0" Width="60px" FixedStyle="Left">
                                                <PropertiesDateEdit DisplayFormatString="{0:dd/MM}"> </PropertiesDateEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Center"></CellStyle>
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataTextColumn Caption="Desc." FieldName="DescNomeDia" VisibleIndex="1" Width="60px" FixedStyle="Left">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Left">
                                                    <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewBandColumn Caption="Invisivel" Visible="False" VisibleIndex="16">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" 
                                                        VisibleIndex="0">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Ano" 
                                                        VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Mes" 
                                                        VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" ShowInCustomizationForm="True" ToolTip="Valor da meta revista de venda que foi replanejada." VisibleIndex="3" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                        <GroupFooterCellStyle ForeColor="#009900">
                                                        </GroupFooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrVendaAT" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrVendaAA" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings ShowFooter="True" VerticalScrollableHeight="400" 
                                            ShowGroupFooter="VisibleAlways" ShowFilterRow="True" ShowFilterBar="Auto" 
                                            ShowFilterRowMenu="True" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Visible" />
                                        <SettingsText CommandClearFilter="Limpar Filtro" 
                                            FilterControlPopupCaption="Igual" />
                                        <SettingsLoadingPanel Text="Processando informações. Aguarde...&amp;hellip;" />
                                        <SettingsDetail ShowDetailRow="True" />
                                        <Styles>
	                                        <FocusedRow BackColor="#FFFF66" ForeColor="#0066FF"> </FocusedRow>
	                                        <Header HorizontalAlign="Center">
                                            </Header>
	                                        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                            <GroupFooter Font-Bold="False">
                                            </GroupFooter>
                                        </Styles>

                                        <Templates>
                                            <DetailRow>
                                                <dx:ASPxGridView ID="gridDetail" runat="server" AutoGenerateColumns="False" DataSourceID="dsDetail" EnableTheming="True" KeyFieldName="Dia" OnBeforePerformDataSelect="gridDetail_BeforePerformDataSelect" style="margin-bottom: 0px" Theme="Default" Width="900px" OnHtmlDataCellPrepared="gridDetail_HtmlDataCellPrepared" OnLoad="gridDetail_Load" OnHtmlRowPrepared="gridDetail_HtmlRowPrepared">
                                                    <GroupSummary>
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" ShowInGroupFooterColumn="vlrMetaVenda" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" ShowInGroupFooterColumn="vlrVendaAT" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAA" ShowInGroupFooterColumn="clientesAA" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAT" ShowInGroupFooterColumn="clientesAT" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difClientes" ShowInGroupFooterColumn="difClientes" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAA" ShowInGroupFooterColumn="vlrMargemAA" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAT" ShowInGroupFooterColumn="vlrMargemAT" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrMargem" ShowInGroupFooterColumn="difVlrMargem" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrMedCheckoutAT" ShowInGroupFooterColumn="vlrMedCheckoutAT" SummaryType="Average" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedFuncAA" ShowInGroupFooterColumn="vlrMedFuncAA" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedFuncAT" ShowInGroupFooterColumn="vlrMedFuncAT" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedioAA" ShowInGroupFooterColumn="ticketMedioAA" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedioAT" ShowInGroupFooterColumn="ticketMedioAT" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" ShowInGroupFooterColumn="percMargemAA" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" ShowInGroupFooterColumn="percMargemAT" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" ShowInGroupFooterColumn="difMargem" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" ShowInGroupFooterColumn="percAting" SummaryType="Custom" />
                                                    </GroupSummary>
                                                    <Columns>
                                                        <dx:GridViewBandColumn Caption="Clientes" ShowInCustomizationForm="True" ToolTip="Exibe as informações de número de clientes deste ano com o ano passado." VisibleIndex="3">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="2015" FieldName="clientesAT" ShowInCustomizationForm="True" ToolTip="Número de clientes que passou na loja nesse período." VisibleIndex="1" Width="80px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle Wrap="True" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="2014" FieldName="clientesAA" ShowInCustomizationForm="True" ToolTip="Número de clientes que passou na loja nesse período." VisibleIndex="0" Width="80px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Dif." FieldName="difClientes" ShowInCustomizationForm="True" ToolTip="Diferença entre o número de entre os clientes deste ano e do ano anterior" VisibleIndex="2" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescClientes" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento do número de clientes em relação ao ano passado." VisibleIndex="3" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="Ticket Médio" ShowInCustomizationForm="True" VisibleIndex="7">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="2014" FieldName="ticketMedioAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="2015" FieldName="ticketMedioAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Desc." FieldName="descSecao" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewBandColumn Caption="Invisivel" ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Ano" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Mes" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" ShowInCustomizationForm="True" ToolTip="Valor da meta revista de venda que foi replanejada." VisibleIndex="3" Width="90px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle ForeColor="#009900">
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="#009900">
                                                                    </FooterCellStyle>
                                                                    <GroupFooterCellStyle ForeColor="#009900">
                                                                    </GroupFooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                    </Columns>

                                                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                                    <SettingsPager Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <Settings HorizontalScrollBarMode="Visible" ShowFilterBar="Auto" ShowFilterRow="True" ShowFilterRowMenu="True" ShowGroupFooter="VisibleAlways" VerticalScrollBarMode="Visible" />
                                                    <SettingsText CommandClearFilter="Limpar Filtro" FilterControlPopupCaption="Igual" />
                                                    <SettingsLoadingPanel Text="Processando informações. Aguarde...&amp;hellip;" />
                                                    <Styles>
                                                        <Header HorizontalAlign="Center">
                                                        </Header>
                                                        <AlternatingRow BackColor="#EEEEEE">
                                                        </AlternatingRow>
                                                        <FocusedRow BackColor="#FFFF66" ForeColor="#0066FF">
                                                        </FocusedRow>
                                                        <Footer Font-Bold="True">
                                                        </Footer>
                                                        <GroupFooter Font-Bold="False">
                                                        </GroupFooter>
                                                    </Styles>
                                                </dx:ASPxGridView>
                                                <asp:SqlDataSource ID="dsDetail" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Vendas_Dia.uspBuscar_AnaliseLojaSecao" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="int16" />
                                                        <asp:SessionParameter Name="idMesmosDias" SessionField="sMESMOS_DIAS" Type="Byte" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </DetailRow>
                                        </Templates>

                                    </dx:ASPxGridView>
                                    
                                    <asp:SqlDataSource ID="dsDadosVendas" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Vendas_Dia.uspBuscar_AnaliseAnoAnterior" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="int16" />                                            
                                            <asp:SessionParameter Name="idProjecao" SessionField="sPROJECAO" Type="Byte" />
                                            <asp:SessionParameter Name="idMesmosDias" SessionField="sMESMOS_DIAS" Type="Byte" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>'
                                    <br />
                                    <br />
                        </div>
                        
                        <asp:Label ID="lblError" runat="server" Text="myError"></asp:Label>

                   </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="gerManager.Vendas_Dia.uspBuscar_AnaliseAnoAnterior" />

</asp:Content>

