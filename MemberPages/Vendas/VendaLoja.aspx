<%@ Page Title="Vendas por Loja" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaLoja.aspx.vb" Inherits="MemberPages_Vendas_VendaLoja" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>
<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>


<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucMercadologicoNew.ascx" TagPrefix="uc1" TagName="wucMercadologicoNew" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >       

        #divMercadologico {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 1px;
        }

        #divAno {
            float: left;    
            margin-left: 5px;        
        }

        #divMes {
            float: left;
            margin-left: 5px; 
        }       

        #divFilial {
            float: left;
            width: 600px;
            padding-left: 2px;
        }

        #divBotaoAtualizar {
            float: left;
            padding-left: 3px;
            padding-top: 2px;
        }

        #divSize {
            float: left;
            padding-left: 3px;
            padding-top: 2px;
        }

        #divCheckFixar {
            clear: both;
            float: left;            
        }

        #divCheckPorDia {            
            float: left;
            padding-left: 20px;
        }
        
        #divCheckLucratividade {            
            float: left;
            padding-left: 20px;
        }

        #divRadioAteOntem {            
            float: left;
            padding-left: 40px;
        } 
        
        #divRadioAteHoje {            
            float: left;
            padding-left: 10px;
        }
        
        #divRadioProjetar {            
            float: left;
            padding-left: 10px;
        }      
        
         #divDados {
            clear:both;
            float: left;
            width: 100%;
        }                 

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 25px;
            margin-left: 1px;  
            margin-top: 2px;          
        }

        #divTituloGrafico {
             float: left;
             font-size: 28px;
             text-align: center;
             padding-top: 10px;
             width: 1000px;
             color:gray;
        }

        #divTituloGrafico_Vendas {
             float: left;
             font-size: 28px;
             text-align: center;
             padding-top: 10px;
             width: 1000px;
             color:gray;
             padding-top: 20px;
        }

        #divTituloGrafico_Clientes {
             float: left;
             font-size: 28px;
             text-align: center;
             padding-top: 10px;
             width: 1000px;
             color:gray;
             padding-top: 20px;
        }

        #divTituloGrafico_CrescimentoCliente {
             float: left;
             font-size: 28px;
             text-align: center;
             padding-top: 10px;
             width: 1000px;
             color:gray;
             margin-top: 20px;
        }

        #divTituloGrafico_NumeroClientesPorDia {
             float: left;
             font-size: 28px;
             text-align: center;
             padding-top: 10px;
             width: 1000px;
             color:gray;
             margin-top: 20px;
        }

        #divDados_Grafico {
            float: left;
        }

        #divDados_GraficoVendas {
            clear: both;
            float: left;
            
        }

        #divGrafico_CrescimentoClientes {
            clear: both;
            float: left;        
        }

        #divDados_GraficoClientes {
            clear: both;
            float: left;
            
        }

        #divDados_GraficoNumeroClientesPorDia {
            clear: both;
            float: left;            
        }


        #divTitulo_ItensMaisVendidos {
            clear:both;            
            text-align: center;
        }

        #divTitulo_ItensMenosVendidos {
             clear:both;            
            text-align: center;
        }

        #divTituloItensMaisVendidosLucro {
            clear:both;            
            text-align: center;
        }

        #divItensMaisVendidos {
            float: left;
        }

        #divItemMenosVendidos {
            float: left;
        }

        #divItensMaisVendidosLucro {
            float: left;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="moldura">

        <div id="divMercadologico">
            <uc1:wucMercadologicoNew runat="server" ID="cboMercadologico" />
        </div>
        
        <div id="divAno" >
            <uc1:wucAno ID="cboAno" runat="server" AutoPostBack="False" />
        </div>

        <div id="divMes" >
            <uc2:wuciListaMes ID="cboMes" runat="server" AutoPostBack="False" />
        </div>

        <div id="divFilial" >
            <uc1:wucListaLojasComCorporacao runat="server" id="cboFilial" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
            </dx:ASPxButton>
        </div>

        <div id="divSize">
            <uc1:wucSize runat="server" ID="cboSize" CallSize="100" />
        </div>

        <div id="divCheckFixar">
            <dx:ASPxCheckBox ID="chkFixar" runat="server" AutoPostBack="False" 
                Text="Fixar Cabeçalho" Theme="DevEx" Checked ="true" >
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>

        <div id="divCheckPorDia">
            <dx:ASPxCheckBox ID="chkPorDia" runat="server" AutoPostBack="False" 
                Text="Ver por Dia da Semana" Theme="DevEx">
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>

        <div id="divCheckLucratividade">
            <dx:ASPxCheckBox ID="optNumCliente" runat="server" Text="Mostrar Lucratividade" 
                Theme="DevEx" AutoPostBack="False">
                 <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>

        <div id="divRadioAteOntem">
            <dx:ASPxRadioButton ID="rndAteOntem" runat="server" Text="Até Ontem" AutoPostBack="false" GroupName="meuGrupo" Theme="DevEx" >
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxRadioButton>
        </div>

        <div id="divRadioAteHoje">
            <dx:ASPxRadioButton ID="rndAteHoje" runat="server" Text="Até Hoje" AutoPostBack="false" GroupName="meuGrupo" Theme="DevEx" ForeColor="Green" Checked="True">
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxRadioButton>
        </div>

        <div id="divRadioProjetar">
            <dx:ASPxRadioButton ID="rndProjetar" runat="server" Text="Projetar Até o Final do Mês" AutoPostBack="false" GroupName="meuGrupo" Theme="DevEx">
                <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxRadioButton>
        </div>

        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Atualizando">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both"> 

                        <div id="divDados_Tabela">
                                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
                                        AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Dia" 
                                        Theme="SoftOrange" style="margin-bottom: 0px" Width="100%" DataSourceID="dsDadosVendas">
                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestao" ShowInColumn="Sugestão" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrMetaVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="dif_vlrVenda_vlrMeta" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numFuncionarios" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCheckOut" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MetragemAreaVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaLucro" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="NumCliente" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting"  SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro"  SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrMedFunc" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedio" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrMedCheckout" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrMedMetragem" SummaryType="Custom"/>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrMeta_Agenda23" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrAgenda23" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAgenda23" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrAgenda23_Dif" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMeta_Agenda23" SummaryType="Min" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAgenda23_Dif" SummaryType="Custom" />
                                        </TotalSummary>
                                        <GroupSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestao" ShowInGroupFooterColumn="vlrSugestao" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" ShowInGroupFooterColumn="vlrMetaVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numFuncionarios" ShowInGroupFooterColumn="numFuncionarios" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaLucro" ShowInGroupFooterColumn="vlrMetaLucro" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" ShowInGroupFooterColumn="vlrMargem" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" ShowInGroupFooterColumn="difLucro" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="NumCliente" ShowInGroupFooterColumn="NumCliente" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" ShowInGroupFooterColumn="percAting" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" ShowInGroupFooterColumn="percAtingLucro" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="percMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" ShowInGroupFooterColumn="percMetaMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" ShowInGroupFooterColumn="difMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrMedFunc" ShowInGroupFooterColumn="vlrMedFunc" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedio" ShowInGroupFooterColumn="ticketMedio" SummaryType="Custom"/>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrMedCheckout" ShowInGroupFooterColumn="vlrMedCheckout" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrMedMetragem" ShowInGroupFooterColumn="vlrMedMetragem" SummaryType="Custom" />
                                        </GroupSummary>
                                        <Columns>
                                            <dx:GridViewBandColumn Caption="Estatísticas - Valor Médio em R$" VisibleIndex="8">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Func." FieldName="vlrMedFunc" 
                                                        ToolTip="Valor médio de vendas por funcionários." VisibleIndex="0" Width="90px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" BackColor="#99FF99" ForeColor="#003300" />
                                                        <CellStyle HorizontalAlign="Right"></CellStyle>
                                                        <FooterCellStyle BackColor="#CCFFCC">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Ticket" FieldName="ticketMedio" 
                                                        ToolTip="Valor do ticket médio" VisibleIndex="1" Width="90px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" BackColor="#99FF99" ForeColor="#003300" />
                                                        <CellStyle HorizontalAlign="Right"></CellStyle>
                                                        <FooterCellStyle BackColor="#CCFFCC">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Check" FieldName="vlrMedCheckout" ToolTip="Valor médio de vendas por check-out." 
                                                        VisibleIndex="2"  Width="90px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EnableFocusedStyle="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" BackColor="#99FF99" ForeColor="#003300" />
                                                        <CellStyle HorizontalAlign="Right"></CellStyle>
                                                        <FooterCellStyle BackColor="#CCFFCC">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="M2" FieldName="vlrMedMetragem" ToolTip="Valor da venda por metro quadrado" 
                                                        VisibleIndex="3" Width="90px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" BackColor="#99FF99" ForeColor="#003300" />
                                                        <CellStyle HorizontalAlign="Right"></CellStyle>
                                                        <FooterCellStyle BackColor="#CCFFCC">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="True" BackColor="#009900" ForeColor="White" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataDateColumn FieldName="Dia" ReadOnly="True" VisibleIndex="0" Width="60px" FixedStyle="Left">
                                                <PropertiesDateEdit DisplayFormatString="{0:dd/MM}"> </PropertiesDateEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Center"></CellStyle>
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewBandColumn Caption="Margem" VisibleIndex="4">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Meta " FieldName="percMetaMargem" 
                                                        VisibleIndex="0" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                        <GroupFooterCellStyle ForeColor="#009900">
                                                        </GroupFooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="percMargem" 
                                                        VisibleIndex="1" UnboundType="Decimal" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                        <GroupFooterCellStyle ForeColor="Blue">
                                                        </GroupFooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn 
                                                        UnboundType="Decimal" VisibleIndex="2" Caption="Dif." FieldName="difMargem"  Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn FieldName="Observacao" 
                                                VisibleIndex="15" Caption="Obs." Visible="False" Width="100px">
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewBandColumn Caption="Agenda 23" ShowInCustomizationForm="True" VisibleIndex="6">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Meta R$" FieldName="vlrMeta_Agenda23" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#FF6A6A" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Real R$" FieldName="vlrAgenda23" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#FF6A6A" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="vlrAgenda23_Dif" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#FF6A6A" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Meta %" FieldName="percMeta_Agenda23" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#FF6A6A" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Real %" FieldName="percAgenda23" ShowInCustomizationForm="True" VisibleIndex="4" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#FF6A6A" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="percAgenda23_Dif" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="5" Width="65px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#FF6A6A" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle BackColor="Red" ForeColor="White" HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn FieldName="NumCliente" VisibleIndex="5" 
                                                Caption="Nº Clientes"  Width="80px" 
                                                ToolTip="Número de clientes que passou na loja.">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle Wrap="True" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Desc." FieldName="descNomeDia" VisibleIndex="1" Width="60px" FixedStyle="Left">
                                                <Settings AutoFilterCondition="Contains" />
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
                                                        VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Vendas Financeiras" VisibleIndex="2" 
                                                ToolTip="Grupo de vendas financeiras que compreende: Sugestão, Meta, Realizado e Percentual de Atingimento da Venda Realizada sobre a Meta de Venda.">
                                                <Columns>                                                    
                                                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" 
                                                        VisibleIndex="1" 
                                                        ToolTip="Valor da meta revista de venda que foi replanejada.">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                        <GroupFooterCellStyle ForeColor="#009900">
                                                        </GroupFooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrVenda" 
                                                        VisibleIndex="2" ToolTip="Valor da venda realizada.">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                        <GroupFooterCellStyle ForeColor="Blue">
                                                        </GroupFooterCellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Atingimento" FieldName="Atingimento" 
                                                        VisibleIndex="2" ToolTip="Valor da venda realizada.">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                        <GroupFooterCellStyle ForeColor="Blue">
                                                        </GroupFooterCellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <%--<dx:GridViewDataTextColumn FieldName="Atingimento" VisibleIndex="4" Caption="Concluido" Width="100px" >
                                                        <DataItemTemplate>
                                                            <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="SoftOrange" 
                                                                Value='<%#Eval("Atingimento")%>' Width="80px" DisplayFormatString=" 0.0" >
                                                            </dx:ASPxProgressBar>
                                                        </DataItemTemplate>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle HorizontalAlign="Center">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle HorizontalAlign="Center">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>--%>

                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="dif_vlrVenda_vlrMeta" VisibleIndex="3" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAting" ShowInCustomizationForm="True" ToolTip="Percentual de atingimento (meta x realizado)" UnboundType="Decimal" VisibleIndex="4" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Lucro" VisibleIndex="3" 
                                                ToolTip="Grupo de Lucro, exibe o quanto de meta de lucro a loja teve dia por dia. Exibe as colunas de Meta, Realizado, Diferença entre a Meta e o Realizado e o Percentual de Atingimento (Realizado dividido pela Meta)" Name="bandLucratividade" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrMargem" 
                                                        VisibleIndex="1" ToolTip="Valor do realizado do lucro" Width="90px">
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
                                                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaLucro" 
                                                        VisibleIndex="0" ToolTip="Valor da meta de lucro" Width="90px">
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
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAtingLucro" 
                                                        VisibleIndex="3"  Width="60px" 
                                                        ToolTip="Percentual de atingimento do lucro (Realizado dividido pela Meta)" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Right">
                                                            <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difLucro" 
                                                        ToolTip="Valor da diferença entre a Meta de Lucro e o Realizado do Lucro." 
                                                        UnboundType="Decimal" VisibleIndex="2" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Right">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                            </dx:GridViewBandColumn>
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings ShowFooter="True" VerticalScrollableHeight="400" 
                                            ShowGroupFooter="VisibleAlways" ShowFilterRow="True" ShowFilterBar="Auto" 
                                            ShowFilterRowMenu="True" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Visible" />
                                        <SettingsText CommandClearFilter="Limpar Filtro" 
                                            FilterControlPopupCaption="Igual" />
                                        <SettingsLoadingPanel Text="Processando informações. Aguarde...&amp;hellip;" />
                                        <Styles>
	                                        <FocusedRow BackColor="Yellow" ForeColor="#0066FF"> </FocusedRow>
	                                        <Header HorizontalAlign="Center">
                                            </Header>
	                                        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                            <GroupFooter Font-Bold="False">
                                            </GroupFooter>
                                        </Styles>

                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="dsDadosVendas" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Vendas_Dia.uspBuscar_VendaLoja" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                            <asp:SessionParameter Name="idTipo" SessionField="sTIPO" Type="Byte" />
                                            <asp:SessionParameter Name="idProjecao" SessionField="sPROJECAO" Type="Byte" />
                                            <asp:SessionParameter Name="sOPCAO" SessionField="sOPCAO" Type="Byte" />
                                            <asp:SessionParameter Name="sMERCADOLOGICO" SessionField="sMERCADOLOGICO" Type="Byte" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                        </div>


                        



                   </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

    </div>  
         
</asp:Content>

