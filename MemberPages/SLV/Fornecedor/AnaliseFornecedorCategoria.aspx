<%@ Page Title="" Language="VB"  MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseFornecedorCategoria.aspx.vb" Inherits="MemberPages_SLV_Fornecedor_AnaliseFornecedorCategoria" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucFornecedor.ascx" TagPrefix="uc1" TagName="wucFornecedor" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >        

        #divFornecedor {  
            clear: both;          
            float: left;
            margin-left: 2px;
            width:700px;
            padding-top: 2px; 
            padding-bottom: 2px; 
        }

       #divPeriodo {            
            float: left;    
            padding-top: 5px;     
            margin-left: 2px;   
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 5px;
            padding-top: 2px;  
        }

        #divSize {
            float: left;
            margin-left: -10px;
            padding-top: 1px; 
        }

        #divPercentual {
            float: left;
            margin-left: 10px;
            padding-top: 1px; 
        }

        #divDados {
            clear: both;
            float: left;  
            margin-left: 2px; 
            margin-top: 1px;
            width: 100%;        
        }    

        .rnd {
            float: left;
            margin-left: 10px;
            margin-top: 2px; 
        }

        #divVisao {
            float: left;
            margin-left: 20px;
            margin-top: 3px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    

    <div id="divPeriodo">
        <uc1:wucListaDiaIniFin runat="server" ID="cboDia" />
    </div>    

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme ="MetropolisBlue" AllowFocus="False" CausesValidation="False" UseSubmitBehavior="False">
        </dx:ASPxButton>
    </div> 

    <dx:ASPxRadioButton ID="rndDepto" runat="server" Text="Departamento" CssClass="rnd " Theme="DevEx" GroupName="myRnd" ToolTip="Exibe as informações totalizadas por Departamento.">
        <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
    </dx:ASPxRadioButton>
    <dx:ASPxRadioButton ID="rndSecao" runat="server" Text="Seção" CssClass="rnd " Theme="DevEx" GroupName="myRnd" ToolTip="Exibe as informações totalizadas por Seção." >
        <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
    </dx:ASPxRadioButton>
    <dx:ASPxRadioButton ID="rndGrupo" runat="server" Text="Grupo" CssClass="rnd " Theme="DevEx" GroupName="myRnd" ToolTip="Exibe as informações totalizadas por Grupo de Familia.">
        <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
    </dx:ASPxRadioButton>
    <dx:ASPxRadioButton ID="rndFamilia" runat="server" Text="Familia" CssClass="rnd " Theme="DevEx" GroupName="myRnd" Checked="True" ToolTip="Exibe as informações totalizadas por Familia.">
        <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
    </dx:ASPxRadioButton>

    <div id="divVisao">
        <dx:ASPxComboBox ID="cboVisao" runat="server" SelectedIndex="0" Width="70px" ToolTip="Visão 1 = Exibe informações da Empresa e Fornecedor lado a lado. Visão 2 = Exibe informações da Empresa e do Fornecedor cada um no seu quadrante.">
            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
            <Items>
                <dx:ListEditItem Selected="True" Text="Visão 1" Value="1" />
                <dx:ListEditItem Text="Visão 2" Value="2" />
            </Items>
        </dx:ASPxComboBox>
    </div>

    <div id="divFornecedor">       
        <uc1:wucFornecedor runat="server" ID="txtFornecedor" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divPercentual">
        <dx:ASPxCheckBox ID="chkSoPercentuais" Text="Só Percentuais" runat="server" Theme="DevEx" Checked="false" ToolTip="Exibe só as colunas de Percentuais. Oculta as colunas de valores."> 
<ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="100%" ClientInstanceName ="cbPanelGrid" Theme ="Metropolis" SettingsLoadingPanel-Text ="Atualizando...">
<SettingsLoadingPanel Text="Atualizando..."></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1"  runat="server" SupportsDisabledAttributes="both">

                    <dx:ASPxGridView ID="grid" runat="server"  
                        DataSourceID="dsDados" AutoGenerateColumns="False"  
                        EnableTheming="True" Theme="Default" Width="100%" Visible="False" ClientInstanceName="grid">
                        <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="EmpQtdeAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="EmpQtdeAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVolumeEmp" SummaryType="Sum" />                           
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_QtdeEmp" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="EmpvlrVendaAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="EmpvlrVendaAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_vlrVendaEmp" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="EmpvlrLucroTotalAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="EmpvlrLucroTotalAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_EmpvlrLucroTotal" SummaryType="Custom" /> 

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargTotalAA_Emp" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargTotalAT_Emp" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargTotal_Emp" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_QtdeForn" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_vlrVendaForn" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_vlrLucroTotal" SummaryType="Custom" /> 

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargTotalAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargTotalAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargTotal" SummaryType="Custom" />
                                                    
                         
                        </TotalSummary>

                        <GroupSummary>

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="EmpQtdeAA" ShowInGroupFooterColumn="EmpQtdeAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="EmpQtdeAT" ShowInGroupFooterColumn="EmpQtdeAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_QtdeEmp" ShowInGroupFooterColumn="percCresc_QtdeEmp" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="EmpvlrVendaAA" ShowInGroupFooterColumn="EmpvlrVendaAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="EmpvlrVendaAT" ShowInGroupFooterColumn="EmpvlrVendaAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_vlrVendaEmp" ShowInGroupFooterColumn="percCresc_vlrVendaEmp" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="EmpvlrLucroTotalAA" ShowInGroupFooterColumn="EmpvlrLucroTotalAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="EmpvlrLucroTotalAT" ShowInGroupFooterColumn="EmpvlrLucroTotalAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_EmpvlrLucroTotal" ShowInGroupFooterColumn="percCresc_EmpvlrLucroTotal" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargTotalAA_Emp" ShowInGroupFooterColumn="percMargTotalAA_Emp" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargTotalAT_Emp" ShowInGroupFooterColumn="percMargTotalAT_Emp" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargTotal_Emp" ShowInGroupFooterColumn="difPercMargTotal_Emp" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" ShowInGroupFooterColumn="QtdeAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" ShowInGroupFooterColumn="QtdeAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_QtdeForn" ShowInGroupFooterColumn="percCresc_QtdeForn" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" ShowInGroupFooterColumn="vlrVendaAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" ShowInGroupFooterColumn="vlrVendaAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_vlrVendaForn" ShowInGroupFooterColumn="percCresc_vlrVendaForn" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAA" ShowInGroupFooterColumn="vlrLucroTotalAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAT" ShowInGroupFooterColumn="vlrLucroTotalAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_vlrLucroTotal" ShowInGroupFooterColumn="percCresc_vlrLucroTotal" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargTotalAA" ShowInGroupFooterColumn="percMargTotalAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargTotalAT" ShowInGroupFooterColumn="percMargTotalAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargTotal" ShowInGroupFooterColumn="difPercMargTotal" SummaryType="Custom" />

                        </GroupSummary>

                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewBandColumn ShowInCustomizationForm="True" VisibleIndex="9" Caption="Lucro c/ Sellout - Empresa " ToolTip="Lucro com SellOut (Lucro PDV + SeelOut)" Name="bandLucroEmp">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="EmpvlrLucroTotalAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#CCFFCC">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="EmpvlrLucroTotalAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#CCFFCC">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="2" Caption="% Cresc" FieldName="percCresc_EmpvlrLucroTotal" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#CCFFCC">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="#CCFFCC" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Margem c/ Sellout - Empresa" ShowInCustomizationForm="True" VisibleIndex="11" ToolTip="Margem com SellOut (Margem de PDV + SellOut)" Name="bandMargemEmp">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="percMargTotalAA_Emp" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#CCFFCC">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percMargTotalAT_Emp" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#CCFFCC">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difPercMargTotal_Emp" ShowInCustomizationForm="True" ToolTip="Diferença entre o % de Margem do Ano Atual x % de MArgem do Ano Anterior" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#CCFFCC">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="#CCFFCC" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda - Empresa" ShowInCustomizationForm="True" VisibleIndex="7" ToolTip="Venda de todos os fornecedores" Name="bandVendaEmp">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="EmpvlrVendaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#CCFFCC">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="EmpvlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#CCFFCC">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_vlrVendaEmp" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#CCFFCC">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="#CCFFCC" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Volume - Empresa" ShowInCustomizationForm="True" VisibleIndex="5" ToolTip="Volume " Name="bandVolumeEmp">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="EmpQtdeAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#CCFFCC">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="EmpQtdeAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#CCFFCC">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_QtdeEmp" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" VisibleIndex="3" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#CCFFCC">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="#CCFFCC" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Volume - Fornecedor " ShowInCustomizationForm="True" VisibleIndex="6" Name="bandVolumeForn">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="QtdeAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#FFCC66">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="QtdeAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#FFCC66">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_QtdeForn" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#FFCC66">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="#FFCC66" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda - Fornecedor" ShowInCustomizationForm="True" VisibleIndex="8" Name="bandVendaForn">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrVendaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#FFCC66">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#FFCC66">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_vlrVendaForn" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#FFCC66">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="#FFCC66" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn ShowInCustomizationForm="True" VisibleIndex="10" Caption="Lucro c/ Sellout - Fornecedor" Name="bandLucroForn">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrLucroTotalAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#FFCC66">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrLucroTotalAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#FFCC66">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#FFCC66">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="#FFCC66" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Margem c/ Sellout - Fornecedor" ShowInCustomizationForm="True" VisibleIndex="12" Name="bandMargemForn">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="percMargTotalAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#FFCC66">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percMargTotalAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#FFCC66">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difPercMargTotal" ShowInCustomizationForm="True" ToolTip="Diferença entre o % de Margem do Ano Atual x % de MArgem do Ano Anterior" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle Font-Bold="True" />
                                        <FooterCellStyle BackColor="#FFCC66">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="#FFCC66" Font-Bold="True" />
                            </dx:GridViewBandColumn>
