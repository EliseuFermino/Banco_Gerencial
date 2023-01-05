<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaDeptoSecaoGrupoSubgrupo.ascx.vb" Inherits="Controles_wucLista_DeptoSecaoGrupoSubgrupo" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>


<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table >
        <tr>
            <td >
                <asp:Label ID="lblDepto" runat="server" Text="Depto:"></asp:Label>
            </td>
            <td class="style4">
                    <asp:DropDownList ID="cboDepto" runat="server" AutoPostBack="True" DataSourceID="dsDepto" DataTextField="listaDepto" DataValueField="idDepto">
                    </asp:DropDownList>
                </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="lblSecao" runat="server" Text="Seção:"></asp:Label>
            </td>
            <td >
                    <asp:DropDownList ID="cboSecao" runat="server" AutoPostBack="True" DataSourceID="dsSecao" DataTextField="ListaReduzida" DataValueField="idSecao">
                    </asp:DropDownList>
                </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="lblGrupo" runat="server" Text="Grupo:"></asp:Label>
            </td>
            <td class="style4">
                    <asp:DropDownList ID="cboGrupo" runat="server" AutoPostBack="True" DataSourceID="dsGrupo" DataTextField="ListaReduzida" DataValueField="idGrupo">
                    </asp:DropDownList>
                </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="lblSubgrupo" runat="server" Text="Sub-grupo:"></asp:Label>
            </td>
            <td >
                    <asp:DropDownList ID="cboSubgrupo" runat="server" AutoPostBack="True" DataSourceID="dsSubGrupo" DataTextField="ListaReduzida" DataValueField="idSubgrupo">
                    </asp:DropDownList>
                </td>
        </tr>
    </table>
        <asp:SqlDataSource ID="dsDepto" runat="server" 
            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        
        
    
    
        SelectCommand="SELECT [idDepto], [listaDepto] FROM [Cadastros].[tblCadDepto] WHERE idDepto<6 ORDER BY [idDepto]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsSecao" runat="server" 
            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        
        
    
    
        SelectCommand="SELECT [idSecao], [ListaReduzida] FROM [Cadastros].[tblCadSecao] WHERE ([idDepto] = @idDepto) AND idSecao<600 ORDER BY [idSecao]">
            <SelectParameters>
                <asp:ControlParameter ControlID="cboDepto" Name="idDepto" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsGrupo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        
        
    
    
        SelectCommand="SELECT [idGrupo], [ListaReduzida] FROM [Cadastros].[tblCadGrupo] WHERE (([idDepto] = @idDepto) AND ([idSecao] = @idSecao)) ORDER BY [idGrupo]">
            <SelectParameters>
                <asp:ControlParameter ControlID="cboDepto" Name="idDepto" PropertyName="SelectedValue" Type="Byte" />
                <asp:ControlParameter ControlID="cboSecao" Name="idSecao" PropertyName="SelectedValue" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsSubGrupo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        SelectCommand="SELECT [idSubgrupo], [ListaReduzida] FROM [Cadastros].[tblCadSubgrupo] WHERE (([idDepto] = @idDepto) AND ([idSecao] = @idSecao) AND ([idGrupo] = @idGrupo)) ORDER BY [idSubgrupo]">
            <SelectParameters>
                <asp:ControlParameter ControlID="cboDepto" Name="idDepto" PropertyName="SelectedValue" Type="Byte" />
                <asp:ControlParameter ControlID="cboSecao" Name="idSecao" PropertyName="SelectedValue" Type="Int16" />
                <asp:ControlParameter ControlID="cboGrupo" Name="idGrupo" PropertyName="SelectedValue" Type="Int16" />
            </SelectParameters>
    </asp:SqlDataSource>
    </ContentTemplate>
</asp:UpdatePanel>





    



