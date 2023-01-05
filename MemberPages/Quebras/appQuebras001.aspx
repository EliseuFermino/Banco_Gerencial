<%@ Page Title="Quebras TOP N" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="appQuebras001.aspx.vb" Inherits="MemberPages_Quebras_appQuebras001" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>

<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css" >
        html {            
            overflow-y:hidden;
            overflow-x:hidden ;
        }

        #moldura {
            width:1024px;
            margin:0 auto;
        }

        #PeriodoInicial {           
            width : 240px;           
            float: left;
        }

        #PeriodoFinal {           
            width : 240px;            
            float: left;
        }

        #Filial {           
            width : 320px;            
            float: left;
        }

        #CaixaTop {           
            width : 70px;            
            float: left;
            align-items : center;
        }

        #Atualizar {           
            width : 125px;            
            float: left;
            text-align:center
        }

        #gridDados { 
            padding: 2px;  
            clear:both ;        
            width:1024px;  
                         
        }

        .Titulo {
            background-color: #CCCCCC;
            text-align :center;
            font-size : 16px;
            padding-top : 0px;
            padding-bottom : 2px;
            font-weight: bold ;
            color :#5a5858;        
        }

        .TituloInicialFinal {
            border : 1px solid #bdbbbb;
            height : 55px;
            margin-left : 2px;
        }

        .Botao {
            border : 1px solid #bdbbbb;
            height : 55px;
            margin-left : 2px;        
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div id="moldura">    
        <%-- Cabeçalho --%>
        <%-- Periodo Inicial --%>
        <div id="PeriodoInicial" class ="TituloInicialFinal">
            <div class="Titulo">
                Periodo Inicial
            </div> 
            <div id="AnoInicial">
                <uc1:wucAno runat="server" ID="cboAnoInicial" />
            </div>
            <div id="MesInicial">
                <uc1:wuciListaMes runat="server" ID="cboMesInicial" />
            </div>
        </div>

        <%-- Periodo Final --%>
        <div id="PeriodoFinal" class ="TituloInicialFinal">
            <div class ="Titulo">
                Periodo Final
            </div> 
            <div id="AnoFinal">
                <uc1:wucAno runat="server" ID="cboAnoFinal" />
            </div>
            <div id="MesFinal">
                <uc1:wuciListaMes runat="server" ID="cboMesFinal" />
            </div>
        </div>

        <%-- Filial --%>
        <div id="Filial" class ="TituloInicialFinal">
            <div class ="Titulo">
                Loja e Empresa 
            </div> 
            <div style="margin-left:2px">
                <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
            </div>
        </div>
        
        <%-- Caixa TOP--%>
        <div id="CaixaTop" class ="TituloInicialFinal">
            <div class ="Titulo">
                TOP 
            </div>

            <div style="padding: 2px">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                    <dx:ASPxTextBox ID="txtTop" runat="server" Width="65px" AutoPostBack ="false" HorizontalAlign="Center"  >
                        <MaskSettings Mask="&lt;0..999999g&gt;" />
                    </dx:ASPxTextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <%-- Botão Atualizar --%>
        <div id="Atualizar" class="Botao">
            <asp:UpdatePanel ID="UpdatePanel2" runat ="server">
                <ContentTemplate >
                    <div >
                        <asp:CheckBox ID="chkFixarCabecalho" runat="server" AutoPostBack="true" Text="Fixar Cabeçalho" /> 
                    </div> 
                    <div style="padding: 5px 2px 2px 30px">
                        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" >
                            <ClientSideEvents Click="function(s, e) {CallPanel.PerformCallback();}" />
                        </dx:ASPxButton>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="gridDados">
             <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="1000px" ClientInstanceName="CallPanel" HideContentOnCallback="False" SettingsLoadingPanel-Text="Atualizando. Aguarde...&amp;hellip;" >
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="sqlDados" AutoGenerateColumns="False" Width="1013px" KeyFieldName="idProduto" Theme="DevEx" OnCustomSummaryCalculate="grid_CustomSummaryCalculate" OnHtmlDataCellPrepared="grid_HtmlDataCellPrepared" OnHtmlFooterCellPrepared="grid_HtmlFooterCellPrepared">
                            <Columns>
                                <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" Width="10px" ShowClearFilterButton="True"/>
                                <dx:GridViewBandColumn Caption="Produto" VisibleIndex="2" FixedStyle="Left">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Código" FieldName="idProduto" ToolTip="Código do produto" VisibleIndex="0" Width="60px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Descrição" FieldName="DescProduto" ToolTip="Descrição do produto" VisibleIndex="0" Width="200px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Vendas e Margem" ToolTip="Valores de venda e percentual de margem por item" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" ToolTip="Valor de venda." VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                

                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" AllowAutoFilterTextInputTimer="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="False" />
                                            <CellStyle ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#C1E0FF" ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem" ReadOnly="True" ToolTip="Percentual de margem de frente de caixa." VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                

                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="True" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#D7EBFF" ForeColor="Blue">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 51 (sobra)" ToolTip="Exibe as informações de volume e valor em reais da agenda 51 (sobra de mercadoria)." VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde51" ReadOnly="True" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                

                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg51" ReadOnly="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                

                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 52 (falta)" ToolTip="Exibe as informações de volume e valor em reais da agenda 52 (falta de mercadoria)." VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde52" ReadOnly="True" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                

                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <GroupFooterCellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg52" ReadOnly="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                

                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 23 (lixo)" ToolTip="Exibe as informações de volume e valor em reais da agenda 23 (lixo)." VisibleIndex="6">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde23" ReadOnly="True" VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                

                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <GroupFooterCellStyle BackColor="#D8D8D8">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23" ReadOnly="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                

                                            </PropertiesTextEdit>
                                            <GroupFooterCellStyle BackColor="#D8D8D8">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Total Perda" ToolTip="Exibe as informações de volume, valor em reais  e percentual de crescimento do total da perda. O total da perda é composto pelo calculo (+ agenda23 + agenda 51 - agenda 52). O percentual de crescimento se dá pela divisão do valor total de quebra pela venda." VisibleIndex="7">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeQuebra" ReadOnly="True" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                

                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFFCC" Font-Bold="True">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrQuebra" ReadOnly="True" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                

                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderLeft BorderColor="Silver" BorderStyle="Dotted" BorderWidth="1px" />
                                            </CellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFFCC" Font-Bold="True">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Perda" FieldName="percCresc" ReadOnly="True" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                

                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderLeft BorderColor="Silver" BorderStyle="Dotted" BorderWidth="1px" />
                                            </CellStyle>
                                            <GroupFooterCellStyle BackColor="#CCFFCC" Font-Bold="False">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Cod. Forn." FieldName="idFornecedor" VisibleIndex="19" Width="70px">
                                    <CellStyle>
                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Fornecedor" FieldName="DescFornecedor" VisibleIndex="21" Width="110px">
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrMargem" Visible="False" VisibleIndex="25" Width="1px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Rank" FieldName="RowNumber" ToolTip="Ranking" VisibleIndex="1" Width="40px" FixedStyle="Left">
                                    <Settings AllowAutoFilter="False" AllowAutoFilterTextInputTimer="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="False" />
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsPager PageSize="50">
                            </SettingsPager>
                            <Settings ShowFilterBar="Auto" ShowFilterRow="True" ShowFilterRowMenu="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="300" ShowHorizontalScrollBar="True" UseFixedTableLayout="True" />
                            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" EmptyDataRow="Não há informações disponiveis ainda para esse período e loja" />
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsLoadingPanel Text="Atualizando. Aguarde...&amp;hellip;" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <GroupFooter BackColor="#EAEAEA" Font-Bold="False">
                                </GroupFooter>
                                <FocusedRow BackColor="Silver" ForeColor="#0066FF">
                                </FocusedRow>
                                <GroupRow Font-Bold="True">
                                </GroupRow>
                                <AlternatingRow BackColor="#E6F2FF">
                                </AlternatingRow>
                            </Styles>                            
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="sqlDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerAgendasConnectionString %>" SelectCommand="AnaliseMes.uspQuebras001" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="anoI" SessionField="sANO_INICIAL" Type="Int16" />
                                <asp:SessionParameter Name="anoF" SessionField="sANO_FINAL" Type="Int16" />
                                <asp:SessionParameter Name="mesI" SessionField="sMES_INICIAL" Type="Byte" />
                                <asp:SessionParameter Name="mesF" SessionField="sMES_FINAL" Type="Byte" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter DefaultValue="10" Name="idTop" SessionField="sTOP" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <div style="padding-top : 3px">
                        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
                        </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

    </div>

    <%-- Google Analytics Gerencial_Eliseu --%>
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-42232555-1', '200.150.68.29:81');
        ga('send', 'pageview');

    </script>

</asp:Content>

