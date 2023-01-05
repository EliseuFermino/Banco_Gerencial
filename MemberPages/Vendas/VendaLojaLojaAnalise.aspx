<%@ Page Title="Vendas por Loja" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaLojaLojaAnalise.aspx.vb" Inherits="MemberPages_Vendas_LojaLoja_Analise" %>

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
            width: 100%;
        }

        #divFilial {
            float: left;
            width: 320px;
            padding-left: 2px;
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
            margin-top: -5px;         
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
            
        <div id="divAno" >
            <uc1:wucAno ID="cboAno" runat="server" AutoPostBack="False" />
        </div>

        <div id="divMes" >
            <uc2:wuciListaMes ID="cboMes" runat="server" AutoPostBack="False" />
        </div>        

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
            </dx:ASPxButton>
        </div>

        <div class="clsRnds">
            <dx:ASPxRadioButton ID="rndMesFechado" runat="server" Text="Mês Fechado" AutoPostBack="false" GroupName="meuGrupo" Theme="DevEx" Visible="false"  >
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxRadioButton>
        </div>

        <div class="clsRnds">
            <dx:ASPxRadioButton ID="rndAteOntem" runat="server" Text="Até Ontem" AutoPostBack="false" GroupName="meuGrupo" Theme="DevEx" Visible="true" >
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxRadioButton>
        </div>

        <div class="clsRnds">
            <dx:ASPxRadioButton ID="rndAteHoje" runat="server" Text="Até Hoje" AutoPostBack="false" GroupName="meuGrupo" Theme="DevEx" ForeColor="Green" Checked="True" Visible="true">
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxRadioButton>
        </div>

        <div class="clsRnds">
            <dx:ASPxRadioButton ID="rndProjetar" runat="server" Text="Projetar Até o Final do Mês" AutoPostBack="false" GroupName="meuGrupo" Theme="DevEx" Visible="true">
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
            <dx:ASPxCheckBox ID="optNumCliente" runat="server" Text="Mostrar Lucratividade" 
                Theme="DevEx" AutoPostBack="False">
                 <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>

        <div class="clsChecks">
            <dx:ASPxCheckBox ID="chkMargem" runat="server" Text="Mostrar Margem" 
                Theme="DevEx" AutoPostBack="False">
                 <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>

        <div class="clsChecks">
            <dx:ASPxCheckBox ID="chkMetaVenda" runat="server" Text="Mostrar Meta" ForeColor ="Green" 
                Theme="DevEx" AutoPostBack="False" ToolTip="Exibe a Meta de Venda e o Percentual de Atingimento.">
                 <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>

        <div class="clsChecks">
            <dx:ASPxCheckBox ID="chkMesmosDias" runat="server" Text="Mesmos Dias" ForeColor ="Blue"  
                Theme="DevEx" AutoPostBack="False" ToolTip="Quando esta opção estiver selecionada o programa compara os mesmos dias da semana, Segunda com Segunda, Terça com Terça, Quarta com Quarta e assim por diante.">
                 <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>

        <div id="divSize">
            <uc1:wucSize runat="server" ID="cboSize" />
        </div>



        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Atualizando">
