<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucCadastroCad.ascx.vb" Inherits="MemberPages_Projetos_Controles_wucCadastroCad" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<style type ="text/css" >

    #divTitulo {
        clear: both ;
        margin-bottom : 7px;
    }

    #divOpcoes {
        clear: both;
        float : left ;
        border: 1px solid gray;
        width: 370px;
        padding-top: 2px;
    }

    #divOpcoes_Projeto {float: left; margin-left: 10px}

    #divOpcoes_SubProjeto {float: left; margin-left: 10px}

    #divOpcoes_Tarefa {float: left; margin-left: 10px}

    #divOpcoes_SubTarefa {float: left; margin-left: 10px}


    #divTitulo_Projeto {clear: both; float: left; margin-top: 7px}

    #divCboProjeto {float: left; margin-left: 17px; margin-top: 5px}

    #divTitulo_SubProjeto {clear: both; float: left; margin-top: 7px}

    #divCboSubProjeto {float: left; margin-left: 10px; margin-top: 5px}

    #divTitulo_Tarefa {clear: both; float: left; margin-top: 7px}

    #divCboTarefa {float: left; margin-left: 46px; margin-top: 5px}

    #divTitulo_SubTarefa {clear: both; float: left; margin-top: 7px}

    #divCboSubTarefa {float: left; margin-left: 16px; margin-top: 5px}


</style>


<div id="divCadastro">

    <div id="divTitulo">
        <asp:Label ID="lblTitulo" runat="server" Text="Projeto" Font-Size="XX-Large" ForeColor="Gray"></asp:Label>
    </div>

    <div id="divOpcoes">

        <div id="divOpcoes_Projeto">
            <dx:ASPxRadioButton ID="rndProjeto" runat="server" AutoPostBack="true" GroupName="grpOpcoes" Text="Projeto" Theme="DevEx" Checked="True"></dx:ASPxRadioButton>
        </div>

        <div id="divOpcoes_SubProjeto">
            <dx:ASPxRadioButton ID="rndSubProjeto" runat="server" AutoPostBack="true" GroupName="grpOpcoes" Text="Sub-Projeto" Theme="DevEx"></dx:ASPxRadioButton>
        </div>

        <div id="divOpcoes_Tarefa">
            <dx:ASPxRadioButton ID="rndTarefa" runat="server" AutoPostBack="true" GroupName="grpOpcoes" Text="Tarefa" Theme="DevEx"></dx:ASPxRadioButton>
        </div>

        <div id="divOpcoes_SubTarefa">
            <dx:ASPxRadioButton ID="rndSubTarefa" runat="server" AutoPostBack="true" GroupName="grpOpcoes" Text="Sub-Tarefa" Theme="DevEx"></dx:ASPxRadioButton>
        </div>

    </div>

    
    <div id="divTitulo_Projeto">
        <asp:Label ID="lblProjeto" runat="server" Text="Projeto"></asp:Label>
    </div>

    <div id="divCboProjeto">
        <dx:ASPxComboBox ID="cboProjeto" runat="server" Theme="PlasticBlue" DataSourceID="dsProjeto" TextField="descProjeto" ValueField="idProjeto" Width="200px"></dx:ASPxComboBox>    
        <asp:SqlDataSource ID="dsProjeto" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="Condor.uspBuscarProjetosUsuario" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="userName" SessionField="sUSUARIO" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>






    <div id="divTitulo_SubProjeto">         
        <asp:Label ID="lblSubProjeto" runat="server" Text="Sub-Projeto"></asp:Label>
    </div>

    <div id="divCboSubProjeto">
        <dx:ASPxComboBox ID="cboSubProjeto" runat="server" ValueType="System.String" Theme="PlasticBlue"></dx:ASPxComboBox>    
    </div>



    <div id="divTitulo_Tarefa">         
        <asp:Label ID="lblTarefa" runat="server" Text="Tarefa"></asp:Label>
    </div>

    <div id="divCboTarefa">
        <dx:ASPxComboBox ID="cboTarefa" runat="server" ValueType="System.String" Theme="PlasticBlue"></dx:ASPxComboBox>    
    </div>



    <div id="divTitulo_SubTarefa">         
        <asp:Label ID="lblSubTarefa" runat="server" Text="Sub-Tarefa"></asp:Label>
    </div>

    <div id="divCboSubTarefa">
        <dx:ASPxComboBox ID="cboSubTarefa" runat="server" ValueType="System.String" Theme="PlasticBlue"></dx:ASPxComboBox>    
    </div>



</div>