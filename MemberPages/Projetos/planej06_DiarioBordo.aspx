<%@ Page Title="Ata - Projeto" Language="VB" MasterPageFile="~/MemberPages/Projetos/mpPlanejamento.master" AutoEventWireup="false" CodeFile="planej06_DiarioBordo.aspx.vb" Inherits="Ranking_planej06_DiarioBordo" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxpg" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxm" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxpc" %>





<%@ Register src="Controles/wuc_cboProjeto_Subprojeto.ascx" tagname="wuc_cboProjeto_Subprojeto" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script language ="javascript" type ="text/javascript">
        function OnGridFocusedRowChanged() {
            gridView.GetRowValues(gridView.GetFocusedRowIndex(), 'Quem;PlanoAcaoID', OnGetRowValues);
        }

        function OnGetRowValues(values) {            
            txtPlanoAcaoID.SetText(values[1]);       
        }
    </script>
    
    <table cellspacing="1" class="style1">
    <tr>
        <td style="width: 469px">
                    <asp:Panel ID="panMemoriaTable" runat="server" BorderColor="#C4DDFA" 
                        BorderStyle="Solid" BorderWidth="1px" Height="557px" 
                BackColor="White" Width="466px">
                        <table class="style1">
                            <tr>
                                <td class="style9" style="font-weight: bold; color: #4F64A6; padding-top: 4px;" colspan="6">
                                    <uc1:wuc_cboProjeto_Subprojeto ID="cboProjeto" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style9" 
                                    style="font-weight: bold; width: 82px; padding-top: 4px; color: #4F64A6;">
                                    Atas:</td>
                                <td colspan="2" style="padding-top: 4px">
                                    <dxe:ASPxComboBox ID="cboList" runat="server" AutoPostBack="True" 
                                        TextField="ataDia" 
                                        ToolTip="Exibe todos os diários de bordo para este projeto. Você de selecionar uma 'Etapa' primeiro." 
                                        ValueField="ataID" Width="140px"                                          
                                         SettingsLoadingPanel-Text="" ShowShadow="False" Theme="PlasticBlue" DataSourceID="dsAta" EnableTheming="True">
                                        
                                        <Columns>
                                            <dxe:ListBoxColumn Caption="Nº" FieldName="ataID" Width="30px" />
                                            <dxe:ListBoxColumn Caption="Dia" FieldName="ataDia" Name="Dia" Width="70px" />
                                            <dxe:ListBoxColumn Caption="Hora" FieldName="ataHora" Width="60px" />
                                            <dxe:ListBoxColumn Caption="Objetivo desta Reunião" FieldName="ataObjetivos" 
                                                Width="400px" />
                                        </Columns>
                                        <ValidationSettings>
                                            <ErrorImage Height="14px" Url="~/App_Themes/Aqua/Editors/edtError.png" 
                                                Width="14px" />
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dxe:ASPxComboBox>
                                </td>
                                <td align="center" style="padding-top: 4px">
                                    <asp:SqlDataSource ID="dsAta" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="BuscarAtas" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="idProjeto" SessionField="idProjeto" Type="Int16" />
                                            <asp:SessionParameter Name="Tipo" SessionField="idTipo" Type="Byte" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td align="center" style="padding-top: 4px">
                                    &nbsp;</td>
                                <td align="center" style="padding-top: 4px">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style9" 
                                    
                                    style="font-weight: bold; color: #4F64A6; width: 82px; padding-top: 4px; height: 26px;">
                                    <b>Dia:</b></td>
                                <td style="padding-top: 4px; height: 26px;">
                                    <dxe:ASPxDateEdit ID="txtDia" runat="server"                                         
                                         Width="110px" 
                                        Enabled="False" Theme="PlasticBlue">
                                        <CalendarProperties ClearButtonText="Limpar" TodayButtonText="Hoje">
                                        </CalendarProperties>
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td style="padding-top: 4px; height: 26px; width: 62px;">
                                    <asp:Label ID="lbl_SubProjetoID" runat="server" style="color: #FFFFFF" 
                                        ForeColor="Blue">lbl_SubProjetoID</asp:Label>
                                </td>
                                <td style="padding-top: 4px; height: 26px;">
                                    <asp:Label ID="lbl_EtapaID" runat="server" style="color: #FFFFFF" 
                                        ForeColor="Black"></asp:Label>
                                </td>
                                <td style="padding-top: 4px; height: 26px;" colspan="2">
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <table class="style1" style="width: 75%">
                            <tr>
                                <td class="style8" style="font-weight: bold; width: 103px; color: #4F64A6;">
                                    Participantes:</td>
                                <td style="width: 406px">
                                    <asp:TextBox ID="txtMemoParticipantes" runat="server" BackColor="#FAFAFA" 
                                        BorderColor="#C4DDFA" BorderStyle="Solid" BorderWidth="1px" Font-Size="Medium" 
                                        ForeColor="#4C61A2" Height="61px" TextMode="MultiLine" Width="358px" 
                                        Enabled="False" MaxLength="500"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8" style="font-weight: bold; width: 103px; color: #4F64A6;">
                                    Objetivo desta Reunião:</td>
                                <td style="width: 406px">
                                    <asp:TextBox ID="txtMemoObjetivos" runat="server" BackColor="#FAFAFA" 
                                        BorderColor="#C4DDFA" BorderStyle="Solid" BorderWidth="1px" Enabled="False" 
                                        Font-Size="Medium" ForeColor="#4C61A2" Height="98px" MaxLength="500" 
                                        TextMode="MultiLine" Width="358px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8" style="font-weight: bold; width: 103px; color: #4F64A6;">
                                    Discussão:</td>
                                <td style="width: 406px">
                                    <asp:TextBox ID="txtMemoDiscussao" runat="server" BackColor="#FAFAFA" 
                                        BorderColor="#C4DDFA" BorderStyle="Solid" BorderWidth="1px" Font-Size="Medium" 
                                        ForeColor="#4C61A2" Height="165px" TextMode="MultiLine" Width="357px" 
                                        Enabled="False" MaxLength="500"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table cellpadding="0" cellspacing="0" class="style1">
                            <tr>
                                <td style="height: 23px">
                                    </td>
                                <td style="height: 23px">
                                    <dxe:ASPxButton ID="btnNovo" runat="server" 
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                        ImageSpacing="5px" Text="Novo " Width="70px">
                                    </dxe:ASPxButton>
                                </td>
                                <td>
                                    <dxe:ASPxButton ID="btnAlterar" runat="server" 
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                        Enabled="False" ImageSpacing="5px" Text="Alterar" Width="70px" 
                                        style="height: 20px">
                                    </dxe:ASPxButton>
                                </td>
                                <td>
                                    <dxe:ASPxButton ID="btnCancelar" runat="server" 
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                        Enabled="False" Text="Cancelar" Width="70px">
                                    </dxe:ASPxButton>
                                </td>
                                <td style="height: 23px">
                                    <dxe:ASPxButton ID="btnSalvar" runat="server" 
                                        CssFilePath="~/App_Themes/Youthful/{0}/styles.css" CssPostfix="Youthful" 
                                        Enabled="False" Text="Salvar" Width="70px">
                                    </dxe:ASPxButton>
                                </td>
                                <td style="width: 90px">
                                    <dxe:ASPxButton ID="btnExcluir" runat="server" 
                                        CssFilePath="~/App_Themes/Red Wine/{0}/styles.css" CssPostfix="RedWine" 
                                        Enabled="False" Text="Excluir" Width="70px">
                                    </dxe:ASPxButton>
                                </td>
                                <td style="height: 23px">
                                    <dxe:ASPxTextBox ID="txtAtaID" runat="server" Width="30px" ForeColor="White">
                                        <Border BorderColor="White" BorderStyle="Solid" BorderWidth="1px" />
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="height: 23px">
                                    </td>
                            </tr>
                        </table>
                        <table cellspacing="1" class="style1">
                            <tr>
                                <td style="width: 6px">
                                    <asp:SqlDataSource ID="dsMemorial" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" 
                                        SelectCommand="SELECT AtaID, CONVERT (char, ataDia, 103) AS ataDia, CONVERT (char, ataHora, 108) AS ataHora, ataObjetivos  FROM projAta WHERE (ProjetoID = @ProjetoID) AND (SubProjetoID IS NULL) ORDER BY CAST(ataDia AS datetime) DESC">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="ProjetoID" SessionField="sPROJETO" Type="Int16" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    <dxe:ASPxButton ID="btnEnviarPlanoAcao" runat="server" 
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                        Enabled="False" Text="Criar Plano de Ação" Width="148px" Visible="False">
                                    </dxe:ASPxButton>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPA" runat="server" BorderStyle="Solid" ForeColor="White" 
                                        Width="20px" BorderColor="White" BorderWidth="1px"></asp:TextBox>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="txtvarPlanoAcao" runat="server" 
                                        ClientInstanceName="txtvarPlanoAcao" ForeColor="White" Width="11px">
                                        <Border BorderColor="White" BorderStyle="Solid" BorderWidth="1px" />
                                    </dxe:ASPxTextBox>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="txtvarStatus" runat="server" 
                                        ClientInstanceName="txtvarPlanoAcao" ForeColor="White" Width="11px">
                                        <Border BorderColor="White" BorderStyle="Solid" BorderWidth="1px" />
                                    </dxe:ASPxTextBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td style="width: 6px">
                                    <asp:SqlDataSource ID="dsMemorialSub" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" 
                                        SelectCommand="SELECT AtaID, CONVERT (char, ataDia, 103) AS ataDia, CONVERT (char, ataHora, 108) AS ataHora, ataObjetivos  FROM projAta WHERE (ProjetoID = @ProjetoID) AND (SubProjetoID = @SubProjetoID) ORDER BY CAST(ataDia AS datetime) DESC">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="ProjetoID" SessionField="sPROJETO" Type="Int16" />
                                            <asp:ControlParameter ControlID="lbl_SubProjetoID" Name="SubProjetoID" 
                                                PropertyName="Text" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:SqlDataSource ID="dsMemoProjeto" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                                        SelectCommand="SELECT ProjetoID, ProjetoDesc FROM viewProjetosAtivo">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:SqlDataSource ID="dsCboSubProjeto" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" 
                                        SelectCommand="SELECT [ProjetoSubDesc], [ProjetoSubID] FROM [projProjetoSub] WHERE ([ProjetoID] = @ProjetoID) ORDER BY [ProjetoSubDesc]">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="ProjetoID" SessionField="sPROJETO" Type="Int16" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:SqlDataSource ID="dsCboEtapa" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" 
                                        SelectCommand="SELECT EtapaID, etapaDesc FROM projEtapas WHERE (projetoID = @ProjetoID)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="ProjetoID" SessionField="sPROJETO" Type="Int16" />
                                        </SelectParameters>
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
        <td align="left" valign="top">
            <asp:Panel ID="Panel2" runat="server" BackColor="White" BorderColor="#99CCFF" 
                BorderStyle="Solid" BorderWidth="1px" Height="557px" Width="500px">
                <table cellspacing="1" class="style1">
                    <tr>
                        <td>
                            <dxe:ASPxButton ID="btnAbrirPA" runat="server" Text="Inserir Plano de Ação" 
                                Width="150px" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                                CssPostfix="Aqua">
                                <ClientSideEvents Click="function(s, e) {
	frmPlanoAcao.Show();
}" />
                            </dxe:ASPxButton>
                        </td>
                        <td align="center">
                            <dxe:ASPxButton ID="btnAlterarPAGrid" runat="server" 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                ImageSpacing="5px" Text="Alterar ou Excluir" Width="130px">
                                <ClientSideEvents Click="function(s, e) {
	frmPlanoAcao.Show();
}" />
                            </dxe:ASPxButton>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <dxe:ASPxTextBox ID="txtPlanoAcaoID" runat="server" 
                                ClientInstanceName="txtPlanoAcaoID" Width="70px" ForeColor="White">
                                <Border BorderStyle="None" />
                            </dxe:ASPxTextBox>
                        </td>
                    </tr>
                </table>
                <table cellspacing="1" class="style1">
                    <tr>
                        <td align="left" valign="top">
                            <dxwgv:ASPxGridView ID="gridViewPlanoAcao" runat="server" 
                                AutoGenerateColumns="False" ClientInstanceName="gridView" DataSourceID="dsViewPA" 
                                KeyFieldName="PlanoAcaoID" 
                                CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                CssPostfix="Office2003_Blue" Width="490px" Theme="PlasticBlue" EnableTheming="True">
                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                    CssPostfix="Office2003_Blue">
                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                    </Header>
                                    <AlternatingRow BackColor="AliceBlue">
                                    </AlternatingRow>
                                    <FocusedRow BackColor="#FFFF99" ForeColor="#0066FF">
                                    </FocusedRow>
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
                                <SettingsText EmptyDataRow="Não há nenhum Plano de Ação para o Projeto selecionado." 
                                    Title="Visualizar Plano de Ações" />
                                <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged();
}" />
                                <TotalSummary>
                                    <dxwgv:ASPxSummaryItem DisplayFormat="Plano de Ação, total de {0:n0}" FieldName="PlanoAcaoID" ShowInColumn="Oque" SummaryType="Count" />
                                </TotalSummary>
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="O quê" FieldName="Oque" VisibleIndex="0" 
                                        Width="270px">
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Quem" VisibleIndex="1" Width="80px">
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Quando" VisibleIndex="2" Width="80px">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="PlanoAcaoID" 
                                        VisibleIndex="3" Width="20px">
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                                    VerticalScrollableHeight="400" ShowFooter="True" />
                                <StylesEditors>
                                    <ProgressBar Height="25px">
                                    </ProgressBar>
                                </StylesEditors>
                            </dxwgv:ASPxGridView>
                            <asp:SqlDataSource ID="dsViewPA" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" 
                                
                                
                                SelectCommand="uspPlanoDeAcao_Projeto_GridView" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="ProjetoID" SessionField="idProjeto" />
                                    <asp:SessionParameter Name="Tipo" SessionField="idTipo" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <table cellspacing="1" class="style1">
                    <tr>
                        <td>
                            <asp:TextBox ID="txtOque" runat="server" BorderStyle="None" ReadOnly="True" 
                                Width="20px" ForeColor="White"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtQuem" runat="server" BorderStyle="None" ReadOnly="True" 
                                Width="20px" ForeColor="White"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPorque" runat="server" BorderStyle="None" ReadOnly="True" 
                                Width="20px" ForeColor="White"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtQuando" runat="server" BorderStyle="None" ReadOnly="True" 
                                Width="20px" ForeColor="White"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtConclusao" runat="server" BorderStyle="None" 
                                ReadOnly="True" Width="20px" ForeColor="White"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtOnde" runat="server" BorderStyle="None" ReadOnly="True" 
                                Width="20px" ForeColor="White"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtComo" runat="server" BorderStyle="None" ReadOnly="True" 
                                Width="20px" ForeColor="White"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtStatus" runat="server" BorderStyle="None" ReadOnly="True" 
                                Width="20px" ForeColor="White"></asp:TextBox>
                        </td>
                        <td align="center">
                            <asp:TextBox ID="txtQuanto" runat="server" BorderStyle="None" ReadOnly="True" 
                                Width="20px" ForeColor="White"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtProjetoID" runat="server" BorderStyle="None" 
                                ForeColor="White" ReadOnly="True" Width="20px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSubProjetoID" runat="server" BorderStyle="None" 
                                ForeColor="White" ReadOnly="True" Width="20px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEtapaID" runat="server" BorderStyle="None" 
                                ForeColor="White" ReadOnly="True" Width="20px"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </asp:Panel>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
