<%@ Page Title="Saldo Inicial - Resultado Financeiro" Language="VB" MasterPageFile="~/MemberPages/Resultado Financeiro/mpResultadoFinanceiro.master" AutoEventWireup="false" CodeFile="frmSaldoInicial.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_frmSaldoInicial" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 57px;
            color: #0066FF;
            font-weight: 700;
        }
        .style4
        {
            color: #FFFFFF;
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <table class="style1">
        <tr>
            <td class="style2">
                Ano:
            </td>
            <td>
                <dxe:ASPxComboBox ID="cboAno" runat="server" AutoPostBack="True" 
                    ValueType="System.String" 
                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                    CssPostfix="Office2003_Blue" ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                    <Items>                   
                        <dxe:ListEditItem Text="2019" Value="2019" />
                        <dxe:ListEditItem Text="2020" Value="2020" />
                        <dxe:ListEditItem Text="2021" Value="2021" />
                        <dxe:ListEditItem Text="2022" Value="2022" />
                        <dxe:ListEditItem Text="2023" Value="2023" />

                    </Items>
                    <ButtonStyle Width="13px">
                    </ButtonStyle>
                </dxe:ASPxComboBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td align="center" bgcolor="White" class="style4" valign="top">
                <dxe:ASPxButton ID="ASPxButton1" runat="server" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    Text="Exportar para Excel" Width="200px">
                </dxe:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
            <td align="center" class="style4" valign="top">
                <dxe:ASPxButton ID="ASPxButton2" runat="server" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    Text="Exportar para Excel" Width="200px">
                </dxe:ASPxButton>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top">
                <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                    KeyFieldName="Ano" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                    CssPostfix="Office2003_Blue">
                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <AlternatingRow BackColor="#F2F9FF">
                        </AlternatingRow>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <TotalSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlr" 
                            ShowInGroupFooterColumn="vlr" SummaryType="Sum" />
                    </TotalSummary>
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
                    <SettingsText Title="Transferência de Entrada" />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="Ano" ReadOnly="True" VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Mes" ReadOnly="True" VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" 
                            VisibleIndex="2" Caption="Filial">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="3" 
                            Caption="Nome da Filial">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="idCSA" ReadOnly="True" 
                            VisibleIndex="4" Visible="False">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlr" VisibleIndex="4">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:conn_relReuniao %>" 
                    SelectCommand="SELECT tblResFin_Dados_2_Mes.Ano, tblResFin_Dados_2_Mes.Mes, tblResFin_Dados_2_Mes.idFilial, tblCadFiliais.Descricao, tblResFin_Dados_2_Mes.idCSA, tblResFin_Dados_2_Mes.vlr FROM tblResFin_Dados_2_Mes INNER JOIN tblCadFiliais ON tblResFin_Dados_2_Mes.idFilial = tblCadFiliais.Filial WHERE (tblResFin_Dados_2_Mes.Ano = @Ano) AND (tblResFin_Dados_2_Mes.Mes = 12) AND (tblResFin_Dados_2_Mes.idCSA = 31) ORDER BY tblResFin_Dados_2_Mes.idFilial">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboAno" Name="Ano" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
            <td align="center" valign="top">
                <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="SqlDataSource2" 
                    KeyFieldName="Ano" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                    CssPostfix="Office2003_Blue">
                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <AlternatingRow BackColor="#F2F9FF">
                        </AlternatingRow>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <TotalSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlr" 
                            ShowInGroupFooterColumn="vlr" SummaryType="Sum" />
                    </TotalSummary>
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
                    <SettingsText Title="Transferência de Saída" />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="Ano" ReadOnly="True" VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Mes" ReadOnly="True" VisibleIndex="1">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" 
                            VisibleIndex="2" Caption="Filial">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="3" 
                            Caption="Nome da Filial">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="idCSA" ReadOnly="True" 
                            VisibleIndex="4" Visible="False">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlr" VisibleIndex="4">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFooter="True" ShowTitlePanel="True" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:conn_relReuniao %>" 
                    
                    SelectCommand="SELECT tblResFin_Dados_2_Mes.Ano, tblResFin_Dados_2_Mes.Mes, tblResFin_Dados_2_Mes.idFilial, tblCadFiliais.Descricao, tblResFin_Dados_2_Mes.idCSA, tblResFin_Dados_2_Mes.vlr FROM tblResFin_Dados_2_Mes INNER JOIN tblCadFiliais ON tblResFin_Dados_2_Mes.idFilial = tblCadFiliais.Filial WHERE (tblResFin_Dados_2_Mes.Ano = @Ano) AND (tblResFin_Dados_2_Mes.Mes = 12) AND (tblResFin_Dados_2_Mes.idCSA = 32) ORDER BY tblResFin_Dados_2_Mes.idFilial">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboAno" Name="Ano" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td>
                <dxwgv:ASPxGridViewExporter ID="Exporter" runat="server" 
                    GridViewID="ASPxGridView1">
                </dxwgv:ASPxGridViewExporter>
                <dxwgv:ASPxGridViewExporter ID="Exporter1" runat="server" 
                    GridViewID="ASPxGridView2">
                </dxwgv:ASPxGridViewExporter>
            </td>
        </tr>
    </table>
    <br />
</p>
</asp:Content>

