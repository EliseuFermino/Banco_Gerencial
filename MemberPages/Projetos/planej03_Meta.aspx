<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Projetos/mpPlanejamento.master" AutoEventWireup="true" CodeFile="planej03_Meta.aspx.vb" Inherits="Ranking_planej03_Meta" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <script lang ="javascript" type ="text/javascript">
        function OnGridFocusedRowChanged() {           
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'Etapa;etapaID', OnGetRowValues);
        }

        function OnGetRowValues(values) {
            txtEtapaID.SetText(values[1]);
            
            
        }
    </script>

    
    <asp:Panel ID="panGeral" runat="server" BorderColor="#3D6CBB" 
        BorderStyle="None" BorderWidth="3px" Width="1010px">
        <table class="style1">
            <tr>
                <td align="center" style="width: 6px" valign="top">
                    <asp:Panel ID="panCronoImg" runat="server" Width="5px" Height="16px">
                    </asp:Panel>
                </td>
                <td align="left" valign="top">
                    <asp:Panel ID="panTable" runat="server" BorderColor="#99CCFF" 
                        BorderStyle="None" BorderWidth="1px">
                        <table class="style1">
                            <tr>
                                <td style="width: 136px; color: #333333">
                                    <b>Nome do Projeto:</b></td>
                                <td>
                                    <dxe:ASPxComboBox ID="cboProjeto" runat="server" AutoPostBack="True" 
                                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue" 
                                        DataSourceID="dsCronoProjeto" ImageFolder="~/App_Themes/Office2003 Blue/{0}/" 
                                        TextField="ProjetoDesc" ValueField="ProjetoID" ValueType="System.String" 
                                        Width="301px">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                    </dxe:ASPxComboBox>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <table class="style1">
                            <tr>
                                <td align="left">
                                    <dxwgv:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" Width="990px"
                                        DataSourceID="SqlDataSource1" KeyFieldName="etapaID" 
                                        ClientInstanceName="grid" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                                        CssPostfix="Aqua" Theme="DevEx" >
                                        <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                                        </Styles>
                                        <SettingsLoadingPanel Text="" />
                                        <SettingsPager Mode="ShowAllRecords">
                                            <AllButton Text="All">
                                                <Image Height="19px" Width="27px" />
                                            </AllButton>
                                            <FirstPageButton>
                                                <Image Height="19px" Width="23px" />
                                            </FirstPageButton>
                                            <LastPageButton>
                                                <Image Height="19px" Width="23px" />
                                            </LastPageButton>
                                            <NextPageButton Text="Next &gt;">
                                                <Image Height="19px" Width="19px" />
                                            </NextPageButton>
                                            <PrevPageButton Text="&lt; Prev">
                                                <Image Height="19px" Width="19px" />
                                            </PrevPageButton>
                                        </SettingsPager>
                                        <Images ImageFolder="~/App_Themes/Aqua/{0}/">
                                            <CollapsedButton Height="15px" 
                                                Url="~/App_Themes/Aqua/GridView/gvCollapsedButton.png" Width="15px" />
                                            <ExpandedButton Height="15px" 
                                                Url="~/App_Themes/Aqua/GridView/gvExpandedButton.png" Width="15px" />
                                            <DetailCollapsedButton Height="15px" 
                                                Url="~/App_Themes/Aqua/GridView/gvDetailCollapsedButton.png" Width="15px" />
                                            <DetailExpandedButton Height="15px" 
                                                Url="~/App_Themes/Aqua/GridView/gvDetailExpandedButton.png" Width="15px" />
                                            <HeaderFilter Height="19px" Url="~/App_Themes/Aqua/GridView/gvHeaderFilter.png" 
                                                Width="19px" />
                                            <HeaderActiveFilter Height="19px" 
                                                Url="~/App_Themes/Aqua/GridView/gvHeaderFilterActive.png" Width="19px" />
                                            <HeaderSortDown Height="5px" 
                                                Url="~/App_Themes/Aqua/GridView/gvHeaderSortDown.png" Width="7px" />
                                            <HeaderSortUp Height="5px" Url="~/App_Themes/Aqua/GridView/gvHeaderSortUp.png" 
                                                Width="7px" />
                                            <FilterRowButton Height="13px" Width="13px" />
                                            <WindowResizer Height="13px" Url="~/App_Themes/Aqua/GridView/WindowResizer.png" 
                                                Width="13px" />
                                        </Images>
                                        <SettingsText GroupPanel="Arraste aqui um cabeçalho qualquer das colunas abaixo para agrupar." 
                                            ConfirmDelete="Gostaria de realmente excluir essa etapa do projeto?" 
                                            Title="Etapas do Projeto" />
                                        <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged();
}" />
                                        <Columns>
                                            <dxwgv:GridViewCommandColumn ButtonType="Image" Caption="Opções" VisibleIndex="0" ShowEditButton="True" ShowNewButton="True" ShowDeleteButton="True"/>
                                            <dxwgv:GridViewDataTextColumn Caption="Etapa" FieldName="Etapa" 
                                                VisibleIndex="1">
                                                <EditFormSettings Visible="False" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="nº Projeto" FieldName="projetoID" 
                                                VisibleIndex="2" Visible="False">
                                                <EditFormSettings Visible="False" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Descrição da Etapa" 
                                                FieldName="etapaDesc" VisibleIndex="2">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataDateColumn Caption="Data Inicial" FieldName="dataInicia" 
                                                VisibleIndex="3">
                                            </dxwgv:GridViewDataDateColumn>
                                            <dxwgv:GridViewDataDateColumn Caption="Data Final" FieldName="dataFinal" 
                                                VisibleIndex="4">
                                            </dxwgv:GridViewDataDateColumn>
                                            <dxwgv:GridViewDataProgressBarColumn Caption="Progresso" FieldName="Complete" 
                                                VisibleIndex="6">
                                                <PropertiesProgressBar Height="" Width="">
                                                </PropertiesProgressBar>
                                            </dxwgv:GridViewDataProgressBarColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Situação" FieldName="etapaSituacao" 
                                                VisibleIndex="5">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Justificativa" 
                                                FieldName="etapaJustificativa" VisibleIndex="7">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Nº" FieldName="etapaID" VisibleIndex="8">
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <Settings ShowGroupPanel="True" ShowTitlePanel="True" />
                                        <StylesEditors>
                                            <ProgressBar Height="25px">
                                            </ProgressBar>
                                        </StylesEditors>
                                        <ImagesEditors>
                                            <CalendarFastNavPrevYear Height="19px" 
                                                Url="~/App_Themes/Aqua/Editors/edtCalendarFNPrevYear.png" Width="19px" />
                                            <CalendarFastNavNextYear Height="19px" 
                                                Url="~/App_Themes/Aqua/Editors/edtCalendarFNNextYear.png" Width="19px" />
                                            <DropDownEditDropDown Height="7px" 
                                                Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                                                UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                                                UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                                                Width="9px" />
                                            <SpinEditIncrement Height="6px" 
                                                Url="~/App_Themes/Aqua/Editors/edtSpinEditIncrementImage.png" 
                                                UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditIncrementDisabledImage.png" 
                                                UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                                                UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                                                Width="7px" />
                                            <SpinEditDecrement Height="7px" 
                                                Url="~/App_Themes/Aqua/Editors/edtSpinEditDecrementImage.png" 
                                                UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditDecrementDisabledImage.png" 
                                                UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                                                UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                                                Width="7px" />
                                            <SpinEditLargeIncrement Height="9px" 
                                                Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncImage.png" 
                                                UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncDisabledImage.png" 
                                                UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                                                UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                                                Width="7px" />
                                            <SpinEditLargeDecrement Height="9px" 
                                                Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecImage.png" 
                                                UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecDisabledImage.png" 
                                                UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                                                UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                                                Width="7px" />
                                        </ImagesEditors>
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
                                                <Image Url="~/image/undo-icon_24.png"/>
                                            </CancelButton>
                                            <UpdateButton>
                                                <Image Url="~/image/note-accept-icon_24.png"/>
                                            </UpdateButton>
                                        </SettingsCommandButton>
                                    </dxwgv:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="dsCronoProjeto" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                            SelectCommand="SELECT ProjetoID, ProjetoDesc FROM viewProjetosAtivo">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                            DeleteCommand="DELETE FROM [projEtapas] WHERE [etapaID] = @etapaID"  
                            InsertCommand="INSERT INTO [projEtapas] ([projetoID], [etapaDesc], [dataInicia], [dataFinal], [etapaSituacao], [etapaJustificativa]) VALUES (@IDProjeto, @etapaDesc, @dataInicia, @dataFinal, @etapaSituacao, @etapaJustificativa)" 
                            ProviderName="<%$ ConnectionStrings:gerContConn2008.ProviderName %>" 
                            SelectCommand="SELECT [etapaID], [projetoID], [etapaDesc], [dataInicia], [dataFinal], [etapaSituacao], [etapaJustificativa], ROW_NUMBER() OVER ( ORDER BY etapaID ASC ) AS Etapa, Complete FROM [projEtapas] WHERE projetoID = @IDProjeto" 
                            
                            
                            UpdateCommand="UPDATE [projEtapas] SET [etapaDesc] = @etapaDesc, [dataInicia] = @dataInicia, [dataFinal] = @dataFinal, [etapaSituacao] = @etapaSituacao, [etapaJustificativa] = @etapaJustificativa WHERE [etapaID] = @etapaID">
                            
                            <DeleteParameters>
                                <asp:Parameter Name="etapaID" Type="Int16" />
                            </DeleteParameters>
                            
                            <InsertParameters>
                                <asp:ControlParameter ControlID="cboProjeto" Name="IDProjeto" PropertyName="Value" />
                                <asp:Parameter Name="etapaDesc" Type="String" />
                                <asp:Parameter Name="dataInicia" Type="DateTime" />
                                <asp:Parameter Name="dataFinal" Type="DateTime" />
                                <asp:Parameter Name="etapaSituacao" Type="String" />
                                <asp:Parameter Name="etapaJustificativa" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="etapaDesc" Type="String" />
                                <asp:Parameter Name="dataInicia" Type="DateTime" />
                                <asp:Parameter Name="dataFinal" Type="DateTime" />
                                <asp:Parameter Name="etapaSituacao" Type="String" />
                                <asp:Parameter Name="etapaJustificativa" Type="String" />
                                <asp:Parameter Name="etapaID" Type="Int16" />
                            </UpdateParameters>
                            
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cboProjeto" Name="IDProjeto" PropertyName="Value" />
                            </SelectParameters>                            
                        </asp:SqlDataSource>
                        <dxe:ASPxTextBox ID="txtEtapaID" runat="server" BackColor="#3367CD" 
                            ClientInstanceName="txtEtapaID" ForeColor="#3367CD" Width="1px">
                            <Border BorderStyle="None" />
                        </dxe:ASPxTextBox>
                        <br />
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
    </asp:Panel>
    <p>
    </p>
    <p>
        <br />
    </p>
</asp:Content>

