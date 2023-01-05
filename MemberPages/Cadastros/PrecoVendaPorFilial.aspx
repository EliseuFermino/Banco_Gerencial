<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="PrecoVendaPorFilial.aspx.vb" Inherits="MemberPages_Cadastros_PrecoVendaPorFilial" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divSecao {            
            float: left;
            margin-left: 10px;
        }

        #divFilial {            
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
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>
    
    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>


    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>

                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" Width="1000px" KeyFieldName="CODPRODUTO">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrNR1" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn FieldName="CODPRODUTO" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Código" Width="70px" FixedStyle="Left">
                                <Settings AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn ShowInCustomizationForm="True" Width="90px" Caption="Custo Condor" VisibleIndex="3" FieldName="vlrCusto">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="GreaterOrEqual" />                               
                                <CellStyle Font-Bold="True" ForeColor="Blue">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="VLRPRECOVENDA" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Preço Venda" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="QtdeEstoque" ShowInCustomizationForm="True" VisibleIndex="5" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n3}" EnableFocusedStyle="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="GreaterOrEqual" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="2" Width="240px" FixedStyle="Left">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descProdutoDeptoLista" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Departamento" Width="100px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descProdutoSecaoLista" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Seção" Width="100px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descProdutoGrupoLista" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Grupo" Width="100px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descProdutoSubgrupoLista" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Sub-Grupo" Width="100px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Situação" FieldName="Ativo" ShowInCustomizationForm="True" VisibleIndex="10" Width="110px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Fornecedor Principal" FieldName="NomeFornecedorPrincipal" ShowInCustomizationForm="True" VisibleIndex="11" Width="150px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager PageSize="20">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowTitlePanel="True" VerticalScrollableHeight="420" VerticalScrollBarMode="Auto" ShowFilterRow="True" ShowFilterBar="Visible" />
                        <SettingsText FilterBarClear="Limpar" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <ImagesFilterControl>
                            <RemoveButton AlternateText="Limpar Filtro">
                            </RemoveButton>
                            <RemoveButtonHot AlternateText="Limpar Filtro">
                            </RemoveButtonHot>
                            <RemoveGroup AlternateText="Limpar Filtro">
                            </RemoveGroup>
                            <OperationLess AlternateText="Menor">
                            </OperationLess>
                        </ImagesFilterControl>
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
                    
            		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:SQL14_gerCadastrosConnectionString %>" SelectCommand="PrecoVenda.uspBuscarPrecoVenda" SelectCommandType="StoredProcedure" EnableCaching="true" CacheExpirationPolicy="Sliding"  >
                        <SelectParameters>
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Servidor 14   -  Database: gerCadastros" Anotacao2="Stored: PrecoVenda.uspBuscarPrecoVenda" />

</asp:Content>


