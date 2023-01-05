<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/RPM/masterRPM.master" AutoEventWireup="false" CodeFile="rpmTodasTarefas.aspx.vb" Inherits="MemberPages_RPM_rpmTodasTarefas" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxpc" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       <script language ="javascript" type ="text/javascript">
           function OnGridFocusedRowChanged()
           {
               grid.GetRowValues(grid.GetFocusedRowIndex(), 'ID;DiaCadastro;Descricao;Duração;Solicitante;Concluido?;Categoria;Status', OnGetRowValues);
           }

           function OnGetRowValues(values)
           {

               txtTarefaID.SetText(values[0]);
               //txtQuem.SetText(values[1]);
               //txtPorque.SetText(values[2]);
               //txtOnde.SetText(values[3]);
               //txtComo.SetText(values[4]);
               //txtQuanto.SetText(values[5]);
               //txtOque.SetText(values[6]);
               //txtStatusTarefa.SetText(values[7]);
               //txtQuando.SetText(values[8]);
               //txtConclusao.SetText(values[9]);
               //txtAtaID.SetText(values[10]);
           }
    </script>

      <style type ="text/css" >

        #divCadastro {
            float: left;            
            margin-top: 2px;
            width: 400px;
            height: 300px;
            border: 1px solid gray;
        }

        #divDescricao {
            float: left;            
            margin-top: 2px;
            margin-left: 4px;
        }

        #divPrazo {
            float: left;            
            margin-top: 5px;
            margin-left: 4px;
        }

        #divTerceiro {
            float: left;            
            margin-top: 5px;
            margin-left: 4px;
        }

        .auto-style2 {
            width: 23px;
        }

        #divBotoes {
            clear: both;
            float: left;            
            margin-top: 10px;
            margin-left: 4px;            
        }



          .auto-style4 {
              height: 14px;
          }
          .dxbButton_Aqua
{
	color: #2C4D79;
	font: normal 12px Tahoma;
	vertical-align: middle;
	border: 1px solid #A3C0E8;
	
	padding: 1px;
	cursor: pointer;
}



          .auto-style8 {
              height: 40px;
          }



          .auto-style9 {
              width: 113px;
          }



          .auto-style10 {
              height: 25px;
              vertical-align:bottom;
          }



          .auto-style11 {
              height: 25px;
              vertical-align:bottom;
              margin-left: 10px;
          }



    </style>



    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ID" Theme="SoftOrange" Width="100%" ClientInstanceName="grid">
        <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged();
}" />
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="Total de Tarefas Ativas: {0:n0}" FieldName="Descricao" SummaryType="Count" />
        </TotalSummary>
        <GroupSummary>
            <dx:ASPxSummaryItem DisplayFormat="Total: {0:n0}" FieldName="ID" SummaryType="Count" />
        </GroupSummary>
        <Columns>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="8" Caption="ID" Width="40px">
                <EditFormSettings Visible="False" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="DiaCadastro" VisibleIndex="0" Caption="Cadastrado em" Width="100px" SortIndex="0" SortOrder="Descending">
                <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy} " EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="1" Caption="Descricao" Width="700px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Duração" FieldName="Duração" VisibleIndex="7" Width="60px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Solicitante" FieldName="Solicitante" VisibleIndex="2" Width="150px">
                <Settings AllowAutoFilter="True" AllowHeaderFilter="True" AutoFilterCondition="Contains" />
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Prazo" FieldName="Prazo" VisibleIndex="3" Width="90px" SortIndex="1" SortOrder="Descending">
                <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy} " EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Conclusão" FieldName="Conclusao" VisibleIndex="4" Width="80px">
                <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy} " EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AutoFilterCondition="Contains" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Categoria" FieldName="Categoria" VisibleIndex="5" Width="130px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Status" FieldName="Status" VisibleIndex="6" Width="110px">
                <Settings AllowFilterBySearchPanel="True" AllowHeaderFilter="True" AutoFilterCondition="Contains" />
                <SettingsHeaderFilter Mode="CheckedList">
                </SettingsHeaderFilter>
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" VerticalScrollableHeight="700" ShowTitlePanel="True" VerticalScrollBarMode="Visible" ShowFooter="True" />
        <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
        <SettingsDataSecurity AllowReadUnlistedFieldsFromClientApi="True" />
        <SettingsSearchPanel Visible="True" />
        <SettingsLoadingPanel Text="Salvando&amp;hellip;" />
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <AlternatingRow BackColor="#E8E8E8">
            </AlternatingRow>
            <FocusedRow BackColor="#FFFF66" ForeColor="#3333CC">
            </FocusedRow>
            <Footer Font-Bold="True">
            </Footer>
        </Styles>
</dx:ASPxGridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerRPMConnectionString %>"  
    SelectCommand="Dados.uspBuscarTodasTarefas" SelectCommandType="StoredProcedure">

