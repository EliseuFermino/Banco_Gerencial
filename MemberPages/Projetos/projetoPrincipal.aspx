<%@ Page Title="" Language="VB" MasterPageFile="mpPrincipal.master" AutoEventWireup="false" CodeFile="projetoPrincipal.aspx.vb" Inherits="Ranking_mpProjeto" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxtc" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxw" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxrp" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxp" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            height: 12px;
        }

.dxeButtonEdit_PlasticBlue
{
    border: Solid 1px #b8b8b8;
    background-color: #FAFAFA;
    width: 170px;
}
.dxeEditArea_PlasticBlue 
{
	font-family: Tahoma;
	font-size: 9pt;
	border: 1px solid #A0A0A0;
}
.dxeButtonEditButton_PlasticBlue
{
    padding: 0px;
	background-image: url('../App_Themes/Plastic%20Blue/Editors/edtButtonEditButtonBack.gif');
    background-repeat: repeat-x;
    background-position: 50% top;
    background-color: #223672;
    border: Solid 1px #2c4182;
}
.dxeButtonEditButton_PlasticBlue, .dxeCalendarButton_PlasticBlue,
.dxeSpinIncButton_PlasticBlue, .dxeSpinDecButton_PlasticBlue,
.dxeSpinLargeIncButton_PlasticBlue, .dxeSpinLargeDecButton_PlasticBlue
{	
	vertical-align: middle;
	border: Solid 1px #CCCCCC;
	cursor: pointer;
	cursor: hand;
} 
        .style10
    {
    }
    .style9
    {
        width: 128px;
    }
    .style11
    {
        width: 163px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1" style="height: 463px">
        <tr>
            <td class="style3">
                </td>
        </tr>
        <tr>
            <td align="left" valign="top">
                <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" 
                    CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                    ImageFolder="~/App_Themes/Plastic Blue/{0}/" Height="377px" Width="924px">
                    <LoadingPanelImage Url="~/App_Themes/Plastic Blue/Web/tcLoading.gif" />
                    <ContentStyle>
                        <Border BorderWidth="0px" />
                    </ContentStyle>
                    <TabPages>
                        <dxtc:TabPage Text="Ficha do Projeto">
                            <TabImage Url="~/image/Number-1-icon.png" />
                            <ContentCollection>
                                <dxw:ContentControl runat="server">
                                    <dxrp:ASPxRoundPanel ID="RoundPanel_Ficha" runat="server" BackColor="White" 
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Height="274px" 
                                        ShowHeader="False" Width="900px">
                                        <ContentPaddings Padding="14px" />
                                        <HeaderStyle BackColor="#E0EDFF">
                                        <BorderBottom BorderColor="#AECAF0" BorderStyle="Solid" BorderWidth="1px" />
                                        </HeaderStyle>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        <HeaderContent>
                                            <BackgroundImage ImageUrl="~/App_Themes/Aqua/Web/rpHeaderBackground.gif" 
                                                Repeat="RepeatX" VerticalPosition="Top" />
                                        </HeaderContent>
                                        
                                        
                                        
                                        
                                        
                                        
                                        <PanelCollection>
                                            <dxp:PanelContent runat="server">
                                                <table class="style1">
                                                    <tr>
                                                        <td class="style4" valign="top">
                                                            <asp:Panel ID="panImagem" runat="server">
                                                                <dxe:ASPxImage ID="imgFicha" runat="server" 
                                                                    ImageUrl="~/image/notes-edit-icon.png">
                                                                </dxe:ASPxImage>
                                                                <br />
                                                            </asp:Panel>
                                                        </td>
                                                        <td align="left" valign="top">
                                                            <asp:Panel ID="panFicha" runat="server" Height="358px">
                                                                <table class="style1">
                                                                    <tr>
                                                                        <td class="style11">
                                                                            <b>Nome do Projeto : </b>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtNomeProjeto" runat="server" BackColor="#FAFAFA" 
                                                                                BorderColor="#B8B8B8" BorderStyle="Solid" BorderWidth="1px" Font-Size="Medium" 
                                                                                ForeColor="#4C61A2" Height="21px" Width="455px"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                                <table class="style1">
                                                                    <tr>
                                                                        <td align="left" class="style10" valign="top">
                                                                            Objetivo do Projeto :</td>
                                                                        <td align="left" valign="top">
                                                                            <asp:TextBox ID="txtObjetivoProjeto" runat="server" BackColor="#FAFAFA" 
                                                                                BorderColor="#B8B8B8" BorderStyle="Solid" BorderWidth="1px" Font-Size="Medium" 
                                                                                ForeColor="#4C61A2" Height="61px" TextMode="MultiLine" Width="356px"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <table class="style1">
                                                                    <tr>
                                                                        <td align="left" class="style10" valign="middle">
                                                                            Data de Inicio:</td>
                                                                        <td class="style9">
                                                                            <dxe:ASPxDateEdit ID="txtDataInicio" runat="server" 
                                                                                CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                                                ForeColor="#4C61A2" ImageFolder="~/App_Themes/Plastic Blue/{0}/" Width="110px">
                                                                                <ValidationSettings>
                                                                                    <ErrorImage Height="14px" 
                                                                                        Url="~/App_Themes/Plastic Blue/Editors/edtError.png" />
                                                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                                                    </ErrorFrameStyle>
                                                                                </ValidationSettings>
                                                                            </dxe:ASPxDateEdit>
                                                                        </td>
                                                                        <td align="left" class="style8" valign="middle">
                                                                            <b>Data de Término:</b></td>
                                                                        <td>
                                                                            <dxe:ASPxDateEdit ID="txtDataTermino" runat="server" 
                                                                                CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                                                ForeColor="#4C61A2" ImageFolder="~/App_Themes/Plastic Blue/{0}/" Width="110px">
                                                                                <ValidationSettings>
                                                                                    <ErrorImage Height="14px" 
                                                                                        Url="~/App_Themes/Plastic Blue/Editors/edtError.png" />
                                                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                                                    </ErrorFrameStyle>
                                                                                </ValidationSettings>
                                                                            </dxe:ASPxDateEdit>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <table class="style1">
                                                                    <tr>
                                                                        <td align="left" class="style10" valign="middle">
                                                                            <b>Coordenador: </b>
                                                                        </td>
                                                                        <td>
                                                                            <dxe:ASPxComboBox ID="cboCoordenador" runat="server" 
                                                                                CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                                                DataSourceID="dsFichaCoordenador" ImageFolder="~/App_Themes/Plastic Blue/{0}/" 
                                                                                TextField="CoordenadorDesc" ValueField="CoordenadorID" 
                                                                                ValueType="System.String" Width="150px">
                                                                                <ValidationSettings>
                                                                                    <ErrorImage Height="14px" 
                                                                                        Url="~/App_Themes/Plastic Blue/Editors/edtError.png" />
                                                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                                                    </ErrorFrameStyle>
                                                                                </ValidationSettings>
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <table class="style1">
                                                                    <tr>
                                                                        <td align="left" class="style10" valign="top">
                                                                            <b>Participantes :</b></td>
                                                                        <td align="left" valign="top">
                                                                            <asp:TextBox ID="txtParticipantes" runat="server" BackColor="#FAFAFA" 
                                                                                BorderColor="#B8B8B8" BorderStyle="Solid" BorderWidth="1px" Font-Size="Medium" 
                                                                                ForeColor="#4C61A2" Height="61px" TextMode="MultiLine" Width="356px"></asp:TextBox>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <table class="style1">
                                                                    <tr>
                                                                        <td align="left" class="style10" valign="middle">
                                                                            Periodicidade:</td>
                                                                        <td>
                                                                            <dxe:ASPxComboBox ID="cboPeriodicidade" runat="server" 
                                                                                CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                                                DataSourceID="dsFichaPeriodicidade" 
                                                                                ImageFolder="~/App_Themes/Plastic Blue/{0}/" TextField="PeriodicidadeDesc" 
                                                                                ValueField="PeriodicidadeID" ValueType="System.String" Width="150px">
                                                                                <ValidationSettings>
                                                                                    <ErrorImage Height="14px" 
                                                                                        Url="~/App_Themes/Plastic Blue/Editors/edtError.png" />
                                                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                                                    </ErrorFrameStyle>
                                                                                </ValidationSettings>
                                                                            </dxe:ASPxComboBox>
                                                                        </td>
                                                                        <td align="center">
                                                                            <dxe:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/image/LogoCondor.jpg">
                                                                            </dxe:ASPxImage>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                                <table class="style1">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:SqlDataSource ID="dsFichaCoordenador" runat="server" 
                                                                                ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                                                                                SelectCommand="SELECT [CoordenadorID], [CoordenadorDesc] FROM [projCadCoordenador] ORDER BY [CoordenadorDesc]">
                                                                            </asp:SqlDataSource>
                                                                        </td>
                                                                        <td>
                                                                            <asp:SqlDataSource ID="dsFichaPeriodicidade" runat="server" 
                                                                                ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                                                                                SelectCommand="SELECT [PeriodicidadeID], [PeriodicidadeDesc] FROM [tblCadPeriodicidade]">
                                                                            </asp:SqlDataSource>
                                                                        </td>
                                                                        <td>
                                                                            &nbsp;</td>
                                                                    </tr>
                                                                </table>
                                                                <br />
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </dxp:PanelContent>
                                        </PanelCollection>
                                        <Border BorderColor="#AECAF0" BorderStyle="Solid" BorderWidth="1px" />
                                    </dxrp:ASPxRoundPanel>
                                </dxw:ContentControl>
                            </ContentCollection>
                        </dxtc:TabPage>
                        <dxtc:TabPage Text="Cronograma">
                            <TabImage Url="~/image/Number-2-icon.png" />
                            <ContentCollection>
                                <dxw:ContentControl runat="server">
                                    <table class="style1" style="margin-bottom: 0px">
                                        <tr>
                                            <td align="left" class="style4" valign="top">
                                                <asp:Panel ID="panCronoImg" runat="server" Width="136px">
                                                    <dxe:ASPxImage ID="imgCrono0" runat="server" 
                                                        ImageUrl="~/image/note-edit-icon.png">
                                                    </dxe:ASPxImage>
                                                </asp:Panel>
                                            </td>
                                            <td align="left" valign="top">
                                                <asp:Panel ID="panCronoTable" runat="server" Height="293px">
                                                    <table class="style1">
                                                        <tr>
                                                            <td class="style8">
                                                                Nome do Projeto:</td>
                                                            <td align="left" valign="top">
                                                                <dxe:ASPxComboBox ID="cboProjeto" runat="server" AutoPostBack="True" 
                                                                    CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                                    DataSourceID="dsCronoProjeto" ImageFolder="~/App_Themes/Plastic Blue/{0}/" 
                                                                    TextField="ProjetoDesc" ValueField="ProjetoID" ValueType="System.String" 
                                                                    Width="201px">
                                                                    <ValidationSettings>
                                                                        <ErrorImage Height="14px" 
                                                                            Url="~/App_Themes/Plastic Blue/Editors/edtError.png" />
                                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                                        </ErrorFrameStyle>
                                                                    </ValidationSettings>
                                                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td>
                                                                <asp:SqlDataSource ID="dsCronoProjeto" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                                                                    SelectCommand="SELECT [ProjetoID], [ProjetoDesc] FROM [projProjetos]">
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <table class="style1">
                                                        <tr>
                                                            <td>
                                                                Etapas do Projeto:</td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                                                                    AutoGenerateColumns="False" 
                                                                    CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                                    DataSourceID="dsCronoEtapa" KeyFieldName="etapaID">
                                                                    <Columns>
                                                                        <dxwgv:GridViewCommandColumn ButtonType="Image" Caption="Opções" VisibleIndex="0" ShowEditButton="True" ShowNewButton="True" ShowDeleteButton="True"/>
                                                                        <dxwgv:GridViewDataTextColumn Caption="Etapa" FieldName="etapaID" 
                                                                            ReadOnly="True" VisibleIndex="1">
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                        <dxwgv:GridViewDataTextColumn Caption="Descrição da Etapa" 
                                                                            FieldName="etapaDesc" VisibleIndex="2">
                                                                        </dxwgv:GridViewDataTextColumn>
                                                                        <dxwgv:GridViewDataDateColumn Caption="Data de Inicio" FieldName="dataInicia" 
                                                                            VisibleIndex="3">
                                                                        </dxwgv:GridViewDataDateColumn>
                                                                        <dxwgv:GridViewDataDateColumn Caption="Data de Término" FieldName="dataFinal" 
                                                                            VisibleIndex="4">
                                                                        </dxwgv:GridViewDataDateColumn>
                                                                    </Columns>
                                                                    <SettingsBehavior ConfirmDelete="True" />
                                                                    <SettingsPager ShowDefaultImages="False">
                                                                        <AllButton Text="All">
                                                                        </AllButton>
                                                                        <NextPageButton Text="Next &gt;">
                                                                        </NextPageButton>
                                                                        <PrevPageButton Text="&lt; Prev">
                                                                        </PrevPageButton>
                                                                    </SettingsPager>
                                                                    <Settings ShowGroupPanel="True" />
                                                                    <Images ImageFolder="~/App_Themes/Plastic Blue/{0}/">
                                                                        <CollapsedButton Height="10px" 
                                                                            Url="~/App_Themes/Plastic Blue/GridView/gvCollapsedButton.png" />
                                                                        <ExpandedButton Height="9px" 
                                                                            Url="~/App_Themes/Plastic Blue/GridView/gvExpandedButton.png" />
                                                                        <HeaderFilter Height="15px" 
                                                                            Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilter.png" />
                                                                        <HeaderActiveFilter Height="15px" 
                                                                            Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilterActive.png" />
                                                                        <HeaderSortDown Height="11px" 
                                                                            Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortDown.png" />
                                                                        <HeaderSortUp Height="11px" 
                                                                            Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortUp.png" />
                                                                        <FilterRowButton Height="13px" />
                                                                        <CustomizationWindowClose Height="14px" />
                                                                        <PopupEditFormWindowClose Height="14px" />
                                                                        <FilterBuilderClose Height="14px" />
                                                                    </Images>
                                                                    <Styles CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
                                                                        CssPostfix="PlasticBlue">
                                                                        <Header ImageSpacing="10px" SortingImageSpacing="10px">
                                                                        </Header>
                                                                    </Styles>
                                                                    <StylesEditors>
                                                                        <ProgressBar Height="25px">
                                                                        </ProgressBar>
                                                                    </StylesEditors>
                                                                    <SettingsCommandButton>
                                                                        <EditButton Text="Alterar">
                                                                            <Image Url="~/image/note-edit-icon_16.png"/>
                                                                        </EditButton>
                                                                        <NewButton>
                                                                            <Image Url="~/image/note-add-icon_16.png"/>
                                                                        </NewButton>
                                                                        <DeleteButton>
                                                                            <Image Url="~/image/note-remove-icon_16.png"/>
                                                                        </DeleteButton>
                                                                        <CancelButton Text="Cancelar">
                                                                            <Image Url="~/image/Log-Out-icon_24.png"/>
                                                                        </CancelButton>
                                                                        <UpdateButton>
                                                                            <Image AlternateText="Atualizar" Url="~/image/note-accept-icon_24.png"/>
                                                                        </UpdateButton>
                                                                    </SettingsCommandButton>
                                                                </dxwgv:ASPxGridView>
                                                                <asp:SqlDataSource ID="dsCronoEtapa" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                                                                    DeleteCommand="DELETE FROM [projEtapas] WHERE [etapaID] = @etapaID AND [projetoID] = @projetoID" 
                                                                    InsertCommand="INSERT INTO [projEtapas] ([etapaID], [projetoID], [etapaDesc], [dataInicia], [dataFinal]) VALUES (@etapaID, @projetoID, @etapaDesc, @dataInicia, @dataFinal)" 
                                                                    SelectCommand="SELECT [etapaID], [projetoID], [etapaDesc], [dataInicia], [dataFinal] FROM [projEtapas] WHERE ([projetoID] = @projetoID)" 
                                                                    UpdateCommand="UPDATE [projEtapas] SET [etapaDesc] = @etapaDesc, [dataInicia] = @dataInicia, [dataFinal] = @dataFinal WHERE [etapaID] = @etapaID AND [projetoID] = @projetoID">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="cboProjeto" Name="projetoID" 
                                                                            PropertyName="Value" Type="Int16" />
                                                                    </SelectParameters>
                                                                    <DeleteParameters>
                                                                        <asp:Parameter Name="etapaID" Type="Int16" />
                                                                        <asp:Parameter Name="projetoID" Type="Int16" />
                                                                    </DeleteParameters>
                                                                    <InsertParameters>
                                                                        <asp:Parameter Name="etapaID" Type="Int16" />
                                                                        <asp:Parameter Name="projetoID" Type="Int16" />
                                                                        <asp:Parameter Name="etapaDesc" Type="String" />
                                                                        <asp:Parameter Name="dataInicia" Type="DateTime" />
                                                                        <asp:Parameter Name="dataFinal" Type="DateTime" />
                                                                    </InsertParameters>
                                                                    <UpdateParameters>
                                                                        <asp:Parameter Name="etapaDesc" Type="String" />
                                                                        <asp:Parameter Name="dataInicia" Type="DateTime" />
                                                                        <asp:Parameter Name="dataFinal" Type="DateTime" />
                                                                        <asp:Parameter Name="etapaID" Type="Int16" />
                                                                        <asp:Parameter Name="projetoID" Type="Int16" />
                                                                    </UpdateParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <br />
                                                    <br />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </dxw:ContentControl>
                            </ContentCollection>
                        </dxtc:TabPage>
                        <dxtc:TabPage Text="Memória">
                            <TabImage Url="~/image/Number-3-icon.png" />
                            <ContentCollection>
                                <dxw:ContentControl runat="server">
                                    <table class="style1">
                                        <tr>
                                            <td align="center" class="style10" valign="top">
                                                <asp:Panel ID="panMemoriaImg" runat="server" Width="161px">
                                                    <dxe:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/image/Notes-icon.png">
                                                    </dxe:ASPxImage>
                                                </asp:Panel>
                                            </td>
                                            <td align="left" rowspan="2" valign="top">
                                                <asp:Panel ID="panMemoriaTable" runat="server">
                                                    <table class="style1">
                                                        <tr>
                                                            <td align="left" class="style5" valign="middle">
                                                                Opções:
                                                            </td>
                                                            <td class="style6">
                                                                <dxe:ASPxRadioButton ID="ASPxRadioButton1" runat="server" 
                                                                    CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                                    GroupName="groupOpcoes" Layout="Flow" Text="Novo" TextSpacing="2px">
                                                                </dxe:ASPxRadioButton>
                                                                &nbsp;
                                                                <dxe:ASPxRadioButton ID="ASPxRadioButton2" runat="server" 
                                                                    CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                                    GroupName="groupOpcoes" Layout="Flow" Text="Buscar" TextSpacing="2px">
                                                                </dxe:ASPxRadioButton>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <table class="style1">
                                                        <tr>
                                                            <td class="style9">
                                                                Nome do Projeto:</td>
                                                            <td>
                                                                <dxe:ASPxComboBox ID="cboMemoProjeto" runat="server" AutoPostBack="True" 
                                                                    CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                                    DataSourceID="dsMemoProjeto" ImageFolder="~/App_Themes/Plastic Blue/{0}/" 
                                                                    TextField="ProjetoDesc" ValueField="ProjetoID" ValueType="System.String" 
                                                                    Width="200px">
                                                                    <ValidationSettings>
                                                                        <ErrorImage Height="14px" 
                                                                            Url="~/App_Themes/Plastic Blue/Editors/edtError.png" />
                                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                                        </ErrorFrameStyle>
                                                                    </ValidationSettings>
                                                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td>
                                                                <asp:SqlDataSource ID="dsMemoProjeto" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                                                                    SelectCommand="SELECT [ProjetoID], [ProjetoDesc] FROM [projProjetos]">
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <table class="style1">
                                                        <tr>
                                                            <td class="style8">
                                                                Objetivo do Projeto:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtMemoParticipantes" runat="server" BackColor="#FAFAFA" 
                                                                    BorderColor="#B8B8B8" BorderStyle="Solid" BorderWidth="1px" Font-Size="Medium" 
                                                                    ForeColor="#4C61A2" Height="61px" TextMode="MultiLine" Width="356px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <table class="style1">
                                                        <tr>
                                                            <td class="style8">
                                                                Decisões:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtMemoDecisoes" runat="server" BackColor="#FAFAFA" 
                                                                    BorderColor="#B8B8B8" BorderStyle="Solid" BorderWidth="1px" Font-Size="Medium" 
                                                                    ForeColor="#4C61A2" Height="61px" TextMode="MultiLine" Width="356px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <table class="style1">
                                                        <tr>
                                                            <td class="style8">
                                                                Objetivo do Projeto:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtMemoParticipantes0" runat="server" BackColor="#FAFAFA" 
                                                                    BorderColor="#B8B8B8" BorderStyle="Solid" BorderWidth="1px" Font-Size="Medium" 
                                                                    ForeColor="#4C61A2" Height="61px" TextMode="MultiLine" Width="356px"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <br />
                                                    <br />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="style4" valign="top">
                                                <dxe:ASPxListBox ID="ASPxListBox2" runat="server" 
                                                    CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                    Height="200px" ImageFolder="~/App_Themes/Plastic Blue/{0}/" Width="111px">
                                                    <ValidationSettings>
                                                        <ErrorImage Url="~/App_Themes/Plastic Blue/Editors/edtError.png" />
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dxe:ASPxListBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="style4" valign="top">
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </dxw:ContentControl>
                            </ContentCollection>
                        </dxtc:TabPage>
                        <dxtc:TabPage Text="Acompanhamento">
                            <TabImage Url="~/image/Number-4-icon.png" />
                            <ContentCollection>
                                <dxw:ContentControl runat="server">
                                    <table class="style1">
                                        <tr>
                                            <td align="left" class="style11" valign="middle">
                                                <asp:Panel ID="panAcompImg" runat="server">
                                                    <dxe:ASPxImage ID="imgAcomp" runat="server" 
                                                        ImageUrl="~/image/keynote-on-icon_128.png">
                                                    </dxe:ASPxImage>
                                                </asp:Panel>
                                            </td>
                                            <td align="left" valign="top">
                                                <asp:Panel ID="panMemoriaTable0" runat="server" Height="150px">
                                                    <table class="style1">
                                                        <tr>
                                                            <td class="style9">
                                                                Nome do Projeto:</td>
                                                            <td>
                                                                <dxe:ASPxComboBox ID="cboAcompProjeto" runat="server" AutoPostBack="True" 
                                                                    CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                                    DataSourceID="dsAcompProjeto" ImageFolder="~/App_Themes/Plastic Blue/{0}/" 
                                                                    TextField="ProjetoDesc" ValueField="ProjetoID" ValueType="System.String" 
                                                                    Width="200px">
                                                                    <ValidationSettings>
                                                                        <ErrorImage Height="14px" 
                                                                            Url="~/App_Themes/Plastic Blue/Editors/edtError.png" />
                                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                                        </ErrorFrameStyle>
                                                                    </ValidationSettings>
                                                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td>
                                                                <asp:SqlDataSource ID="dsAcompProjeto" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                                                                    SelectCommand="SELECT [ProjetoID], [ProjetoDesc] FROM [projProjetos]">
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <table class="style1">
                                                        <tr>
                                                            <td class="style9">
                                                                Nome do Projeto:</td>
                                                            <td>
                                                                <dxe:ASPxComboBox ID="cboAcompEtapa" runat="server" AutoPostBack="True" 
                                                                    CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                                    DataSourceID="dsAcompEtapa" ImageFolder="~/App_Themes/Plastic Blue/{0}/" 
                                                                    TextField="etapaDesc" ValueField="etapaID" ValueType="System.String" 
                                                                    Width="320px">
                                                                    <ValidationSettings>
                                                                        <ErrorImage Height="14px" 
                                                                            Url="~/App_Themes/Plastic Blue/Editors/edtError.png" />
                                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                                        </ErrorFrameStyle>
                                                                    </ValidationSettings>
                                                                </dxe:ASPxComboBox>
                                                            </td>
                                                            <td>
                                                                <asp:SqlDataSource ID="dsAcompEtapa" runat="server" 
                                                                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                                                                    SelectCommand="SELECT [etapaID], [etapaDesc] FROM [projEtapas] WHERE ([projetoID] = @projetoID) ORDER BY [etapaID]">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="cboAcompProjeto" Name="projetoID" 
                                                                            PropertyName="Value" Type="Int16" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <br />
                                                    <table class="style1">
                                                        <tr>
                                                            <td>
                                                                Acompanhamento das Etapas:</td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="style10" colspan="2" valign="top">
                                                <asp:Panel ID="panAcompTable" runat="server" BorderColor="#D2F0FF" 
                                                    BorderStyle="Solid" BorderWidth="1px" Height="400px" ScrollBars="Vertical">
                                                    <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" 
                                                        AutoGenerateColumns="False" 
                                                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                        CssPostfix="Office2003_Blue" DataSourceID="dsAcompTarefas" 
                                                        KeyFieldName="EtapaID">
                                                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                                        <Columns>
                                                            <dxwgv:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" ShowEditButton="True" ShowNewButton="True" ShowDeleteButton="True"/>
                                                            <dxwgv:GridViewDataTextColumn FieldName="EtapaID" ReadOnly="True" 
                                                                VisibleIndex="1">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn FieldName="TarefaID" ReadOnly="True" 
                                                                VisibleIndex="2">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn FieldName="TarefaDesc" VisibleIndex="3">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn FieldName="Oque" VisibleIndex="4">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn FieldName="Quem" VisibleIndex="5">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn FieldName="Porque" Visible="False" 
                                                                VisibleIndex="6">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataDateColumn FieldName="Quando" VisibleIndex="6">
                                                            </dxwgv:GridViewDataDateColumn>
                                                            <dxwgv:GridViewDataTextColumn FieldName="Onde" VisibleIndex="7">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn FieldName="Como" Visible="False" VisibleIndex="9">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataTextColumn FieldName="Quanto" Visible="False" 
                                                                VisibleIndex="8">
                                                            </dxwgv:GridViewDataTextColumn>
                                                            <dxwgv:GridViewDataCheckColumn FieldName="Concluida" VisibleIndex="8">
                                                            </dxwgv:GridViewDataCheckColumn>
                                                            <dxwgv:GridViewDataDateColumn FieldName="DataConclusao" VisibleIndex="9">
                                                            </dxwgv:GridViewDataDateColumn>
                                                        </Columns>
                                                        <SettingsPager Visible="False">
                                                            <AllButton Text="All">
                                                            </AllButton>
                                                            <NextPageButton Text="Next &gt;">
                                                            </NextPageButton>
                                                            <PrevPageButton Text="&lt; Prev">
                                                            </PrevPageButton>
                                                        </SettingsPager>
                                                        <SettingsEditing Mode="EditForm" />
                                                        <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                                            <CollapsedButton Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" />
                                                            <ExpandedButton Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" />
                                                            <DetailCollapsedButton Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" />
                                                            <DetailExpandedButton Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" />
                                                        </Images>
                                                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                            CssPostfix="Office2003_Blue">
                                                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                            </Header>
                                                            <LoadingPanel ImageSpacing="10px">
                                                            </LoadingPanel>
                                                        </Styles>
                                                        <SettingsCommandButton>
                                                            <EditButton>
                                                                <Image Url="~/image/note-edit-icon_16.png"/>
                                                            </EditButton>
                                                            <NewButton>
                                                                <Image Url="~/image/note-add-icon_16.png"/>
                                                            </NewButton>
                                                            <DeleteButton>
                                                                <Image Url="~/image/note-remove-icon_16.png"/>
                                                            </DeleteButton>
                                                            <CancelButton>
                                                                <Image Url="~/image/Log-Out-icon_24.png"/>
                                                            </CancelButton>
                                                            <UpdateButton>
                                                                <Image Url="~/image/note-accept-icon_24.png"/>
                                                            </UpdateButton>
                                                        </SettingsCommandButton>
                                                    </dxwgv:ASPxGridView>
                                                    <asp:SqlDataSource ID="dsAcompTarefas" runat="server" 
                                                        ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                                                        DeleteCommand="DELETE FROM [projTarefas] WHERE [TarefaID] = @TarefaID AND [EtapaID] = @EtapaID" 
                                                        InsertCommand="INSERT INTO [projTarefas] ([TarefaID], [EtapaID], [TarefaDesc], [Oque], [Quem], [Porque], [Quando], [Onde], [Como], [Quanto], [Concluida], [DataConclusao]) VALUES (@TarefaID, @EtapaID, @TarefaDesc, @Oque, @Quem, @Porque, @Quando, @Onde, @Como, @Quanto, @Concluida, @DataConclusao)" 
                                                        SelectCommand="SELECT [TarefaID], [EtapaID], [TarefaDesc], [Oque], [Quem], [Porque], [Quando], [Onde], [Como], [Quanto], [Concluida], [DataConclusao] FROM [projTarefas] WHERE ([EtapaID] = @EtapaID) ORDER BY [TarefaID]" 
                                                        UpdateCommand="UPDATE [projTarefas] SET [TarefaDesc] = @TarefaDesc, [Oque] = @Oque, [Quem] = @Quem, [Porque] = @Porque, [Quando] = @Quando, [Onde] = @Onde, [Como] = @Como, [Quanto] = @Quanto, [Concluida] = @Concluida, [DataConclusao] = @DataConclusao WHERE [TarefaID] = @TarefaID AND [EtapaID] = @EtapaID">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="cboAcompEtapa" Name="EtapaID" 
                                                                PropertyName="Value" Type="Int16" />
                                                        </SelectParameters>
                                                        <DeleteParameters>
                                                            <asp:Parameter Name="TarefaID" Type="Int16" />
                                                            <asp:Parameter Name="EtapaID" Type="Int16" />
                                                        </DeleteParameters>
                                                        <InsertParameters>
                                                            <asp:Parameter Name="TarefaID" Type="Int16" />
                                                            <asp:Parameter Name="EtapaID" Type="Int16" />
                                                            <asp:Parameter Name="TarefaDesc" Type="String" />
                                                            <asp:Parameter Name="Oque" Type="String" />
                                                            <asp:Parameter Name="Quem" Type="String" />
                                                            <asp:Parameter Name="Porque" Type="String" />
                                                            <asp:Parameter Name="Quando" Type="DateTime" />
                                                            <asp:Parameter Name="Onde" Type="String" />
                                                            <asp:Parameter Name="Como" Type="String" />
                                                            <asp:Parameter Name="Quanto" Type="String" />
                                                            <asp:Parameter Name="Concluida" Type="Boolean" />
                                                            <asp:Parameter Name="DataConclusao" Type="DateTime" />
                                                        </InsertParameters>
                                                        <UpdateParameters>
                                                            <asp:Parameter Name="TarefaDesc" Type="String" />
                                                            <asp:Parameter Name="Oque" Type="String" />
                                                            <asp:Parameter Name="Quem" Type="String" />
                                                            <asp:Parameter Name="Porque" Type="String" />
                                                            <asp:Parameter Name="Quando" Type="DateTime" />
                                                            <asp:Parameter Name="Onde" Type="String" />
                                                            <asp:Parameter Name="Como" Type="String" />
                                                            <asp:Parameter Name="Quanto" Type="String" />
                                                            <asp:Parameter Name="Concluida" Type="Boolean" />
                                                            <asp:Parameter Name="DataConclusao" Type="DateTime" />
                                                            <asp:Parameter Name="TarefaID" Type="Int16" />
                                                            <asp:Parameter Name="EtapaID" Type="Int16" />
                                                        </UpdateParameters>
                                                    </asp:SqlDataSource>
                                                </asp:Panel>
                                            </td>
                                        </tr>
                                    </table>
                                </dxw:ContentControl>
                            </ContentCollection>
                        </dxtc:TabPage>
                    </TabPages>
                    <Paddings PaddingLeft="5px" PaddingRight="5px" PaddingTop="5px" />
                </dxtc:ASPxPageControl>
            </td>
        </tr>
    </table>
</asp:Content>

