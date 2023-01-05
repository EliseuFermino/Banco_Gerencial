<%@ Page Title="Faixa Cupons Aniversário" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Faixas_Cupom_Aniversario.aspx.vb" Inherits="MemberPages_Gerencial_Faixas_Cupom_Aniversario" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>








<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divFilial {
            clear: both;
            float: left;
            margin-left: 10px;
            margin-top: 5px;
            width: 255px;
        }

        #divPeriodo {         
            float: left;
            margin-left: 10px;
            
        }        

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 6px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            padding-top: 5px;
        }

  
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

     <div id="divFilial" >
            <uc1:wucLista_Filial_Empresa runat="server" ID="cboFilial" Visible_Empresa ="false" Caption="Filial" AutoPostBack="false"    />
        </div>

    <div id="divPeriodo" >
        <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" Width="100px">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

 
    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" Theme="MetropolisBlue">
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" />
                         <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Faixa" ShowInCustomizationForm="True" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Total" ShowInCustomizationForm="True" VisibleIndex="2" ReadOnly="True">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="percPart" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Caption="% Part." ToolTip="Percentual de Participação">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Total" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="percPart" SummaryType="Sum" />
                        </TotalSummary>

                        <Toolbars>
                            <dx:GridViewToolbar EnableAdaptivity="true">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                </Items>
                            </dx:GridViewToolbar>
                        </Toolbars>


                        <Styles>
                            <Header HorizontalAlign="Center" Font-Size="Large">
                            </Header>
                            <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <Cell Font-Size="Larger">
                            </Cell>
                            <Footer Font-Size="Larger">
                            </Footer>
                        </Styles>


                    </dx:ASPxGridView>
                  
                 <%--Arraste seu controle aqui --%>                         
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerTempConnectionString %>" SelectCommand="dbo.usp_Buscar_Faixas_Cupons_Aniversario" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" Type="DateTime" />
                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: gerTemp" Anotacao2="Stored Procedure: dbo.usp_Buscar_Faixas_Cupons_Aniversario" />

</asp:Content>
