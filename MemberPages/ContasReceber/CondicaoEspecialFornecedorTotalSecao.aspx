<%@ Page Title="Operação Comercial - Fornecedor Total" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CondicaoEspecialFornecedorTotalSecao.aspx.vb" Inherits="MemberPages_ContasReceber_CondicaoEspecialFornecedorTotalSecao" %>


    <%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucFornecedor.ascx" TagPrefix="uc1" TagName="wucFornecedor" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            
            float: left;
            margin-left: 2px;
        }

        #divMesInicial {            
            float: left;
            margin-left: 10px;
        }

        #divMesFinal {            
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
            width: 100%;
        }

        #divBotaoExcel { 
            clear:both;           
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }

         #divSecao {   
             clear: both;         
            float: left;
            margin-left: 2px;
            margin-top: 3px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divSecao">
        <uc1:wucListaSecao runat="server" ID="cboSecao" />
    </div>

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMesInicial">
        <uc1:wuciListaMes runat="server" ID="cboMesInicial" />
    </div>

    <div id="divMesFinal">
        <uc1:wuciListaMes runat="server" ID="cboMesFinal" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" CallSize="100" />
    </div>




    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent>
                  
                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" Width="100%" KeyFieldName="idAgenda">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrAgenda" SummaryType="Sum" />
                            
                        </TotalSummary>
                        <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrAgenda" SummaryType="Sum" />
                        </GroupSummary>
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialDesc" ShowInCustomizationForm="True" VisibleIndex="5" Width="175px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="idAgenda" ShowInCustomizationForm="True" Width="70px" Caption="Agenda" VisibleIndex="6">
    <Settings AutoFilterCondition="NotEqual" />
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="descAgenda" ShowInCustomizationForm="True" Width="280px" Caption="Descrição da Agenda" VisibleIndex="7">
    <CellStyle Wrap="False">
    </CellStyle>
</dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrAgenda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9" Width="110px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle Font-Bold="True" ForeColor="#3333FF">
                                </CellStyle>
                                <FooterCellStyle ForeColor="#3333FF">
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Seção" FieldName="descProdutoSecaoLista" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="11" Width="200px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="True" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Tipo" FieldName="Tipo" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px" FixedStyle="Left">
                                <Settings AllowAutoFilter="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn ShowInCustomizationForm="True" VisibleIndex="13">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Codigo" FieldName="idFornecedor" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descrição do Formecedor" FieldName="nomeFornecedor" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px">
                                        <Settings AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="CGC Principal" FieldName="cgcPrincipal" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descrição do Formecedor" FieldName="NomeFornecedorPrincipal" ShowInCustomizationForm="True" VisibleIndex="3" Width="200px">
                                        <Settings AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Acordo" FieldName="numTitulo" ShowInCustomizationForm="True" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager PageSize="20">
                            <Summary AllPagesText="Pages: {0} - {1} ({2} fornecedores)" Text="Page {0} of {1} ({2} fornecedores)" />
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="400" ShowFooter="True" ShowFilterRow="True" ShowFilterRowMenu="True" ShowGroupPanel="True" />
                        <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
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
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerContasReceberConnectionString %>" SelectCommand="dbo.usp_AcordoComercial_Analitico_PorFornecedor_Total_Secao" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes_Inicial" SessionField="sMES_INICIAL" Type="Byte" />
                            <asp:SessionParameter Name="Mes_Final" SessionField="sMES_FINAL" Type="Byte" />                            
                            <asp:SessionParameter Name="Secao" SessionField="sSECAO" Type="Byte" />
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




