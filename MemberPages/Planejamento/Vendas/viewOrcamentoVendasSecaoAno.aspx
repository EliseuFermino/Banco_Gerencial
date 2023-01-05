<%@ Page Title="Relatório de Vendas por Seção" Language="VB" MasterPageFile="~/MemberPages/SiteOrcamento.master" AutoEventWireup="false" CodeFile="viewOrcamentoVendasSecaoAno.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_viewOrcamentoVendasSecaoAno" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaPosicao.ascx" TagPrefix="uc1" TagName="wucListaPosicao" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
     <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

     
        #divFilial {            
            float: left;
            margin-left: 10px;
        }

         #divPosicao {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoAtualizar {            
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

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />    
    </div>

    <div id="divPosicao">
        <uc1:wucListaPosicao runat="server" ID="cboPosicao" />
     </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divDados">
   
     <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>        
            
                <dxwgv:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" 
                    DataSourceID="dsView" EnableTheming="True" Theme="SoftOrange" Width="1000px">

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
                        <dxwgv:GridViewBandColumn Caption="Ano 3" VisibleIndex="2" Name="Grupo_Ano3" 
                            ShowInCustomizationForm="True">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="vlrA3" ReadOnly="True" 
                                    VisibleIndex="0" ShowInCustomizationForm="True" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Part" FieldName="percA3" ReadOnly="True" 
                                    VisibleIndex="1" ShowInCustomizationForm="True" Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Ano 2" VisibleIndex="3" Name="Grupo_Ano2" 
                            ShowInCustomizationForm="True">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="vlrA2" ReadOnly="True" 
                                    VisibleIndex="0" ShowInCustomizationForm="True" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Part" FieldName="percA2" ReadOnly="True" 
                                    VisibleIndex="1" ShowInCustomizationForm="True" Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Ano 1" VisibleIndex="4" Name="Grupo_Ano1" 
                            ShowInCustomizationForm="True">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="vlrA1" ReadOnly="True" 
                                    VisibleIndex="0" ShowInCustomizationForm="True" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Part" FieldName="percA1" ReadOnly="True" 
                                    VisibleIndex="1" ShowInCustomizationForm="True" Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="Blue">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#0066CC" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Meta" VisibleIndex="5" Name="Grupo_Meta" 
                            ShowInCustomizationForm="True">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="vlr" ReadOnly="True" 
                                    VisibleIndex="0" ShowInCustomizationForm="True" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="#009900">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Part" FieldName="perc" ReadOnly="True" 
                                    VisibleIndex="1" ShowInCustomizationForm="True" Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="#009900">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#009900" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Crescimento" VisibleIndex="6" 
                            Name="Grupo_Crescimento" ShowInCustomizationForm="True">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn FieldName="CrescA3_A4" ReadOnly="True" 
                                    VisibleIndex="2" Name="CrescMeta" ShowInCustomizationForm="True" 
                                    Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="CrescA2_A3" ReadOnly="True" 
                                    VisibleIndex="1" Name="CrescAA" ShowInCustomizationForm="True" 
                                    Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="CrescA1_A2" ReadOnly="True" 
                                    VisibleIndex="0" Name="CrescAA1" ShowInCustomizationForm="True" 
                                    Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#FF9900" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Seção" FieldName="Descricao" 
                            VisibleIndex="0" ShowInCustomizationForm="True" Width="200px">
                            <CellStyle Wrap="False">
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <settings showverticalscrollbar="True" verticalscrollableheight="610" />
                    <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                    <Styles>
                        <Header HorizontalAlign="Center"></Header>
                        <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                    </Styles>
                  
                </dxwgv:ASPxGridView>

    <asp:SqlDataSource ID="dsView" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        SelectCommand="uspBackPage_VendaSecaoOriginalLoja_Atualiza_Ano" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            
            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                            
            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
            <asp:SessionParameter Name="userName" SessionField="sUSER" Type="String" />
             <asp:SessionParameter Name="idTipoSecao" SessionField="sTIPO" Type="Byte" />
		    <asp:SessionParameter Name="idPosicao" SessionField="sPOSICAO" Type="Byte" />

        </SelectParameters>
    </asp:SqlDataSource>

      </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

   </div>           

    
    

</asp:Content>

