<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuc_cboProjeto_Subprojeto.ascx.vb" Inherits="MemberPages_Projetos_Controles_wuc_cboProjeto_Subprojeto" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<style type="text/css" >

    #divFrame {
        float: left;
    }

    #divLegendaProjeto {
        clear:both;
        float: left;
        margin-top: 1px;
    }

    #divProjeto {
        float: left;
        margin-left: 5px;
    }

    #divLegendaSubprojeto {
        clear:both;
        float: left;
        margin-top: 8px;
    }

    #divSubprojeto {
        float: left;
        margin-left: 5px;
        margin-top: 7px;
    }

    #divLegendaTarefas {
        clear:both;
        float: left;
        margin-top: 8px;
    }

    #divTarefas {
        float: left;
        margin-left: 5px;
        margin-top: 7px;
    }

    #divBotaoTarefas {
        float: left;
        margin-left: 5px;
        margin-top: 6px;
    }

    #divBotaoSubprojeto {
        float: left;
        margin-left: 5px;
        margin-top: 6px;   
    }

</style>


<%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>

<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate >--%>

        <div id="divFrame">

            <div id="divLegendaProjeto">
                Projeto
            </div>

            <div id="divProjeto">
                <dx:ASPxComboBox ID="cboProjeto" runat="server" Theme="PlasticBlue" AutoPostBack="True" DataSourceID="dsListaProjeto" TextField="descProjeto" ValueField="idProjeto" Width="250px"></dx:ASPxComboBox>
            </div>

            <div id="divLegendaSubprojeto">
                Sub-projeto
            </div>

            <div id="divSubprojeto">
                <dx:ASPxComboBox ID="cboSubProjeto" runat="server" Theme="PlasticBlue" AutoPostBack="True" DataSourceID="dsListaSubProjeto" TextField="SubProjetoDesc" ValueField="SubProjetoID" Width="250px"></dx:ASPxComboBox>
            </div>

            <div id="divBotaoSubprojeto">
                <asp:Button ID="btnSubprojeto" runat="server" Text="Novo" />
            </div>


            <div id="divLegendaTarefas">
                Tarefa
            </div>

            <div id="divTarefas">
                <dx:ASPxComboBox ID="cboTarefas" runat="server" Theme="PlasticBlue" AutoPostBack="True" DataSourceID="dsListaTarefas" TextField="descTarefa" ValueField="CodTarefa" Width="250px"></dx:ASPxComboBox>
            </div>

            <div id="divBotaoTarefas">
                <asp:Button ID="btnTarefas" runat="server" Text="Novo" />
            </div>

        </div>


        <div id="divDataSource">

             <asp:SqlDataSource ID="dsListaProjeto" runat="server" 
                ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" 
                SelectCommand="uspBuscarProjetosUsuario" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="userName" SessionField="sUSUARIO" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

             <asp:SqlDataSource ID="dsListaSubProjeto" runat="server" 
                ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" 
                SelectCommand="SELECT [SubProjetoID], [SubProjetoDesc] FROM [projFicha] WHERE ([ProjetoID] = @ProjetoID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cboProjeto" Name="ProjetoID" PropertyName="Value" Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>

             <asp:SqlDataSource ID="dsListaTarefas" runat="server" 
                ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" 
                SelectCommand="SELECT [CodTarefa], [descTarefa] FROM [tblCadTarefas] WHERE ([SubProjetoID] = @SubProjetoID)">
                <SelectParameters>
                    <asp:SessionParameter Name="SubProjetoID" SessionField="idSubprojeto" />
                </SelectParameters>
            </asp:SqlDataSource>


        </div>

<%--    </ContentTemplate>
</asp:UpdatePanel>--%>