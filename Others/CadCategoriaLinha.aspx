<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadCategoriaLinha.aspx.vb" Inherits="MemberPages_CadCategoriaLinha" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cadastro de Grupo de Contas</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/MemberPages/Principal.aspx">Menu Principal</asp:HyperLink>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="1" 
            DataKeyNames="idGrupoSub" DataSourceID="dsCadGrupo" ForeColor="Black" 
            GridLines="Vertical" PageSize="30">
            <RowStyle BackColor="#F7F7DE" />
            <Columns>
                <asp:CommandField CancelText="Cancelar" EditText="Editar" InsertText="Inserir" 
                    NewText="Novo" SelectText="Selecionar" ShowEditButton="True" 
                    ShowSelectButton="True" UpdateText="Atyalizar" />
                <asp:BoundField DataField="idGrupoSub" HeaderText="Cod" ReadOnly="True" 
                    SortExpression="idGrupoSub" />
                <asp:BoundField DataField="CatLinhaDesc" HeaderText="Descrição" 
                    SortExpression="CatLinhaDesc" />
                <asp:BoundField DataField="CatLinhaDescNivel" HeaderText="Descrição do Nivel" 
                    SortExpression="CatLinhaDescNivel" />
                <asp:BoundField DataField="CodPessoalAdm" HeaderText="CodPessoalAdm" 
                    SortExpression="CodPessoalAdm" />
                <asp:BoundField DataField="CatLinhaOrdem" HeaderText="CatLinhaOrdem" 
                    SortExpression="CatLinhaOrdem" />
                <asp:BoundField DataField="idGrupo" HeaderText="idGrupo" 
                    SortExpression="idGrupo" />
                <asp:CheckBoxField DataField="Fixa" HeaderText="Fixa" SortExpression="Fixa" />
                <asp:BoundField DataField="Ordem" HeaderText="Ordem" SortExpression="Ordem" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <EditRowStyle Font-Size="Small" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsCadGrupo" runat="server" 
            ConflictDetection="CompareAllValues" 
            ConnectionString="<%$ ConnectionStrings:conn_relReuniao %>" 
            DeleteCommand="DELETE FROM [tblCategoriaLinha] WHERE [idGrupoSub] = @original_idGrupoSub AND (([CatLinhaDesc] = @original_CatLinhaDesc) OR ([CatLinhaDesc] IS NULL AND @original_CatLinhaDesc IS NULL)) AND (([CatLinhaDescNivel] = @original_CatLinhaDescNivel) OR ([CatLinhaDescNivel] IS NULL AND @original_CatLinhaDescNivel IS NULL)) AND (([CodPessoalAdm] = @original_CodPessoalAdm) OR ([CodPessoalAdm] IS NULL AND @original_CodPessoalAdm IS NULL)) AND (([CatLinhaOrdem] = @original_CatLinhaOrdem) OR ([CatLinhaOrdem] IS NULL AND @original_CatLinhaOrdem IS NULL)) AND [idGrupo] = @original_idGrupo AND [Fixa] = @original_Fixa AND (([Ordem] = @original_Ordem) OR ([Ordem] IS NULL AND @original_Ordem IS NULL))" 
            InsertCommand="INSERT INTO [tblCategoriaLinha] ([idGrupoSub], [CatLinhaDesc], [CatLinhaDescNivel], [CodPessoalAdm], [CatLinhaOrdem], [idGrupo], [Fixa], [Ordem]) VALUES (@idGrupoSub, @CatLinhaDesc, @CatLinhaDescNivel, @CodPessoalAdm, @CatLinhaOrdem, @idGrupo, @Fixa, @Ordem)" 
            OldValuesParameterFormatString="original_{0}" 
            SelectCommand="SELECT [idGrupoSub], [CatLinhaDesc], [CatLinhaDescNivel], [CodPessoalAdm], [CatLinhaOrdem], [idGrupo], [Fixa], [Ordem] FROM [tblCategoriaLinha] ORDER BY [idGrupoSub]" 
            UpdateCommand="UPDATE [tblCategoriaLinha] SET [CatLinhaDesc] = @CatLinhaDesc, [CatLinhaDescNivel] = @CatLinhaDescNivel, [CodPessoalAdm] = @CodPessoalAdm, [CatLinhaOrdem] = @CatLinhaOrdem, [idGrupo] = @idGrupo, [Fixa] = @Fixa, [Ordem] = @Ordem WHERE [idGrupoSub] = @original_idGrupoSub AND (([CatLinhaDesc] = @original_CatLinhaDesc) OR ([CatLinhaDesc] IS NULL AND @original_CatLinhaDesc IS NULL)) AND (([CatLinhaDescNivel] = @original_CatLinhaDescNivel) OR ([CatLinhaDescNivel] IS NULL AND @original_CatLinhaDescNivel IS NULL)) AND (([CodPessoalAdm] = @original_CodPessoalAdm) OR ([CodPessoalAdm] IS NULL AND @original_CodPessoalAdm IS NULL)) AND (([CatLinhaOrdem] = @original_CatLinhaOrdem) OR ([CatLinhaOrdem] IS NULL AND @original_CatLinhaOrdem IS NULL)) AND [idGrupo] = @original_idGrupo AND [Fixa] = @original_Fixa AND (([Ordem] = @original_Ordem) OR ([Ordem] IS NULL AND @original_Ordem IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_idGrupoSub" Type="Byte" />
                <asp:Parameter Name="original_CatLinhaDesc" Type="String" />
                <asp:Parameter Name="original_CatLinhaDescNivel" Type="String" />
                <asp:Parameter Name="original_CodPessoalAdm" Type="Byte" />
                <asp:Parameter Name="original_CatLinhaOrdem" Type="Byte" />
                <asp:Parameter Name="original_idGrupo" Type="Int16" />
                <asp:Parameter Name="original_Fixa" Type="Boolean" />
                <asp:Parameter Name="original_Ordem" Type="Byte" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="CatLinhaDesc" Type="String" />
                <asp:Parameter Name="CatLinhaDescNivel" Type="String" />
                <asp:Parameter Name="CodPessoalAdm" Type="Byte" />
                <asp:Parameter Name="CatLinhaOrdem" Type="Byte" />
                <asp:Parameter Name="idGrupo" Type="Int16" />
                <asp:Parameter Name="Fixa" Type="Boolean" />
                <asp:Parameter Name="Ordem" Type="Byte" />
                <asp:Parameter Name="original_idGrupoSub" Type="Byte" />
                <asp:Parameter Name="original_CatLinhaDesc" Type="String" />
                <asp:Parameter Name="original_CatLinhaDescNivel" Type="String" />
                <asp:Parameter Name="original_CodPessoalAdm" Type="Byte" />
                <asp:Parameter Name="original_CatLinhaOrdem" Type="Byte" />
                <asp:Parameter Name="original_idGrupo" Type="Int16" />
                <asp:Parameter Name="original_Fixa" Type="Boolean" />
                <asp:Parameter Name="original_Ordem" Type="Byte" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="idGrupoSub" Type="Byte" />
                <asp:Parameter Name="CatLinhaDesc" Type="String" />
                <asp:Parameter Name="CatLinhaDescNivel" Type="String" />
                <asp:Parameter Name="CodPessoalAdm" Type="Byte" />
                <asp:Parameter Name="CatLinhaOrdem" Type="Byte" />
                <asp:Parameter Name="idGrupo" Type="Int16" />
                <asp:Parameter Name="Fixa" Type="Boolean" />
                <asp:Parameter Name="Ordem" Type="Byte" />
            </InsertParameters>
        </asp:SqlDataSource>
    
        <br />
    
    </div>
    </form>
</body>
</html>
