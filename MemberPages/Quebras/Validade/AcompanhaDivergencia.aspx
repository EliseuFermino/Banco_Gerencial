<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AcompanhaDivergencia.aspx.vb" Inherits="MemberPages_Quebras_AcompanhaDivergencia" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>








<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wuciListaDia.ascx" TagPrefix="uc1" TagName="wuciListaDia" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #ShowButton {
            float: left;
            margin-left: 2px;
            width: 115px;  
            padding-top: 2px;                      
        }

        #divPeriodo {            
            float: left;    
            padding-top: 5px;        
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 5px;
            padding-top: 2px;  
        }

        #divFixarCabecalho {
            float: left;
            margin-left: 5px;
            padding-top: 3px; 
        }

        #divExcel {
            float: left;
            margin-left: 15px;
            padding-top: 1px; 
        }

        #divDados {
            clear: both;
            float: left;  
            margin-left: 2px; 
            margin-top: 5px;        
        }

      
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div id="divPeriodo">
        <uc1:wuciListaDia runat="server" ID="cboDia" />
    </div>
    

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme ="Metropolis">
            <ClientSideEvents Click="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divFixarCabecalho">
        <dx:ASPxCheckBox ID="chkFixarCabecalho" runat="server" Theme ="DevEx" Text ="Fixar cabeçalho" Checked="True" CheckState="Checked">
            <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="900px" ClientInstanceName ="cbPanelGrid" Theme ="Metropolis" SettingsLoadingPanel-Text ="Atualizando...">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1"  runat="server" SupportsDisabledAttributes="both">
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" Width="650px" Visible="False">
                       
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Descricao" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Total de Produtos" ShowInCustomizationForm="True" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Ag. 51 - Sobra" FieldName="idProduto51" ShowInCustomizationForm="True" ToolTip="Agenda 51 - Sobra" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ag. 52 - Falta" FieldName="idProduto52" ShowInCustomizationForm="True" ToolTip="Agenda 52 - Faltas" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Valores em R$" ShowInCustomizationForm="True" VisibleIndex="2">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Ag. 51 - Sobra" FieldName="vlrAg51" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ag. 52 - Falta" FieldName="vlrAg52" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Divergencia" FieldName="vlrDivergencia" ShowInCustomizationForm="True" VisibleIndex="5" ReadOnly="True">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" VerticalScrollableHeight="550" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="WhiteSmoke">
                            </AlternatingRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="dbo.ups_Ederson_Acompanha_Divergencia" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA_INICIAL" />                  
                       
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Label ID="lblError" runat="server" Text="" ForeColor ="Red" ></asp:Label>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



    
</asp:Content>

