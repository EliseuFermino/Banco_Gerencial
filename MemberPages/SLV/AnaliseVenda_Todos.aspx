<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseVenda_Todos.aspx.vb" Inherits="MemberPages_SLV_AnaliseVenda_Todos" %>

<%@ Register src="../../Controles/wucListaDiaIniFin.ascx" tagname="wucListaDiaIniFin" tagprefix="uc1" %>
<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc2" %>

<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>


<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <table cellspacing="1" style="width: 845px">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <Triggers >
                         <asp:PostBackTrigger ControlID="btnExcel" /> 
                    </Triggers>
                    <ContentTemplate>
                        <table cellspacing="1" style="width: 818px">
                            <tr>
                                <td>

                                    <uc3:wuciListaLojasComApoio ID="cboFilial" runat="server" />

                                </td>
                                <td>
                                    <uc1:wucListaDiaIniFin ID="cboDia" runat="server" />
                                </td>
                                <td>
                                    <uc2:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
                                </td>
                                <td>
                                    <uc4:wucBotaoExcel ID="btnExcel" runat="server" />
                                </td>
                            </tr>
                        </table>
                        <table cellspacing="1" >
                            <tr>
                                <td>
                                    <dx:ASPxGridView ID="grid" runat="server" 
                                        DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                                        EnableTheming="True" Theme="SoftOrange" Width="400px" 
                                        KeyFieldName="idSecao">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="idDepto" VisibleIndex="1" SortIndex="0" 
                                                SortOrder="Ascending" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="descSecao" VisibleIndex="2" 
                                                Caption="Seção" Width="150px">
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="QtdeAT" VisibleIndex="9" Caption="Qtde" 
                                                ToolTip="Quantidade vendida do período selecionado" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrVendaAT" VisibleIndex="10" 
                                                Caption="Venda" ToolTip="Valor de venda do período selecionado" 
                                                Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percMargemAT" VisibleIndex="11" 
                                                Caption="% Marg" ToolTip="Percentual de margem do período selecionado" 
                                                Width="50px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="QtdeAA" VisibleIndex="3" 
                                                Caption="Qtde AA" ToolTip="Quantidade do Ano Anterior (mesmo período)" 
                                                Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#CC9900" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrVendaAA" VisibleIndex="4" 
                                                Caption="Venda AA" 
                                                ToolTip="Valor da venda do ano anterior (mesmo período)" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#CC9900" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percMargemAA" VisibleIndex="5" 
                                                Caption="% Marg" 
                                                ToolTip="Percentual de margem do ano anterior (mesmo período)" 
                                                Width="50px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#CC9900" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrVendaMA" VisibleIndex="7" 
                                                Caption="Venda MA" ToolTip="Valor de venda do mês anterior (mesmo dias)" 
                                                Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#FF9900" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="QtdeMA" VisibleIndex="6" 
                                                Caption="Qtde MA" ToolTip="Quantidade do mês anterior (mesmo dias)" 
                                                Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#FF9900" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percMargemMA" VisibleIndex="8" 
                                                Caption="% Marg" 
                                                ToolTip="Percentual de margem do mês anterior (mesmo dias)" Width="50px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#FF9900" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percCresc" VisibleIndex="12" 
                                                Caption="% Cresc" 
                                                
                                                
                                                ToolTip="Percentual de crescimento entre periodo atual e periodo do ano anterior" 
                                                Width="50px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrMeta" VisibleIndex="13" Caption="Meta" 
                                                ToolTip="Valor de meta de venda do período selecionado" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#009900" />
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percMargemMeta" VisibleIndex="14" 
                                                Caption="% Marg" 
                                                ToolTip="Percentual de meta de margem do período selecionado" Width="50px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#009900" />
                                                <CellStyle ForeColor="#009900">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Depto" FieldName="descDepto" 
                                                VisibleIndex="15" Width="45px">
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Styles>
	                                        <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                                        	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                        </Styles>
                                        <Settings ShowGroupPanel="True" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e loja" 
                                            GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                        SelectCommand="SELECT [idDepto], [descDepto], [descSecao], [QtdeAT], [vlrVendaAT], [percMargemAT], [QtdeAA], [vlrVendaAA], [percMargemAA], [vlrVendaMA], [QtdeMA], [percMargemMA], [percCresc], [vlrMeta], [percMargemMeta] FROM [SLV].[AnaliseAnoAnterior] WHERE ([Usuario] = @Usuario) ORDER BY [idSecao]">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
<br />
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
            </td>
        </tr>
    </table>

</asp:Content>

