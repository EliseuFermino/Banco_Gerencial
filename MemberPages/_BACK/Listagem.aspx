<%@ Page Title="Listagem Produto Sem Giro" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Listagem.aspx.vb" Inherits="MemberPages_Checklist_ProdutosSemGiro_Listagem" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>

<%@ Register Src="~/Controles/wucListaDepto.ascx" TagPrefix="uc1" TagName="wucListaDepto" %>
<%@ Register Src="~/Controles/wucAguarde.ascx" TagPrefix="uc1" TagName="wucAguarde" %>
<%@ Register Src="~/Controles/wucAguardeRoda.ascx" TagPrefix="uc1" TagName="wucAguardeRoda" %>

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
            margin-top: 5px;
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
            margin-top: 3px;
            width: 100%;
        }

        #divDias {
            float: left;
            margin-left: 5px;
            padding-left: 5px;
            padding-top: 5px;
        }

        #divTodos {
            float: left;
            margin-left: 5px;
            padding-left: 5px;
            padding-top: 5px;
        }

        #divDiasTexto {
            clear:both; 
            float:left; 
            margin-left: 9px;
            padding-top: 7px;
        }

        .Quadrante {            
            float: left;
            border: 1px solid gray;
            margin: 2px;
            padding: 2px 2px 2px 2px;
        }

        #divQuadrante1 {            
            float: left;
            border: 1px solid gray;
            margin: 2px;
            height: 80px;
        }

        #divQuadrante2 {            
            float: left;
            border: 1px solid gray;
            margin: 2px;
            height: 80px;
            background-color: lightcoral;
        }

        #divQuadrante3 {            
            float: left;
            border: 1px solid gray;
            margin: 2px;
            height: 80px;
            background-color: yellow;
        }

        #divQuadrante4 {            
            float: left;
            border: 1px solid gray;
            margin: 2px;
            height: 80px;
            background-color: lightgreen;
            width: 125px;
        }

        #divClass {  
            clear:both;          
            float: left;
            margin-left: 560px;
            margin-top: -30px;
        }

        #divClassCaption {  
            clear:both;          
            float: left;
            margin-left: 560px;
            margin-top: -50px;
        }

    </style>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">    
        <ContentTemplate>    

    <div id="divQuadrante1" class="Quadrante">

        <div id="divFilial">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>

        <div id="divDepartamento">
            <uc1:wucListaDepto runat="server" ID="cboDepto" />
        </div>

        <div id="divDias">           
            <dx:ASPxTextBox ID="txtDias" runat="server" Width="40px" Text="3" Font-Size="14px" HorizontalAlign="Center" ClientInstanceName="Dias" Caption="Dias"></dx:ASPxTextBox>
        </div>

        <div id="divTodos">           
            <dx:ASPxCheckBox ID="chkTodos" runat="server" Theme="DevEx" Checked="false" ForeColor="Blue" Text="Todos Produtos" ToolTip="Quando selecionado exibe todos os produtos de todos os Mercadológicos." ></dx:ASPxCheckBox>  
        </div>

    </div>
            
    <div id="divQuadrante2" class="Quadrante">
        <dx:ASPxListBox ID="chkSituacao" runat="server" SelectedIndex="1" Theme="DevEx" SelectionMode="CheckColumn" Height="75px" Width="155px">
            <Items>
                <dx:ListEditItem Text="DESCONTINUADO" Value="2" />
                <dx:ListEditItem Selected="True" Text="ATIVO" Value="1" />
                <dx:ListEditItem Selected="True" Text="FORA DE LINHA" Value="3" />
            </Items>
        </dx:ASPxListBox>
    </div>

    <div id="divQuadrante3" class="Quadrante">
        <dx:ASPxListBox ID="chkSistematica" runat="server" SelectedIndex="2" Theme="DevEx" SelectionMode="CheckColumn" Height="75px" Width="155px">
            <Items>
                <dx:ListEditItem Text="SISTEMÁTICA 1" Value="1" />
                <dx:ListEditItem Text="SISTEMÁTICA 10" Value="10" />
                <dx:ListEditItem Selected="True" Text="SISTEMÁTICA 20" Value="20" />
            </Items>
        </dx:ASPxListBox>
    </div>

    <div id="divQuadrante4" class="Quadrante">
        <dx:ASPxCheckBox ID="chkClassif_A" runat="server" Text="Classificação A" AutoPostBack="true" OnCheckedChanged="chk_CheckedChanged" Theme="DevEx" Checked="True" CheckState="Checked"></dx:ASPxCheckBox>        
        <dx:ASPxCheckBox ID="chkClassif_B" runat="server" Text="Classificação B" AutoPostBack="true"  OnCheckedChanged="chk_CheckedChanged" Theme="DevEx"></dx:ASPxCheckBox> 
        <dx:ASPxCheckBox ID="chkClassif_C" runat="server" Text="Classificação C" AutoPostBack="true"  OnCheckedChanged="chk_CheckedChanged" Theme="DevEx"></dx:ASPxCheckBox> 
    </div>

        <uc1:wucAguarde runat="server" ID="wucAguarde" />    

        </ContentTemplate>
    </asp:UpdatePanel>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="Metropolis" AllowFocus="False" UseSubmitBehavior="False">           
        </dx:ASPxButton>
    </div>   

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divDados">
        
        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="ID" Width="100%">
            <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total de Produtos: {0:n0}" FieldName="CodProduto" SummaryType="Count" ShowInColumn="nomeProduto" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaMedia" SummaryType="Sum" />
            </TotalSummary>
            <Columns>
                <dx:GridViewCommandColumn ButtonType="Image" Caption="Alterar" FixedStyle="Left" VisibleIndex="0" Width="55px" ShowEditButton="True" ShowClearFilterButton="True"/>
                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="2" ReadOnly="True" Visible="False">
                    <Settings AllowAutoFilter="False" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idFilial" Visible="False" VisibleIndex="3">
                    <Settings AllowAutoFilter="False" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProduto" FixedStyle="Left" VisibleIndex="4" Caption="Produto" Width="70px">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="nomeProduto" VisibleIndex="5" FixedStyle="Left" Caption="Descrição do Produto" Width="250px">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                    <CellStyle Wrap="False"></CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Última &lt;br&gt; Saida" FieldName="Ultima_Saida" VisibleIndex="9" Width="90px">
                    <EditFormSettings Visible="False" />
                    <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EAN" VisibleIndex="10" Width="110px">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Sistematica" VisibleIndex="11" Width="50px" Caption="Siste-&lt;br&gt;mática">
                    <EditFormSettings Visible="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descProdutoDeptoLista" VisibleIndex="12" Caption="Departamento" Width="90px">
                    <Settings AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descProdutoSecaoLista" VisibleIndex="13" Caption="Seção" Width="90px">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descProdutoGrupoLista" VisibleIndex="14" Caption="Grupo" Width="90px">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descProdutoSubgrupoLista" VisibleIndex="15" Caption="Subgrupo" Width="90px">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Classificacao" VisibleIndex="6" Caption="Classi-&lt;br&gt;ficação" FixedStyle="Left" Width="50px" ToolTip="Classificação do Produto: A, B ou C.">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Dias Sem &lt;br&gt; Venda" FieldName="Dias_Sem_Saida" FixedStyle="Left" VisibleIndex="8" Width="65px">
                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                    <EditFormSettings Visible="False" />
                    <HeaderStyle BackColor="#0066FF" ForeColor="White" />
                    <CellStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Estoque" VisibleIndex="16">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="EstoqueQtde" VisibleIndex="0" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AutoFilterCondition="NotEqual" />
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Custo" FieldName="EstoqueCusto" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:c}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ultima Entrada" FieldName="Ultima_Entrada" VisibleIndex="2" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <CellStyle Font-Bold="False" ForeColor="Blue" HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <HeaderStyle BackColor="#CCCC00" />
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn Caption="Fisico &lt;br&gt; Área de Venda" FieldName="Campo1" VisibleIndex="18" Width="90px">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Fisico &lt;br&gt; Depósito" FieldName="Campo2" VisibleIndex="19" Width="80px">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Fisico &lt;br&gt; Trocas" FieldName="Campo3" VisibleIndex="20" Width="80px">
                    <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total &lt;br&gt; Fisico" FieldName="vlrTotalFisico" VisibleIndex="21" Width="60px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <HeaderStyle BackColor="#0066FF" ForeColor="White" />
                    <CellStyle Font-Bold="True" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Diver-&lt;br&gt;gência" FieldName="vlrDivergencia" VisibleIndex="22" Width="60px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <HeaderStyle BackColor="#0066FF" ForeColor="White" />
                    <CellStyle Font-Bold="True" HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Perdas de Vendas" VisibleIndex="17">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="VolumeMedio" VisibleIndex="0" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Preço " FieldName="vlrPrecoVenda" VisibleIndex="1" Width="60px" ToolTip="Preço de Venda">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="R$ " FieldName="VendaMedia" ToolTip="Projeção de Venda Diaria" VisibleIndex="2" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn Caption="PBL" FieldName="PBL" FixedStyle="Left" VisibleIndex="7" Width="50px">
                    <Settings AutoFilterCondition="Contains" />
                    <HeaderStyle BackColor="Red" ForeColor="White" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Fornecedor Principal" VisibleIndex="23">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="CGC" FieldName="cgcPrincipal" VisibleIndex="0">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Fornecedor" FieldName="NomeFornecedorPrincipal" VisibleIndex="1" Width="200px" >
                            <Settings AutoFilterCondition="Contains" />
                             <CellStyle Wrap="False"></CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Fornecedor" VisibleIndex="1" FixedStyle="Left">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Codigo" FieldName="idFornecedor" VisibleIndex="0">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Fornecedor" FieldName="nomeFornecedor" VisibleIndex="1" Width="200px">
                            <Settings AutoFilterCondition="Contains" />
                             <CellStyle Wrap="False"></CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
            <SettingsPager PageSize="15">
            </SettingsPager>
                        
            <SettingsEditing Mode="Inline" />
            <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="400" ShowFilterRow="True" />
            <SettingsText PopupEditFormCaption="Alteração" />
            <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
            <SettingsPopup>
                <EditForm HorizontalAlign="OutsideLeft" Width="400px" />
            </SettingsPopup>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
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
                    <Image Url="~/image/edit-icon-16.png">
                    </Image>
                </EditButton>
                <CancelButton Text="Cancelar">
                    <Image Url="~/image/check_no.png" Width="20px">
                    </Image>
                </CancelButton>
                <UpdateButton Text="Salvar">
                    <Image Url="~/image/check_16.png" Width="20px">
                    </Image>
                </UpdateButton>
            </SettingsCommandButton>
        </dx:ASPxGridView>                    
                    
        <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="SELECT [ID], [idFilial], [DiaProcessamento], [nomeProduto], [CodProduto], [EAN], [PBL], [Sistematica], [EstoqueCusto], [EstoqueQtde], [Dias_Sem_Saida], [descProdutoSubgrupoLista], [descProdutoGrupoLista], [descProdutoSecaoLista], [descProdutoDeptoLista], [Campo1], [Campo2], [Campo3], [Campo4], [Campo5], [Usuario], [Ultima_Saida],[vlrTotalFisico],[vlrDivergencia],[Classificacao],[vlrPrecoVenda],[VolumeMedio],[VendaMedia],[Ultima_Entrada], cgcPrincipal, NomeFornecedorPrincipal, idFornecedor, nomeFornecedor FROM [tblProdutoSemGiro] WHERE ([Usuario] = @Usuario AND [DiaProcessamento]=@DiaHoje)" UpdateCommand="UPDATE [tblProdutoSemGiro] SET [Campo1] = @Campo1, [Campo2] = @Campo2, [Campo3] = @Campo3, [Campo4] = @Campo4, [Campo5] = @Campo5 WHERE [ID] = @ID">
            
            <SelectParameters>
                <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                <asp:SessionParameter Name="DiaHoje" SessionField="sDiaHoje" Type="DateTime" />
            </SelectParameters>
            <UpdateParameters>                
                <asp:Parameter Name="Campo1" Type="Decimal" />
                <asp:Parameter Name="Campo2" Type="Decimal" />
                <asp:Parameter Name="Campo3" Type="Decimal" />
                <asp:Parameter Name="Campo4" Type="Decimal" />
                <asp:Parameter Name="Campo5" Type="Decimal" />          
            </UpdateParameters>
        </asp:SqlDataSource>   
        
        <br />    
        
        <asp:Label ID="lblOBS" runat="server" Text="" Font-Size="Larger" ForeColor="Red"></asp:Label>         
             
        <dx:ASPxGridView ID="gridTotal" runat="server" DataSourceID="dsTotalPorLoja" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="CodLoja" Theme="SoftOrange" Width="260px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ProjecaoVendaDia" SummaryType="Sum" />
            </TotalSummary>
            <Columns>
                <dx:GridViewDataTextColumn Caption="Filial" FieldName="CodLoja" VisibleIndex="0" Width="140px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Projeção Dia" FieldName="ProjecaoVendaDia" ReadOnly="True" VisibleIndex="1">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" />
            <Styles>
                <AlternatingRow BackColor="#E8E8E8">
                </AlternatingRow>
                <Footer Font-Bold="True">
                </Footer>
            </Styles>

        </dx:ASPxGridView>
                   
        <asp:SqlDataSource ID="dsTotalPorLoja" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Giro.uspTotalPorLoja" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Dias" SessionField="sDIAS" Type="Byte" />
                <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                <asp:SessionParameter Name="idDepto" SessionField="sDEPTO" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>

                   
    </div>

    

</asp:Content>

