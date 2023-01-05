<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucFornecedor.ascx.vb" Inherits="Controles_wucFornecedor" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>








   <script lang="javascript" type ="text/javascript">
       function OnGridFocusedRowChanged()
       {
           gridFiltroFornecedor.GetRowValues(gridFiltroFornecedor.GetFocusedRowIndex(), 'idFornecedor;nomeFornecedor', OnGetRowValues);
       }

       function OnGetRowValues(values)
       {
           txtFornecedorcodigoEncontrado.SetText(values[0]);
           txtFornecedorNomeEncontrado.SetText(values[1]);
       }

    </script>

   <style type="text/css">

        #divFornecedorCaption {
            clear:both;
            float: left; 
            margin-left: 2px;
            margin-top: 3px;
        }

        #divFornecedorEncontrado {
            float: left;
            margin-left: 2px;
        }

        #divFornecedorNomeEncontrado {
            float: left;
            margin-left: 1px;
        }

        #divFiltro_FornecedorLegenda {
            clear:both;
            float: left; 
            margin-top: 3px;           
        }

        #divFiltro_FornecedorInforma {
            float: left;
            margin-left: 2px;        
        }

        #divFiltro_Grid_Fornecedor {
            clear: both;
            float: left;            
            margin-top: 5px;
        }

        #divfiltro_SelecaoStatus_Fornecedor {
            float: left;
            margin-left: 10px;   
        }

        #divBotaoFornecedor {
            float: left;
            margin-left: 0px;           
       }

       #divCNPJ_Principal {
            float: left;
            margin-left: 10px;           
       }

    </style>


    <dx:ASPxCallbackPanel ID="cbPanelFornecedor" runat="server" ClientInstanceName="cbPanelFornecedor" SettingsLoadingPanel-Text="Aguarde. Buscando informações...&amp;hellip;">
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1_Fornecedor" runat="server" SupportsDisabledAttribute="True">

                <div id="divFornecedorCaption">
                    Fornecedor:
                </div>

                <div id="divFornecedorEncontrado">
                    <dx:ASPxTextBox ID="txtFornecedorcodigoEncontrado" runat="server" HorizontalAlign="Center" ForeColor="#666666" Width="80px" Height="25px" Font-Size="14px" ClientInstanceName="txtFornecedorcodigoEncontrado" >
                        <ClientSideEvents TextChanged="function(s, e) {
	cbPanelFornecedor.PerformCallback();
}" />
                    </dx:ASPxTextBox>
                </div>

                <div id="divFornecedorNomeEncontrado">
                    <dx:ASPxTextBox ID="txtFornecedorNomeEncontrado" runat="server" Width="305px" Height="25px" ForeColor="#666666" ReadOnly="true" Font-Size="14px" ClientInstanceName="txtFornecedorNomeEncontrado"  ></dx:ASPxTextBox>
                </div>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>

    <div id="divBotaoFornecedor">
        <dx:ASPxButton ID="ShowButton" runat="server" Text="Fornecedor" Theme="SoftOrange" Width="30px" Height="25px" AutoPostBack="False" />
    </div>

    <div id="divCNPJ_Principal">
        <dx:ASPxCheckBox ID="chkCNPJ_Principal" runat="server" Checked="false" Theme="DevEx" Text="CNPJ Principal" ></dx:ASPxCheckBox>
    </div>

    <dx:ASPxPopupControl ID="myPopupControl_Fornecedor" runat="server" CloseAction="OuterMouseClick" LoadContentViaCallback="OnFirstShow" Theme="SoftOrange"
                         PopupElementID="ShowButton" PopupVerticalAlign="Below" PopupHorizontalAlign="LeftSides" AllowDragging="True" Width="560px" Height="300px" HeaderText="Encontrar Fornecedor" ClientInstanceName="ClientPopupControl_Fornecedor" SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;">
        


        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl_Fornecedor" runat="server">

            <div id="divFiltro_FornecedorLegenda">
                Informe o Nome do fornecedor: 
            </div>

            <div id="divFiltro_FornecedorInforma">
                <dx:ASPxTextBox ID="txtFiltro_FornecedorInforma" runat="server" Width="200px" Theme="SoftOrange" >
                    <ClientSideEvents TextChanged="function(s, e) {	ClientPopupControl_Fornecedor.PerformCallback();}" />
                </dx:ASPxTextBox>
            </div>

            <div id="divfiltro_SelecaoStatus_Fornecedor">
                <dx:ASPxComboBox ID="cboFiltroStatus_Fornecedor" runat="server" ValueType="System.String" Width="130px" SelectedIndex="0" Theme="SoftOrange" ToolTip="Se o Fornecedor esta Ativo ou Inativo.">

                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	ClientPopupControl_Fornecedor.PerformCallback();
}" />

                    <Items>
                        <dx:ListEditItem Text="ATIVO" Value="1" Selected="True" />
                        <dx:ListEditItem Text="INATIVO" Value="0" />                        
                    </Items>

                </dx:ASPxComboBox>
            </div>

            <div id="divFiltro_Grid_Fornecedor">
                <dx:ASPxGridView ID="gridFiltroFornecedor" runat="server" DataSourceID="dsFiltroFornecedor" AutoGenerateColumns="False" KeyFieldName="idFornecedor" Width="550px" Theme="Default" ClientInstanceName="gridFiltroFornecedor" EnableTheming="True" >
                    <ClientSideEvents RowDblClick="function(s, e) {
	OnGridFocusedRowChanged();
	ClientPopupControl_Fornecedor.Hide();

}" />
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="Total de Fornecedores: {0:n0}" FieldName="idFornecedor" ShowInColumn="nomeFornecedor" SummaryType="Count" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Código" FieldName="idFornecedor" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Descrição do Fornecedor" FieldName="nomeFornecedor" ShowInCustomizationForm="True" VisibleIndex="1" Width="300px">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        
                        <dx:GridViewDataTextColumn Caption="CGC" FieldName="CGC" ShowInCustomizationForm="True" ToolTip="CGC no Fornecedor" VisibleIndex="2" Width="150px">
                        </dx:GridViewDataTextColumn>
                        
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings ShowFilterRow="True" VerticalScrollableHeight="250" VerticalScrollBarMode="Auto" ShowFooter="True" />
                    <SettingsText EmptyDataRow="Não há fornecedores para essa seleção" />
                    <SettingsLoadingPanel Text="Buscando fornecedor&amp;hellip;" />
                    <Styles>
                        <Header HorizontalAlign="Center">
                        </Header>
                        <AlternatingRow BackColor="#F0F0F0">
                        </AlternatingRow>
                        <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="Blue">
                        </FocusedRow>
                    </Styles>
                </dx:ASPxGridView>
                
                <asp:SqlDataSource ID="dsFiltroFornecedor" runat="server" ConnectionString="<%$ ConnectionStrings:gerKnowledgeConnectionString %>" SelectCommand="Fornecedor.uspBuscarPeloNome" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="SQL_STRING" SessionField="sFORNECEDOR_ENCONTRA" Type="String" /> 
                        <asp:SessionParameter Name="SQL_ATIVO" SessionField="sSTATUS" Type="String" />
                                                                     
                    </SelectParameters>
                </asp:SqlDataSource>

            </div>

            </dx:PopupControlContentControl>
        </ContentCollection>


    </dx:ASPxPopupControl>







