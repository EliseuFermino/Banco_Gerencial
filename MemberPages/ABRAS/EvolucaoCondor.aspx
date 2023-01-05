<%@ Page Title="Evolução Condor" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="EvolucaoCondor.aspx.vb" Inherits="MemberPages_EvolucaoCondor" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 469px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table cellspacing="1" class="style1">
            <tr>
                <td class="style5" align="left" valign="top">
                    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                        AutoGenerateColumns="False"                         
                         DataSourceID="SqlDataSource1" 
                        KeyFieldName="Ano" Theme="DevEx">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles >
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>                       
                        <SettingsText Title="Evolução Condor ABRAS" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Ranking" FieldName="Ranking" 
                                VisibleIndex="1">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Ano" FieldName="Ano" ReadOnly="True" 
                                VisibleIndex="2" SortIndex="0" SortOrder="Descending">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="% Cresc." FieldName="percCresc" VisibleIndex="4">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Faturamento" FieldName="vlrVenda" 
                                VisibleIndex="3">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Check-out" FieldName="Checkout" 
                                VisibleIndex="5">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="M² Venda" FieldName="metroVenda" 
                                VisibleIndex="6">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Nº Lojas" FieldName="numLojas" 
                                VisibleIndex="7">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Funcionários" FieldName="numFunc" 
                                VisibleIndex="8">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Nº de Clientes" FieldName="numClientes" 
                                VisibleIndex="9">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowTitlePanel="True" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                        
                        SelectCommand="SELECT [RankingSuperHiper], [Ranking], [Ano], [vlrVenda], [percCresc],[Checkout], [metroVenda], [numLojas], [numFunc], [numClientes] FROM [tblEvolucaoCondor] ORDER BY [Ano]">
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
<p>
    <dxwgv:ASPxGridViewExporter ID="ExporterExcel1" runat="server" 
        FileName="Evolução Condor" GridViewID="ASPxGridView1">
    </dxwgv:ASPxGridViewExporter>
    <dxe:ASPxButton ID="ASPxButton1" runat="server"        
        Text="Exportar Excel" Width="150px" Theme="DevEx">
    </dxe:ASPxButton>
    <br />
</p>
</asp:Content>

