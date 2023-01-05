<%@ Page Title="Consulta Despesa Analitica" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ConsultaDespesaAnalitica.aspx.vb" Inherits="MemberPages_ConsultaDespesaAnalitica" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>



<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">


.dxeButtonEdit_Aqua
{
    background-color: White;
    border: Solid 1px #AECAF0;
    width: 170px;
}
        .style5
        {
            width: 152px;
        }
        .style6
        {
            width: 38px;
        }
        .style7
        {
            width: 188px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <table cellspacing="1" class="style1">
            <tr>
                <td class="style5">
                                        <uc1:wucAno ID="cboAno" runat="server" />
                                    </td>
                <td class="style7">
                                        <uc2:wuciListaMes ID="cboMes" runat="server" />
                                    </td>
                <td>
                    <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="Exportar Excel" 
                        Width="200px">
                    </dxe:ASPxButton>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="5">
                    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                        AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue" DataSourceID="SqlDataSource1" Width="900px" Theme="DevEx">
                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue">
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <AlternatingRow BackColor="#F4FAFF">
                            </AlternatingRow>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager PageSize="20">
                        </SettingsPager>
                        <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                            <CollapsedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                Width="11px" />
                            <ExpandedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                            <DetailCollapsedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                Width="11px" />
                            <DetailExpandedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                            <FilterRowButton Height="13px" Width="13px" />
                        </Images>
                        <Columns>
                            <dxwgv:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dxwgv:GridViewDataTextColumn Caption="Loja" FieldName="LOJA" VisibleIndex="1" 
                                Width="30px">
                                <CellStyle Wrap="True">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataDateColumn Caption="Dia" FieldName="DATA" VisibleIndex="2" 
                                Width="80px">
                                <CellStyle Wrap="True">
                                </CellStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Valor" FieldName="VALOR" 
                                VisibleIndex="3" Width="80px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle Wrap="True">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Fonte" FieldName="FONTE" 
                                VisibleIndex="4" Width="100px">
                                <CellStyle Wrap="True">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Fornecedor / Descrição" 
                                FieldName="DESCRICAO" VisibleIndex="5" Width="300px">
                                <CellStyle Wrap="True">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="NF" FieldName="NOTA" VisibleIndex="6" 
                                Width="50px">
                                <CellStyle Wrap="True">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Observações" FieldName="OBSERVACOES" 
                                VisibleIndex="7" Width="200px">
                                <CellStyle Wrap="True">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="DescricaoDet" 
                                VisibleIndex="8" Width="100px">
                                <CellStyle Wrap="True">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFilterRow="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="400" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="SELECT LOJA, DATA, VALOR, FONTE, DESCRICAO, NOTA, OBSERVACOES, DescricaoDet FROM Despesas.viewDespesaBase WHERE (ANO = @Ano) AND (MES = @Mes)">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="Ano" SessionField="@Ano" 
                                Type="String" />
                            <asp:SessionParameter DefaultValue="" Name="Mes" SessionField="@Mes" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <dxwgv:ASPxGridViewExporter ID="ExporterExcel1" runat="server" 
                        GridViewID="ASPxGridView1">
                    </dxwgv:ASPxGridViewExporter>
                </td>
            </tr>
        </table>
        <br />
    </p>
</asp:Content>