<SettingsLoadingPanel Text="Atualizando"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both"> 

                        <div id="divDados_Tabela">

                                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
                                        AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="idFilial" 
                                        Theme="SoftOrange" style="margin-bottom: 0px" Width="100%" DataSourceID="dsDadosVendas">
                                        <TotalSummary>                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />    
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAA" SummaryType="Sum" />                                 
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difClientes" SummaryType="Sum" />
                                                                                    
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numFuncAA" SummaryType="Sum" /> 
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numFuncAT" SummaryType="Sum" /> 
                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrMargem" SummaryType="Sum" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescVenda" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescClientes" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedFuncAA" SummaryType="Custom"  />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedFuncAT" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedioAA" SummaryType="Custom"  />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedioAT" SummaryType="Custom"  />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedCheckoutAA" SummaryType="Average" />                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedCheckoutAT" SummaryType="Average" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescMargem" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" SummaryType="Custom" />
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
                                        <Columns>
                                            <dx:GridViewBandColumn Caption="% Margem" VisibleIndex="5" ToolTip="Quadrante de margem" Name="bandMargem" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="percMargemAA" VisibleIndex="0" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="percMargemAT" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difMargem" ShowInCustomizationForm="True" ToolTip="Diferença entre a Margem do Ano Atual e a do Ano Anterior" VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Venda Funcionário" ShowInCustomizationForm="True" ToolTip="Venda por Funcionário" VisibleIndex="6">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrMedFuncAA" ShowInCustomizationForm="True" ToolTip="Valor médio de vendas por funcionários." VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Right">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="vlrMedFuncAT" ShowInCustomizationForm="True" ToolTip="Valor do ticket médio" VisibleIndex="1" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Right">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle Font-Bold="False" Font-Italic="False" HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Clientes" ShowInCustomizationForm="True" ToolTip="Exibe as informações de número de clientes deste ano com o ano passado." VisibleIndex="3">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="clientesAT" ShowInCustomizationForm="True" ToolTip="Número de clientes que passou na loja nesse período." VisibleIndex="1" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle Wrap="True" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="clientesAA" ShowInCustomizationForm="True" ToolTip="Número de clientes que passou na loja nesse período." VisibleIndex="0" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difClientes" ShowInCustomizationForm="True" ToolTip="Diferença entre o número de entre os clientes deste ano e do ano anterior" VisibleIndex="2" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescClientes" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento do número de clientes em relação ao ano passado." VisibleIndex="3" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Ticket Médio" ShowInCustomizationForm="True" VisibleIndex="7">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="ticketMedioAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="ticketMedioAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Valor Check-Out" ShowInCustomizationForm="True" VisibleIndex="8">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrMedCheckoutAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="vlrMedCheckoutAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn Caption="Desc." FieldName="descFilial" VisibleIndex="1" Width="150px" FixedStyle="Left">
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Left" Wrap="False">
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
                                                        VisibleIndex="2">
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
                                            <dx:GridViewBandColumn Caption="Vendas" VisibleIndex="2" 
                                                ToolTip="Grupo de vendas financeiras que compreende: Sugestão, Meta, Realizado e Percentual de Atingimento da Venda Realizada sobre a Meta de Venda.">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" 
                                                        VisibleIndex="1" ToolTip="Meta de Venda" Width="110px" Visible="False" FixedStyle="Left" Name="bandMetaVenda">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrVendaAT" ShowInCustomizationForm="True" ToolTip="Valor da venda do período atual." VisibleIndex="2" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                        <GroupFooterCellStyle ForeColor="Blue">
                                                        </GroupFooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="vlrVendaAA" 
                                                        VisibleIndex="0" 
                                                        ToolTip="Valor da venda do período anterior." Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Greater" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAting" ShowInCustomizationForm="True" ToolTip="Percentual de Atingimento da Meta" VisibleIndex="4" Width="60px" Name="bandPercAting" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCrescVenda" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento de Vendas" VisibleIndex="3" Width="65px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="False" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Lucro" VisibleIndex="4" 
                                                ToolTip="Grupo de Lucro, exibe o quanto de meta de lucro a loja teve dia por dia. Exibe as colunas de Meta, Realizado, Diferença entre a Meta e o Realizado e o Percentual de Atingimento (Realizado dividido pela Meta)" Name="bandLucratividade" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrMargemAA" ShowInCustomizationForm="True" ToolTip="Valor do Lucro no período" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="vlrMargemAT" ShowInCustomizationForm="True" ToolTip="Valor do Lucro no período" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Cresc" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento do lucro em relação ao ano passado." VisibleIndex="3" Width="60px" FieldName="percCrescMargem">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difVlrMargem" ShowInCustomizationForm="True" ToolTip="Diferença entre o lucro do ano atual e do lucro do ano anterior" VisibleIndex="2" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                            </dx:GridViewBandColumn>
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings ShowFooter="True" VerticalScrollableHeight="400" 
                                            ShowGroupFooter="VisibleAlways" ShowFilterBar="Auto" 
                                            ShowFilterRowMenu="True" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Visible" ShowFilterRow="True" />
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
                                                <dx:ASPxGridView ID="gridDetail" runat="server" AutoGenerateColumns="False" DataSourceID="dsDetail" EnableTheming="True" KeyFieldName="Dia" OnBeforePerformDataSelect="gridDetail_BeforePerformDataSelect" OnHtmlDataCellPrepared="gridDetail_HtmlDataCellPrepared" OnHtmlRowPrepared="gridDetail_HtmlRowPrepared" OnLoad="gridDetail_Load" style="margin-bottom: 0px" Theme="Default" Width="900px">
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
                                                        <dx:GridViewBandColumn Caption="% Margem" Name="bandMargem" ToolTip="Quadrante de margem" Visible="False" VisibleIndex="5">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="2014" FieldName="percMargemAA" VisibleIndex="0" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="2015" FieldName="percMargemAT" VisibleIndex="1" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Dif." FieldName="difMargem" ToolTip="Diferença entre a Margem do Ano Atual e a do Ano Anterior" VisibleIndex="2" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="Clientes" ToolTip="Exibe as informações de número de clientes deste ano com o ano passado." VisibleIndex="3">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="2015" FieldName="clientesAT" ToolTip="Número de clientes que passou na loja nesse período." VisibleIndex="1" Width="80px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle Wrap="True" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="2014" FieldName="clientesAA" ToolTip="Número de clientes que passou na loja nesse período." VisibleIndex="0" Width="80px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Dif." FieldName="difClientes" ToolTip="Diferença entre o número de entre os clientes deste ano e do ano anterior" VisibleIndex="2" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescClientes" ToolTip="Percentual de Crescimento do número de clientes em relação ao ano passado." VisibleIndex="3" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="Ticket Médio" VisibleIndex="7">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="2014" FieldName="ticketMedioAA" VisibleIndex="0" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="2015" FieldName="ticketMedioAT" VisibleIndex="1" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Desc." FieldName="descSecao" FixedStyle="Left" VisibleIndex="1" Width="200px">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewBandColumn Caption="Invisivel" Visible="False" VisibleIndex="16">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" VisibleIndex="0">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Ano" VisibleIndex="1">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="1">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" ToolTip="Valor da meta revista de venda que foi replanejada." VisibleIndex="3" Width="90px">
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
                                                        <dx:GridViewBandColumn Caption="Vendas" ToolTip="Grupo de vendas financeiras que compreende: Sugestão, Meta, Realizado e Percentual de Atingimento da Venda Realizada sobre a Meta de Venda." VisibleIndex="2">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" FixedStyle="Left" Name="bandMetaVenda" ToolTip="Meta de Venda" Visible="False" VisibleIndex="1" Width="90px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                                    <CellStyle ForeColor="#009900">
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="#009900">
                                                                    </FooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrVendaAT" ToolTip="Valor da venda do período atual." VisibleIndex="2" Width="100px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle ForeColor="Blue">
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                    <GroupFooterCellStyle ForeColor="Blue">
                                                                    </GroupFooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="2013" FieldName="vlrVendaAA" ToolTip="Valor da venda do período anterior." VisibleIndex="0" Width="100px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAting" Name="bandPercAting" ToolTip="Percentual de Atingimento da Meta" Visible="False" VisibleIndex="4" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCrescVenda" ToolTip="Percentual de Crescimento de Vendas" VisibleIndex="3" Width="65px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <HeaderStyle Font-Bold="False" HorizontalAlign="Center" />
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="Lucro" Name="bandLucratividade" ToolTip="Grupo de Lucro, exibe o quanto de meta de lucro a loja teve dia por dia. Exibe as colunas de Meta, Realizado, Diferença entre a Meta e o Realizado e o Percentual de Atingimento (Realizado dividido pela Meta)" Visible="False" VisibleIndex="4">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrMargemAA" ToolTip="Valor do Lucro no período" VisibleIndex="0" Width="90px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="2015" FieldName="vlrMargemAT" ToolTip="Valor do Lucro no período" VisibleIndex="1" Width="90px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescMargem" ToolTip="Percentual de Crescimento do lucro em relação ao ano passado." VisibleIndex="3" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Dif." FieldName="difVlrMargem" ToolTip="Diferença entre o lucro do ano atual e do lucro do ano anterior" VisibleIndex="2" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
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

                                                <asp:SqlDataSource ID="dsDetail" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Vendas_Dia.uspBuscar_AnaliseLojaLojaSecao" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>                                                       
                                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                                                                                       
                                                        <asp:SessionParameter Name="idProjecao" SessionField="sPROJECAO" Type="Byte" />
                                                        <asp:SessionParameter Name="idMesmosDias" SessionField="sMESMOS_DIAS" Type="Byte" />                                                        
                                                    </SelectParameters>
                                                </asp:SqlDataSource>


                                            </DetailRow>
                                        </Templates>

                                    </dx:ASPxGridView>
                                    
                                    <asp:SqlDataSource ID="dsDadosVendas" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Vendas_Dia.uspBuscar_AnaliseLojaAnoAnterior" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                                                                                       
                                            <asp:SessionParameter Name="idProjecao" SessionField="sPROJECAO" Type="Byte" />
                                            <asp:SessionParameter Name="idMesmosDias" SessionField="sMESMOS_DIAS" Type="Byte" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                        </div>

                        <%--<asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>--%>
                        
                   </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

<%--<asp:Label ID="lblError1" runat="server" Text="Label"></asp:Label>--%>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Banco: 225 - gerManager" Anotacao2="Stored Procedure: Vendas_Dia.uspBuscar_AnaliseLojaAnoAnterior" />

          
</asp:Content>

