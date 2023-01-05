<%@ Page Title="Perfil Acumulado" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Perfil_Acumulado.aspx.vb" Inherits="MemberPages_Vendas_Perfil_Acumulado" %>

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

        #divMesInicial {
            float: left;
            margin-left: 10px;
        }

        #divMesFinal {
            float: left;
            margin-left: 10px;
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

        <div id="divMesInicial">
            <uc1:wuciListaMes runat="server" ID="cboMesInicial" />
        </div>

        <div id="divMesFinal">
            <uc1:wuciListaMes runat="server" ID="cboMesFinal" />
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
                        <dx:ASPxGridView ID="grid1" runat="server" DataSourceID="dsPerfil" AutoGenerateColumns="False" KeyFieldName="Descricao" Width="1000px">
                            <Columns>
                                <dx:GridViewBandColumn Caption="PDV" ShowInCustomizationForm="True" ToolTip="Quadrante do PDV" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Nº" FieldName="numPDV" ShowInCustomizationForm="True" ToolTip="Número de PDV na loja" VisibleIndex="0" Width="40px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaPDV" ShowInCustomizationForm="True" ToolTip="Venda por PDV" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="F/P" FieldName="NFPDV" ShowInCustomizationForm="True" ToolTip="Número de Funcionários divididos pelo Número de PDV" VisibleIndex="2" Width="40px">
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn FieldName="Descricao" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                    <HeaderStyle Font-Bold="True" />
                                    <CellStyle Font-Bold="False" Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" ToolTip="Quadrante de Vendas" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaRevista" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaRealizada" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percMxR" ShowInCustomizationForm="True" ToolTip="Percentual de Atingimento" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Part." FieldName="percPart" ShowInCustomizationForm="True" ToolTip="Percentual de participação sobre a empresa" VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Crescimento" ShowInCustomizationForm="True" ToolTip="Quadrante de Crescimento" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="M.A." FieldName="percCrescMA" ShowInCustomizationForm="True" ToolTip="Mês Anterior - Crescimento sobre o mês anterior" VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="A.A." FieldName="percCrescAA" ShowInCustomizationForm="True" ToolTip="Ano Anterior - Crescimento sobre o ano anterior" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Pos" FieldName="Class" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Posição " VisibleIndex="1" Width="40px">
                                    <HeaderStyle Font-Bold="True" />
                                    <CellStyle Font-Bold="False" HorizontalAlign="Center">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Check-Out" ShowInCustomizationForm="True" ToolTip="Quadrante de Check-Out" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Nº" FieldName="numCheckOut" ShowInCustomizationForm="True" ToolTip="Número de check-out na loja" VisibleIndex="0" Width="40px">
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaCheck" ShowInCustomizationForm="True" ToolTip="Venda por check-out" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="F/C" FieldName="NFCheckOut" ShowInCustomizationForm="True" ToolTip="Número de Funcionários divididos pelo Número de Check-Out" VisibleIndex="2" Width="50px">
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Metragem da Área de Venda" ShowInCustomizationForm="True" ToolTip="Quadrante de Metragem da Área de Venda" VisibleIndex="7">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Metro" FieldName="MetragemAreaVenda" ShowInCustomizationForm="True" ToolTip="Valor da metragem da área de venda da loja" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaMetroQuadrado" ShowInCustomizationForm="True" ToolTip="Valor da venda por metro quadrado de área de venda" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Funcionários" ShowInCustomizationForm="True" ToolTip="Quadrante de Funcionários" VisibleIndex="10">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="numFuncionarios" ShowInCustomizationForm="True" ToolTip="Quantidade de funcionários na loja" VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaPorFuncionarios" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="F/M" FieldName="FuncionarioMetroQuadrado" ShowInCustomizationForm="True" ToolTip="Total de Funcionários divididos por Metragem de Área de Venda da loja" VisibleIndex="2" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Folha de Pagamento" ShowInCustomizationForm="True" ToolTip="Quadrante de Folha de Pagamento" VisibleIndex="13">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrFolhaPagamento" ShowInCustomizationForm="True" ToolTip="Valor da Folha" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Médio" FieldName="vlrSalarioMedio" ShowInCustomizationForm="True" ToolTip="Valor da folha média" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Registros" ShowInCustomizationForm="True" ToolTip="Quadrante de Registros" VisibleIndex="16">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Nº" FieldName="numRegistros" ShowInCustomizationForm="True" ToolTip="Número de registros" VisibleIndex="0" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrRegistro" ShowInCustomizationForm="True" ToolTip="Valor médio do registro" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Clientes" ShowInCustomizationForm="True" ToolTip="Quadrante de Clientes" VisibleIndex="19">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Nº" FieldName="numClientes" ShowInCustomizationForm="True" ToolTip="Número de Clientes" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaPorCliente" ShowInCustomizationForm="True" ToolTip="Venda por cliente" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R/C" FieldName="NRClientes" ShowInCustomizationForm="True" ToolTip="Número de Registros divididos por Número de Clientes" VisibleIndex="2" Width="55px">
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
                                <FocusedRow BackColor="#FFFFCC" Font-Bold="True" ForeColor="#0066FF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsPerfil" runat="server" ConnectionString="<%$ ConnectionStrings:tempdbConnectionString %>" SelectCommand="uspBuscarPERFIL_Acumulado" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="MesInicial" SessionField="sMES_INICIAL" Type="Byte" />
                                <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

        </div>

 <%--   </div>--%>

</asp:Content>

