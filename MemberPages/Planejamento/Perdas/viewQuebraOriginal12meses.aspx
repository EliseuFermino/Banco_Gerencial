<%@ Page Title="Perda Total Original 12 Meses" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="viewQuebraOriginal12meses.aspx.vb" Inherits="MemberPages_Planejamento_Perdas_viewQuebraOriginal12meses" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css" >
        html {            
            overflow-y:hidden;
            overflow-x:hidden ;
        }

        #moldura {
            width:1024px;
            margin: 0 auto ;
        }

        #divAno {
           float: left;
        }

        #divFilial {
           float: left;
           width: 320px;
           padding-left: 2px;                     
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 30px;
            margin-left: 1px;  
            margin-top: 2px;          
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 2px;
            width: 80px;  
            padding-top: 2px;                                
        }

        #divBotaoExcel {
            float: left;
            margin-left: -9px;              
            padding-top: 2px;                      
        }

        #divGrid1 {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 1015px;
            margin-left: 1px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="moldura">
        <div id="divAno" class="myBorder">
            <uc1:wucAno runat="server" ID="cboAno" />
        </div>

        <div id="divFilial" class="myBorder">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" Height="32px">
                <ClientSideEvents Click="function(s, e) {cbPanel1.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="divBotaoExcel">
            <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid1" />
        </div>

        <div id="divGrid1">
            <dx:ASPxCallbackPanel ID="cbPanel1" runat="server" Width="1024px" Theme="Metropolis" ClientInstanceName="cbPanel1" SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;" >
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="both">
                        <dx:ASPxGridView ID="grid1" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" Width="1020px" EnableTheming="True" KeyFieldName="descProdutoSecaoLista" Theme="DevEx">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vMes01" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pMes01" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vMes02" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pMes02" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vMes03" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pMes03" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vMes04" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pMes04" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vMes05" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pMes05" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vMes06" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pMes06" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vMes07" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pMes07" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vMes08" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pMes08" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vMes09" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pMes09" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vMes10" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pMes10" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vMes11" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pMes11" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vMes12" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pMes12" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vAno" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pAno" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaMes01" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaMes02" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaMes03" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaMes04" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaMes05" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaMes06" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaMes07" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaMes08" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaMes09" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaMes10" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaMes11" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaMes12" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPerdaAno" SummaryType="Custom" />
                            </TotalSummary>
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="descProdutoSecaoLista" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Seção" Width="150px">
                                    <CellStyle BackColor="#FFFFCC" Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Janeiro" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vMes01" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Perda" FieldName="pMes01" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaMes01" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Fevereiro" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vMes02" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Perda" FieldName="pMes02" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaMes02" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Março" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vMes03" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Perda" FieldName="pMes03" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaMes03" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Abril" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vMes04" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Perda" FieldName="pMes04" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaMes04" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Maio" ShowInCustomizationForm="True" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vMes05" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Perda" FieldName="pMes05" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaMes05" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Junho" ShowInCustomizationForm="True" VisibleIndex="9">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vMes06" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Perda" FieldName="pMes06" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaMes06" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Julho" ShowInCustomizationForm="True" VisibleIndex="13">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vMes07" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Perda" FieldName="pMes07" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaMes07" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agosto" ShowInCustomizationForm="True" VisibleIndex="17">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vMes08" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Perda" FieldName="pMes08" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaMes08" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Setembro" ShowInCustomizationForm="True" VisibleIndex="21">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vMes09" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Perda" FieldName="pMes09" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaMes09" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Oututbro" ShowInCustomizationForm="True" VisibleIndex="25">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vMes10" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Perda" FieldName="pMes10" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaMes10" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Novembro" ShowInCustomizationForm="True" VisibleIndex="29">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vMes11" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Perda" FieldName="pMes11" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaMes11" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Dezembro" ShowInCustomizationForm="True" VisibleIndex="34">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vMes12" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Perda" FieldName="pMes12" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaMes12" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Ano" ShowInCustomizationForm="True" VisibleIndex="38">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vAno" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle Font-Bold="True" ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Perda" FieldName="pAno" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle Font-Bold="True">
                                            </CellStyle>
                                            <FooterCellStyle Font-Bold="True">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percPerdaAno" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle Font-Bold="True">
                                            </CellStyle>
                                            <FooterCellStyle Font-Bold="True">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings HorizontalScrollBarMode="Visible" VerticalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="400" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <Footer Font-Bold="True">
                                </Footer>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Metas.uspOriginal_VendaPerdaPorSecao_12Meses" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>
    </div>
</asp:Content>

