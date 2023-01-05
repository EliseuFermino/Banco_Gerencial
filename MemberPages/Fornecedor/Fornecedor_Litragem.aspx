<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Fornecedor_Litragem.aspx.vb" Inherits="MemberPages_Fornecedor_Fornecedor_Litragem" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>








<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divPeriodo {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }        

        #divSecao {            
            float: left;
            margin-left: 10px;
             margin-top: 1px;
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

    <div id="divSecao">
        <uc1:wucListaSecao runat="server" ID="cboSecao" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" AutoPostBack="False" />
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>



    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>

                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" Width="1010px" EnableTheming="True" Theme="SoftOrange" Visible="False">
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn FieldName="Usuario" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="cgcPrincipal" ShowInCustomizationForm="True" VisibleIndex="2" FixedStyle="Left">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="NomeFornecedorPrincipal" ShowInCustomizationForm="True" VisibleIndex="3" FixedStyle="Left" Width="250px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Periodo Selecionado" ShowInCustomizationForm="True" VisibleIndex="4">
                                <Columns>
                                    <dx:GridViewBandColumn Caption="Qtde" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Periodo &lt;br&gt; Anterior" FieldName="Qtde_AA" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="Gray" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Periodo &lt;br&gt; Atual" FieldName="Qtde_AT" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="Gray" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Qtde" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle BackColor="Gray" />
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Volume" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Periodo &lt;br&gt; Anterior" FieldName="Peso_AA" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="Gray" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Periodo &lt;br&gt; Atual" FieldName="Peso_AT" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="Gray" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Volume" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle BackColor="Gray" />
                                    </dx:GridViewBandColumn>
                                </Columns>
                                <HeaderStyle BackColor="Gray" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Mes: Março/2017" ShowInCustomizationForm="True" VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewBandColumn Caption="Qtde" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Mar/17" FieldName="Qtde_MA_AT" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Mar/16" FieldName="Qtde_MA_AA" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Qtde_MA" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Volume" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Mar/17" FieldName="Peso_MA_AT" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Mar/16" FieldName="Peso_MA_AA" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Volume_MA" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Mes: Fevereiro/2017" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Columns>
                                    <dx:GridViewBandColumn Caption="Qtde" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Mar/16" FieldName="Qtde_MA1_AA" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Mar/17" FieldName="Qtde_MA1_AT" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Qtde_MA1" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Volume" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Mar/16" FieldName="Peso_MA1_AA" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Mar/17" FieldName="Peso_MA1_AT" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Volume_MA1" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Mes: Janeiro/2017" ShowInCustomizationForm="True" VisibleIndex="16">
                                <Columns>
                                    <dx:GridViewBandColumn Caption="Qtde" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Mar/16" FieldName="Qtde_MA2_AA" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Mar/17" FieldName="Qtde_MA2_AT" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Qtde_MA2" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Volume" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Mar/16" FieldName="Peso_MA2_AA" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Mar/17" FieldName="Peso_MA2_AT" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Volume_MA2" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior ColumnResizeMode="Control" />
                        <SettingsPager PageSize="20">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" ShowFilterRow="True" VerticalScrollableHeight="400" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#E6E6E6">
                            </AlternatingRow>
                        </Styles>
                    </dx:ASPxGridView>
                  
                 <%--Arraste seu controle aqui --%>                         
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresConnectionString %>" SelectCommand="usp_BuscarLitragemDados" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Usuario" SessionField="sUSERNAME" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Label ID="lblError" runat="server" Text="lblError"></asp:Label>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>
