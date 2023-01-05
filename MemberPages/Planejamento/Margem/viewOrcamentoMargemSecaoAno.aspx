<%@ Page Title="Relatório de Vendas por Seção" Language="VB" MasterPageFile="~/MemberPages/SiteOrcamento.master" AutoEventWireup="false" CodeFile="viewOrcamentoMargemSecaoAno.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_viewOrcamentoVendasMargemAno" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>


<%@ Register src="../../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>
<%@ Register src="../../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<%@ Register src="../../../Controles/wucListaPosicao.ascx" tagname="wucListaPosicao" tagprefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
    <table class="auto-style1">
        <tr>
            <td align="left" class="auto-style2" style="width: 88px">
                <uc1:wucAno ID="cboAno" runat="server" />
            </td>
            <td style="width: 191px">
                <uc3:wuciListaLojasComApoio ID="cboFilial" runat="server" />
            </td>
            <td align="left" style="width: 164px">
                    <dx:ASPxCheckBox ID="chkCabecalho" runat="server" AutoPostBack="True" 
                        Checked="True" CheckState="Checked" Text="Fixar cabeçalho" Theme="DevEx">
                    </dx:ASPxCheckBox>
                </td>
            <td align="left">
                <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                    FileName="Orcamento" GridViewID="grid">
                </dx:ASPxGridViewExporter>
                    <dx:ASPxButton ID="btnExportar" runat="server" Text="Exportar Excel" 
                    Width="150px">
                    </dx:ASPxButton>
                </td>
            <td align="left">&nbsp;</td>
        </tr>
    </table>
    <table class="auto-style1">
        <tr>
            <td>
                <dxwgv:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="dsView" EnableTheming="True" Theme="SoftOrange" 
                        KeyFieldName="Descricao" Width="1000px">
                    <Columns>
                        <dxwgv:GridViewBandColumn Caption="Ano 3" VisibleIndex="2" Name="Grupo_Ano3" 
                            ShowInCustomizationForm="True">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="vlrA3" ReadOnly="True" 
                                    VisibleIndex="0" ShowInCustomizationForm="True" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Part" FieldName="percA3" ReadOnly="True" 
                                    VisibleIndex="1" ShowInCustomizationForm="True" Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Ano 2" VisibleIndex="3" Name="Grupo_Ano2" 
                            ShowInCustomizationForm="True">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="vlrA2" ReadOnly="True" 
                                    VisibleIndex="0" ShowInCustomizationForm="True" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Part" FieldName="percA2" ReadOnly="True" 
                                    VisibleIndex="1" ShowInCustomizationForm="True" Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Ano 1" VisibleIndex="4" Name="Grupo_Ano1" 
                            ShowInCustomizationForm="True">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="vlrA1" ReadOnly="True" 
                                    VisibleIndex="0" ShowInCustomizationForm="True" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Part" FieldName="percA1" ReadOnly="True" 
                                    VisibleIndex="1" ShowInCustomizationForm="True" Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="Blue">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#0066CC" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Meta" VisibleIndex="5" Name="Grupo_Meta" 
                            ShowInCustomizationForm="True">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="vlr" ReadOnly="True" 
                                    VisibleIndex="0" ShowInCustomizationForm="True" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="#009900">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Part" FieldName="perc" ReadOnly="True" 
                                    VisibleIndex="1" ShowInCustomizationForm="True" Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="#009900">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#009900" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Crescimento" VisibleIndex="6" 
                            Name="Grupo_Crescimento" ShowInCustomizationForm="True">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn FieldName="CrescA3_A4" ReadOnly="True" 
                                    VisibleIndex="2" Name="CrescMeta" ShowInCustomizationForm="True" 
                                    Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="CrescA2_A3" ReadOnly="True" 
                                    VisibleIndex="1" Name="CrescAA" ShowInCustomizationForm="True" 
                                    Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="CrescA1_A2" ReadOnly="True" 
                                    VisibleIndex="0" Name="CrescAA1" ShowInCustomizationForm="True" 
                                    Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#FF9900" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Seção" FieldName="Descricao" 
                            VisibleIndex="0" ShowInCustomizationForm="True" Width="200px">
                            <CellStyle Wrap="False">
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <settings showverticalscrollbar="True" verticalscrollableheight="410" />
                    <Styles>
                        <Header HorizontalAlign="Center"></Header>
                        <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                    </Styles>
                  
                </dxwgv:ASPxGridView>
    <asp:SqlDataSource ID="dsView" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        SelectCommand="uspBackPage_VendaSecaoOriginalLoja_Page" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="userName" SessionField="sUSER" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    
                </td>
        </tr>

        <tr>
            <td>
                <uc4:wucListaPosicao ID="cboPosicao" runat="server" />
            </td>
        </tr>
    </table>
        
    <br />
</p>
</asp:Content>

