<%@ Page Title="Estoque por Loja - Todas Seções - PGR424" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Estoque_Secao_porLoja.aspx.vb" Inherits="MemberPages_Estoque_Secao_porLoja" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divFilial {
            clear: both;
            float: left;
        }

        #divPeriodo {
            
            margin-left: 2px;
            margin-top: 5px;
        }        

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 12px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 3px;
            width: 100%;
        }

        #divSize {            
            float: left;    
            margin-left: 15px;  
             margin-top: 7px;     
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
            margin-top: 2px;
        }

        #divQuadrante {            
            margin-top: 8px;                
            line-break:normal
        }

        #divProdutos {
            margin-top: 2px;
            float:left;
            width: 530px;
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

   
    <div id="divQuadrante">

        <div id="divFilial">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" AutoPostBack="false" />
        </div>
    
        <div id="divPeriodo">
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" Height="15px">
                <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="divSize">
            <uc1:wucSize runat="server" ID="cboSize" />
        </div>

        <asp:Button ID="btnAtualiza" runat="server" Text="Button" Visible="false"  />

</div>



    

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent>

                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" KeyFieldName="Descricao" Width="100%" Visible="false">
                        <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn FieldName="descSecao" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Seção / Departamento" FixedStyle="Left" Width="200px">
                                <Settings AllowAutoFilter="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="QtdeEstoque" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Qtde Estoque" Width="120px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrEstoque" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Valor Estoque" Width="120px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>

                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Settings VerticalScrollableHeight="550" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Visible" ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="False" />
                        <SettingsText EmptyDataRow="Nenhuma informação disponivel." GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <FocusedRow BackColor="Yellow" Font-Bold="True" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>
                  
                 <%--Arraste seu controle aqui --%>                         
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Programas.usp_PGR424" SelectCommandType="StoredProcedure" EnableCaching="False" >
                        <SelectParameters>                            
                            <asp:SessionParameter Name="Dia" SessionField="sDIA_INICIAL" DbType="Date" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" DbType="Int16" />                            
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Red"></asp:Label>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: gerEstoque" Anotacao2="dbo.usp_Buscar_Estoque_Total_Por_Dia_Todas_Filiais" />

</asp:Content>


