<%@ Page Title="Contas à Receber - Análise Por Fornecedor e por Agenda" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="FornecedorAnaliseMesAnteriorPorAgenda.aspx.vb" Inherits="MemberPages_ContasReceber_FornecedorAnaliseMesAnteriorPorAgenda" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaAgendasContasReceber.ascx" TagPrefix="uc1" TagName="wucListaAgendasContasReceber" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divMes {            
            float: left;
            margin-left: 10px;
        }

        #divAgendas {            
            float: left;
            margin-left: 10px;
        }

        #divCGC {
            float: left;
            margin-left: 10px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>

    <div id="divAgendas">
        <uc1:wucListaAgendasContasReceber runat="server" ID="cboAgendas" />
    </div>

    <div id="divCGC">
        <dx:ASPxCheckBox ID="checkCGC" runat="server" Text="Base CNPJ" Checked="true"  ></dx:ASPxCheckBox>
    </div>


    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

   
    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="idForn" Width="800px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMesAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMesAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDif" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="idForn" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px" Caption="id">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descForn" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="300px" Caption="Nome do Fornecedor">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrMesAA" ShowInCustomizationForm="True" VisibleIndex="3" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrMesAT" ShowInCustomizationForm="True" VisibleIndex="4" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrDif" Caption ="Diferença" ShowInCustomizationForm="True" VisibleIndex="5" Width="80px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="percCresc" Caption ="% Cresc" ShowInCustomizationForm="True" VisibleIndex="6" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn> 
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager PageSize="20">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="440" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
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
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerContasReceberConnectionString %>" SelectCommand="Fornecedor.uspComparativoAgenda_MesAntual_x_MesAnterior" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="MesInicial" SessionField="sMES_INICIAL" Type="Byte" />
                            <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="idAgenda" SessionField="sAGENDA" Type="Int16" />
                            <asp:SessionParameter Name="cgcPrincipal" SessionField="sCGC_PRINCIPAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


</asp:Content>