<dx:GridViewDataTextColumn FieldName="descProdutoDeptoLista" ShowInCustomizationForm="True" FixedStyle="Left" Width="100px" Caption="Departamento" VisibleIndex="1">
    <HeaderStyle Font-Bold="True" />
    <CellStyle Wrap="False" Font-Bold="False">
    </CellStyle>
</dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Seção" FieldName="descProdutoSecaoLista" ShowInCustomizationForm="True" VisibleIndex="2" Width="110px" FixedStyle="Left">
                                <Settings AllowAutoFilter="True" />
                                <HeaderStyle Font-Bold="True" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="descProdutoGrupoLista" ShowInCustomizationForm="True" VisibleIndex="3" Width="130px" FixedStyle="Left">
                                <HeaderStyle Font-Bold="True" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Familia" FieldName="descProdutoSubgrupoLista" ShowInCustomizationForm="True" VisibleIndex="4" Width="130px" FixedStyle="Left">
                                <HeaderStyle Font-Bold="True" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                                
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager PageSize="25">
                        </SettingsPager>
                         <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <ImagesFilterControl>
                            <OperationContains AlternateText="Contem">
                            </OperationContains>
                        </ImagesFilterControl>
                        <Styles>
	                        <FocusedRow BackColor="Yellow" ForeColor="#333333"> </FocusedRow>
	                            <Header HorizontalAlign="Center">
                            </Header>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>                                       
                        <Settings VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Visible" ShowFooter="True" ShowGroupFooter="VisibleAlways" ShowFilterBar="Auto" ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e fornecedor" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" FilterBarClear="Limpar" FilterBarCreateFilter="Limpar"                                             />
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="dsDados" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerTempConnectionString %>" 
                        SelectCommand="dbo.usp_Buscar_RelatorioAndreia" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="userName" SessionField="sUSERNAME" Type="String" />
                           <asp:SessionParameter Name="idMercardologico" SessionField="sMERCADOLOGICO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                    <asp:Label ID="lblError" runat="server" Text="" ForeColor ="Red" ></asp:Label>

                    <br />
                    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Banco: gerVendaFornecedoresSLV" Anotacao2="Stored: dbo.usp_Report_Andreia_Zonta" />

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



    
</asp:Content>

