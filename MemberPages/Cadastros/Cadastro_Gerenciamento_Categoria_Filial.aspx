<%@ Page Title="Cadastro Filial -  Gerenciamento por Categoria" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Cadastro_Gerenciamento_Categoria_Filial.aspx.vb" Inherits="MemberPages_Cadastros_Cadastro_Gerenciamento_Categoria_Filial" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">

        #myDiv {
            clear:both ;
            float: left ;
            padding-top: 7px;
            padding-left: 2px;
        }

        #divFilial {
            float: left;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divFilial">
        <uc1:wucLista_Filial_Empresa runat="server" ID="cboFilial" AutoPostBack="true" Visible_Empresa="false"  />
    </div>

    <div id="myDiv"> 

        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="idProdutoGC" EnableTheming="True" Theme="MaterialCompact">
            <SettingsEditing Mode="Batch">
                <BatchEditSettings StartEditAction="Click" />
            </SettingsEditing>
            <Settings VerticalScrollableHeight="400" ShowFooter="True" />
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
                    <Settings ShowEditorInBatchEditMode="False" />
                </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn FieldName="MetragemGC" VisibleIndex="3" Caption="Metragem">
                     <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                     </PropertiesTextEdit>
                     <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
            </Columns>

            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="MetragemGC" SummaryType="Sum" />
            </TotalSummary>

            <Styles>
                <Header BackColor="#666666" ForeColor="White">
                </Header>
                <AlternatingRow BackColor="#EBEBEB">
                </AlternatingRow>
            </Styles>

        </dx:ASPxGridView>
        <asp:Label ID="lblError" runat="server" Text="Error" Visible ="false" ></asp:Label>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" DeleteCommand="DELETE FROM [SLV].[tblGerenciamentoCategoriaFilial] WHERE [idFilial] = @idFilial AND [idProdutoGC] = @idProdutoGC " InsertCommand="INSERT INTO [dbo].[vwGerenciamentoCategoria] ([idProdutoGC],[idFilial],[MetragemGC]) VALUES (@idProdutoGC, @idFilial,@MetragemGC)" SelectCommand="SELECT * FROM [dbo].[vwGerenciamentoCategoria] WHERE idFilial = @idFilial" UpdateCommand="UPDATE [dbo].[vwGerenciamentoCategoria] SET  [MetragemGC] = @MetragemGC WHERE [idFilial] = @idFilial AND [idProdutoGC] = @idProdutoGC">
            <SelectParameters>
                <asp:SessionParameter Name="idFilial" Type="Int16" SessionField="sFILIAL" />
            </SelectParameters>
            <DeleteParameters>               
                <asp:SessionParameter Name="idFilial" Type="Int16" SessionField="sFILIAL" />
                <asp:Parameter Name="idProdutoGC" Type="Int16" />
            </DeleteParameters>
            <InsertParameters>
                <asp:SessionParameter Name="idFilial" Type="Int16" SessionField="sFILIAL" />
                <asp:Parameter Name="idProdutoGC" Type="Int16" />
                <asp:Parameter Name="MetragemGC" Type="Decimal" />                
            </InsertParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="idFilial" Type="Int16" SessionField="sFILIAL" />
                <asp:Parameter Name="idProdutoGC" Type="Int16" />
                <asp:Parameter Name="MetragemGC" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>

    

</asp:Content>

