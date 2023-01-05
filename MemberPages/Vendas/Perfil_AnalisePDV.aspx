<%@ Page Title="Perfil" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Perfil_AnalisePDV.aspx.vb" Inherits="MemberPages_Vendas_Perfil_AnalisePDV" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>







<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css" >
           
        html {            
                overflow-x:hidden;            
            }

        /*#moldura {
                width:1024px; 
                margin: 0 auto ;                      
            }*/

        #divAno {
            float: left;            
        }

        #divMes {
            float: left;
        }

        #divBotaoAtualizar {
            float: left;
            padding-left: 10px;
            padding-top: 2px;
        }

        #divSize {
            float: left;  
            margin-left: 10px;       
        }

        #divExcel {
            float: left;  
            margin-left: 10px;       
        }

        #divDados {
            clear:both;
            float: left;
            margin-left: 3px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

 <%--   <div id="moldura">--%>

        <div id="divAno">
            <uc1:wucAno runat="server" ID="cboAno" />
        </div>

        <div id="divMes">
            <uc1:wuciListaMes runat="server" ID="cboMes" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
            </dx:ASPxButton>
        </div>

        <div id="divSize">     
            <uc1:wucSize runat="server" ID="cboSize" /> 
        </div>

        <div id="divExcel">     
            <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid1" />
        </div>

        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="1000px" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Atualizando&amp;hellip;">
                <PanelCollection>
                    <dx:PanelContent runat ="server" SupportsDisabledAttributes="both">
                        <dx:ASPxGridView ID="grid1" runat="server" DataSourceID="dsPerfil" AutoGenerateColumns="False" KeyFieldName="Descricao" Width="750px">
                            <Columns>
                                <dx:GridViewBandColumn Caption="Frente Caixa / PDV" ShowInCustomizationForm="True" ToolTip="Quadrante do PDV" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Nº" FieldName="numPDV" ShowInCustomizationForm="True" ToolTip="Número de PDV na Frente de Caixa + PDV's no Eletro, Rotisseria e Restaurante." VisibleIndex="1" Width="60px">
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaPDV" ShowInCustomizationForm="True" ToolTip="Venda por Frente de Caixa / PDV " VisibleIndex="2" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Pos" FieldName="ClassPDV" ShowInCustomizationForm="True" ToolTip="Posiçãp" VisibleIndex="0" Width="40px">
                                            <CellStyle Font-Bold="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn FieldName="Descricao" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px" Caption="Descrição">
                                    <HeaderStyle Font-Bold="True" />
                                    <CellStyle Font-Bold="False" Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Frente Caixa s/ Eletro" ShowInCustomizationForm="True" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Nº" FieldName="numCheckOut" ShowInCustomizationForm="True" ToolTip="Número de PDV na Frente de Caixa + PDV's no Eletro, Rotisseria e Restaurante." VisibleIndex="1" Width="60px">
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaPDV_Eletro" ShowInCustomizationForm="True" ToolTip="Venda por Frente de Caixa / PDV sem Eletro" VisibleIndex="2" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Pos" FieldName="ClassCheck" ShowInCustomizationForm="True" VisibleIndex="0" Width="40px">
                                            <CellStyle Font-Bold="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Frente de Caixa" ShowInCustomizationForm="True" ToolTip="Quadrante de Check-Out" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Nº" FieldName="numCheckOut" ShowInCustomizationForm="True" ToolTip="Número de PDV na Frente de Caixa" VisibleIndex="1" Width="60px">
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaCheck" ShowInCustomizationForm="True" ToolTip="Venda por Frente de Caixa" VisibleIndex="2" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Pos" FieldName="Class" ShowInCustomizationForm="True" ToolTip="Posição " VisibleIndex="0" Width="40px" FixedStyle="Left">
                                            <HeaderStyle Font-Bold="False" />
                                            <CellStyle Font-Bold="False" HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewBandColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F0F0F0">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" Font-Bold="True" ForeColor="#0066FF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsPerfil" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="uspBuscarPERFIL_AnalisePDV" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

        </div>

 <%--   </div>--%>

</asp:Content>

