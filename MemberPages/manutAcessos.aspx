<%@ Page Title="" Language="VB" MasterPageFile="Site.master" AutoEventWireup="false" CodeFile="manutAcessos.aspx.vb" Inherits="Ranking_MetaDeVenda" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css" >
              
        #divDadosTodos {
            clear: both;
            float:left;
            margin-left: 10px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divDadosTodos">
       <table class="style1">
        <tr>
            <td>
                <asp:Label ID="lblInfo" Text="Selecione: " Visible="false" runat="server"></asp:Label> &nbsp <asp:DropDownList ID="cboLista" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Setor" DataValueField="Setor" Visible="false" ></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerContSQL1ConnectionString %>" SelectCommand="SELECT [Setor] FROM [Usuario].[vListaSetor] ORDER BY [Setor]"></asp:SqlDataSource>
            </td>

        </tr>
        <tr>
            <td>
                <dx:ASPxGridView ID="gridMaster" runat="server" AutoGenerateColumns="False" 
                    ClientInstanceName="master" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                    CssPostfix="Office2003_Blue" 
                    KeyFieldName="idPrograma" Theme="SoftOrange" EnableTheming="True">
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px" Font-Size="Small">
                        </Header>
                        <GroupRow Font-Size="Small">
                        </GroupRow>
                        <Cell Font-Size="Small">
                        </Cell>
                        <GroupPanel Font-Size="Small">
                        </GroupPanel>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <GroupSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Acessos" 
                            SummaryType="Count" />
                    </GroupSummary>
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Acessos" 
                            ShowInGroupFooterColumn="Acesso" SummaryType="Count" />
                    </TotalSummary>
                    <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                        <CollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <ExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" 
                            Width="11px" />
                        <DetailCollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <DetailExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" 
                            Width="11px" />
                        <FilterRowButton Height="13px" Width="13px" />
                    </Images>
                    <SettingsText Title="Total de acesso por usuário." 
                        GroupPanel="Arraste aqui um cabeçalho de uma coluna abaixo para agrupar." 
                        PopupEditFormCaption="Atualizando informações..." />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Acessos" VisibleIndex="0" 
                            ReadOnly="True" Caption="Acesso">
                            <EditFormSettings Visible="False" />
                            <HeaderStyle HorizontalAlign="Center" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DescPrograma" 
                            VisibleIndex="1" Caption="Programa">
                            <HeaderStyle HorizontalAlign="Center" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="2" 
                            GroupIndex="3" SortIndex="3" SortOrder="Ascending">
                            <HeaderStyle HorizontalAlign="Center" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Dia" VisibleIndex="3" GroupIndex="1" 
                            SortIndex="1" SortOrder="Descending">
                            <PropertiesDateEdit EncodeHtml="False">
                            </PropertiesDateEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="Hora" VisibleIndex="4" SortIndex="4" 
                            SortOrder="Descending">
                            <PropertiesDateEdit DisplayFormatString="{0:HH:mm:ss}" EncodeHtml="False">
                            </PropertiesDateEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="Ano" VisibleIndex="5" ReadOnly="True">
                            <HeaderStyle HorizontalAlign="Center" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Mes" 
                            VisibleIndex="6" ReadOnly="True" Caption="Mês" GroupIndex="0" 
                            SortIndex="0" SortOrder="Descending">
                            <HeaderStyle HorizontalAlign="Center" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Setor" FieldName="Setor" GroupIndex="2" 
                            SortIndex="2" SortOrder="Ascending" ToolTip="Setor do Usuário" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFooter="True" ShowTitlePanel="True" ShowGroupPanel="True" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <SettingsDetail ShowDetailRow="True" ShowDetailButtons="False" />
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsMaster" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerContSQL1ConnectionString %>"          
                    
                    SelectCommand="Estatistica.uspBuscarAcessos" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsMasterPrevencao" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerContSQL1ConnectionString %>"          
                    
                    SelectCommand="SELECT a.Acessos, p.DescPrograma, b.Usuario, a.Dia, a.Hora, a.Ano, a.Mes, b.Setor FROM Estatistica.tblProgramaEstatistica AS a INNER JOIN Estatistica.tblIP AS b ON a.IP = b.IP INNER JOIN Estatistica.tblCadPrograma AS p ON a.idPrograma = p.idPrograma WHERE Ano>=2018" >      

                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </div>

</asp:Content>

