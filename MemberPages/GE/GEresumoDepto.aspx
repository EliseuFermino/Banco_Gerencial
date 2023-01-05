<%@ Page Title="Resumo por Departamento" Language="VB" MasterPageFile="~/MemberPages/SiteGerencial.master" AutoEventWireup="false" CodeFile="GEresumoDepto.aspx.vb" Inherits="MemberPages_GE_GEresumoDepto" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>
<%@ Register src="../../Controles/wucFixarCabecalho.ascx" tagname="wucFixarCabecalho" tagprefix="uc3" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <table class="auto-style1">
            <tr>
                <td style="width: 101px">
                <uc1:wucAno ID="cboAno" runat="server" />
                </td>
                <td style="width: 151px">
                <uc2:wuciListaMes ID="cboMes" runat="server" />
                </td>
                <td style="width: 124px">
                    <uc3:wucFixarCabecalho ID="chkFixarCabecalho" runat="server" />
                </td>
                <td>
                    <dx:ASPxButton ID="btnExportar" runat="server" Text="Excel" Theme="DevEx" 
                        Width="80px">
                    </dx:ASPxButton>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td>
        <dx:ASPxGridView ID="gridSecao" runat="server" AutoGenerateColumns="False" 
            DataSourceID="dsDepto" EnableTheming="True" KeyFieldName="FilialLista" 
            Theme="DevEx" Width="600px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeSLV" 
                    SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaSLV" 
                    SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeGE" 
                    SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaGE" 
                    SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescQtde" 
                    SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescVenda" 
                    SummaryType="Custom" />
            </TotalSummary>
            <Columns>
                <dx:GridViewBandColumn Caption="Vendas" VisibleIndex="1">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="qtdeSLV" VisibleIndex="0">
                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrVendaSLV" 
                            VisibleIndex="1" Width="90px">
                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Garantia Estendida" VisibleIndex="5">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrVendaGE" 
                            VisibleIndex="1">
                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="qtdeGE" VisibleIndex="0">
                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Participação" VisibleIndex="7">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="% Qtde" FieldName="percCrescQtde" 
                            VisibleIndex="0" Width="65px">
                            <propertiestextedit displayformatstring="{0:n2}" encodehtml="False"></propertiestextedit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Vlr" FieldName="percCrescVenda" 
                            VisibleIndex="1" Width="65px">
                            <propertiestextedit displayformatstring="{0:n2}" encodehtml="False"></propertiestextedit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn Caption="Seção" FieldName="FilialLista" 
                    VisibleIndex="0" Width="150px">
                    <CellStyle Wrap="False">
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                VerticalScrollableHeight="400" />
            <SettingsText EmptyDataRow="Não há informações disponiveis para este período" 
                Title="Tabela de Informações - Departamento 5 - Eletro" />
            <Styles>
                <Header HorizontalAlign="Center"></Header>
                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                <Footer Font-Bold="True">
                </Footer>
                <TitlePanel Font-Size="Medium">
                </TitlePanel>
            </Styles>
        </dx:ASPxGridView>
                    <br />
                    <asp:SqlDataSource ID="dsDepto" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                        
                        SelectCommand="SELECT a.vlrVendaGE, a.qtdeGE, a.vlrVendaSLV, a.qtdeSLV, a.percCrescQtde, a.percCrescVenda, b.FilialLista FROM Dia.tblVendaGarantiaEstendida_ResumoDepto AS a INNER JOIN gerManager.Cadastros.tblCadFiliais AS b ON a.idFilial = b.Filial WHERE (a.Ano = @Ano) AND (a.Mes = @Mes) AND idFilial&lt;&gt;99">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" 
                        FileName="Garantia Estendida por Departamento" GridViewID="gridSecao">
                    </dx:ASPxGridViewExporter>
                </td>
            </tr>
        </table>
        <br />
    </p>
</asp:Content>