<p>
        <dxpc:ASPxPopupControl ID="panelSPE" runat="server" AllowDragging="True" 
            ClientInstanceName="pnSPE" 
            CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
            HeaderText="Seleção de Sub-Projeto ou Etapa" 
            Height="126px" ImageFolder="~/App_Themes/Plastic Blue/{0}/" Modal="True" 
            Width="400px" AllowResize="True">
            <ContentStyle>
                <BorderBottom BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" />
            </ContentStyle>
            <SizeGripImage Height="16px" Url="~/App_Themes/Plastic Blue/Web/pcSizeGrip.gif" 
                Width="16px" />
            <CloseButtonStyle>
                <Paddings Padding="0px" />
            </CloseButtonStyle>
            <ContentCollection>
<dxpc:PopupControlContentControl runat="server">
    <table class="style1">
        <tr>
            <td style="width: 104px">
                <b>Sub-Projeto:</b></td>
            <td>
                <dxe:ASPxComboBox ID="cboSubProjetoSPE" runat="server" AutoPostBack="True" 
                    TextField="ProjetoSubDesc" ValueField="ProjetoSubID" ValueType="System.String" 
                    Width="250px" DataSourceID="dsCboSubProjeto">
                </dxe:ASPxComboBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td style="width: 104px">
                <b>Etapa: </b>
            </td>
            <td>
                <dxe:ASPxComboBox ID="cboEtapaSPE" runat="server" ValueType="System.String" 
                    Width="200px" AutoPostBack="True" DataSourceID="dsCboEtapa" 
                    TextField="etapaDesc" ValueField="EtapaID">
                </dxe:ASPxComboBox>
            </td>
            <td align="right">
                &nbsp;</td>
        </tr>
    </table>
    <table cellspacing="1" class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td align="right">
                <dxe:ASPxButton ID="btnNewSPE" runat="server" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Text="Novo" 
                    Width="90px">
                    <ClientSideEvents Click="function(s, e) {
	panelCadastroSPE.Show();
	pnSPE.Hide();
}" />
                </dxe:ASPxButton>
            </td>
            <td align="left">
                <dxe:ASPxButton ID="btnOkSPE" runat="server" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Text="OK" 
                    Width="90px" AutoPostBack="False">
                    <ClientSideEvents Click="function(s, e) {
	pnSPE.Hide();
}" />
                </dxe:ASPxButton>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
                </dxpc:PopupControlContentControl>
