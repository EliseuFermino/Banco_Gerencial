<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="RelatorioPatrimonio.aspx.vb" Inherits="MemberPages_Patrimonio_RelatorioPatrimonio" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>








<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divFilial {
            clear: both;
            float: left;
            margin-left: 2px;
        }

       #divAno {          
            float: left;
            margin-left: 2px;
        }

        #divMes {            
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

        #divSize {            
            float: left;           
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            width: 100%;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>


    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="grid" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>



    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" Width="100%" ClientInstanceName="grid" >
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Total" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="EAN" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                <Settings AllowAutoFilter="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nomeProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="250px">
                                <Settings AllowAutoFilter="True" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Qtde" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Preco" ShowInCustomizationForm="True" VisibleIndex="4" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:C2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Total" ShowInCustomizationForm="True" VisibleIndex="5" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:C2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <CellStyle ForeColor="Blue">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="NomeFiscalAbordagem" ShowInCustomizationForm="True" VisibleIndex="6">
                                <Settings AllowAutoFilter="True" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Observacao" ShowInCustomizationForm="True" VisibleIndex="7">
                                <Settings AllowAutoFilter="True" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Dia" ShowInCustomizationForm="True" VisibleIndex="8">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="NomeFiscalConstatou" ShowInCustomizationForm="True" VisibleIndex="9">
                                <Settings AllowAutoFilter="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="NumCamera" ShowInCustomizationForm="True" VisibleIndex="10">
                                <Settings AllowAutoFilter="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="DVR" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Settings AllowAutoFilter="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nomeFilialLista" ShowInCustomizationForm="True" VisibleIndex="12" Width="150px">
                                <Settings AllowAutoFilter="True" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reativa_Preventiva" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="13">
                                <Settings AllowAutoFilter="True" />
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager NumericButtonCount="20" PageSize="20">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowGroupPanel="True" ShowFilterRow="True" />
                        <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" SearchPanelEditorNullText="Digite um texto para pesquisar em toda a tela..." />
                        <SettingsSearchPanel Visible="True" />
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
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="Patrimonio.usp_DadosPatrimonio" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


</asp:Content>

