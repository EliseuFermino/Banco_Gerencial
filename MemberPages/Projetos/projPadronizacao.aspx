<%@ Page Title="Arquivos - Projeto" Language="VB" MasterPageFile="mpPlanejamento.master" AutoEventWireup="false" CodeFile="projPadronizacao.aspx.vb" Inherits="Ranking_projProcessoAtual" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>

<%@ Register src="Controles/wuc_cboProjeto_Subprojeto.ascx" tagname="wuc_cboProjeto_Subprojeto" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <table class="style1">
            <tr>
                <td>
                                <uc1:wuc_cboProjeto_Subprojeto ID="cboAcompProjeto" runat="server" />
                            </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <table class="style1">
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                        AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue" DataSourceID="SqlDataSource1" Width="750px" Theme="DevEx">
                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue">
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <AlternatingRow BackColor="#FFFFE8">
                            </AlternatingRow>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager Mode="ShowAllRecords">
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
                        <SettingsText EmptyDataRow="Não há nenhum arquivo disponivel para este projeto." 
                            GroupPanel="Arraste um cabeçalho de coluna abaixo aqui para agrupar" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="NomeArquivo" VisibleIndex="0" 
                                Width="400px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataHyperLinkColumn Caption="link" FieldName="linkFile" 
                                VisibleIndex="1" Width="100px">
                                <PropertiesHyperLinkEdit Text="Arquivo">
                                </PropertiesHyperLinkEdit>
                                <CellStyle ForeColor="Blue" Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataHyperLinkColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Nome" FieldName="Nome" 
                                ToolTip="Nome do colaborador que postou o arquivo." VisibleIndex="2" 
                                Width="150px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Tipo" FieldName="Tipo" VisibleIndex="3">
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                            ShowGroupPanel="True" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" 
                        
                        
                        
                        
                        
                        SelectCommand="SELECT projPadronizacao.linkFile, projPadronizacao.NomeArquivo, projPadronizacao.Nome, tblCadPadronizacao.descPadrRed AS Tipo FROM projPadronizacao INNER JOIN tblCadPadronizacao ON projPadronizacao.tipo = tblCadPadronizacao.idPadr WHERE (projPadronizacao.ProjetoID = @ProjetoID) OR (projPadronizacao.ProjetoID = 999) ORDER BY projPadronizacao.idFile">
                        <SelectParameters>
                            <asp:SessionParameter Name="ProjetoID" SessionField="idProjeto" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="width: 439px">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </p>
</asp:Content>

