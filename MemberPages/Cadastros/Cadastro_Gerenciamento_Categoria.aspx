<%@ Page Title="Cadastro Gerenciamento por Categoria" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Cadastro_Gerenciamento_Categoria.aspx.vb" Inherits="MemberPages_Cadastros_Cadastro_Gerenciamento_Categoria" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">

        #myDiv {
            padding-top: 7px;
            padding-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="myDiv"> 

        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="idProdutoGC" EnableTheming="True" Theme="MaterialCompact">
            <SettingsEditing Mode="Batch">
                <BatchEditSettings StartEditAction="DblClick" />
            </SettingsEditing>
            <Settings VerticalScrollableHeight="400" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
            <SettingsText CommandBatchEditCancel="Alterar" CommandBatchEditPreviewChanges="Mudanças Anteriores" CommandBatchEditUpdate="Salvar Alterações" CommandCancel="Cancelar" CommandDelete="Excluir" CommandEdit="Alterar" CommandNew="Novo" ConfirmDelete="Tem certeza que deseja Excluir ?" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="idProdutoGC"  VisibleIndex="1" Caption="ID GC" ToolTip="Identificador do Gerenciamento de Categorias">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descProdutoGC" VisibleIndex="2" Caption="Descrição Gerenciamento de Categorias">
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="MetragemGC" VisibleIndex="3" Caption="Metragem">
                     <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                     </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>

            <Styles>
                <Header BackColor="#666666" ForeColor="White">
                </Header>
                <AlternatingRow BackColor="#EBEBEB">
                </AlternatingRow>
            </Styles>

        </dx:ASPxGridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" DeleteCommand="DELETE FROM [SLV].[tblGerenciamentoCategoria] WHERE [idProdutoGC] = @idProdutoGC" InsertCommand="INSERT INTO [SLV].[tblGerenciamentoCategoria] ([idProdutoGC],[descProdutoGC],[MetragemGC]) VALUES (@idProdutoGC, @descProdutoGC,@MetragemGC)" SelectCommand="SELECT * FROM [SLV].[tblGerenciamentoCategoria]" UpdateCommand="UPDATE [SLV].[tblGerenciamentoCategoria] SET  [descProdutoGC] = @descProdutoGC, [MetragemGC] = @MetragemGC WHERE [idProdutoGC] = @idProdutoGC">
            <DeleteParameters>
                <asp:Parameter Name="idProdutoGC" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="idProdutoGC" Type="Int16" />
                <asp:Parameter Name="descProdutoGC" Type="String" />
                <asp:Parameter Name="MetragemGC" Type="Int16" />                
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="idProdutoGC" Type="Int16" />
                <asp:Parameter Name="descProdutoGC" Type="String" />
                <asp:Parameter Name="MetragemGC" Type="Int16" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>

    

</asp:Content>

