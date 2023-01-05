<%@ Page Title="Historico por Comprador" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CondicaoEspecialHistoricoPorComprador4anos.aspx.vb" Inherits="MemberPages_ContasReceber_CondicaoEspecialTotalPorComprador" %>



<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divMesInicial {            
            float: left;
            margin-left: 10px;
        }

        #divBaseCNPJ {
            float: left;
            margin-left: 5px;
             margin-top: 4px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divShowAgenda {            
            float: left;
            margin-left: 10px;
            margin-top: 4px;
        }

        #divSize {            
            float: left;           
        }


        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divBotaoExcel { 
            clear:both;           
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divMesInicial">
        <uc1:wuciListaMes runat="server" ID="cboMesInicial" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    
    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                  
                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" Width="600px" KeyFieldName="Comprador">
                        <TotalSummary>

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2013" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2014" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2015" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2016" SummaryType="Sum" />

                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Comprador" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="2013" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="2014" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="2015" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="2016" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager PageSize="20" Mode="ShowAllRecords">
                            <Summary AllPagesText="Pages: {0} - {1} ({2} fornecedores)" Text="Page {0} of {1} ({2} fornecedores)" />
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="400" ShowFooter="True" ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <SettingsDetail ShowDetailRow="True" ShowDetailButtons="False" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>
                    
		            <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerContasReceberConnectionString %>" SelectCommand="uspTotalComprador4Anos" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="MesInicial" SessionField="sMES_INICIAL" Type="Byte" />
                                        <asp:SessionParameter Name="MesFinal" SessionField="sMES_INICIAL" Type="Byte" />
                            
                                    </SelectParameters>
                                </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

</asp:Content>


