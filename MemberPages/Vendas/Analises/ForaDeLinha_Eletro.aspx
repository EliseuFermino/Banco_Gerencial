<%@ Page Title="Fora de Linha - Eletro" Language="VB" MasterPageFile="~/MemberPages/Vendas/Analises/mpForaDeLinha.master" AutoEventWireup="false" CodeFile="ForaDeLinha_Eletro.aspx.vb" Inherits="MemberPages_Vendas_Analises_ForaDeLinha_Eletro" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%--<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">



</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentForaDeLinha" Runat="Server">

        <style type="text/css" >

        .LayoutGridSecao {
            margin-left: 2px;
            padding-top: 10px;
        }

    </style>

    <div id="divTotal" class ="LayoutGridSecao ">
        <dx:ASPxGridView ID="grid_Total" runat="server" DataSourceID="dsDepartamento5" AutoGenerateColumns="False" KeyFieldName="descSemana" EnableTheming="True" Theme="Default">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Semana" FieldName="descSemana" VisibleIndex="0" Width="200px">
                    <HeaderStyle Font-Bold="True" Font-Size="Large" />
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Total" VisibleIndex="1">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucroComercial" VisibleIndex="2" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Fora de Linha" VisibleIndex="5">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeFL" VisibleIndex="0" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Qtde" ReadOnly="True" VisibleIndex="1" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaFL" VisibleIndex="2" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Venda" ReadOnly="True" VisibleIndex="3" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialFL" VisibleIndex="4" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargemFL" ReadOnly="True" VisibleIndex="5" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" BackColor="Silver" />
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn FieldName="rn" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#EBEBEB">
                </AlternatingRow>
                <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsDepartamento5" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Departamento5" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>

    <div id="divSecao50"  class="LayoutGridSecao" >
        <dx:ASPxGridView ID="grid_Secao50" runat="server" DataSourceID="dsSecao50" AutoGenerateColumns="False" KeyFieldName="idSemana">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Semana" FieldName="descSemana" VisibleIndex="0" Width="200px">
                    <HeaderStyle Font-Bold="True" Font-Size="Large" />
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Total" VisibleIndex="1">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucroComercial" VisibleIndex="2" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Fora de Linha" VisibleIndex="5">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeFL" VisibleIndex="0" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Qtde" ReadOnly="True" VisibleIndex="1" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaFL" VisibleIndex="2" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Venda" ReadOnly="True" VisibleIndex="3" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialFL" VisibleIndex="4" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargemFL" ReadOnly="True" VisibleIndex="5" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" BackColor="Silver" />
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn FieldName="rn" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" />
            <SettingsDetail ShowDetailRow="True" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#EBEBEB">
                </AlternatingRow>
                <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                </FocusedRow>
            </Styles>
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="detail_Secao50" runat="server" AutoGenerateColumns="False" DataSourceID="dsGrupo_Semana_Secao50" KeyFieldName="descSemana" OnBeforePerformDataSelect="detail_Secao54_BeforePerformDataSelect" OnHtmlDataCellPrepared="detail_Secao50_HtmlDataCellPrepared">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="descSemana" VisibleIndex="0" Width="200px">
                                <HeaderStyle Font-Bold="True" Font-Size="Large" />
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Total" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucroComercial" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Fora de Linha" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeFL" VisibleIndex="0" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Qtde" ReadOnly="True" VisibleIndex="1" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaFL" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Venda" ReadOnly="True" VisibleIndex="3" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialFL" VisibleIndex="4" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargemFL" ReadOnly="True" VisibleIndex="5" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="Silver" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="rn" Visible="False" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowTitlePanel="True" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EBEBEB">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="dsGrupo_Semana_Secao50" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Grupo_Secao50" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idSemana" SessionField="sSEMANA" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </DetailRow>
            </Templates>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsSecao50" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Secao50" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </div>

    <div id="divSecao51" class ="LayoutGridSecao ">
        <dx:ASPxGridView ID="grid_Secao51" runat="server" DataSourceID="dsSecao51" AutoGenerateColumns="False" KeyFieldName="idSemana">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Semana" FieldName="descSemana" VisibleIndex="0" Width="200px">
                    <HeaderStyle Font-Bold="True" Font-Size="Large" />
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Total" VisibleIndex="1">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucroComercial" VisibleIndex="2" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Fora de Linha" VisibleIndex="5">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeFL" VisibleIndex="0" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Qtde" ReadOnly="True" VisibleIndex="1" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaFL" VisibleIndex="2" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Venda" ReadOnly="True" VisibleIndex="3" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialFL" VisibleIndex="4" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargemFL" ReadOnly="True" VisibleIndex="5" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" BackColor="Silver" />
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn FieldName="rn" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
             <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" />
            <SettingsDetail ShowDetailRow="True" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#EBEBEB">
                </AlternatingRow>
                <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                </FocusedRow>
            </Styles>
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="detail_Secao51" runat="server" AutoGenerateColumns="False" DataSourceID="dsGrupo_Semana_Secao51" KeyFieldName="descSemana" OnBeforePerformDataSelect="detail_Secao54_BeforePerformDataSelect" OnHtmlDataCellPrepared="detail_Secao51_HtmlDataCellPrepared">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="descSemana" VisibleIndex="0" Width="200px">
                                <HeaderStyle Font-Bold="True" Font-Size="Large" />
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Total" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucroComercial" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Fora de Linha" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeFL" VisibleIndex="0" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Qtde" ReadOnly="True" VisibleIndex="1" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaFL" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Venda" ReadOnly="True" VisibleIndex="3" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialFL" VisibleIndex="4" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargemFL" ReadOnly="True" VisibleIndex="5" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="Silver" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="rn" Visible="False" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowTitlePanel="True" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EBEBEB">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="dsGrupo_Semana_Secao51" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Grupo_Secao51" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idSemana" SessionField="sSEMANA" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </DetailRow>
            </Templates>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsSecao51" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Secao51" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </div>

    <div id="divSecao52" class ="LayoutGridSecao">
        <dx:ASPxGridView ID="grid_Secao52" runat="server" DataSourceID="dsSecao52" AutoGenerateColumns="False" KeyFieldName="idSemana">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Semana" FieldName="descSemana" VisibleIndex="0" Width="200px">
                    <HeaderStyle Font-Bold="True" Font-Size="Large" />
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Total" VisibleIndex="1">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucroComercial" VisibleIndex="2" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Fora de Linha" VisibleIndex="5">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeFL" VisibleIndex="0" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Qtde" ReadOnly="True" VisibleIndex="1" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaFL" VisibleIndex="2" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Venda" ReadOnly="True" VisibleIndex="3" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialFL" VisibleIndex="4" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargemFL" ReadOnly="True" VisibleIndex="5" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" BackColor="Silver" />
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn FieldName="rn" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
             <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" />
            <SettingsDetail ShowDetailRow="True" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#EBEBEB">
                </AlternatingRow>
                <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                </FocusedRow>
            </Styles>
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="detail_Secao52" runat="server" AutoGenerateColumns="False" DataSourceID="dsGrupo_Semana_Secao52" KeyFieldName="descSemana" OnBeforePerformDataSelect="detail_Secao54_BeforePerformDataSelect" OnHtmlDataCellPrepared="detail_Secao52_HtmlDataCellPrepared">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="descSemana" VisibleIndex="0" Width="200px">
                                <HeaderStyle Font-Bold="True" Font-Size="Large" />
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Total" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucroComercial" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Fora de Linha" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeFL" VisibleIndex="0" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Qtde" ReadOnly="True" VisibleIndex="1" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaFL" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Venda" ReadOnly="True" VisibleIndex="3" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialFL" VisibleIndex="4" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargemFL" ReadOnly="True" VisibleIndex="5" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="Silver" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="rn" Visible="False" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowTitlePanel="True" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EBEBEB">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="dsGrupo_Semana_Secao52" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Grupo_Secao52" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idSemana" SessionField="sSEMANA" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </DetailRow>
            </Templates>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsSecao52" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Secao52" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </div>

    <div id="divSecao53" class ="LayoutGridSecao">
        <dx:ASPxGridView ID="grid_Secao53" runat="server" DataSourceID="dsSecao53" AutoGenerateColumns="False" KeyFieldName="idSemana">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Semana" FieldName="descSemana" VisibleIndex="0" Width="200px">
                    <HeaderStyle Font-Bold="True" Font-Size="Large" />
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Total" VisibleIndex="1">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucroComercial" VisibleIndex="2" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Fora de Linha" VisibleIndex="5">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeFL" VisibleIndex="0" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Qtde" ReadOnly="True" VisibleIndex="1" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaFL" VisibleIndex="2" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Venda" ReadOnly="True" VisibleIndex="3" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialFL" VisibleIndex="4" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargemFL" ReadOnly="True" VisibleIndex="5" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" BackColor="Silver" />
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn FieldName="rn" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" />
            <SettingsDetail ShowDetailRow="True" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#EBEBEB">
                </AlternatingRow>
                <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                </FocusedRow>
            </Styles>
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="detail_Secao53" runat="server" AutoGenerateColumns="False" DataSourceID="dsGrupo_Semana_Secao53" KeyFieldName="descSemana" OnBeforePerformDataSelect="detail_Secao54_BeforePerformDataSelect" OnHtmlDataCellPrepared="detail_Secao53_HtmlDataCellPrepared">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="descSemana" VisibleIndex="0" Width="200px">
                                <HeaderStyle Font-Bold="True" Font-Size="Large" />
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Total" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucroComercial" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Fora de Linha" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeFL" VisibleIndex="0" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Qtde" ReadOnly="True" VisibleIndex="1" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaFL" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Venda" ReadOnly="True" VisibleIndex="3" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialFL" VisibleIndex="4" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargemFL" ReadOnly="True" VisibleIndex="5" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="Silver" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="rn" Visible="False" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowTitlePanel="True" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EBEBEB">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="dsGrupo_Semana_Secao53" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Grupo_Secao53" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idSemana" SessionField="sSEMANA" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </DetailRow>
            </Templates>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsSecao53" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Secao53" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </div>

    <div id="divSecao54" class ="LayoutGridSecao ">
        <dx:ASPxGridView ID="grid_Secao54" runat="server" DataSourceID="dsSecao54" AutoGenerateColumns="False" KeyFieldName="idSemana">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Semana" FieldName="descSemana" VisibleIndex="0" Width="200px">
                    <HeaderStyle Font-Bold="True" Font-Size="Large" />
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Total" VisibleIndex="1">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucroComercial" VisibleIndex="2" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Fora de Linha" VisibleIndex="5">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeFL" VisibleIndex="0" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Qtde" ReadOnly="True" VisibleIndex="1" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaFL" VisibleIndex="2" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Venda" ReadOnly="True" VisibleIndex="3" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialFL" VisibleIndex="4" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargemFL" ReadOnly="True" VisibleIndex="5" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" BackColor="Silver" />
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn FieldName="rn" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" />
            <SettingsDetail ShowDetailRow="True" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#EBEBEB">
                </AlternatingRow>
                <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                </FocusedRow>
            </Styles>
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="detail_Secao54" runat="server" AutoGenerateColumns="False" DataSourceID="dsGrupo_Semana_Secao54" KeyFieldName="descSemana" OnBeforePerformDataSelect="detail_Secao54_BeforePerformDataSelect" OnHtmlDataCellPrepared="detail_Secao54_HtmlDataCellPrepared">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="descSemana" VisibleIndex="0" Width="200px">
                                <HeaderStyle Font-Bold="True" Font-Size="Large" />
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Total" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucroComercial" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Fora de Linha" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeFL" VisibleIndex="0" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Qtde" ReadOnly="True" VisibleIndex="1" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaFL" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Venda" ReadOnly="True" VisibleIndex="3" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialFL" VisibleIndex="4" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargemFL" ReadOnly="True" VisibleIndex="5" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="Silver" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="rn" Visible="False" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowTitlePanel="True" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EBEBEB">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="dsGrupo_Semana_Secao54" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Grupo_Secao54" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idSemana" SessionField="sSEMANA" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                </DetailRow>
            </Templates>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsSecao54" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Secao54" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </div>

    <div id="divSecao55" class ="LayoutGridSecao ">
        <dx:ASPxGridView ID="grid_Secao55" runat="server" DataSourceID="dsSecao55" AutoGenerateColumns="False" KeyFieldName="idSemana">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Semana" FieldName="descSemana" VisibleIndex="0" Width="200px">
                    <HeaderStyle Font-Bold="True" Font-Size="Large" />
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Total" VisibleIndex="1">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucroComercial" VisibleIndex="2" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" />
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Fora de Linha" VisibleIndex="5">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeFL" VisibleIndex="0" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Qtde" ReadOnly="True" VisibleIndex="1" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaFL" VisibleIndex="2" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Venda" ReadOnly="True" VisibleIndex="3" Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialFL" VisibleIndex="4" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargemFL" ReadOnly="True" VisibleIndex="5" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle Font-Bold="True" BackColor="Silver" />
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn FieldName="rn" Visible="False" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" />
            <SettingsDetail ShowDetailRow="True" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#EBEBEB">
                </AlternatingRow>
                <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                </FocusedRow>
            </Styles>
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="detail_Secao55" runat="server" AutoGenerateColumns="False" DataSourceID="dsGrupo_Semana_Secao55" KeyFieldName="descSemana" OnBeforePerformDataSelect="detail_Secao55_BeforePerformDataSelect" OnHtmlDataCellPrepared="detail_Secao55_HtmlDataCellPrepared">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="descSemana" VisibleIndex="0" Width="200px">
                                <HeaderStyle Font-Bold="True" Font-Size="Large" />
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Total" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrLucroComercial" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Fora de Linha" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeFL" VisibleIndex="0" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Qtde" ReadOnly="True" VisibleIndex="1" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaFL" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_Venda" ReadOnly="True" VisibleIndex="3" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialFL" VisibleIndex="4" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Margem" FieldName="percMargemFL" ReadOnly="True" VisibleIndex="5" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="Silver" Font-Bold="True" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="rn" Visible="False" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowTitlePanel="True" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EBEBEB">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="#3366FF">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="dsGrupo_Semana_Secao55" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Grupo_Secao55" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idSemana" SessionField="sSEMANA" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                </DetailRow>
            </Templates>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsSecao55" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Secao55" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </div>

</asp:Content>

