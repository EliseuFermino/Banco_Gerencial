<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ConsultaConsolidado.aspx.vb" Inherits="MemberPages_Quebras_RemessaConserto_ConsultaConsolidado" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divPeriodo {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }        

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 1px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divSize {            
            float: left;           
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }



    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divPeriodo">
        <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
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

                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="numNota" Width="800px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="VlrTotal" SummaryType="Sum" />
                        </TotalSummary>
                        <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" ShowInGroupFooterColumn="Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="VlrTotal" ShowInGroupFooterColumn="Total" SummaryType="Sum" />
                        </GroupSummary>
                        <Columns>
                            <dx:GridViewDataDateColumn Caption="Dia" FieldName="DiaMovimento" ShowInCustomizationForm="True" VisibleIndex="1">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="Filial" FieldName="nomeFilialLista" GroupIndex="0" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="2">
                                <Settings AllowGroup="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="nº NF" FieldName="numNota" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="nº Fornecedor" FieldName="idFornecedorDestino" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Código Produto" FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="5" Width="400px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Qtde" ShowInCustomizationForm="True" VisibleIndex="6">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Preço Unit." FieldName="PrecoUnitario" ShowInCustomizationForm="True" VisibleIndex="7">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Total" FieldName="VlrTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EnableFocusedStyle="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Assistência Têcnica" FieldName="nomeFornecedor" GroupIndex="1" ShowInCustomizationForm="True" SortIndex="1" SortOrder="Ascending" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" />
                        <Styles>
                            <GroupRow Font-Bold="True" Font-Size="Small" ForeColor="#3333FF">
                            </GroupRow>
                            <AlternatingRow BackColor="#F0F0F0">
                            </AlternatingRow>
                            <Footer BackColor="#CCFFCC" Font-Bold="True">
                            </Footer>
                            <GroupFooter Font-Bold="True" Font-Size="Small">
                            </GroupFooter>
                        </Styles>
                    </dx:ASPxGridView>
                  
                 <%--Arraste seu controle aqui --%>                         
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Remessa.usp_BuscarNF" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" DbType="Date" />
                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" DbType="Date" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>



