<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Objtivo_Estrategico_Nivel_3_Lista.aspx.vb" Inherits="MemberPages_Projetos_Mandala_Objtivo_Estrategico_Nivel_3_Lista" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>








<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <script type ="text/javascript">
        function OnGridFocusedRowChanged() {
            grid_Nivel3.GetRowValues(grid_Nivel3.GetFocusedRowIndex(), 'COD;Obj_Estr_N2_ID;Objetivo_Estrategico_Desc1;Responsavel;Obj_Estr_N3_ID;Objetivo_Estrategico_Desc2;Participantes;TempoExecucao;DataInicio;DataFim;Dependencia;Estimativa;Objetivo_Estrategico_Desc;idStatus', OnGetRowValues);
        }

        function OnGetRowValues(values) {
           
            txtCOD.SetText(values[0]);
            txt_Nivel3.SetText(values[0]);
            txt_Responsavel.SetText(values[3]);
            txt_PlanoAcao.SetText(values[5]);
            txt_DataInicial.SetDate(values[8]);
            txt_DataFinal.SetDate(values[9]);
            cboStatus.SetText(values[13]);
        }

    </script> 
    
    <style type="text/css">
        .auto-style3 {
            height: 31px;
        }

        #divAtualizar{
            clear:both;
            float: left;
            margin-left: 5px;
        }

        #divExcel{         
            float: left;
            margin-left: 10px;
        }

        

    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAtualizar">
        <dx:ASPxButton ID="btnVoltar" runat="server" Text="Voltar" Theme="Metropolis"></dx:ASPxButton>
    </div>

    <div id="divExcel">
        <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="grid_Nivel3" GuiaNome="Plano de Ação" />
    </div>

 

        <dx:ASPxGridView ID="grid_Nivel3" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="COD" EnableTheming="True" Theme="SoftOrange" Width="99%" ClientInstanceName="grid_Nivel3">
            <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged();
}" RowDblClick="function(s, e) {
	popForm.Show();
}" />
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total de Plano de Ações: {0:n0}" FieldName="Obj_Estr_N2_ID" ShowInColumn="Objetivo_Estrategico_Desc2" SummaryType="Count" />
            </TotalSummary>
            <Columns>
                <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                <dx:GridViewDataTextColumn FieldName="Objetivo_Estrategico_Desc" VisibleIndex="15" Caption="Objetivo Esgtratégico - Nivel 1" Width="350px">
                    <Settings AllowAutoFilter="False" AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idStatus" VisibleIndex="8" Caption="Status" Width="110px">
                    <HeaderStyle BackColor="#66FF66" ForeColor="#003300" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lider" VisibleIndex="13">
                    <Settings AllowAutoFilter="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Objetivo_Estrategico_Desc1" VisibleIndex="12" Caption="Ação Esgtratégica - Nivel 2" Width="400px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Responsavel" VisibleIndex="3">
                    <Settings AutoFilterCondition="Contains" />
                    <HeaderStyle BackColor="#66FF66" ForeColor="#003300" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Obj_Estr_N3_ID" ReadOnly="True" VisibleIndex="1" Caption="Nivel 3" Width="50px" FixedStyle="Left">
                    <Settings AutoFilterCondition="Contains" />
                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Objetivo_Estrategico_Desc2" VisibleIndex="2" Caption="Plano de Ação" Width="400px" FixedStyle="Left">
                    <Settings AutoFilterCondition="Contains" />
                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                    <CellStyle Wrap="True">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Participantes" VisibleIndex="4">
                    <Settings AutoFilterCondition="Contains" />
                    <HeaderStyle BackColor="#66FF66" ForeColor="#003300" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TempoExecucao" VisibleIndex="10" Caption="Tempo de Execução" Width="130px">
                    <HeaderStyle BackColor="#66FF66" ForeColor="#003300" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DataInicio" VisibleIndex="5">
                    <HeaderStyle BackColor="#66FF66" ForeColor="#003300" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="DataFim" VisibleIndex="6">
                    <HeaderStyle BackColor="#66FF66" ForeColor="#003300" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Dependencia" VisibleIndex="11">
                    <Settings AutoFilterCondition="Contains" />
                    <HeaderStyle BackColor="#66FF66" ForeColor="#003300" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Estimativa" VisibleIndex="7">
                    <Settings AutoFilterCondition="Contains" />
                    <HeaderStyle BackColor="#66FF66" ForeColor="#003300" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="COD" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ColumnResizeMode="Control" AllowFocusedRow="True" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings HorizontalScrollBarMode="Visible" ShowFilterRow="True" ShowGroupPanel="True" VerticalScrollableHeight="525" VerticalScrollBarMode="Auto" ShowFooter="True" />
            <SettingsDataSecurity AllowReadUnlistedFieldsFromClientApi="True" />
            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
            <Styles>
                <AlternatingRow BackColor="#E0E0E0">
                </AlternatingRow>
                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                </FocusedRow>
                <Footer Font-Size="Large">
                </Footer>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="Objetivo_Estrategico.usp_BuscarNivel3" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="idNivel_1" QueryStringField="nivel2" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="dsDados_Todos" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="Objetivo_Estrategico.usp_BuscarNivel_Todos" SelectCommandType="StoredProcedure">
          
        </asp:SqlDataSource>
   

 <div id="divDados">
     <dx:ASPxPopupControl ID="popForm" runat="server" ClientInstanceName="popForm" AllowDragging="True"              
            HeaderText="Alterações..." Height="200px" Modal="True" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
            Width="320px">

         <ContentCollection>
        <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
            <table class="dxflInternalEditorTable_Office2010Silver">
                <tr>
                    <td class="auto-style3">ID. Plano de Ação:</td>
                    <td class="auto-style3">
                        <dx:ASPxTextBox ID="txt_Nivel3" runat="server" ClientInstanceName="txt_Nivel3" Font-Size="Medium" Width="100px" ReadOnly="True">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style3">Responsável:</td>
                    <td class="auto-style3">
                        <dx:ASPxTextBox ID="txt_Responsavel" runat="server" ClientInstanceName="txt_Responsavel" Font-Size="Medium" Width="150px">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Plano de Ação:</td>
                    <td class="auto-style3">
                        <dx:ASPxTextBox ID="txt_PlanoAcao" runat="server" ClientInstanceName="txt_PlanoAcao" Font-Size="Medium" Width="350px">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="auto-style3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Data Inicial:</td>
                    <td class="auto-style3">
                        <dx:ASPxDateEdit ID="txt_DataInicial" runat="server" ClientInstanceName="txt_DataInicial" Width="110px">
                        </dx:ASPxDateEdit>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td class="auto-style3">Data Final: </td>
                    <td class="auto-style3">
                        <dx:ASPxDateEdit ID="txt_DataFinal" runat="server" ClientInstanceName="txt_DataFinal" Width="110px">
                        </dx:ASPxDateEdit>
                    </td>
                    <td class="auto-style3"></td>
                </tr>
                <tr>
                    <td>Status:</td>
                    <td>
                        <dx:ASPxComboBox ID="cboStatus" runat="server" SelectedIndex="0" ClientInstanceName="cboStatus">
                            <Items>
                                <dx:ListEditItem Selected="True" Text="Não Iniciado" Value="0" />
                                <dx:ListEditItem Text="Em Andamento" Value="1" />
                                <dx:ListEditItem Text="Concluido" Value="2" />
                                <dx:ListEditItem Text="Atrasado" Value="3" />
                                <dx:ListEditItem Text="Abortado" Value="4" />
                            </Items>
                        </dx:ASPxComboBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <dx:ASPxButton ID="btnSalvar" runat="server" ClientInstanceName="btnSalvar" Text="Salvar" Theme="Metropolis">
                        </dx:ASPxButton>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
        </dx:PopupControlContentControl>
        </ContentCollection>

     </dx:ASPxPopupControl> 
    </div>
   
    <dx:ASPxTextBox ID="txtCOD" runat="server" Width="1px" ClientInstanceName="txtCOD">
        <Border BorderStyle="None" />
    </dx:ASPxTextBox>

</asp:Content>

