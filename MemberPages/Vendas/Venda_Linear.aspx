<%@ Page Title="Venda Linear" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Venda_Linear.aspx.vb" Inherits="MemberPages_Vendas_Venda_Linear" %>

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
        }    
        
        #divFilial {            
            float: left;
            margin-left: 10px;
             margin-top: 1px;
        }    

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 2px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 2px;
        }

        #divSize {            
            float: left;   
            margin-left: 10px;        
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
            margin-top: 2px;
        }



    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divPeriodo">
        <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" AutoPostBack ="false"  />
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
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" EnableTheming="True" Theme="MaterialCompact">
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" />
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="idCategoria_Pereciveis_Linear" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descCategoria_Pereciveis_Linear" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Descrição" SortIndex="0" SortOrder="Ascending" Width="150px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CodLoja" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Filial" Width="60px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="QtdVendas" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Volume" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Venda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Vendas" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Sum" />
                        </TotalSummary>
                        <Styles>
                            <Header BackColor="Gray" ForeColor="White">
                            </Header>
                            <AlternatingRow BackColor="#EAEAEA">
                            </AlternatingRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>
                  
                 <%--Arraste seu controle aqui --%>                         
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="usp_Buscar_Venda_Linear" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" DbType="Date" />
                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" DbType="Date" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>


