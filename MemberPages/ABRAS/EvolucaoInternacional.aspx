<%@ Page Title="Evolução Condor" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="EvolucaoInternacional.aspx.vb" Inherits="MemberPages_EvolucaoCondor" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style5
        {
            width: 469px;
        }
        .style6
        {
            width: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table cellspacing="1" class="style1">
            <tr>
                <td align="left" valign="top">
                    <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" 
                        AutoGenerateColumns="False" DataSourceID="SqlDataSource2" 
                        KeyFieldName="id" Theme="DevEx">
                        <settingsbehavior allowfocusedrow="True" />
                        <styles>
                            <header imagespacing="5px" sortingimagespacing="5px">
                            </header>
                             <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <loadingpanel imagespacing="10px">
                            </loadingpanel>
                        </styles>
                        <settingspager mode="ShowAllRecords">
                        </settingspager>
                        
                        <settingstext title="20 Maiores Redes do Mundo (* em Bilhões)" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Cod" FieldName="id" 
                                VisibleIndex="0" ReadOnly="True" Width="30px">
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Empresa" FieldName="descSuperm" 
                                VisibleIndex="1" Width="150px">
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Ano" FieldName="Ano" 
                                VisibleIndex="2" Width="30px">
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Venda em Itens Alimenticios *" FieldName="vlrVendaIA" 
                                VisibleIndex="3" Width="95px">
                                <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Nº de Lojas" FieldName="numLojas" 
                                VisibleIndex="4" Width="50px">
                                <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Venda Total *" FieldName="vlrVenda" 
                                VisibleIndex="5" Width="60px">
                                <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <settings showtitlepanel="True" 
                            verticalscrollableheight="400" />
                        <styleseditors>
                            <progressbar height="25px">
                            </progressbar>
                        </styleseditors>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                        SelectCommand="SELECT [id], [descSuperm], [Ano], [vlrVendaIA], [numLojas], [vlrVenda] FROM [tblEvolucaoInternacional] ORDER BY [id]">
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>
<p>
    <dxe:ASPxButton ID="ASPxButton1" runat="server"          
        Text="Exportar para Excel" Width="150px" Theme="DevEx">
    </dxe:ASPxButton>
    <dxwgv:ASPxGridViewExporter ID="ExporterExcel1" runat="server" 
        FileName="Ranking Internacional" GridViewID="ASPxGridView2">
    </dxwgv:ASPxGridViewExporter>
</p>
</asp:Content>

