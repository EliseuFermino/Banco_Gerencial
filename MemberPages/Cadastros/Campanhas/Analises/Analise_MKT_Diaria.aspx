<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Analise_MKT_Diaria.aspx.vb" Inherits="MemberPages_Campanhas_Analises_Analise_MKT_Diaria" %>


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

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 1px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 2px;
            width: 100%;
        }

        #divSize {            
            float: left;           
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divDatas {
            clear:both;
            float:left;
            margin-left: 5px;
        }

        #divProdutos {            
            float:left;
            margin-left: 20px;
        }

        #divLojas {            
            float:left;
            margin-left: 20px;
        }

        #divVendaEmpresaGeral {            
            float:left;
            margin-left: 20px;
        }

        #divLucroPDV {            
            float:left;
            margin-left: 20px;
        }

        #divSellOut {            
            float:left;
            margin-left: 20px;
        }

    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div>


    <div id="divPeriodo">
        <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" CallSize ="150%" />
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divDatas">
        <dx:ASPxCheckBox ID="chkDatas" runat="server" Theme="DevEx" Text="Exibir Datas" Font-Bold="True" CheckState="Unchecked" >
            <ClientSideEvents ValueChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divProdutos">
        <dx:ASPxCheckBox ID="chkProdutos" runat="server" Theme="DevEx" Text="Exibir Produtos" Font-Bold="True" CheckState="Unchecked" >
            <ClientSideEvents ValueChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divLojas">
        <dx:ASPxCheckBox ID="chkLojas" runat="server" Theme="DevEx" Text="Exibir Lojas" Font-Bold="True" CheckState="Unchecked" >
            <ClientSideEvents ValueChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divVendaEmpresaGeral">
        <dx:ASPxCheckBox ID="chkVendaEmpresaGeral" runat="server" Theme="DevEx" Text="Exibir Venda Geral" Font-Bold="True" CheckState="Unchecked" >
            <ClientSideEvents ValueChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divLucroPDV">
        <dx:ASPxCheckBox ID="chkLucroPDV" runat="server" Theme="DevEx" Text="Exibir Lucro PDV" Font-Bold="True" CheckState="Unchecked" >
            <ClientSideEvents ValueChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divSellOut">
        <dx:ASPxCheckBox ID="chkSellOut" runat="server" Theme="DevEx" Text="Exibir Sell-Out" Font-Bold="True" CheckState="Unchecked" >
            <ClientSideEvents ValueChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>



    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent>

                 <%--Arraste seu controle aqui --%> 
                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDado" KeyFieldName="idCampanha" Width="100%" EnableTheming="True" Theme="SoftOrange">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="aa_QtdVendas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m3_QtdVendas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m2_QtdVendas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m1_QtdVendas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="aa_Venda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m3_Venda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m2_Venda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m1_Venda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="aa_VendaGeral" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m3_VendaGeral" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m2_VendaGeral" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m1_VendaGeral" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaGeral" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="aa_LucroComercial" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m3_LucroComercial" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m2_LucroComercial" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m1_LucroComercial" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercial" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="aa_LucroSellOut" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m3_LucroSellOut" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m2_LucroSellOut" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m1_LucroSellOut" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="aa_LucroCheio" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m3_LucroCheio" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m2_LucroCheio" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m1_LucroCheio" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroCheio" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="aa_numCliente" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m3_numCliente" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m2_numCliente" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="m1_numCliente" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />

                            <dx:ASPxSummaryItem FieldName="numCliente_Geral" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartClientes" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartVenda" SummaryType="Custom" />

                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="idCampanha" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px" Caption="Nº da &lt;br&gt; Campanha">
                                <Settings AutoFilterCondition="Contains" HeaderFilterMode="CheckedList" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descCampanha" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="250px" Caption="Descrição da &lt;br&gt; Campanha">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Datas" Name="bandDatas" ShowInCustomizationForm="True" VisibleIndex="3" FixedStyle="Left" Visible="False" >
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="aa_Data" ShowInCustomizationForm="True" VisibleIndex="0" Width="65px">
                                        <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yy} " EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m3_Data" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                        <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yy} " EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m2_Data" ShowInCustomizationForm="True" VisibleIndex="2" Width="65px">
                                        <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yy} " EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m1_Data" ShowInCustomizationForm="True" VisibleIndex="3" Width="65px">
                                        <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yy} " EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Data" ShowInCustomizationForm="True" VisibleIndex="4" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yy} " EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Produtos" Name="bandProduto" ShowInCustomizationForm="True" VisibleIndex="4" Visible="False" >
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="aa_CodProduto" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m3_CodProduto" ShowInCustomizationForm="True" VisibleIndex="1" Width="50px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m2_CodProduto" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m1_CodProduto" ShowInCustomizationForm="True" VisibleIndex="3" Width="50px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CodProduto" ShowInCustomizationForm="True" VisibleIndex="4" Width="50px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Lojas" Name="bandLoja" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False" >
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="aa_CodLoja" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m3_CodLoja" ShowInCustomizationForm="True" VisibleIndex="1" Width="50px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m2_CodLoja" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m1_CodLoja" ShowInCustomizationForm="True" VisibleIndex="3" Width="50px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CodLoja" ShowInCustomizationForm="True" VisibleIndex="4" Width="50px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Quantidades (Volume)" Name="bandVolume" ShowInCustomizationForm="True" VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="aa_QtdVendas" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>                                    
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m3_QtdVendas" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m2_QtdVendas" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m1_QtdVendas" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="4" Width="90px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                        <CellStyle Font-Bold="True" ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Vendas da Campanha" Name="bandVenda" ShowInCustomizationForm="True" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="aa_Venda" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>                                    
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m3_Venda" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m2_Venda" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m1_Venda" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Venda" ShowInCustomizationForm="True" VisibleIndex="4" Width="90px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                        <CellStyle Font-Bold="True" ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartVenda" ShowInCustomizationForm="True" VisibleIndex="5" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Vendas Geral da Empresa" Name="bandVendaGeral" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False" >
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="aa_VendaGeral" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>                                    
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m3_VendaGeral" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m2_VendaGeral" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m1_VendaGeral" ShowInCustomizationForm="True" VisibleIndex="3" Width="90px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="VendaGeral" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                        <CellStyle Font-Bold="True" ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Lucro PDV" Name="bandLucroPDV" ShowInCustomizationForm="True" VisibleIndex="9" Visible="false" >
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="aa_LucroComercial" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>                                    
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m3_LucroComercial" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m2_LucroComercial" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m1_LucroComercial" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="LucroComercial" ShowInCustomizationForm="True" VisibleIndex="4" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                        <CellStyle Font-Bold="True" ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="SELL-OUT" Name="bandLucroSellOut" ShowInCustomizationForm="True" VisibleIndex="10" Visible="false">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="aa_LucroSellOut" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>                                    
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m3_LucroSellOut" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m2_LucroSellOut" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m1_LucroSellOut" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="LucroSellOut" ShowInCustomizationForm="True" VisibleIndex="4" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                        <CellStyle Font-Bold="True" ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Lucro Final" Name="bandLucroCheio" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="aa_LucroCheio" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>                                    
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m3_LucroCheio" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m2_LucroCheio" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m1_LucroCheio" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="LucroCheio" ShowInCustomizationForm="True" VisibleIndex="4" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                        <CellStyle Font-Bold="True" ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Número de Clientes" Name="bandnumCliente" ShowInCustomizationForm="True" VisibleIndex="12">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="aa_numCliente" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>                                    
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m3_numCliente" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m2_numCliente" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="m1_numCliente" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="numCliente" ShowInCustomizationForm="True" VisibleIndex="4" Width="80px">
                                        <Settings AllowAutoFilter="False" />
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>   
                                        <CellStyle Font-Bold="True" ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartClientes" ShowInCustomizationForm="True" VisibleIndex="5" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>


                            <dx:GridViewDataCheckColumn Caption="#" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Se Verde, a campanha esta Fechada." VisibleIndex="0" Width="30px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataCheckColumn>


                            <dx:GridViewDataTextColumn FieldName="numCliente_Geral" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                            </dx:GridViewDataTextColumn>


                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager PageSize="17">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" ShowFilterBar="Auto" ShowFilterRow="True" ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
                        <SettingsText FilterBarClear="Limpar Filtro" FilterBarCreateFilter="Limpar" />
                        <ImagesFilterControl>
                            <OperationDoesNotEqual AlternateText="Não Incluir">
                            </OperationDoesNotEqual>
                        </ImagesFilterControl>
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EAEAEA">
                            </AlternatingRow>
                            <FocusedRow BackColor="Yellow" ForeColor="Blue">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>                           
                    
                    <asp:SqlDataSource ID="dsDado" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="usp_Analise_MKT_Diaria" SelectCommandType="StoredProcedure">
                         <SelectParameters>                            
                            <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                            <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />                      
                        </SelectParameters>

                    </asp:SqlDataSource>
                    
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


    </div>

</asp:Content>

