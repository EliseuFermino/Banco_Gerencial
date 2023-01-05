<%@ Page Title="Fora de Linha - Eletro" Language="VB" MasterPageFile="~/MemberPages/Vendas/Analises/mpForaDeLinha.master" AutoEventWireup="false" CodeFile="ForaDeLinha_Eletro_Mes.aspx.vb" Inherits="MemberPages_Vendas_Analises_ForaDeLinha_Eletro_Mes" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>


<%--<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">



</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentForaDeLinha" Runat="Server">

        <style type="text/css" >

        .LayoutGridSecao {
            clear : both;
            margin-left: 2px;
            padding-top: 10px;
        }

        #divAno {
            clear: both;
        }

    </style>

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divTotal" class ="LayoutGridSecao ">
        <dx:ASPxGridView ID="grid_Total" runat="server" DataSourceID="dsDepartamento5" AutoGenerateColumns="False" KeyFieldName="descSemana">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Mês" FieldName="NomeMes" VisibleIndex="0" Width="100px">
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
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="80px">
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
        <asp:SqlDataSource ID="dsDepartamento5" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Departamento5_Mes" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div id="divSecao50"  class="LayoutGridSecao" >
        <dx:ASPxGridView ID="grid_Secao50" runat="server" DataSourceID="dsSecao50" AutoGenerateColumns="False" KeyFieldName="descSemana">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Mês" FieldName="NomeMes" VisibleIndex="0" Width="100px">
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
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="80px">
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
        <asp:SqlDataSource ID="dsSecao50" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Secao50_Mes" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

    <div id="divSecao51" class ="LayoutGridSecao ">
        <dx:ASPxGridView ID="grid_Secao51" runat="server" DataSourceID="dsSecao51" AutoGenerateColumns="False" KeyFieldName="descSemana">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Mês" FieldName="NomeMes" VisibleIndex="0" Width="100px">
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
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="80px">
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
        <asp:SqlDataSource ID="dsSecao51" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Secao51_Mes" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

    <div id="divSecao52" class ="LayoutGridSecao">
        <dx:ASPxGridView ID="grid_Secao52" runat="server" DataSourceID="dsSecao52" AutoGenerateColumns="False" KeyFieldName="descSemana">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Mês" FieldName="NomeMes" VisibleIndex="0" Width="100px">
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
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="80px">
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
        <asp:SqlDataSource ID="dsSecao52" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Secao52_Mes" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

    <div id="divSecao53" class ="LayoutGridSecao">
        <dx:ASPxGridView ID="grid_Secao53" runat="server" DataSourceID="dsSecao53" AutoGenerateColumns="False" KeyFieldName="descSemana">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Mês" FieldName="NomeMes" VisibleIndex="0" Width="100px">
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
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="80px">
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
        <asp:SqlDataSource ID="dsSecao53" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Secao53_Mes" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

    <div id="divSecao54" class ="LayoutGridSecao ">
        <dx:ASPxGridView ID="grid_Secao54" runat="server" DataSourceID="dsSecao54" AutoGenerateColumns="False" KeyFieldName="descSemana">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Mês" FieldName="NomeMes" VisibleIndex="0" Width="100px">
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
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="80px">
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
        <asp:SqlDataSource ID="dsSecao54" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Secao54_Mes" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

    <div id="divSecao55" class ="LayoutGridSecao ">
        <dx:ASPxGridView ID="grid_Secao55" runat="server" DataSourceID="dsSecao55" AutoGenerateColumns="False" KeyFieldName="descSemana">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Mês" FieldName="NomeMes" VisibleIndex="0" Width="100px">
                    <HeaderStyle Font-Bold="True" Font-Size="Large" />
                    <CellStyle>
                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Departamento Eletro - Total" VisibleIndex="1">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" VisibleIndex="1" Width="80px">
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
                <dx:GridViewBandColumn Caption="Departamento Eletro - Fora de Linha" VisibleIndex="5">
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
        <asp:SqlDataSource ID="dsSecao55" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_ForaDeLinha_Secao55_Mes" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>

</asp:Content>

