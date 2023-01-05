<%@ Page Title="Tarefas" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="projTarefas.aspx.vb" Inherits="MemberPages_projTarefas" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="padding-left:10px;padding-top:10px">
   
    <dxwgv:ASPxGridView ID="gridTarefas" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" KeyFieldName="idTarefa" 
        Width="1300px" Theme="Default">
        <SettingsBehavior AllowFocusedRow="True" />
       
        <SettingsLoadingPanel Text="Aguarde. Processando...&amp;hellip;" />
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <GroupSummary>
            <dxwgv:ASPxSummaryItem DisplayFormat="Tarefas {0:n0}" FieldName="descTarefa" 
                SummaryType="Count" />
        </GroupSummary>
        <TotalSummary>
            <dxwgv:ASPxSummaryItem DisplayFormat="Total {0:n0}" FieldName="descTarefa" 
                ShowInColumn="desc Tarefa" SummaryType="Count" />
        </TotalSummary>
   
        <SettingsEditing Mode="PopupEditForm" PopupEditFormAllowResize="True" 
            PopupEditFormHeight="200px" PopupEditFormModal="True" 
            PopupEditFormWidth="900px" />
        <SettingsText EmptyDataRow="Nenhuma tarefa cadastrada." 
            GroupPanel="Arraste aqui uma coluna abaixo para agrupar." />
    <Columns>
        <dxwgv:GridViewCommandColumn Caption="Opções" VisibleIndex="0" Width="150px" ShowEditButton="True" ShowNewButton="True" ShowDeleteButton="True"/>
        <dxwgv:GridViewDataTextColumn FieldName="idTarefa" ReadOnly="True" 
            VisibleIndex="1" Caption="Tarefa" Width="50px">
            <EditFormSettings Visible="False" />
        </dxwgv:GridViewDataTextColumn>
        <dxwgv:GridViewDataTextColumn FieldName="descTarefa" VisibleIndex="2" 
            Caption="Descrição da tarefa." Width="200px">
        </dxwgv:GridViewDataTextColumn>
        <dxwgv:GridViewDataTextColumn FieldName="Depto" VisibleIndex="3" Width="100px">
        </dxwgv:GridViewDataTextColumn>
        <dxwgv:GridViewDataTextColumn FieldName="Prioridade" VisibleIndex="4" 
            Width="70px">
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dxwgv:GridViewDataTextColumn>
        <dxwgv:GridViewDataTextColumn FieldName="Responsavel" VisibleIndex="5" 
            Caption="Solicitante" Width="100px">
        </dxwgv:GridViewDataTextColumn>
        <dxwgv:GridViewDataDateColumn FieldName="DataInclusao" VisibleIndex="6" 
            Caption="Data inclusão" Width="100px">
        </dxwgv:GridViewDataDateColumn>
        <dxwgv:GridViewDataDateColumn FieldName="DataPrevisao" VisibleIndex="7" 
            Caption="Data previsão" Width="100px">
        </dxwgv:GridViewDataDateColumn>
        <dxwgv:GridViewDataDateColumn FieldName="DataConclusao" VisibleIndex="8" 
            Caption="Data conclusão" Width="100px">
        </dxwgv:GridViewDataDateColumn>
        <dxwgv:GridViewDataTextColumn FieldName="Quem" VisibleIndex="9" Width="100px">
        </dxwgv:GridViewDataTextColumn>
        <dxwgv:GridViewDataCheckColumn FieldName="Concluida" VisibleIndex="10" 
            Width="80px">
        </dxwgv:GridViewDataCheckColumn>
        <dxwgv:GridViewDataTextColumn FieldName="Tipo" VisibleIndex="11" Width="100px">
        </dxwgv:GridViewDataTextColumn>
    </Columns>
    <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" 
        ShowVerticalScrollBar="True" VerticalScrollableHeight="500" />
        <StylesEditors>
            <ProgressBar Height="25px">
            </ProgressBar>
        </StylesEditors>
        <Styles>
	<FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
    </Styles>
        <SettingsCommandButton>
            <EditButton Text="Alterar"/>
            <NewButton Text="Novo"/>
            <DeleteButton Text="Excluir"/>
            <CancelButton Text="Cancelar"/>
            <UpdateButton Text="Atualizar"/>
        </SettingsCommandButton>
    </dxwgv:ASPxGridView>
 </div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
    DeleteCommand="DELETE FROM [projTarefas] WHERE [idTarefa] = @idTarefa" 
    InsertCommand="INSERT INTO [projTarefas] ([descTarefa], [Depto], [Prioridade], [Responsavel], [DataInclusao], [DataPrevisao], [DataConclusao], [Quem], [Concluida], [Tipo]) VALUES (@descTarefa, @Depto, @Prioridade, @Responsavel, @DataInclusao, @DataPrevisao, @DataConclusao, @Quem, @Concluida, @Tipo)" 
    SelectCommand="SELECT [idTarefa], [descTarefa], [Depto], [Prioridade], [Responsavel], [DataInclusao], [DataPrevisao], [DataConclusao], [Quem], [Concluida], [Tipo] FROM [projTarefas]" 
    UpdateCommand="UPDATE [projTarefas] SET [descTarefa] = @descTarefa, [Depto] = @Depto, [Prioridade] = @Prioridade, [Responsavel] = @Responsavel, [DataInclusao] = @DataInclusao, [DataPrevisao] = @DataPrevisao, [DataConclusao] = @DataConclusao, [Quem] = @Quem, [Concluida] = @Concluida, [Tipo] = @Tipo WHERE [idTarefa] = @idTarefa">
    <DeleteParameters>
        <asp:Parameter Name="idTarefa" Type="Int64" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="descTarefa" Type="String" />
        <asp:Parameter Name="Depto" Type="String" />
        <asp:Parameter Name="Prioridade" Type="String" />
        <asp:Parameter Name="Responsavel" Type="String" />
        <asp:Parameter DbType="Date" Name="DataInclusao" />
        <asp:Parameter DbType="Date" Name="DataPrevisao" />
        <asp:Parameter DbType="Date" Name="DataConclusao" />
        <asp:Parameter Name="Quem" Type="String" />
        <asp:Parameter Name="Concluida" Type="Boolean" />
        <asp:Parameter Name="Tipo" Type="String" />
        <asp:Parameter Name="idTarefa" Type="Int64" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="descTarefa" Type="String" />
        <asp:Parameter Name="Depto" Type="String" />
        <asp:Parameter Name="Prioridade" Type="String" />
        <asp:Parameter Name="Responsavel" Type="String" />
        <asp:Parameter DbType="Date" Name="DataInclusao" />
        <asp:Parameter DbType="Date" Name="DataPrevisao" />
        <asp:Parameter DbType="Date" Name="DataConclusao" />
        <asp:Parameter Name="Quem" Type="String" />
        <asp:Parameter Name="Concluida" Type="Boolean" />
        <asp:Parameter Name="Tipo" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