</ContentCollection>
            <CloseButtonImage Height="14px" Width="14px" />
            <HeaderStyle HorizontalAlign="Center">
            <Paddings PaddingBottom="4px" PaddingLeft="10px" PaddingRight="4px" 
                PaddingTop="4px" />
            </HeaderStyle>
        </dxpc:ASPxPopupControl>
    </p>
    <p>
        <dxpc:ASPxPopupControl ID="popPlanoAcao" runat="server" 
            AllowDragging="True" ClientInstanceName="frmPlanoAcao" 
            CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
            HeaderText="Incluir, Alterar  ou Excluir Plano de Ação" 
            ImageFolder="~/App_Themes/Plastic Blue/{0}/" Modal="True" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
            Width="550px" ShowCloseButton="False">
            <ContentStyle>
                <BorderBottom BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" />
            </ContentStyle>
            <SizeGripImage Height="16px" Width="16px" 
                Url="~/App_Themes/Plastic Blue/Web/pcSizeGrip.gif" />
            <CloseButtonStyle>
                <Paddings Padding="0px" />
            </CloseButtonStyle>
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                    <table class="style1">
                        <tr>
                            <td style="width: 86px">
                                <b>O Que:</b></td>
                            <td colspan="3">
                                <dxe:ASPxTextBox ID="ftxt_Oque" runat="server" Width="430px" 
                                    BackColor="#FFFFEC" Font-Bold="True" ForeColor="#3399FF">
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 86px">
                                <b>Quem:</b></td>
                            <td>
                                <dxe:ASPxTextBox ID="ftxt_Quem" runat="server" Width="170px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                <b>Quanto:</b></td>
                            <td>
                                <dxe:ASPxTextBox ID="ftxt_Quanto" runat="server" Width="170px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <table class="style1">
                        <tr>
                            <td style="width: 105px">
                                <b>Por quê ?:</b></td>
                            <td colspan="3">
                                <dxe:ASPxMemo ID="ftxt_Porque" runat="server" Height="71px" Width="431px">
                                </dxe:ASPxMemo>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 105px">
                                <b>Até Quando:</b></td>
                            <td>
                                <dxe:ASPxDateEdit ID="ftxt_Quando" runat="server" 
                                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                    CssPostfix="Office2003_Blue" ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                    <ButtonStyle Width="13px">
                                    </ButtonStyle>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td>
                                <b>Conclusão:</b></td>
                            <td>
                                <dxe:ASPxDateEdit ID="ftxt_Conclusao" runat="server" 
                                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                    CssPostfix="Office2003_Blue" ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                    <ButtonStyle Width="13px">
                                    </ButtonStyle>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 105px">
                                <b>Onde:</b></td>
                            <td colspan="3">
                                <dxe:ASPxTextBox ID="ftxt_Onde" runat="server" Width="430px">
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 105px">
                                <b>Como:</b></td>
                            <td colspan="3">
                                <dxe:ASPxMemo ID="ftxt_Como" runat="server" Height="71px" Width="430px">
                                </dxe:ASPxMemo>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 105px">
                                <b>Status:</b></td>
                            <td colspan="3">
                                <dxe:ASPxComboBox ID="cboStatusTarefa" runat="server" ValueType="System.String" 
                                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                    CssPostfix="Office2003_Blue" ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                    <Items>
                                        <dxe:ListEditItem Text="Em Andamento" Value="Em Andamento" />
                                        <dxe:ListEditItem Text="Em Atraso" Value="Em Atraso" />
                                        <dxe:ListEditItem Text="Concluido" Value="Concluido" />
                                        <dxe:ListEditItem Text="Cancelado" Value="Cancelado" />
                                    </Items>
                                    <ButtonStyle Width="13px">
                                    </ButtonStyle>
                                </dxe:ASPxComboBox>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <table class="style1">
                        <tr>
                            <td style="width: 363px">
                                <dxe:ASPxTextBox ID="ftxt_PlanoAcaoID" runat="server" 
                                    ClientInstanceName="ftxt_TarefaID" ForeColor="WhiteSmoke" Width="10px" 
                                    BackColor="WhiteSmoke">
                                    <Border BorderColor="White" BorderStyle="None" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td align="right" style="width: 363px">
                                <dxe:ASPxButton ID="btnAlterarPA" runat="server" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Text="Alterar" 
                                    Width="90px">
                                </dxe:ASPxButton>
                            </td>
                            <td align="center">
                                <dxe:ASPxButton ID="btnCancelarPA" runat="server" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    Text="Cancelar" Width="90px">
                                </dxe:ASPxButton>
                            </td>
                            <td>
                                <dxe:ASPxButton ID="btnSalvarPA" runat="server" 
                                    CssFilePath="~/App_Themes/Youthful/{0}/styles.css" CssPostfix="Youthful" 
                                    Text="Salvar" Width="90px">
                                    <ClientSideEvents Click="function(s, e) {

}" />
                                </dxe:ASPxButton>

                            </td>
                            <td>
                                <dxe:ASPxButton ID="btnExcluirPA" runat="server" 
                                    CssFilePath="~/App_Themes/Red Wine/{0}/styles.css" CssPostfix="RedWine" 
                                    Text="Excluir" Width="90px">
                                </dxe:ASPxButton>
                            </td>
                            <td>
                                <dxe:ASPxButton ID="btnFechar" runat="server" Text="Fechar" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    Width="90px" AutoPostBack="False">
                                    <ClientSideEvents Click="function(s, e) {
	gridView.Refresh();
	txtvarPlanoAcao.SetText(1);
	frmPlanoAcao.Hide();
	gridView.Refresh();
}" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <CloseButtonImage Height="14px" Width="14px" />
            <HeaderStyle Font-Bold="True" HorizontalAlign="Center">
            <Paddings PaddingRight="4px" PaddingBottom="4px" PaddingLeft="10px" 
                PaddingTop="4px" />
            </HeaderStyle>
        </dxpc:ASPxPopupControl>
        </p>
   
</asp:Content>

