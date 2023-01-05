<%@ Page Title="Perfil" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Perfil.aspx.vb" Inherits="MemberPages_Vendas_Perfil" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>



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
            padding-right: 5px;
            width: 100%;
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
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Atualizando&amp;hellip;">
<SettingsLoadingPanel Text="Atualizando&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent runat ="server" SupportsDisabledAttributes="both">
                        <dx:ASPxGridView ID="grid1" runat="server" DataSourceID="dsPerfil" AutoGenerateColumns="False" KeyFieldName="Descricao" Width="100%">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Descricao" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                    <HeaderStyle Font-Bold="True" />
                                    <CellStyle Font-Bold="False" Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" ToolTip="Quadrante de Vendas" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaRevista" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaRealizada" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
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
                                <dx:GridViewBandColumn Caption="Número de PDV's" ShowInCustomizationForm="True" ToolTip="Ponto de Vendas" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Check-out" FieldName="numCheckOut" ShowInCustomizationForm="True" ToolTip="Número de Check-Out na Loja" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#CCFFCC" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Rotisseria" FieldName="numCaixaRotisseria" ShowInCustomizationForm="True" ToolTip="Número de PDV na Rotisseria" VisibleIndex="2" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#CCFFCC" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Total s/ Eletro" FieldName="numPDV_Abras" ShowInCustomizationForm="True" ToolTip="O Total compõe a soma dos campos: Check-out + Caixa Rápido + Rotisseria" VisibleIndex="3" Width="100px">
                                            <HeaderStyle BackColor="#99CC00" ForeColor="White" />
                                            <CellStyle Font-Bold="True" ForeColor="#009900" HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda s/ Eletro" FieldName="VendaPDVsemEletro" ShowInCustomizationForm="True" ToolTip="Venda por PDV - Sem Eletro" VisibleIndex="4" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#99CC00" ForeColor="White" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Eletro" FieldName="numCaixaEletro" ShowInCustomizationForm="True" ToolTip="Número de PDV no Eletrodomésticos" VisibleIndex="5" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#CCFFCC" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Caixa Rápido" FieldName="numCaixaRapido" ShowInCustomizationForm="True" ToolTip="Número de PDV nos Caixas Rapidos" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#CCFFCC" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Total" FieldName="numPDV" ShowInCustomizationForm="True" ToolTip="Total de PDV's na  loja" VisibleIndex="6" Width="60px">
                                            <HeaderStyle BackColor="#99CC00" Font-Bold="True" ForeColor="White" />
                                            <CellStyle Font-Bold="True" ForeColor="#009900" HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda Geral" FieldName="VendaPDV" ShowInCustomizationForm="True" ToolTip="Venda por PDV" VisibleIndex="7" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#99CC00" ForeColor="White" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="F/P" FieldName="NFPDV" ShowInCustomizationForm="True" ToolTip="Número de Funcionários divididos pelo Número de PDV" VisibleIndex="8" Width="40px">
                                            <HeaderStyle BackColor="#99CC00" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" BackColor="#669900" ForeColor="White" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Metragem da Área" ShowInCustomizationForm="True" ToolTip="Quadrante de Metragem da Área de Venda" VisibleIndex="10">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="MetragemAreaVenda" ShowInCustomizationForm="True" ToolTip="Valor da metragem da área de venda da loja" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Comercial" FieldName="MetragemAreaComercial" ShowInCustomizationForm="True" ToolTip="Valor da venda por metro quadrado de área de venda" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Edificação" FieldName="MetragemAreaEdificacao" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle Font-Bold="True" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Funcionários" ShowInCustomizationForm="True" ToolTip="Quadrante de Funcionários" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Ativos sem &lt;/br&gt; Aprendiz" FieldName="numFunc_TotalSemAprendiz" ShowInCustomizationForm="True" ToolTip="Funcionários Ativos sem os Menores Aprendizes" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#99CCFF" />
                                            <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Militar" FieldName="numFunc_Militar" ShowInCustomizationForm="True" ToolTip="Em Serviço Militar" VisibleIndex="3" Width="50px">
                                            <HeaderStyle BackColor="#FF9933" />
                                            <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Aprendiz" FieldName="numFunc_Aprendiz" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" ToolTip="Menor Aprendiz">
                                            <HeaderStyle BackColor="#009900" ForeColor="White" />
                                            <CellStyle ForeColor="#009933" HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Licença" FieldName="numFunc_Licenca" ShowInCustomizationForm="True" ToolTip="Funcionários Licenças" VisibleIndex="4" Width="50px">
                                            <HeaderStyle BackColor="#FF9933" />
                                            <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="INSS" FieldName="numFunc_INSS" ShowInCustomizationForm="True" ToolTip="Afastado pelo INSS" VisibleIndex="5" Width="50px">
                                            <HeaderStyle BackColor="#FF9933" />
                                            <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Maternidade" FieldName="numFunc_Maternidade" ShowInCustomizationForm="True" ToolTip="Em Licença Maternidade" VisibleIndex="6" Width="75px">
                                            <HeaderStyle BackColor="#FF9933" />
                                            <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Seguro" FieldName="numFunc_Seguro" ShowInCustomizationForm="True" ToolTip="Funcionários em Seguro" VisibleIndex="7" Width="50px">
                                            <HeaderStyle BackColor="#FF9933" />
                                            <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Total Geral" FieldName="numFunc_TotalGeral" ShowInCustomizationForm="True" ToolTip="Total de Funcionários" VisibleIndex="8" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#333399" ForeColor="White" />
                                            <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Ativos com &lt;/br&gt; Aprendiz" FieldName="numFuncionarios" ShowInCustomizationForm="True" ToolTip="Quantidade de funcionários Ativos na loja" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#99CCFF" />
                                            <CellStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="QL" FieldName="QL" ShowInCustomizationForm="True" VisibleIndex="9" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#996633" ForeColor="White" />
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataCheckColumn Caption="Status" FieldName="difQL1" ToolTip="Indicador se o % de Crescimento sobre a venda do ano anterior esta maior ou meno" VisibleIndex="10" Width="45px">
                                            <PropertiesCheckEdit>
                                                <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                                </DisplayImageChecked>
                                                <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                                </DisplayImageUnchecked>
                                                <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageUndefined>
                                                <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageGrayed>
                                            </PropertiesCheckEdit>
                                           
                                            <HeaderStyle BackColor="#996633" ForeColor="White" />
                                        </dx:GridViewDataCheckColumn>


                                        <dx:GridViewDataTextColumn FieldName="difQL" ShowInCustomizationForm="True" Width="75px" Caption="Ativo Acima &lt;br &gt; do QL" VisibleIndex="11">
    <HeaderStyle BackColor="#996633" ForeColor="White" />
    <CellStyle Font-Bold="True" ForeColor="#336600" HorizontalAlign="Center">
<BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px"></BorderRight>
    </CellStyle>
    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                             <CellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
</dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaPorFuncionarios" ShowInCustomizationForm="True" VisibleIndex="12" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="F/M" FieldName="FuncionarioMetroQuadrado" ShowInCustomizationForm="True" ToolTip="Total de Funcionários divididos por Metragem de Área de Venda da loja" VisibleIndex="13" Width="50px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
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
                                        <dx:GridViewDataTextColumn Caption="Nº" FieldName="numRegistros" ShowInCustomizationForm="True" ToolTip="Número de registros" VisibleIndex="0" Width="90px">
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
                                        <dx:GridViewDataTextColumn Caption="Nº" FieldName="numClientes" ShowInCustomizationForm="True" ToolTip="Número de Clientes" VisibleIndex="0" Width="70px">
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

            <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="DataBase: gerCadastros" Anotacao2="Stored Procedure: uspBuscarPERFIL" />

        </div>

 <%--   </div>--%>

</asp:Content>