</asp:SqlDataSource>

     

    <%-------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

                                    <dxe:ASPxButton ID="ASPxButton1" runat="server" 
                                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                        CssPostfix="Office2003_Blue" Text="Alterar Plano de Ação" Width="170px">
                                        <ClientSideEvents Click="function(s, e) {
	frmEdit.Show()
}" />
                                    </dxe:ASPxButton>
                                    <dxe:ASPxTextBox ID="txtTarefaID" runat="server" 
                                        ClientInstanceName="txtTarefaID" ForeColor="#EFEEEF" ReadOnly="True" 
                                        Width="60px" BackColor="#EFEEEF">
                                        <Border BorderStyle="None" />
                                    </dxe:ASPxTextBox>
                                <asp:Label ID="lblError1" runat="server" Text="Label" Visible="False"></asp:Label>
                                <br />

  
      
    <%-------------------------------------------------------------------------------------------------------------------------------------------------------------------------%>

        <dx:ASPxPopupControl ID="panPlanoAcao" runat="server" 
            AllowDragging="True" ClientInstanceName="frmEdit" 
           
            HeaderText="Alterar ou Excluir Plano de Ação" 
             Modal="True" 
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="420px" AppearAfter="200" DisappearAfter="150">
            <ContentStyle>
                <BorderBottom BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" />
            </ContentStyle>
            
            <CloseButtonStyle>
                <Paddings Padding="0px" />
            </CloseButtonStyle>
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">

        <div id="divDescricao">    

            <table cellpadding="0" cellspacing="0" >
                <tr>
                    <td style="font-weight: bold">Descrição da Tarefa:</td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxMemo ID="txtDesc" runat="server" Height="150px" Width="380px" Native="True" Theme="Glass">
                        </dx:ASPxMemo>
                    </td>
                </tr>
            </table>

        </div>

        <div id="divPrazo">

           <table cellpadding="0" cellspacing="0" >
                <tr>
                    <td style="font-weight: bold">Solicitante:</td>
                    <td class="auto-style2"></td>
                    <td style="font-weight: bold">Prazo:</td>
                    <td class="auto-style2"></td>
                    <td style="font-weight: bold">Duração</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtSolicitante" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style2"></td>
                    <td>
                        <dx:ASPxDateEdit ID="cboDia" runat="server" HorizontalAlign="Center" Width="110px"></dx:ASPxDateEdit>
                    </td>
                    <td class="auto-style2"></td>
                    <td>
                        <dx:ASPxTextBox ID="txtDuracao" runat="server" Width="60px" HorizontalAlign="Center">
                            <MaskSettings Mask="HH:mm" />
                        </dx:ASPxTextBox>
                    </td>
                </tr>
            </table>

        </div>

        <div id="divTerceiro">

           <table cellpadding="0" cellspacing="0" >
                <tr>
                    <td style="font-weight:bold">Status:</td>
                    <td style="font-weight: bold" class="auto-style9" colspan="2">Categoria</td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxComboBox ID="cboStatus" runat="server" DataSourceID="dsStatus" TextField="descStatus" ValueField="idStatus" ValueType="System.Byte" Width="120px">
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsStatus" runat="server" ConnectionString="<%$ ConnectionStrings:gerRPMConnectionString %>" SelectCommand="uspLista_Status" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style9" colspan="2">
                        <dx:ASPxComboBox ID="cboCategoria" runat="server" DataSourceID="dsListaPersonal" TextField="descCatPersonal" ValueField="idCatPersonal" ValueType="System.Byte" Width="140px" style="margin-left: 0px">
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsListaPersonal" runat="server" ConnectionString="<%$ ConnectionStrings:gerRPMConnectionString %>" SelectCommand="uspLista_CategoriaPersonal" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                    </td>
                </tr>

                <tr>
                    <td class="auto-style10"><strong style="vertical-align: bottom">Pertence à algum projeto?</strong></td>
                    <td class="auto-style10"></td>
                    <td class="auto-style10"><strong>Terminado em:</strong></td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <dx:ASPxComboBox ID="cboProjeto" runat="server" DataSourceID="dsListaProjetos" style="margin-left: 0px" TextField="descProjeto" ValueField="idProjeto" ValueType="System.Byte" Width="160px">
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsListaProjetos" runat="server" ConnectionString="<%$ ConnectionStrings:gerRPMConnectionString %>" SelectCommand="uspLista_Projetos" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style4">&nbsp;</td>
                    <td>
                        <dx:ASPxDateEdit ID="cboConclusao" runat="server" HorizontalAlign="Center" Width="110px">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>

               <tr>
                   <td class="auto-style8">

                       <dx:ASPxButton ID="btnSalvar" runat="server"  CssPostfix="Youthful" Text="Salvar" Width="90px" Theme="Mulberry">
                           <ClientSideEvents Click="function(s, e) {

}" />
                       </dx:ASPxButton>

                   </td>

                   <td class="auto-style8" colspan="2">

                       <dx:ASPxButton ID="btnExcluirPA" runat="server"  CssPostfix="RedWine" Text="Excluir" Width="90px" Theme="Mulberry">
                       </dx:ASPxButton>

                   </td>

                   <td class="auto-style9">

                   </td>

                   <td class="auto-style9">

                       <dx:ASPxButton ID="btnFechar" runat="server" AutoPostBack="False"  CssPostfix="Aqua" Text="Fechar" Width="90px" Theme="Mulberry">
                           <ClientSideEvents Click="function(s, e) {
	frmEdit.Hide();
}" />
                       </dx:ASPxButton>


                   </td>

                   <td class="auto-style8" style="text-align: center">

                       &nbsp;</td>
               </tr>

            </table>

        </div>

         </div>

                    <br />
                </dx:PopupControlContentControl>
            </ContentCollection>
            <CloseButtonImage Height="14px" Width="14px" />
            <HeaderStyle Font-Bold="True" HorizontalAlign="Center">
            <Paddings PaddingBottom="0px" PaddingLeft="0px" PaddingRight="0px" 
                PaddingTop="0px" />
            </HeaderStyle>
        </dx:ASPxPopupControl>
        
</asp:Content>

