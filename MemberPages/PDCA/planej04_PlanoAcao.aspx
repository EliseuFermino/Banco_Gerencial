<%@ Page Title="Plano de Ação - PDCA" Language="VB" MasterPageFile="~/MemberPages/PDCA/mpPlanejamento.master" AutoEventWireup="true" CodeFile="planej04_PlanoAcao.aspx.vb" Inherits="MemberPages_planej04_PlanoAcao" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxpc" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxnb" %>

<%@ Register src="Controles/wuc_cboProjeto_Subprojeto.ascx" tagname="wuc_cboProjeto_Subprojeto" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
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
    
    <asp:Panel ID="Panel1" runat="server" BackColor="White" BorderColor="#9cc525"
        BorderStyle="Solid" BorderWidth="2px" Height="550px" Width="1150px">
        <table class="style1">
            <tr>
                <td style="color: #4E5F95; width: 406px">
                    <uc1:wuc_cboProjeto_Subprojeto ID="cboAcompProjeto" runat="server" />
                </td>
                <td>
                    <asp:Panel ID="panTemp" runat="server" Width="440px">
                        <table class="style1">
                            <tr>
                                <td>
                                    <dxe:ASPxButton ID="ASPxButton1" runat="server" 
                                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                        CssPostfix="Office2003_Blue" Text="Alterar Plano de Ação" Width="170px" Theme="Youthful">
                                        <ClientSideEvents Click="function(s, e) {
	frmEdit.Show()
}" />
                                    </dxe:ASPxButton>
                                </td>
                                <td>
                                    <dxe:ASPxButton ID="btnAta" runat="server" 
                                        CssFilePath="~/App_Themes/Office2003 Olive/{0}/styles.css" 
                                        CssPostfix="Office2003_Olive" Text="Ir para  Ata" Width="90px" Theme="Youthful">
                                        <ClientSideEvents Click="function(s, e) {
	panAta.Show();
}" />
                                    </dxe:ASPxButton>
                                </td>
                                <td style="width: 136px">
                                    <dxe:ASPxTextBox ID="txtText" runat="server" ClientEnabled="False" 
                                        ClientInstanceName="txtText" ForeColor="White" Width="20px">
                                        <Border BorderColor="White" />
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="width: 67px">
                                    <dxe:ASPxTextBox ID="txtTarefaID" runat="server" 
                                        ClientInstanceName="txtTarefaID" ForeColor="White" ReadOnly="True" 
                                        Width="20px">
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
                                    <dxe:ASPxTextBox ID="txtQuanto" runat="server" ClientInstanceName="txtQuanto" 
                                        ForeColor="White" Width="20px">
                                        <Border BorderStyle="None" />
                                    </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 136px">
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
                                    <dxe:ASPxTextBox ID="txtOque" runat="server" ClientInstanceName="txtOque" 
                                        ForeColor="White" Height="18px" Native="True" Width="20px">
                                        <Border BorderColor="White" BorderStyle="None" />
                                    </dxe:ASPxTextBox>
                                </td>
                                <td style="width: 67px">
                                    <dxe:ASPxTextBox ID="txtAtaID" runat="server" ClientInstanceName="txtAtaID" 
                                        ForeColor="White" ReadOnly="True" Width="30px">
                                        <Border BorderStyle="None" />
                                    </dxe:ASPxTextBox>
                                </td>
                                <td>
                                    <dxe:ASPxTextBox ID="txtvarStatus" runat="server" 
                                        ClientInstanceName="txtvarStatus" ForeColor="White" Height="18px" Native="True" 
                                        Width="20px">
                                        <Border BorderColor="White" BorderStyle="None" />
                                    </dxe:ASPxTextBox>
                                </td>
                                <td>
                                    <dxe:ASPxLabel ID="lblStatus0" runat="server" ForeColor="White" 
                                        Text="ASPxLabel">
                                    </dxe:ASPxLabel>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <table class="style1">
            <tr>
                <td>
                   
                    <dxwgv:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDS2"  Width="1050px" 
                        AutoGenerateColumns="False" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue" KeyFieldName="PlanoAcaoID" 
                        ClientInstanceName="grid" Theme="Youthful">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue">
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <AlternatingRow BackColor="#F4FCFF">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF99" ForeColor="#0066FF">
                            </FocusedRow>
                            <GroupPanel BackColor="#F5F5F1">
                            </GroupPanel>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <GroupSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="PlanoAcaoID" 
                            SummaryType="Count" />
                        </GroupSummary>
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
                            <dxwgv:GridViewDataTextColumn FieldName="Plano" ReadOnly="True" 
                                VisibleIndex="1" Width="35px" FixedStyle="Left" >                            
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="2" Width="200" 
                                FixedStyle="Left"  Caption="Causa" >                           
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Oque" VisibleIndex="3" Width="200px" 
                                FixedStyle="Left" Caption="O Quê" ShowInCustomizationForm="True" >                            
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Quem" VisibleIndex="4" Width="80" FixedStyle="Left" >                            
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Porque" Visible="False" VisibleIndex="5" Width="200" />
                            <dxwgv:GridViewDataDateColumn FieldName="Quando" VisibleIndex="5" Width="80px" 
                                Caption="Até Quando" >                            
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Onde" VisibleIndex="6" Width="200" 
                                Visible="False" >                            
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Como" VisibleIndex="6" Width="200" >                            
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Quanto" VisibleIndex="7" Width="70" 
                                Visible="False" >                            
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataCheckColumn FieldName="Concluida" VisibleIndex="8" 
                                Width="50" Visible="False" />                            
                            <dxwgv:GridViewDataDateColumn FieldName="DataConclusao" VisibleIndex="7" 
                                Width="100px" Caption="Data Conclusão" >                            
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dxwgv:GridViewDataDateColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="10" Width="50px" 
                                Visible="False" Caption="Etapa" />                            
                            <dxwgv:GridViewDataDateColumn FieldName="DataInclusao" VisibleIndex="12" 
                                Width="50" Visible="False" />                           
                            <dxwgv:GridViewDataTextColumn FieldName="AtaID" VisibleIndex="11" Width="40px" 
                                Visible="True" Caption="Ata" />                            
                            <dxwgv:GridViewDataTextColumn FieldName="ProjetoSubDesc" VisibleIndex="9" Width="80px" 
                                Visible="True" Caption="Sub-Conta" />                            
                            <dxwgv:GridViewDataTextColumn FieldName="StatusTarefa" VisibleIndex="8" 
                                Width="70px" Caption="Status" >                           
                            
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            
                        </Columns>
                        <Settings ShowGroupPanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="400" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDS2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>"                
                        
                        
                        
                        SelectCommand="uspBuscarPlanoDeAcao" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ProjetoID" SessionField="idProjeto" />                                                       
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="lblError" runat="server" Text="Label" Visible="false"></asp:Label>
        <br />
        <dxpc:ASPxPopupControl ID="panPlanoAcao" runat="server" 
            AllowDragging="True" ClientInstanceName="frmEdit" 
            CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
            HeaderText="Alterar ou Excluir Plano de Ação" 
            ImageFolder="~/App_Themes/Plastic Blue/{0}/" Modal="True" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
            ShowCloseButton="False" Width="550px">
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
                                <dxe:ASPxTextBox ID="ftxt_Oque" runat="server" ReadOnly="True" Width="430px" 
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
                                Quanto:</td>
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
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="width: 105px">
                                <b>Até Quando:</b></td>
                            <td>
                                <dxe:ASPxDateEdit ID="ftxt_Quando" runat="server">
                                </dxe:ASPxDateEdit>
                            </td>
                            <td>
                                Conclusão:</td>
                            <td>
                                <dxe:ASPxDateEdit ID="ftxt_Conclusao" runat="server">
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
                                <dxe:ASPxComboBox ID="cboStatusTarefa" runat="server" ValueType="System.String">
                                    <Items>
                                        <dxe:ListEditItem Text="Em Andamento" Value="Em Andamento" />
                                        <dxe:ListEditItem Text="Em Atraso" Value="Em Atraso" />
                                        <dxe:ListEditItem Text="Concluido" Value="Concluido" />
                                        <dxe:ListEditItem Text="Cancelado" Value="Cancelado" />
                                    </Items>
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
                                <dxe:ASPxTextBox ID="ftxt_PlanoAcaoID" runat="server" BackColor="WhiteSmoke" 
                                    ClientInstanceName="ftxt_TarefaID" ForeColor="WhiteSmoke" Width="10px">
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
                                <dxe:ASPxButton ID="btnSalvar" runat="server" 
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
                                <dxe:ASPxButton ID="btnFechar" runat="server" AutoPostBack="False" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Text="Fechar" 
                                    Width="90px">
                                    <ClientSideEvents Click="function(s, e) {
	frmEdit.Hide();
}" />
                                </dxe:ASPxButton>
                            </td>
                        </tr>
                    </table>
                    <br />
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <CloseButtonImage Height="14px" Width="14px" />
            <HeaderStyle Font-Bold="True" HorizontalAlign="Center">
            <Paddings PaddingBottom="0px" PaddingLeft="0px" PaddingRight="0px" 
                PaddingTop="0px" />
            </HeaderStyle>
        </dxpc:ASPxPopupControl>
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
                                    &nbsp;</td>
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
                                        BorderColor="#C4DDFA" BorderStyle="Solid" BorderWidth="1px" Enabled="False" 
                                        Font-Size="Medium" ForeColor="#4C61A2" Height="61px" MaxLength="500" 
                                        TextMode="MultiLine" Width="358px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8" style="font-weight: bold; width: 117px; color: #4F64A6;">
                                    Objetivo desta Reunião:</td>
                                <td style="width: 406px">
                                    <asp:TextBox ID="txtMemoObjetivos" runat="server" BackColor="#FAFAFA" 
                                        BorderColor="#C4DDFA" BorderStyle="Solid" BorderWidth="1px" Enabled="False" 
                                        Font-Size="Medium" ForeColor="#4C61A2" Height="98px" MaxLength="500" 
                                        TextMode="MultiLine" Width="358px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8" style="font-weight: bold; width: 117px; color: #4F64A6;">
                                    Discussão:</td>
                                <td style="width: 406px">
                                    <asp:TextBox ID="txtMemoDiscussao" runat="server" BackColor="#FAFAFA" 
                                        BorderColor="#C4DDFA" BorderStyle="Solid" BorderWidth="1px" Enabled="False" 
                                        Font-Size="Medium" ForeColor="#4C61A2" Height="165px" MaxLength="500" 
                                        TextMode="MultiLine" Width="357px"></asp:TextBox>
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

