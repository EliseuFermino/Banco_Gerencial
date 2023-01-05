<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="MetaDeVendaPorFilial.aspx.vb" Inherits="MemberPages_Vendas_MetaDeVendaPorFilial" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="../../Controles/DescricaoAtualizaro.ascx" tagname="DescricaoAtualizaro" tagprefix="uc2" %>

<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
        <table >
        <tr>
            <td>
               
                        <table>
                            <tr>
                                <td>                                
                                    <uc1:wucAno ID="cboAno" runat="server" />                                
                                </td>
                                <td >
                                    <uc3:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                                </td>
                                <td>
                                    <div id="divBotaoAtualizar" class="app_btnAtualizar_margem-left_10 " >
                                        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                                            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
                                        </dx:ASPxButton>
                                    </div>
                                </td>
                                <td >
                                    <div style="margin-left:10px">
                                    </div>
                                   
                                </td>
                            </tr>
                        </table>
                             
                    <dxwgv:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando" EnableHierarchyRecreation="false" >
            <PanelCollection>
                <dxwgv:PanelContent>


                        <table cellspacing="1" class="style4">
                            <tr>
                                <td style="margin-left: 40px">
                                    <dxwgv:ASPxGridView ID="gridMaster" runat="server" AutoGenerateColumns="False" 
                                        ClientInstanceName="master" 
                                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                        CssPostfix="Office2003_Blue" DataSourceID="dsMaster" KeyFieldName="Mes" 
                                        Width="500px" Theme="DevEx">
                                        <SettingsBehavior AllowFocusedRow="True" />
                                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                            CssPostfix="Office2003_Blue">
                                            <Header ImageSpacing="5px" SortingImageSpacing="5px" Font-Bold="False" HorizontalAlign="Center">
                                            </Header>
                                            <AlternatingRow BackColor="#F0F0F0">
                                            </AlternatingRow>
                                            <Footer BackColor="#DBDBDB">
                                            </Footer>
                                            <LoadingPanel ImageSpacing="10px">
                                            </LoadingPanel>
                                            <TitlePanel Font-Size="Medium">
                                            </TitlePanel>
                                        </Styles>
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <TotalSummary>
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" 
                                                ShowInGroupFooterColumn="Original" SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                                ShowInGroupFooterColumn="Revista" SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                                                ShowInGroupFooterColumn="Realizado" SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="DifRevOri" 
                                                ShowInGroupFooterColumn="Dif. " SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" ShowInColumn="Dif. " 
                                                SummaryType="Custom" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOri" SummaryType="Custom" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRev" SummaryType="Custom" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAA" SummaryType="Custom" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDifRea" SummaryType="Sum" />
                                        </TotalSummary>
                                        <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                            <FilterRowButton Height="13px" Width="13px" />
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
                                        </Images>
                                        <SettingsText Title="Meta de Vendas 2011 - Empresa" />
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="Mês" FieldName="Mes" 
                                                ToolTip="Mês da Venda da Empresa" VisibleIndex="0" Width="15px">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Center">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="DescMes" 
                                                ToolTip="Descrição do mês" VisibleIndex="1" Width="80px">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </FooterCellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewBandColumn Caption="Venda Real" VisibleIndex="5">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="Realizado AA" FieldName="vlrRealAA" ToolTip="Realizado do Ano Anterior. Venda vem do BDT" VisibleIndex="0" Width="90px" Name="vlrReaAA">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                        </PropertiesTextEdit>
                                                        <CellStyle ForeColor="#996633">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True" ForeColor="#996633">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" ReadOnly="True" ToolTip="Venda Realizada da Empresa. Venda vem do BDT" VisibleIndex="1" Width="90px" Name="vlrRea">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Diferença" FieldName="vlrDifRea" ToolTip="Diferença de vendas entre ano atual e ano anterior" VisibleIndex="2" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                            </dxwgv:GridViewBandColumn>
                                            <dxwgv:GridViewBandColumn Caption="Atingimento" VisibleIndex="7">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="% Ori." FieldName="percOri" ToolTip="% de atingimento. Realizado sobre Original" VisibleIndex="0" Width="40px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Font-Bold="False">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="% Rev." FieldName="percRev" ToolTip="% de atingimento. Realizado sobre Revista" VisibleIndex="1" Width="40px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Font-Bold="False">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="% AA" FieldName="percAA" ToolTip="Percentual de Crescimento sobre o Ano Anterior" VisibleIndex="2" Width="40px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle Font-Bold="False">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                            </dxwgv:GridViewBandColumn>
                                            <dxwgv:GridViewBandColumn Caption="Meta" VisibleIndex="2" Name="bandMeta">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="Original" FieldName="vlrOri" ReadOnly="True" ToolTip="Meta de Venda Original da Empresa" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#FF6600">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True" ForeColor="#FF6600">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Revista" FieldName="vlrRev" ReadOnly="True" ToolTip="Meta de Venda Revisada da Empresa" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True" ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Diferença" FieldName="DifRevOri" ToolTip="Diferença entre Revista e Original." VisibleIndex="2" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                            </dxwgv:GridViewBandColumn>
                                        </Columns>
                                        <Settings ShowFooter="True" ShowTitlePanel="True" />
                                        <StylesEditors>
                                            <ProgressBar Height="25px">
                                            </ProgressBar>
                                        </StylesEditors>
                                        <SettingsDetail ShowDetailRow="True" ShowDetailButtons="False" />
                                    </dxwgv:ASPxGridView>
                                    <asp:SqlDataSource ID="dsMaster" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" 
                                        SelectCommand="Analises.uspBuscarMetaDeVendaPorFilial" 
                                        SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                            <asp:SessionParameter Name="Ano" SessionField="sAno" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>

                </dxwgv:PanelContent>
            </PanelCollection>
        </dxwgv:ASPxCallbackPanel>
                        
                        <br />
                  
                <br />
            </td>
        </tr>
    </table>

</asp:Content>

