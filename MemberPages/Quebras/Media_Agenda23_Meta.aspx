<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteMetas.master" AutoEventWireup="false" CodeFile="Media_Agenda23_Meta.aspx.vb" Inherits="Media_Agenda23_Meta" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css" >     

        #divoAno {                   
           float: left;         
           padding-left: 2px;
           margin-left: 2px;
           margin-top: 3px;             
        }

        #divMes {       
           float: left;         
           padding-left: 2px;
           margin-left: 2px;
           margin-top: 3px;             
        }

        #divFilial {           
           float: left;         
           padding-left: 2px;
           margin-left: 2px;
           margin-top: 3px;             
        }

        #divGrafico {            
            float: left;
            padding-top: 5px;                        
        }

        #divBotaoAtualizar {            
            float:left ;           
            margin-left: 2px;
            width: 80px;  
            padding-top: 2px;                                            
        }

        
        #divSize {            
            float: left;   
            padding: 9px;  
            margin-top: 3px;
            margin-left: 5px;      
        }       
       
        #divDados {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 100%;
            margin-left: 1px;            
            padding-right: 2px;  
        }    
          

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <%--<div id="moldura">--%>

        <div id="divAno">
            <uc1:wucAno runat="server" ID="cboAno" />
        </div>

         <div id="divMes" >
            <uc1:wuciListaMes runat="server" ID="cboMes" />
        </div>

        <div id="divFilial" class="BGC_myBorder">
            <uc1:wucLista_Filial_Empresa runat="server" ID="cboFilial" />
        </div>
        

        <div id="divSize" class="BGC_myBorder " >
            <uc1:wucSize runat="server" ID="cboSize" CallSize="100" AutoPostBack="false"  />
        </div>        

        
        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" >
                <ClientSideEvents Click="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
        </div>       


        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
<SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>


                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
                                        EnableTheming="True" Theme="SoftOrange" 
                                        KeyFieldName="idSecao"  DataSourceID="SqlDataSource1" Width="100%" >
                                        <Toolbars>
                                            <dx:GridViewToolbar>
                                                <Items>
                                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para EXCEL - XLS" />
                                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para EXCEL - XLSX" />
                                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" />
                                                </Items>
                                            </dx:GridViewToolbar>
                                        </Toolbars>
                                        <Columns>                                           

                         

                                            <dx:GridViewDataTextColumn FieldName="descId" VisibleIndex="1" 
                                                Caption="Seção / Departamento" Width="200px" FixedStyle="Left">
                                                <Settings AutoFilterCondition="Contains" />
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="Código" FieldName="idSecao" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="0" Width="70px" Visible="False">
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Name="band6" ShowInCustomizationForm="True" VisibleIndex="5">
                                                <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23_Mes6" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23_Mes6" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#0066CC" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Name="band5" ShowInCustomizationForm="True" VisibleIndex="6">
                                                <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23_Mes5" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#0066CC" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23_Mes5" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#0066CC" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Name="band4" ShowInCustomizationForm="True" VisibleIndex="7">
                                                <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23_Mes4" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#0066CC" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23_Mes4" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#0066CC" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Name="band3" ShowInCustomizationForm="True" VisibleIndex="8">
                                                <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23_Mes3" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#0066CC" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23_Mes3" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#0066CC" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Name="band2" ShowInCustomizationForm="True" VisibleIndex="11">
                                                <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23_Mes2" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#0066CC" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23_Mes2" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#0066CC" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Name="band1" ShowInCustomizationForm="True" VisibleIndex="14">
                                                <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23_Mes1" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#0066CC" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23_Mes1" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#0066CC" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Meta / Média" Name="bandMedia" ShowInCustomizationForm="True" VisibleIndex="2">
                                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23_Media" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23_Media" ShowInCustomizationForm="True" VisibleIndex="2">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Meta Venda" FieldName="vlrMetaVenda" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>

                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>

                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_Mes6" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_Mes5" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_Mes4" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_Mes3" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_Mes2" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_Mes1" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23_Media" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23_Mes6" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23_Mes5" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23_Mes4" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23_Mes3" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23_Mes2" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23_Mes1" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23_Media" SummaryType="Custom" />
                                        </TotalSummary>

                                        <Styles>
	                                        <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF" Font-Bold="True"> </FocusedRow>
	                                        	<Header HorizontalAlign="Center" Font-Size="Small" ForeColor="White">
                                            </Header>
	                                        	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Cell Font-Size="Small">
                                            </Cell>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                        </Styles>                                        
                                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" HorizontalScrollBarMode="Visible" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                            />
                                    </dx:ASPxGridView>        
                        

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Quebras.usp_Agenda23_6_Meses" SelectCommandType="StoredProcedure" EnableCaching="False" >
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

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Banco: DW" Anotacao2="Stored Procedure: Quebras.usp_Agenda23_6_Meses" />

   <%-- </div>--%>
   
</asp:Content>

