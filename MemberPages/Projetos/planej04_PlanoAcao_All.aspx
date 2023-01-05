<%@ Page Title="Acompanhamento de Projetos" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="planej04_PlanoAcao_All.aspx.vb" Inherits="MemberPages_planej04_PlanoAcao_All" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxpc" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

   <script language ="javascript" type ="text/javascript">
        function OnGridFocusedRowChanged() {           
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'PlanoAcaoID;Quem;Porque;Onde;Como;Quanto;Oque;StatusTarefa;Quando;DataConclusao;AtaID', OnGetRowValues);
        }

        function OnGetRowValues(values) {
        
            txtTarefaID.SetText(values[0]);
            txtQuem.SetText(values[1]);
            txtPorque.SetText(values[2]);           
            txtOnde.SetText(values[3]);
            txtComo.SetText(values[4]);
            txtQuanto.SetText(values[5]);
            txtOque.SetText(values[6]);
            txtStatusTarefa.SetText(values[7]);
            txtQuando.SetText(values[8]);
            txtConclusao.SetText(values[9]);
            txtAtaID.SetText(values[10]);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderColor="#003399" 
        BorderStyle="Solid" BorderWidth="2px" Height="580px" Width="1100px">
        <table class="style1">
            <tr>
                <td style="color: #4E5F95; ">
                    <table cellspacing="1" class="style1" style="width: 89%">
                        <tr>
                            <td>
                                <dxe:ASPxButton ID="btnAta" runat="server" 
                                    CssFilePath="~/App_Themes/Office2003 Olive/{0}/styles.css" 
                                    CssPostfix="Office2003_Olive" Text="Ir para  Ata" Width="100px" Theme="DevEx">
                                    <ClientSideEvents Click="function(s, e) {
	panAta.Show();
}" />
                                </dxe:ASPxButton>
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtText" runat="server" ClientEnabled="False" 
                                    ClientInstanceName="txtText" ForeColor="White" Width="20px">
                                    <Border BorderColor="White" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtTarefaID" runat="server" 
                                    ClientInstanceName="txtTarefaID" ForeColor="White" ReadOnly="True" Width="20px">
                                    <Border BorderStyle="None" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtQuem" runat="server" ClientInstanceName="txtQuem" 
                                    ForeColor="White" Width="20px">
                                    <Border BorderStyle="None" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtPorque" runat="server" ClientInstanceName="txtPorque" 
                                    ForeColor="White" Width="20px">
                                    <Border BorderStyle="None" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtQuando" runat="server" ClientInstanceName="txtQuando" 
                                    ForeColor="White" Width="20px">
                                    <Border BorderStyle="None" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtOnde" runat="server" ClientInstanceName="txtOnde" 
                                    ForeColor="White" Width="20px">
                                    <Border BorderStyle="None" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtComo" runat="server" ClientInstanceName="txtComo" 
                                    ForeColor="White" Width="20px">
                                    <Border BorderStyle="None" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtConclusao" runat="server" 
                                    ClientInstanceName="txtConclusao" ForeColor="White" Width="80px">
                                    <Border BorderStyle="None" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtStatusTarefa" runat="server" 
                                    ClientInstanceName="txtStatusTarefa" ForeColor="White" Width="20px">
                                    <Border BorderColor="White" BorderStyle="None" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtAtaID" runat="server" ClientInstanceName="txtAtaID" 
                                    ForeColor="White" ReadOnly="True" Width="20px">
                                    <Border BorderStyle="None" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtQuanto" runat="server" ClientInstanceName="txtQuanto" 
                                    ForeColor="White" Width="20px">
                                    <Border BorderStyle="None" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                <dxe:ASPxLabel ID="lblStatus" runat="server" ForeColor="White" Text="ASPxLabel">
                                </dxe:ASPxLabel>
                            </td>
                            <td>
                                <dxe:ASPxTextBox ID="txtvarStatus" runat="server" 
                                    ClientInstanceName="txtvarStatus" ForeColor="White" Height="18px" Native="True" 
                                    Width="20px">
                                    <Border BorderColor="White" BorderStyle="None" />
                                </dxe:ASPxTextBox>
                            </td>
                            <td>
                                <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="grid" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <dxe:ASPxTextBox ID="txtOque0" runat="server" ClientInstanceName="txtOque" 
                        ForeColor="White" Height="18px" Native="True" Width="20px">
                        <Border BorderColor="White" BorderStyle="None" />
                    </dxe:ASPxTextBox>
                </td>
            </tr>
        </table>
        <table class="style1">
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDS2" 
                        AutoGenerateColumns="False" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue" KeyFieldName="PlanoAcaoID" 
                        ClientInstanceName="grid" Width="1050px" Theme="DevEx">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue">
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <GroupSummary>
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="PlanoAcaoID" 
                            SummaryType="Count" />
                        </GroupSummary>
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem DisplayFormat="Total de Planos de Ação: {0:n0}" 
                                FieldName="AtaID" ShowInColumn="O Quê" SummaryType="Count" />
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
                        <SettingsText GroupPanel="Arraste aqui um cabeçalho qualquer das colunas abaixo para agrupar. " 
                            EmptyDataRow="Não há nenhum Plano de Ação cadastrado para o projeto selecionado." />
                        <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged();
}" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="PlanoAcaoID" ReadOnly="True" 
                                VisibleIndex="0" Width="25px" FixedStyle="Left" 
                                Caption="ID" >
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="ProjetoDesc" ReadOnly="True" 
                                VisibleIndex="1" Width="100px" FixedStyle="Left" Caption="Projeto" 
                                GroupIndex="1" SortIndex="1" SortOrder="Ascending" >
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Oque" VisibleIndex="2" Width="200" 
                                FixedStyle="Left"  Caption="O Quê" >
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Quem" VisibleIndex="3" Width="80" 
                                FixedStyle="Left" >
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Porque" VisibleIndex="4" Width="200" 
                                Visible="False" />
                            <dxwgv:GridViewDataDateColumn FieldName="Quando" VisibleIndex="4" Width="80px" 
                                Caption="Até Quando" >
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Onde" VisibleIndex="5" Width="200" 
                                Visible="False" >
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Como" VisibleIndex="5" Width="200" >
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Quanto" VisibleIndex="6" Width="70" 
                                Visible="False" >
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataCheckColumn FieldName="Concluida" VisibleIndex="7" 
                                Width="50" Visible="False" />
                            <dxwgv:GridViewDataDateColumn FieldName="DataConclusao" VisibleIndex="6" 
                                Width="100px" Caption="Data Conclusão" >
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="etapaDesc" VisibleIndex="9" Width="50px" 
                                Visible="True" Caption="Etapa" />
                            <dxwgv:GridViewDataDateColumn FieldName="DataInclusao" VisibleIndex="11" 
                                Width="50" Visible="False" />
                            <dxwgv:GridViewDataTextColumn FieldName="AtaID" VisibleIndex="10" Width="40px" 
                                Visible="True" Caption="Ata" />
                            <dxwgv:GridViewDataTextColumn FieldName="ProjetoSubDesc" VisibleIndex="8" Width="80px" 
                                Visible="True" Caption="Sub-Projeto" />
                            <dxwgv:GridViewDataTextColumn FieldName="StatusTarefa" VisibleIndex="7" 
                                Width="70px" Caption="Status" GroupIndex="0" SortIndex="0" 
                                SortOrder="Ascending" >
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowGroupPanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="400" ShowFooter="True" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDS2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                        
                        
                        
                        
                        
                        SelectCommand="SELECT projPlanoAcao.PlanoAcaoID, projPlanoAcao.Oque, projPlanoAcao.Porque, projPlanoAcao.Quem, projPlanoAcao.Quando, projPlanoAcao.Onde, projPlanoAcao.Como, projPlanoAcao.Quanto, projPlanoAcao.Concluida, projPlanoAcao.DataConclusao, projPlanoAcao.DataAta, projPlanoAcao.DataInclusao, projPlanoAcao.HoraInclusao, projPlanoAcao.StatusTarefa, projPlanoAcao.ProjetoID, projPlanoAcao.AtaID, projProjetoSub.ProjetoSubDesc, projEtapas.etapaDesc, projProjeto.ProjetoDesc FROM projPlanoAcao INNER JOIN projProjetoSub ON projPlanoAcao.SubProjetoID = projProjetoSub.ProjetoSubID INNER JOIN projEtapas ON projPlanoAcao.EtapaID = projEtapas.EtapaID INNER JOIN projProjeto ON projPlanoAcao.ProjetoID = projProjeto.ProjetoID WHERE (projPlanoAcao.ProjetoID &lt;&gt; 11) AND (projPlanoAcao.PlanoAcaoID &gt; 0) ORDER BY projPlanoAcao.ProjetoID, projPlanoAcao.PlanoAcaoID">
                    </asp:SqlDataSource>
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <dxpc:ASPxPopupControl ID="panAta" runat="server" AllowDragging="True" 
            ClientInstanceName="panAta" 
            CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
            HeaderText="Visualizar Ata da Reunião" Height="430px" 
            ImageFolder="~/App_Themes/Plastic Blue/{0}/" Modal="True" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
            Width="480px">
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
                    <asp:Panel ID="panMemoriaTable" runat="server" BackColor="White" 
                        BorderColor="#C4DDFA" BorderStyle="Solid" BorderWidth="1px" Height="470px" 
                        Width="466px">
                        <table class="style1">
                            <tr>
                                <td class="style9" style="font-weight: bold; width: 92px; color: #4F64A6;">
                                    Projeto:</td>
                                <td>
                                    <asp:Label ID="lblProjeto" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style9" 
                                    style="font-weight: bold; width: 92px; padding-top: 4px; color: #4F64A6;">
                                    Sub-Projeto:</td>
                                <td style="padding-top: 4px">
                                    <asp:Label ID="lblSubProjeto" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style9" 
                                    style="font-weight: bold; width: 92px; padding-top: 4px; color: #4F64A6; height: 21px;">
                                    Etapa:</td>
                                <td style="padding-top: 4px; height: 21px;">
                                    <asp:Label ID="lblEtapa" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style9" 
                                    style="font-weight: bold; width: 92px; padding-top: 4px; color: #4F64A6;">
                                    Nº da Ata:</td>
                                <td style="padding-top: 4px">
                                    <asp:Label ID="lblAta" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style9" 
                                    style="font-weight: bold; color: #4F64A6; width: 92px; padding-top: 4px; height: 17px;">
                                    <b>Dia:</b></td>
                                <td style="padding-top: 4px; height: 17px;">
                                    <asp:Label ID="lblDia" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table class="style1" style="width: 75%">
                            <tr>
                                <td class="style8" style="font-weight: bold; width: 117px; color: #4F64A6;">
                                    Participantes:</td>
                                <td style="width: 406px">
                                    <asp:TextBox ID="txtMemoParticipantes" runat="server" BackColor="#FAFAFA" 
                                        BorderColor="#C4DDFA" BorderStyle="Solid" BorderWidth="1px" 
                                        Font-Size="Medium" ForeColor="#4C61A2" Height="61px" MaxLength="500" 
                                        TextMode="MultiLine" Width="358px" ReadOnly="True" Enabled="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8" style="font-weight: bold; width: 117px; color: #4F64A6;">
                                    Objetivo desta Reunião:</td>
                                <td style="width: 406px">
                                    <asp:TextBox ID="txtMemoObjetivos" runat="server" BackColor="#FAFAFA" 
                                        BorderColor="#C4DDFA" BorderStyle="Solid" BorderWidth="1px" 
                                        Font-Size="Medium" ForeColor="#4C61A2" Height="98px" MaxLength="500" 
                                        TextMode="MultiLine" Width="358px" ReadOnly="True" Enabled="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8" style="font-weight: bold; width: 117px; color: #4F64A6;">
                                    Discussão:</td>
                                <td style="width: 406px">
                                    <asp:TextBox ID="txtMemoDiscussao" runat="server" BackColor="#FAFAFA" 
                                        BorderColor="#C4DDFA" BorderStyle="Solid" BorderWidth="1px" 
                                        Font-Size="Medium" ForeColor="#4C61A2" Height="165px" MaxLength="500" 
                                        TextMode="MultiLine" Width="357px" ReadOnly="True" Enabled="True"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <CloseButtonImage Height="14px" Width="14px" />
            <HeaderStyle HorizontalAlign="Center">
            <Paddings PaddingBottom="4px" PaddingLeft="10px" PaddingRight="4px" 
                PaddingTop="4px" />
            </HeaderStyle>
        </dxpc:ASPxPopupControl>
        <br />
    </asp:Panel>
</asp:Content>

