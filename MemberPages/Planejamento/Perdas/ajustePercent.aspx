<%@ Page Title="Ajustes percentual - Perdas" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ajustePercent.aspx.vb" Inherits="MemberPages_Planejamento_Perdas_AjustePercent" %>

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
                            <span class="input-group-text justify-content-sm-center" style="height: 45px">Ajustes - Percentual de Perdas
                        <br />
                            </span>
                            <br />
                            <div class="row col-auto justify-content-center sm">
                                <div class="col-auto xs" id="divTipo" runat="server">
                                    <span class="input-group-text justify-content-center sm">Tipo</span>
                                    <asp:DropDownList ID="selTipo" runat="server" CssClass="form-control justify-content-center" AutoPostBack="true" OnSelectedIndexChanged="selTipo_SelectedIndexChanged">
                                        <asp:ListItem Text="Lojas" Value="Lojas" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Atacado" Value="Atacado"></asp:ListItem>
                                        <asp:ListItem Text="Hipermais" Value="Hipermais"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="col-auto xs" id="divAno" runat="server">
                                    <span class="input-group-text justify-content-center sm">Ano</span>
                                    <asp:DropDownList ID="selAno" runat="server" CssClass="form-control justify-content-center" AutoPostBack="true" OnSelectedIndexChanged="selTipo_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row col-12 justify-content-center align-center" runat="server" id="divDados">
                        <br />

                        <div class="col-auto justify-content-sm-center">
                            <dx:ASPxCallbackPanel ID="gridPanel" runat="server" ClientInstanceName="gridPanel" Width="900px" CssClass="justify-content-center text-center width-auto" SettingsLoadingPanel-Text="Aguarde. Atualizando">
                                <PanelCollection>
                                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                                        <dx:ASPxGridView ID="gridPerc" runat="server"  EnableTheming="True" Theme="MaterialCompact" Font-Size="14" AutoGenerateColumns="False" KeyFieldName="idFilial" ClientInstanceName="gridPerc" DataSourceID="SqlDataSource1">
                                            <ClientSideEvents BatchEditChangesSaving="function(s, e) {}"
                                                BatchEditConfirmShowing="function(s, e) {}"
                                                BatchEditEndEditing="function(s, e) {}"
                                                EndCallback="function(s, e) {gridPanel.Refresh();}" />
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <SettingsEditing Mode="Batch">
                                                <BatchEditSettings StartEditAction="DblClick" />
                                            </SettingsEditing>
                                            <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="400" />
                                            <SettingsResizing ColumnResizeMode="Disabled" />
                                            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                                            <SettingsText CommandBatchEditCancel="Cancelar" CommandBatchEditPreviewChanges="Alterações" CommandBatchEditUpdate="Salvar" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Ano" ReadOnly="true" VisibleIndex="0" CellStyle-HorizontalAlign="Center" Width="150px">
                                                    <Settings ShowEditorInBatchEditMode="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="idFilial" Caption="idFilial" ReadOnly="true" VisibleIndex="1" CellStyle-HorizontalAlign="Left" Visible="false" Width="15px">
                                                    <Settings ShowEditorInBatchEditMode="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FilialLista" Caption="Filial" ReadOnly="true" VisibleIndex="1" CellStyle-HorizontalAlign="Left" Width="350px">
                                                    <Settings ShowEditorInBatchEditMode="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="perc" Caption="Percentual" VisibleIndex="2" Width="150px" CellStyle-HorizontalAlign="Center">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings ShowEditorInBatchEditMode="true" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="lastUpdate" Caption="Última Atualização" ReadOnly="true" HeaderStyle-Wrap="True" CellStyle-HorizontalAlign="Center" VisibleIndex="3" Width="250px">
                                                    <Settings ShowEditorInBatchEditMode="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <Styles>
                                                <Header HorizontalAlign="Center" Font-Bold="true" Font-Size="16">
                                                </Header>
                                                <AlternatingRow BackColor="#EFEFEF">
                                                </AlternatingRow>
                                                <Footer Font-Bold="True">
                                                </Footer>
                                            </Styles>
                                        </dx:ASPxGridView>

                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>"
                                            SelectCommand="	Select	*
	                                                    From	(
				                                                    SELECT	Distinct	
						                                                    [Ano]
					                                                    ,	[idFilial]
                                                                        ,	FilialLista
					                                                    ,	Max([perc]) as perc
					                                                    ,	Concat(Max(A.[dataAtu]),' ',Max(A.horaAtu)) as lastUpdate
					                                                    ,	Case 
							                                                    When A.idFilial between 1 and 100
								                                                    Then 'Lojas' 
							                                                    When A.idFilial between 600 and 699
								                                                    Then 'Atacado'
							                                                    When a.idFilial Between 700 and 799
								                                                    Then 'Hipermais'
							                                                    End As Tipo
				                                                    FROM	[gerManager].[Realizado].[tblReaQuebra]		As A With (NoLock) 
				                                                    Join	gerCadastros.Cadastros.tblCadFiliais		As B With (Nolock) On B.Filial		= A.idFilial
				                                                    Where	Ano = @sAno
				                                                    Group By Ano, idFilial, FilialLista
			                                                    ) As Vw
                                                       Where Tipo = @sTipo"
                                            UpdateCommand=" Update	[gerManager].[Realizado].[tblReaQuebra] 
			                                            Set		[perc] = @Perc 
				                                            ,	[dataAtu] = Convert(varchar(20),getdate(),103)
				                                            ,	[horaAtu] = CONVERT(VARCHAR(8), getdate(), 108)
                                                            ,   [matricula] = @usuario   
			                                            Where	Ano			=	@Ano
			                                            And		idFilial	=	@idFilial">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="sAno" SessionField="sAno" Type="String" />
                                                <asp:SessionParameter Name="sTipo" SessionField="sTipo" Type="String" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="Perc" Type="Decimal" />
                                                <asp:Parameter Name="Ano" Type="Int16" />
                                                <asp:Parameter Name="idFilial" Type="Int16" />
                                                <asp:SessionParameter Name="usuario" SessionField="sUSUARIO" Type="string" />
                                            </UpdateParameters>
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

