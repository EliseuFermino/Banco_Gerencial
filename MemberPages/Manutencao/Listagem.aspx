<%@ Page Title="Listagem Produto Sem Giro" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Listagem.aspx.vb" Inherits="MemberPages_Checklist_ProdutosSemGiro_Listagem" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDepto.ascx" TagPrefix="uc1" TagName="wucListaDepto" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >
               
        #divFilial {            
            float: left;
            margin-left: 10px;
        }

        #divDepartamento {
            clear: both;
            float: left;
            margin-left: -2px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divSize {            
            float: left;           
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divQuadrante1">

        <div id="divFilial">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>

        <div id="divDepartamento">
            <uc1:wucListaDepto runat="server" ID="cboDepto" />
        </div>

    </div>



    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>



    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="ID" Width="1000px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="Total de Produtos: {0:n0}" FieldName="CodProduto" SummaryType="Count" ShowInColumn="nomeProduto" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewCommandColumn FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" ButtonType="Image" Caption="Alterar" Width="60px" ShowEditButton="True" ShowCancelButton="True">
                                <CellStyle ForeColor="Blue">
                                </CellStyle>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="ID" ShowInCustomizationForm="True" VisibleIndex="1" ReadOnly="True" Visible="False">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="DiaProcessamento" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Dia da &lt;br&gt; Verificação" Width="80px">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="CodProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Produto" Width="70px">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="5" FixedStyle="Left" Caption="Descrição do Produto" Width="250px">
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="EAN" ShowInCustomizationForm="True" VisibleIndex="7" Width="110px">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Sistematica" ShowInCustomizationForm="True" VisibleIndex="8" Width="70px">
                                <EditFormSettings Visible="False" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descProdutoDeptoLista" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Departamento" Width="90px">
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descProdutoSecaoLista" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Seção" Width="90px">
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descProdutoGrupoLista" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Grupo" Width="90px">
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descProdutoSubgrupoLista" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Subgrupo" Width="90px">
                                <EditFormSettings Visible="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Dias_Sem_Saida" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Dias Sem &lt;br&gt; Saida" FixedStyle="Left" Width="80px">
                                <EditFormSettings Visible="False" />
                                <HeaderStyle BackColor="#0066FF" ForeColor="White" />
                                <CellStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Campo1" ShowInCustomizationForm="True" VisibleIndex="15" Width="70px" Caption="Estoque &lt;br&gt; Fisico">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Campo2" ShowInCustomizationForm="True" VisibleIndex="16" Caption="Estoque &lt;br&gt; Loja" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Campo3" ShowInCustomizationForm="True" VisibleIndex="17" Caption="Estoque &lt;br&gt; Trocas" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Campo4" ShowInCustomizationForm="True" VisibleIndex="18" Caption="Outros" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Campo5" ShowInCustomizationForm="True" VisibleIndex="19" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Estoque" ShowInCustomizationForm="True" VisibleIndex="13">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="EstoqueQtde" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Custo" FieldName="EstoqueCusto" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:c}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="EstoqueValor" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:c}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <EditFormSettings Visible="False" />
                                        <CellStyle Font-Bold="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        
                        <SettingsEditing Mode="PopupEditForm" />
                        <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
                        <SettingsText PopupEditFormCaption="Alteração" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <SettingsPopup>
                            <EditForm HorizontalAlign="OutsideLeft" Width="400px" />
                        </SettingsPopup>
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                        <StylesPopup>
                            <EditForm>
                                <Header Font-Bold="True">
                                </Header>
                            </EditForm>
                        </StylesPopup>
                        <SettingsCommandButton>
                            <EditButton>
                                <Image AlternateText="Alterar" Height="16px" Url="~/image/edit-icon-16.png" Width="16px">
                                </Image>
                            </EditButton>
                            <CancelButton Text="Cancelar"/>
                            <UpdateButton Text="Salvar">
                                <Image Width="50px">
                                </Image>
                            </UpdateButton>
                        </SettingsCommandButton>
                    </dx:ASPxGridView>                    
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="SELECT * FROM [tblProdutoSemGiro] WHERE ([idFilial] = @idFilial)" DeleteCommand="DELETE FROM [tblProdutoSemGiro] WHERE [ID] = @ID" InsertCommand="INSERT INTO [tblProdutoSemGiro] ([idFilial], [DiaProcessamento], [CodProduto], [nomeProduto], [EAN], [Sistematica], [descProdutoDeptoLista], [descProdutoSecaoLista], [descProdutoGrupoLista], [descProdutoSubgrupoLista], [Dias_Sem_Saida], [EstoqueQtde], [EstoqueCusto], [Campo1], [Campo2], [Campo3], [Campo4], [Campo5]) VALUES (@idFilial, @DiaProcessamento, @CodProduto, @nomeProduto, @EAN, @Sistematica, @descProdutoDeptoLista, @descProdutoSecaoLista, @descProdutoGrupoLista, @descProdutoSubgrupoLista, @Dias_Sem_Saida, @EstoqueQtde, @EstoqueCusto, @Campo1, @Campo2, @Campo3, @Campo4, @Campo5)" UpdateCommand="UPDATE [tblProdutoSemGiro] SET [idFilial] = @idFilial, [DiaProcessamento] = @DiaProcessamento, [CodProduto] = @CodProduto, [nomeProduto] = @nomeProduto, [EAN] = @EAN, [Sistematica] = @Sistematica, [descProdutoDeptoLista] = @descProdutoDeptoLista, [descProdutoSecaoLista] = @descProdutoSecaoLista, [descProdutoGrupoLista] = @descProdutoGrupoLista, [descProdutoSubgrupoLista] = @descProdutoSubgrupoLista, [Dias_Sem_Saida] = @Dias_Sem_Saida, [EstoqueQtde] = @EstoqueQtde, [EstoqueCusto] = @EstoqueCusto, [Campo1] = @Campo1, [Campo2] = @Campo2, [Campo3] = @Campo3, [Campo4] = @Campo4, [Campo5] = @Campo5 WHERE [ID] = @ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="idFilial" Type="Byte" />
                            <asp:Parameter DbType="Date" Name="DiaProcessamento" />
                            <asp:Parameter Name="CodProduto" Type="Int32" />
                            <asp:Parameter Name="nomeProduto" Type="String" />
                            <asp:Parameter Name="EAN" Type="String" />
                            <asp:Parameter Name="Sistematica" Type="Byte" />
                            <asp:Parameter Name="descProdutoDeptoLista" Type="String" />
                            <asp:Parameter Name="descProdutoSecaoLista" Type="String" />
                            <asp:Parameter Name="descProdutoGrupoLista" Type="String" />
                            <asp:Parameter Name="descProdutoSubgrupoLista" Type="String" />
                            <asp:Parameter Name="Dias_Sem_Saida" Type="Int16" />
                            <asp:Parameter Name="EstoqueQtde" Type="Decimal" />
                            <asp:Parameter Name="EstoqueCusto" Type="Decimal" />
                            <asp:Parameter Name="Campo1" Type="Decimal" />
                            <asp:Parameter Name="Campo2" Type="Decimal" />
                            <asp:Parameter Name="Campo3" Type="Decimal" />
                            <asp:Parameter Name="Campo4" Type="Decimal" />
                            <asp:Parameter Name="Campo5" Type="Decimal" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" DefaultValue="28" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="idFilial" Type="Byte" />
                            <asp:Parameter Name="DiaProcessamento" DbType="Date" />
                            <asp:Parameter Name="CodProduto" Type="Int32" />
                            <asp:Parameter Name="nomeProduto" Type="String" />
                            <asp:Parameter Name="EAN" Type="String" />
                            <asp:Parameter Name="Sistematica" Type="Byte" />
                            <asp:Parameter Name="descProdutoDeptoLista" Type="String" />
                            <asp:Parameter Name="descProdutoSecaoLista" Type="String" />
                            <asp:Parameter Name="descProdutoGrupoLista" Type="String" />
                            <asp:Parameter Name="descProdutoSubgrupoLista" Type="String" />
                            <asp:Parameter Name="Dias_Sem_Saida" Type="Int16" />
                            <asp:Parameter Name="EstoqueQtde" Type="Decimal" />
                            <asp:Parameter Name="EstoqueCusto" Type="Decimal" />
                            <asp:Parameter Name="Campo1" Type="Decimal" />
                            <asp:Parameter Name="Campo2" Type="Decimal" />
                            <asp:Parameter Name="Campo3" Type="Decimal" />
                            <asp:Parameter Name="Campo4" Type="Decimal" />
                            <asp:Parameter Name="Campo5" Type="Decimal" />
                            <asp:Parameter Name="ID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


</asp:Content>

