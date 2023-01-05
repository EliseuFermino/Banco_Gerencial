<%@ Page Title="Relatório de Vendas por Seção" Language="VB" MasterPageFile="~/MemberPages/SiteOrcamento.master" AutoEventWireup="false" CodeFile="viewOrcamentoVendasSecao.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_viewOrcamentoVendasSecao" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>


<%@ Register src="../../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>
<%@ Register src="../../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<%@ Register src="../../../Controles/wucListaPosicao.ascx" tagname="wucListaPosicao" tagprefix="uc4" %>

<%@ Register src="../../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
    <table>
        <tr>
            <td align="left" class="auto-style2" style="width: 88px">
                <uc1:wucAno ID="cboAno" runat="server" />
            </td>
            <td style="width: 148px">
                <uc2:wuciListaMes ID="cboMes" runat="server"  />
            </td>
            <td style="width: 595px">
                <uc5:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
            </td>
           
            
            <td align="left">&nbsp;</td>
        </tr>
    </table>
    <table class="auto-style1">
        <tr>
            <td>
                <dxwgv:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="dsView" EnableTheming="True" Theme="SoftOrange" Width="1000px">

                    <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>

                    <Columns>
                        <dxwgv:GridViewBandColumn Caption="Ano 3" VisibleIndex="2" Name="Grupo_Ano3">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="vlrA3" ReadOnly="True" 
                                    VisibleIndex="0" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Part" FieldName="percA3" ReadOnly="True" 
                                    VisibleIndex="1" Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Ano 2" VisibleIndex="3" Name="Grupo_Ano2">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="vlrA2" ReadOnly="True" 
                                    VisibleIndex="0" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Part" FieldName="percA2" ReadOnly="True" 
                                    VisibleIndex="1" Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Ano 1" VisibleIndex="4" Name="Grupo_Ano1">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="vlrA1" ReadOnly="True" 
                                    VisibleIndex="0" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Part" FieldName="percA1" ReadOnly="True" 
                                    VisibleIndex="1" Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="Blue">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#0066CC" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Meta" VisibleIndex="5" Name="Grupo_Meta">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="vlr" ReadOnly="True" 
                                    VisibleIndex="0" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="#009900">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Part" FieldName="perc" ReadOnly="True" 
                                    VisibleIndex="1" Width="50px">
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
                            Name="Grupo_Crescimento">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn FieldName="CrescA3_A4" ReadOnly="True" 
                                    VisibleIndex="2" Name="CrescMeta" 
                                    Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="CrescA2_A3" ReadOnly="True" 
                                    VisibleIndex="1" Name="CrescAA" 
                                    Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="CrescA1_A2" ReadOnly="True" 
                                    VisibleIndex="0" Name="CrescAA1" 
                                    Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#FF9900" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Seção" FieldName="Descricao" 
                            VisibleIndex="0" Width="200px">
                            <CellStyle Wrap="False">
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <settings showverticalscrollbar="True" verticalscrollableheight="610" />
                     <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
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

</p>

</asp:Content>

