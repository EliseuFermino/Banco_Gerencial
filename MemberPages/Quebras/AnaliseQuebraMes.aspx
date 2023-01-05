<%@ Page Title="Analise de Quebras por Mês" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseQuebraMes.aspx.vb" Inherits="MemberPages_Quebras_AnaliseQuebraMes" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc3" %>
<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc5" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 191px;
        }
        .auto-style4 {
            width: 123px;
        }
        .auto-style7 {
            width: 190px;
        }
        .auto-style8 {
            width: 369px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table cellspacing="1" class="auto-style1">
                <tr>
                    <td class="auto-style4" style="text-align: left; vertical-align: top">
                        <uc1:wucAno ID="cboAno" runat="server" />
                    </td>
                    <td class="auto-style2" style="text-align: left; vertical-align: top">
                        <uc2:wuciListaMes ID="cboMesInicial" runat="server" LabelDescMes="Mês Inicial:" />
                    </td>
                    <td style="text-align: left; vertical-align: top" class="auto-style7">
                        <uc2:wuciListaMes ID="cboMesFinal" runat="server" LabelDescMes="Mês Final:" />
                    </td>
                    <td style="text-align: left; vertical-align: top" class="auto-style8">
                        <uc3:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                    </td>
                    <td>
                        <uc4:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
                    </td>
                    <td></td>
                </tr>
            </table>
            <table cellspacing="1" class="auto-style1">
                <tr>
                    <td style="text-align: left; vertical-align: top">
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" EnableTheming="True" Theme="DevEx">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                            </TotalSummary>
                            <GroupSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde51" ShowInGroupFooterColumn="Qtde51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg51" ShowInGroupFooterColumn="vlrAg51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde52" ShowInGroupFooterColumn="Qtde52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg52" ShowInGroupFooterColumn="vlrAg52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde23" ShowInGroupFooterColumn="Qtde23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23" ShowInGroupFooterColumn="vlrAg23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeQuebra" ShowInGroupFooterColumn="QtdeQuebra" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrQuebra" ShowInGroupFooterColumn="vlrQuebra" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" ShowInGroupFooterColumn="percCresc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" ShowInGroupFooterColumn="vlrMargem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="percMargem" SummaryType="Custom" />
                            </GroupSummary>
                            <Columns>                                
                                <%--Produto--%>

                                <%--Venda e Margem--%>

                                <%--Filial--%>

                                <%--Agenda 51--%>

                                <%--Agenda 52--%>

                                <%--Agenda 23--%>
                                
                                <%--Total da Perda--%>

                                <%--Lista de Departamento--%>

                                <%--Lista Seção--%>

                                <%--Lista Grupo--%>

                                <%--Lista Subgrupo--%>

                                
                                <%--Comprador--%>

                                <%--Fornecedor--%>
                                <dx:GridViewCommandColumn VisibleIndex="0" Visible="False" Width="10px" ShowClearFilterButton="True"/>
                                <dx:GridViewBandColumn Caption="Produto" VisibleIndex="1">
                                    <Columns>
                                         <dx:GridViewDataTextColumn Caption="Código" FieldName="idProduto" ToolTip="Código do produto" VisibleIndex="0" Width="60px">
                                         </dx:GridViewDataTextColumn>
                                         <dx:GridViewDataTextColumn Caption="Descrição" FieldName="DescProduto" ToolTip="Descrição do produto" VisibleIndex="0" Width="100px">
                                             <CellStyle Wrap="False">
                                             </CellStyle>
                                         </dx:GridViewDataTextColumn>
                                     </Columns>
                                </dx:GridViewBandColumn>

                                <dx:GridViewBandColumn Caption="Vendas e Margem" ToolTip="Valores de venda e percentual de margem por item" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" ToolTip="Valor de venda." VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" AllowAutoFilterTextInputTimer="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="False" />
                                            <GroupFooterCellStyle BackColor="#C1E0FF" ForeColor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem" ReadOnly="True" ToolTip="Percentual de margem de frente de caixa." VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="True" />
                                            <GroupFooterCellStyle BackColor="#D7EBFF" ForeColor="Blue">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                                <dx:GridViewBandColumn Caption="Agenda 51 (sobra)" VisibleIndex="3" ToolTip="Exibe as informações de volume e valor em reais da agenda 51 (sobra de mercadoria).">                                    
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde51" VisibleIndex="0" Width="80px" ReadOnly="True">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <GroupFooterCellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg51" VisibleIndex="1" Width="80px" ReadOnly="True">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                                <dx:GridViewBandColumn Caption="Agenda 52 (falta)" ToolTip="Exibe as informações de volume e valor em reais da agenda 52 (falta de mercadoria)." VisibleIndex="4">                                     
                                     <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde52" ReadOnly="True" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
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

                                <dx:GridViewBandColumn Caption="Agenda 23 (lixo)" ToolTip="Exibe as informações de volume e valor em reais da agenda 23 (lixo)." VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde23" ReadOnly="True" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <GroupFooterCellStyle BackColor="#D8D8D8">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23" ReadOnly="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <GroupFooterCellStyle BackColor="#D8D8D8">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                
                                <dx:GridViewBandColumn Caption="Total Perda" ToolTip="Exibe as informações de volume, valor em reais  e percentual de crescimento do total da perda. O total da perda é composto pelo calculo (+ agenda23 + agenda 51 - agenda 52). O percentual de crescimento se dá pela divisão do valor total de quebra pela venda." VisibleIndex="6">                                    
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeQuebra" ReadOnly="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <GroupFooterCellStyle BackColor="#FFFFCC" Font-Bold="True">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrQuebra" ReadOnly="True" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <GroupFooterCellStyle BackColor="#FFFFCC" Font-Bold="True">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc" ReadOnly="True" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <GroupFooterCellStyle BackColor="#CCFFCC" Font-Bold="False">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

                                <dx:GridViewDataTextColumn Caption="Depto." FieldName="ListaDepto" GroupIndex="0" SortIndex="0" SortOrder="Ascending" VisibleIndex="13" Width="50px" ToolTip="Departamento">
                                    <Settings AllowDragDrop="False" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>

                                <dx:GridViewDataTextColumn FieldName="ListaSecao" VisibleIndex="15" Caption="Seção" Width="50px" GroupIndex="1" SortIndex="1" SortOrder="Ascending">
                                    <CellStyle Wrap="False"></CellStyle>
                                </dx:GridViewDataTextColumn>

                                <dx:GridViewDataTextColumn Caption="Grupo" FieldName="ListaGrupo" VisibleIndex="17" Width="50px">
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>

                                
                                <dx:GridViewDataTextColumn Caption="Sub-grupo" FieldName="ListaSubgrupo" VisibleIndex="19" Width="70px">
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>

                                <dx:GridViewDataTextColumn FieldName="idFornecedor" VisibleIndex="21" Caption="Cod. Forn." Width="70px">
                                </dx:GridViewDataTextColumn>

                                <dx:GridViewDataTextColumn FieldName="DescFornecedor" VisibleIndex="23" Caption="Fornecedor" Width="80px">
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>

                                <dx:GridViewDataTextColumn FieldName="vlrMargem" Visible="False" VisibleIndex="25" Width="1px">
                                </dx:GridViewDataTextColumn>

                            </Columns>
                            <SettingsBehavior ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowFilterBar="Auto" ShowFilterRowMenu="True" ShowGroupPanel="True" ShowFilterRow="True" ShowGroupFooter="VisibleAlways" ShowFooter="True" />
                            <SettingsLoadingPanel Text="Processando informação. Aguarde...&amp;hellip;" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <GroupFooter Font-Bold="False" BackColor="#EAEAEA"> </GroupFooter>                                
	                                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                                <GroupRow Font-Bold="True">
                                </GroupRow>
	                                <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerAgendasConnectionString %>" SelectCommand="AnaliseMes.uspBuscaAnaliseQuebraLoja" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="mesInicial" SessionField="sMESINICIAL" Type="Byte" />
                                <asp:SessionParameter Name="mesFinal" SessionField="sMESFINAL" Type="Byte" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <table cellspacing="1" class="auto-style1">
            </table>
<br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="ASPxGridView1" />
</asp:Content>

