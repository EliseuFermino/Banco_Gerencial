<%@ Page Title="Comparativo" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ComparativoMetragem.aspx.vb" Inherits="MemberPages_Funcionarios_ComparativoMetragem" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>







<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >
       
        #divAno {
            float: left;            
        }

        #divMes {
            float: left;
        }

        #divFilial {            
            float: left;
            margin-left: 10px;
            padding-top: 2px;
        }


        #divBotaoAtualizar {
            float: left;
            padding-left: 10px;
            padding-top: 1px;
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
            width: 100%;
        }

        #divGrid1 {
            clear:both;
            float: left;
            margin-left: 2px;
            width: 100%;
        }

        #divGrid2 {    
            clear: both;        
            float: left;
            margin-left: 2px;
            margin-top: 10px;
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

        <div id="divFilial">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
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
                <PanelCollection>
                    <dx:PanelContent runat ="server" SupportsDisabledAttributes="both">

                        <div id="divGrid1">

                            <dx:ASPxGridView ID="grid1" runat="server" DataSourceID="dsPerfil" AutoGenerateColumns="False" KeyFieldName="Descricao" Width="99%">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Descricao" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                        <HeaderStyle Font-Bold="True" />
                                        <CellStyle Font-Bold="False" Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" ToolTip="Quadrante de Vendas" VisibleIndex="2">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaRealizada" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle Font-Bold="True" />
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewDataTextColumn Caption="Pos" FieldName="Class" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Posição " VisibleIndex="1" Width="40px" Visible="False">
                                        <HeaderStyle Font-Bold="True" />
                                        <CellStyle Font-Bold="False" HorizontalAlign="Center">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Metragem da Área de Venda" ShowInCustomizationForm="True" ToolTip="Quadrante de Metragem da Área de Venda" VisibleIndex="12">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Metro" FieldName="MetragemAreaVenda" ShowInCustomizationForm="True" ToolTip="Valor da metragem da área de venda da loja" VisibleIndex="0" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaMetroQuadrado" ShowInCustomizationForm="True" ToolTip="Valor da venda por metro quadrado de área de venda" VisibleIndex="1" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle Font-Bold="True" />
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Funcionários" ShowInCustomizationForm="True" ToolTip="Quadrante de Funcionários" VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Ativos sem &lt;/br&gt; Aprendiz" FieldName="numFunc_TotalSemAprendiz" ShowInCustomizationForm="True" ToolTip="Funcionários Ativos sem os Menores Aprendizes" VisibleIndex="0" Width="75px">
                                                <HeaderStyle BackColor="#99CCFF" />
                                                <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="QL" ShowInCustomizationForm="True" Width="50px" Caption="Q.L." VisibleIndex="1" ToolTip="Quadro de Lotação. Número de funcionários que a loja deve ter no período especificado.">
    <CellStyle HorizontalAlign="Center">
    </CellStyle>
</dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaFunc_AtivoComAprendiz" ShowInCustomizationForm="True" VisibleIndex="6" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Militar" FieldName="numFunc_Militar" ShowInCustomizationForm="True" ToolTip="Em Serviço Militar" VisibleIndex="7" Width="50px">
                                            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="difQL" ShowInCustomizationForm="True" Width="55px" Caption="Dif." ToolTip="Diferença entre 'Ativos sem Aprendiz' x 'QL'." VisibleIndex="2">
    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
    </PropertiesTextEdit>

