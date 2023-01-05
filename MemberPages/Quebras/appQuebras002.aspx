<%@ Page Title="Quebra do Item por Filial" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="appQuebras002.aspx.vb" Inherits="MemberPages_Quebras002" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc3" %>
<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc5" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<%@ Register src="../../Controles/wucFixarCabecalho.ascx" tagname="wucFixarCabecalho" tagprefix="uc6" %>


<%@ Register Src="~/Controles/wucProdutoEncontra.ascx" TagPrefix="uc1" TagName="wucProdutoEncontra" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;            
        }
        .auto-style2 {
        }
        .auto-style4 {
        }
        .auto-style9 {
            width: 92px;
        }
        .auto-style10 {
            width: 100px;
        }
        .auto-style11 {
            width: 91px;
        }
        .auto-style12 {
            width: 102px;
        }
        .auto-style20 {
            width: auto;
            float: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table>
                <tr>
                    <td class="auto-style4" style="border: 1px solid #C0C0C0; text-align: center; vertical-align: top; background-color: #CCCCCC;" colspan="2">
                        <strong>Período Inicial</strong></td>
                    <td class="auto-style2" style="border: 1px solid #C0C0C0; text-align: center; vertical-align: top; background-color: #CCCCCC;" colspan="2">
                        <strong>Periodo Final</strong></td>
                    <td style="border: 1px solid #C0C0C0; text-align: center; vertical-align: top; background-color: #336600; color: #FFFFFF;" class="style16">
                        <b>Produto</b></td>
                    <td>
                        <uc6:wucFixarCabecalho ID="chkFixarCabecalho" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" style="text-align: left; vertical-align: top">
                        <uc1:wucAno ID="cboAnoInicial" runat="server" />
                    </td>
                    <td class="auto-style10" style="vertical-align: top">
                        <uc2:wuciListaMes ID="cboMesInicial" runat="server" LabelDescMes="Mês:" />
                    </td>
                    <td class="auto-style11" style="text-align: left; vertical-align: top">
                        <uc1:wucAno ID="cboAnoFinal" runat="server" />
                    </td>
                    <td class="auto-style12" style="text-align: left; vertical-align: top">
                        <uc2:wuciListaMes ID="cboMesFinal" runat="server" LabelDescMes="Mês:" />
                    </td>
                    <td class="auto-style20">
                        <uc1:wucProdutoEncontra runat="server" ID="txtTop" />
                    </td>
                    <td>
                        <uc4:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td></td>
                </tr>
            </table>
            <table cellspacing="1" class="auto-style1">
                <tr >
                    <td style="text-align: left; vertical-align: top">
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EnableTheming="True" KeyFieldName="FilialLista"  OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared"  Theme="DevEx" Width="1000px">
                         
                            <Columns>
                                <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" Width="10px">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewBandColumn Caption="Vendas e Margem" ToolTip="Valores de venda e percentual de margem por item" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" ToolTip="Valor de venda." VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
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
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
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
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
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
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 52 (falta)" ToolTip="Exibe as informações de volume e valor em reais da agenda 52 (falta de mercadoria)." VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde52" ReadOnly="True" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
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
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 23 (lixo)" ToolTip="Exibe as informações de volume e valor em reais da agenda 23 (lixo)." VisibleIndex="6">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde23" ReadOnly="True" VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
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
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <GroupFooterCellStyle BackColor="#D8D8D8">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Total Perda" ToolTip="Exibe as informações de volume, valor em reais  e percentual de crescimento do total da perda. O total da perda é composto pelo calculo (+ agenda23 + agenda 51 - agenda 52). O percentual de crescimento se dá pela divisão do valor total de quebra pela venda." VisibleIndex="7">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeQuebra" ReadOnly="True" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
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
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderLeft BorderColor="Silver" BorderStyle="Dotted" BorderWidth="1px" />
                                            </CellStyle>
                                            <GroupFooterCellStyle BackColor="#FFFFCC" Font-Bold="True">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Perda" FieldName="percCresc" ReadOnly="True" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
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
                                <dx:GridViewDataTextColumn FieldName="vlrMargem" Visible="False" VisibleIndex="25" Width="1px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" ToolTip="Descrição Filial" VisibleIndex="1" Width="200px">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowFilterBar="Auto" ShowFilterRowMenu="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="400" />
                            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                            <SettingsLoadingPanel Text="Processando informação. Aguarde...&amp;hellip;" />
                            <SettingsDetail ShowDetailButtons="False" />
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

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:gerAgendasConnectionString %>" SelectCommand="AnaliseMes.uspQuebras002" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter  Name="anoI" SessionField="sANO_INICIAL" Type="Int16" />
                                <asp:SessionParameter  Name="anoF" SessionField="sANO_FINAL" Type="Int16" />
                                <asp:SessionParameter  Name="mesI" SessionField="sMES_INICIAL" Type="Byte" />
                                <asp:SessionParameter  Name="mesF" SessionField="sMES_FINAL" Type="Byte" />                                
                                <asp:SessionParameter  Name="idProduto" SessionField="sPRODUTO" Type="Int32" />
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

