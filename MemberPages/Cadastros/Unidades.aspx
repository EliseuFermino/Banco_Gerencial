<%@ Page Title="Manutenção Unidades" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Unidades.aspx.vb" Inherits="MemberPages_Planejamento_Perdas_AjustePercent" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <aspxcallbackpanel id="cbPanel" runat="server" width="100%" theme="Metropolis" clientinstancename="cbPanel" settingsloadingpanel-text="Aguarde...">
        <panelcollection>
            <panelcontent>
                <div class="container justify-content-center" style="max-width: 98%">
                    <br />
                    <div class="row col-12 justify-content-center" runat="server" id="divFiltros">
                        <div class="col-md-10 justify-content-sm-center">
                            <span class="input-group-text justify-content-sm-center" style="height: 45px">Manutenção - Unidades
                        <br />
                            </span>
                            <br />
                        </div>
                    </div>
                    <br />

                    <div class="row col-12 justify-content-center align-center" runat="server" id="divDados">
                        <br />

                        <div class="col-auto justify-content-sm-center">
                            <dx:ASPxCallbackPanel ID="gridPanel" runat="server" ClientInstanceName="gridPanel" Width="900px" CssClass="justify-content-center text-center width-auto" SettingsLoadingPanel-Text="Aguarde. Atualizando">
                                <PanelCollection>
                                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                                        <dx:ASPxGridView ID="gridUnidades" runat="server" Font-Size="14" AutoGenerateColumns="False" KeyFieldName="idUnidade" ClientInstanceName="gridPerc" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="MaterialCompact">
                                            <SettingsEditing Mode="Batch">
                                                <BatchEditSettings StartEditAction="DblClick" />
                                            </SettingsEditing>
                                            <ClientSideEvents BatchEditChangesSaving="function(s, e) {}"
                                                BatchEditConfirmShowing="function(s, e) {}"
                                                BatchEditEndEditing="function(s, e) {}"
                                                EndCallback="function(s, e) {grid_Departamento.Refresh();}" />
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <SettingsBehavior ConfirmDelete="True" />
                                            <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="400" />
                                            <SettingsResizing ColumnResizeMode="Disabled" />
                                            <SettingsDataSecurity AllowDelete="True" AllowInsert="True" AllowEdit="true" />
                                            <SettingsText CommandBatchEditCancel="Cancelar" CommandBatchEditPreviewChanges="Alterações" CommandBatchEditUpdate="Salvar" CommandNew="Novo" />
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowNewButtonInHeader="True" VisibleIndex="0" />
                                                <dx:GridViewDataTextColumn FieldName="idUnidade" Caption="Id" ReadOnly="true" VisibleIndex="2" CellStyle-HorizontalAlign="Center">
                                                    <Settings ShowEditorInBatchEditMode="true" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="descUnidade" Caption="Descrição" VisibleIndex="3" CellStyle-HorizontalAlign="center" Width="250px">
                                                    <Settings ShowEditorInBatchEditMode="true" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="icone" Caption="icone" VisibleIndex="4" CellStyle-HorizontalAlign="left" Width="350px">
                                                    <Settings ShowEditorInBatchEditMode="true" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsCommandButton>
                                                <EditButton Text="Alterar" />
                                                <NewButton Text="Novo" />
                                                <DeleteButton Text="Excluir" />
                                                <CancelButton Text="Cancelar" />
                                                <UpdateButton Text="Salvar" />
                                                <ClearFilterButton Text="Limpar" />
                                            </SettingsCommandButton>
                                            <Styles>
                                                <Header HorizontalAlign="Center" Font-Bold="true" Font-Size="16">
                                                </Header>
                                                <AlternatingRow BackColor="#EFEFEF">
                                                </AlternatingRow>
                                                <Footer Font-Bold="True">
                                                </Footer>
                                            </Styles>
                                        </dx:ASPxGridView>

                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>"
                                            SelectCommand="	SELECT [idUnidade]
                                                              ,[descUnidade]
                                                              ,[icone]
                                                          FROM [gerCadastros].[Cad].[tblUnidade]
                                                            Order By idUnidade"
                                            UpdateCommand=" Update	[gerCadastros].[Cad].[tblUnidade] 
			                                            Set	    [descUnidade] = @descUnidade 
				                                            ,	[icone] = @icone
			                                            Where	idUnidade	=	@idUnidade "
                                            DeleteCommand="Delete From	[gerCadastros].[Cad].[tblUnidade] Where	idUnidade =	@idUnidade"
                                            InsertCommand=" INSERT INTO [Cad].[tblUnidade]
                                                                ([idUnidade]
                                                                ,[descUnidade]
                                                                ,[icone]
                                                                ,[descUnidade_Mini])
                                                            VALUES
                                                                (@idUnidade
                                                                ,@descUnidade
                                                                ,@icone
                                                                ,null)">
                                            <UpdateParameters>
                                                <asp:Parameter Name="idUnidade" Type="Int16" />
                                                <asp:Parameter Name="descUnidade" Type="String" />
                                                <asp:Parameter Name="icone" Type="String" />
                                            </UpdateParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="idUnidade" Type="Int16" />
                                                <asp:Parameter Name="descUnidade" Type="String" />
                                                <asp:Parameter Name="icone" Type="String" />
                                            </InsertParameters>
                                            <DeleteParameters>
                                                <asp:Parameter Name="idUnidade" Type="Int16" />
                                            </DeleteParameters>
                                        </asp:SqlDataSource>

                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxCallbackPanel>
                        </div>
                    </div>
                </div>
            </panelcontent>
        </panelcollection>
    </aspxcallbackpanel>

    <script src="../../assets/bootstrap-5.0.2-dist/Modal/jquery.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/bootstrap.min.js"></script>

    <style>
        .modal-dialog {
            margin-left: auto;
            margin-right: auto;
            max-width: 850px;
        }

        .gwFormat td {
            padding: 8px 13px 8px 13px;
        }

        .dxgvControl_SoftOrange {
            width: auto !important;
            align-content: center;
            justify-content: center !important;
        }

        .dxgvCSD {
            width: auto !important;
        }

        .MainContent_gridPanel_gridPerc_DXMainTable {
            width: auto !important;
        }

        .dxgvHEC {
            width: auto !important;
        }
    </style>

    <script src="../../js/bootstrap.js"></script>

</asp:Content>