<CellStyle HorizontalAlign="Center"></CellStyle>
</dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn FieldName="VendaFunc_AtivoSemAprendiz" ShowInCustomizationForm="True" Width="70px" Caption="Venda" VisibleIndex="3">
        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
        </PropertiesTextEdit>
        <HeaderStyle BackColor="#FF9933" />
        <CellStyle ForeColor="Blue" HorizontalAlign="Center">
        </CellStyle>
    </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Aprendiz" FieldName="numFunc_Aprendiz" ShowInCustomizationForm="True" VisibleIndex="4" Width="60px" ToolTip="Menor Aprendiz">
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Licença" FieldName="numFunc_Licenca" ShowInCustomizationForm="True" ToolTip="Funcionários Licenças" VisibleIndex="8" Width="50px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="INSS" FieldName="numFunc_INSS" ShowInCustomizationForm="True" ToolTip="Afastado pelo INSS" VisibleIndex="9" Width="50px">     
                                                <HeaderStyle BackColor="#99CCFF" />                                       
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Maternidade" FieldName="numFunc_Maternidade" ShowInCustomizationForm="True" ToolTip="Em Licença Maternidade" VisibleIndex="10" Width="75px">
                                                <HeaderStyle BackColor="#009933" ForeColor="White" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Seguro" FieldName="numFunc_Seguro" ShowInCustomizationForm="True" ToolTip="Funcionários em Seguro" VisibleIndex="11" Width="50px">
                                                <HeaderStyle BackColor="#FF9933" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Total Geral" FieldName="numFunc_TotalGeral" ShowInCustomizationForm="True" ToolTip="Total de Funcionários" VisibleIndex="12" Width="70px">
                                                <HeaderStyle BackColor="#FF9933" />
                                                <CellStyle ForeColor="#009933" HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Ativos com &lt;/br&gt; Aprendiz" FieldName="numFuncionarios" ShowInCustomizationForm="True" ToolTip="Quantidade de funcionários Ativos na loja" VisibleIndex="5" Width="75px">
                                                <HeaderStyle BackColor="#FF9933" />
                                                <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                                </CellStyle>
                                                <HeaderStyle BackColor="#99CCFF" />
                                                <CellStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaPorFuncionarios" ShowInCustomizationForm="True" VisibleIndex="13" Width="70px">
                                                <HeaderStyle BackColor="#FF9933" />
                                                <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                                </CellStyle>
                                                <HeaderStyle BackColor="#99CCFF" />
                                                <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                                </CellStyle>
                                                <HeaderStyle BackColor="#99CCFF" />
                                                <CellStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="F/M" FieldName="FuncionarioMetroQuadrado" ShowInCustomizationForm="True" ToolTip="Total de Funcionários divididos por Metragem de Área de Venda da loja" VisibleIndex="14" Width="50px">
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
                                    <dx:GridViewBandColumn Caption="Folha de Pagamento" ShowInCustomizationForm="True" ToolTip="Quadrante de Folha de Pagamento" VisibleIndex="9">
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
                                    <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior ColumnResizeMode="Control" />
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="150" VerticalScrollBarMode="Visible" />
                                <Styles>
                                    <Header HorizontalAlign="Center">
                                    </Header>
                                    <AlternatingRow BackColor="#F0F0F0">
                                    </AlternatingRow>
                                    <FocusedRow BackColor="#FFFFCC" Font-Bold="True" ForeColor="#0066FF">
                                    </FocusedRow>
                                    <TitlePanel HorizontalAlign ="Left"  ></TitlePanel>
                                </Styles>
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="dsPerfil" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="Funcionarios.uspBuscarPERFIL_Analise" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>


                        <div id="divGrid2">

                            <dx:ASPxGridView ID="grid2" runat="server" DataSourceID="dsPerfilVenda" AutoGenerateColumns="False" KeyFieldName="Descricao" Width="99%">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Descricao" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                        <HeaderStyle Font-Bold="True" />
                                        <CellStyle Font-Bold="False" Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" ToolTip="Quadrante de Vendas" VisibleIndex="2">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaRealizada" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle Font-Bold="True" />
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewDataTextColumn Caption="Pos" FieldName="Class" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Posição " VisibleIndex="1" Width="40px" Visible="False">
                                        <HeaderStyle Font-Bold="True" />
                                        <CellStyle Font-Bold="False" HorizontalAlign="Center">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Funcionários" ShowInCustomizationForm="True" ToolTip="Quadrante de Funcionários" VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Ativos sem &lt;/br&gt; Aprendiz" FieldName="numFunc_TotalSemAprendiz" ShowInCustomizationForm="True" ToolTip="Funcionários Ativos sem os Menores Aprendizes" VisibleIndex="0" Width="75px">
                                                <HeaderStyle BackColor="#99CCFF" />
                                                <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaFunc_AtivoComAprendiz" ShowInCustomizationForm="True" VisibleIndex="6" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#99CCFF" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Militar" FieldName="numFunc_Militar" ShowInCustomizationForm="True" ToolTip="Em Serviço Militar" VisibleIndex="7" Width="50px">
                                                <HeaderStyle BackColor="#FF9933" />
                                                <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="QL" ShowInCustomizationForm="True" Width="55px" Caption="Q.L." VisibleIndex="1" ToolTip="Quadro de Lotação. Número de funcionários que a loja deve ter no período especificado.">
    <CellStyle HorizontalAlign="Center">
    </CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="difQL" ShowInCustomizationForm="True" Width="55px" Caption="Dif." ToolTip="Diferença entre 'Ativos sem Aprendiz' x 'QL'." VisibleIndex="2">
    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
    </PropertiesTextEdit>
    <CellStyle HorizontalAlign="Center">
    </CellStyle>
</dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn FieldName="VendaFunc_AtivoSemAprendiz" ShowInCustomizationForm="True" Width="70px" Caption="Venda" VisibleIndex="3">
        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
        </PropertiesTextEdit>
    </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Aprendiz" FieldName="numFunc_Aprendiz" ShowInCustomizationForm="True" VisibleIndex="4" Width="60px" ToolTip="Menor Aprendiz">
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Licença" FieldName="numFunc_Licenca" ShowInCustomizationForm="True" ToolTip="Funcionários Licenças" VisibleIndex="8" Width="50px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="INSS" FieldName="numFunc_INSS" ShowInCustomizationForm="True" ToolTip="Afastado pelo INSS" VisibleIndex="9" Width="50px">     
                                                <HeaderStyle BackColor="#009933" ForeColor="White" />                                       
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Maternidade" FieldName="numFunc_Maternidade" ShowInCustomizationForm="True" ToolTip="Em Licença Maternidade" VisibleIndex="10" Width="75px">
                                                <HeaderStyle BackColor="#99CCFF" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Seguro" FieldName="numFunc_Seguro" ShowInCustomizationForm="True" ToolTip="Funcionários em Seguro" VisibleIndex="11" Width="50px">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Total Geral" FieldName="numFunc_TotalGeral" ShowInCustomizationForm="True" ToolTip="Total de Funcionários" VisibleIndex="12" Width="70px">
                                                <HeaderStyle BackColor="#FF9933" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Ativos com &lt;/br&gt; Aprendiz" FieldName="numFuncionarios" ShowInCustomizationForm="True" ToolTip="Quantidade de funcionários Ativos na loja" VisibleIndex="5" Width="75px">
                                                <HeaderStyle BackColor="#FF9933" />
                                                <CellStyle ForeColor="#009933" HorizontalAlign="Center">
                                                </CellStyle>
                                                <HeaderStyle BackColor="#99CCFF" />
                                                <CellStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="VendaPorFuncionarios" ShowInCustomizationForm="True" VisibleIndex="13" Width="70px">
                                                <HeaderStyle BackColor="#FF9933" />
                                                <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                                </CellStyle>
                                                <HeaderStyle BackColor="#FF9933" />
                                                <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                                </CellStyle>
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#99CCFF" />
                                                <CellStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle Font-Bold="True" />
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Folha de Pagamento" ShowInCustomizationForm="True" ToolTip="Quadrante de Folha de Pagamento" VisibleIndex="9">
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
                                    <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior ColumnResizeMode="Control" />
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="150" VerticalScrollBarMode="Visible" />
                                <Styles>
                                    <Header HorizontalAlign="Center">
                                    </Header>
                                    <AlternatingRow BackColor="#F0F0F0">
                                    </AlternatingRow>
                                    <FocusedRow BackColor="#FFFFCC" Font-Bold="True" ForeColor="#0066FF">
                                    </FocusedRow>
                                    <TitlePanel HorizontalAlign ="Left"  ></TitlePanel>
                                </Styles>
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="dsPerfilVenda" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="Funcionarios.uspBuscarPERFIL_AnalisePorVenda" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>


                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

            <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="DataBase: gerCadastros"  Anotacao2="Stored Procedure: Funcionarios.uspBuscarPERFIL_AnalisePorVenda"/>

        </div>

 <%--   </div>--%>

</asp:Content>

