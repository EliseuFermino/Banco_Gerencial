<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuc_Exibir_Lojas_Atacarejos_Todos.ascx.vb" Inherits="Controles_wuc_Exibir_Lojas_Atacarejos_Todos" %>

<style type="text/css">

    #divLojas {
        float: left ;
    }

    #divAtacarejo {
        margin-left: 5px;
        float: left ;
    }

</style>

<div id="divLojas">
    <asp:CheckBox ID="chkLojas" runat="server" Text="Condor" AutoPostBack="false" ToolTip="Clique nessa opção para exibir as lojas do Condor"  />
</div>

<div id="divAtacarejo">
    <asp:CheckBox ID="chkAtacarejo" runat="server" Text="Atacarejo" AutoPostBack="false" ToolTip="Clique nessa opção para exibir as lojas da Gigante" />
</div>
