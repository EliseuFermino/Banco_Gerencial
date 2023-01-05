<%@ Page Title="Perfil" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Perfil_Clientes.aspx.vb" Inherits="MemberPages_Vendas_Perfil_Clientes" %>

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
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="1000px" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Atualizando&amp;hellip;">
                <PanelCollection>
                    <dx:PanelContent runat ="server" SupportsDisabledAttributes="both">
                        <dx:ASPxGridView ID="grid1" runat="server" DataSourceID="dsPerfil" AutoGenerateColumns="False" KeyFieldName="Descricao" Width="1000px">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Descricao" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                    <HeaderStyle Font-Bold="True" />
                                    <CellStyle Font-Bold="False" Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Clientes" ShowInCustomizationForm="True" ToolTip="Quadrante de Clientes" VisibleIndex="19">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Nº" FieldName="numClientes" ShowInCustomizationForm="True" ToolTip="Número de Clientes" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaPorCliente" ShowInCustomizationForm="True" ToolTip="Venda por cliente" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Itens" FieldName="NRClientes" ShowInCustomizationForm="True" ToolTip="Média de Itens por Clientes" VisibleIndex="2" Width="55px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="numClientes2" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Pessoas na Loja" ToolTip="Número de Clientes x 2,5" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
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
                                <FocusedRow BackColor="Yellow" Font-Bold="True" ForeColor="#0066FF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsPerfil" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="uspBuscarPERFIL" SelectCommandType="StoredProcedure">
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

