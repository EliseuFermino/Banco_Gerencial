<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucProdutoEncontra.ascx.vb" Inherits="Controles_wucProdutoEncontra" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



   <script lang="javascript" type ="text/javascript">
       function OnGridFocusedRowChanged()
       {
           gridFiltroProduto.GetRowValues(gridFiltroProduto.GetFocusedRowIndex(), 'idProduto;nomeProduto;Ativo', OnGetRowValues);
       }      

       function OnGetRowValues(values)
       {
           txtProdutocodigoEncontrado.SetText(values[0]);
           txtProdutoNomeEncontrado.SetText(values[1]);           
       }
     
    </script>

   <style type="text/css">

        #divProdutoCaption {
            clear:both;
            float: left; 
            margin-left: 2px;
            margin-top: 3px;
        }

        #divProdutoEncontrado {
            float: left;
            margin-left: 2px;
        }

        #divProdutoNomeEncontrado {
            float: left;
            margin-left: 1px;
        }

        #divFiltro_ProdutoLegenda {
            clear:both;
            float: left; 
            margin-top: 3px;           
        }

        #divFiltro_ProdutoInforma {
            float: left;
            margin-left: 2px;        
        }

        #divFiltro_Grid {
            clear: both;
            float: left;            
            margin-top: 5px;
        }

        #divfiltro_SelecaoStatus {
            float: left;
            margin-left: 10px;   
        }

    </style>


    <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="cbPanelProduto" SettingsLoadingPanel-Text="Aguarde. Buscando informações...&amp;hellip;">
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">

                <div id="divProdutoCaption">
                    Produto:
                </div>

                <div id="divProdutoEncontrado">
                    <dx:ASPxTextBox ID="txtProdutocodigoEncontrado" runat="server" HorizontalAlign="Center" ForeColor="#666666" Width="80px" Height="25px" Font-Size="14px" ClientInstanceName="txtProdutocodigoEncontrado" >
                        <ClientSideEvents TextChanged="function(s, e) {
	cbPanelProduto.PerformCallback();
}" />
                    </dx:ASPxTextBox>
                </div>

                <div id="divProdutoNomeEncontrado">
                    <dx:ASPxTextBox ID="txtProdutoNomeEncontrado" runat="server" Width="305px" Height="25px" ForeColor="#666666" ReadOnly="true" Font-Size="14px" ClientInstanceName="txtProdutoNomeEncontrado"  ></dx:ASPxTextBox>
                </div>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>

    <div>
        <dx:ASPxButton ID="ShowButton" runat="server" Text="Produto" Theme="SoftOrange" Width="30px" Height="25px" AutoPostBack="False" />
    </div>

    <dx:ASPxPopupControl ID="myPopupControl" runat="server" CloseAction="OuterMouseClick" LoadContentViaCallback="OnFirstShow" Theme="SoftOrange"
                         PopupElementID="ShowButton" PopupVerticalAlign="Below" PopupHorizontalAlign="LeftSides" AllowDragging="True" Width="560px" Height="300px" HeaderText="Encontrar Produto" ClientInstanceName="ClientPopupControl" SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;">
        


<SettingsLoadingPanel Text="Aguarde. Atualizando&amp;hellip;"></SettingsLoadingPanel>
        


        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl" runat="server">

            <div id="divFiltro_ProdutoLegenda">
                Informe a Descrição do produto: 
            </div>

            <div id="divFiltro_ProdutoInforma">
                <dx:ASPxTextBox ID="txtFiltro_ProdutoInforma" runat="server" Width="200px" Theme="SoftOrange" >
                    <ClientSideEvents TextChanged="function(s, e) {	
ClientPopupControl.PerformCallback();
}" />
                </dx:ASPxTextBox>
            </div>

            <div id="divfiltro_SelecaoStatus">
                <dx:ASPxComboBox ID="cboFiltroStatus" runat="server" ValueType="System.String" Width="130px" SelectedIndex="0" Theme="SoftOrange" ToolTip="Se o Produto esta Ativo, Fora de Linha ou Descontinuado.">

                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	ClientPopupControl.PerformCallback();
}" />

                    <Items>
                        <dx:ListEditItem Text="ATIVO" Value="ATIVO" Selected="True" />
                        <dx:ListEditItem Text="FORA DE LINHA" Value="FORA DE LINHA" />
                        <dx:ListEditItem Text="DESCONTINUADO" Value="DESCONTINUADO" />
                    </Items>

                </dx:ASPxComboBox>
            </div>

            <div id="divFiltro_Grid">
                <dx:ASPxGridView ID="gridFiltroProduto" runat="server" DataSourceID="dsFiltroProduto" AutoGenerateColumns="False" KeyFieldName="idProduto" Width="550px" Theme="Default" ClientInstanceName="gridFiltroProduto" EnableTheming="True" >
                    <ClientSideEvents RowDblClick="function(s, e) {
	OnGridFocusedRowChanged();
	ClientPopupControl.Hide();

}" />
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="Total de Produtos: {0:n0}" FieldName="idProduto" ShowInColumn="nomeProduto" SummaryType="Count" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Código" FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="1" Width="300px">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Seção" FieldName="Ativo" ShowInCustomizationForm="True" ToolTip="Seção do produto." VisibleIndex="3" Width="150px">
                            <Settings AutoFilterCondition="Contains" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings ShowFilterRow="True" VerticalScrollableHeight="250" VerticalScrollBarMode="Auto" ShowFooter="True" />
                    <SettingsText EmptyDataRow="Não há produtos para essa seleção" />
                    <SettingsLoadingPanel Text="Buscando produtos&amp;hellip;" />
                    <Styles>
                        <Header HorizontalAlign="Center">
                        </Header>
                        <AlternatingRow BackColor="#F0F0F0">
                        </AlternatingRow>
                        <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="Blue">
                        </FocusedRow>
                    </Styles>
                </dx:ASPxGridView>
                
                <asp:SqlDataSource ID="dsFiltroProduto" runat="server" ConnectionString="<%$ ConnectionStrings:gerKnowledgeConnectionString %>" SelectCommand="Cadastros.uspBuscarItemPeloNome" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="SQL_STRING" SessionField="sPRODUTO_PROCURA" Type="String" />
                        <asp:SessionParameter Name="SQL_STATUS" SessionField="sSTATUS" Type="String" />                        
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>

            </dx:PopupControlContentControl>
        </ContentCollection>


    </dx:ASPxPopupControl>
