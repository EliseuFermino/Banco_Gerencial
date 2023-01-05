<%@ Page Title="Centro de Custo - Departamento" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="cc_TodasLojas_porDepto.aspx.vb" Inherits="MemberPages_CentroCusto_cc_TodasLojas_porDepto" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaGrupo_Subgrupo.ascx" TagPrefix="uc1" TagName="wucListaGrupo_Subgrupo" %>
<%@ Register Src="~/Controles/wucListaDepto.ascx" TagPrefix="uc1" TagName="wucListaDepto" %>











<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type ="text/css" >
        #html {
            overflow-x:hidden;
            overflow-y:hidden;
        }

        #moldura {
            width:1024px;
            margin: 0 auto ;
        }

        #divAno {
            float: left;
        }

        #divMes {
            float: left;
        }

        #divDespesas {
            float: left;
            width:305px;
        }

        #divDepartamento {
            float: left;
            width: 210px;
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px;                      
        }

        #divGrid1 {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 1015px;
            margin-left: 1px;
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 28px;
            margin-left: 1px;            
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div id="moldura">
                <div id="divAno" class="myBorder">
                    <uc1:wucAno runat="server" ID="cboAno" />
                </div>

                <div id="divMes" class="myBorder">
                    <uc1:wuciListaMes runat="server" ID="cboMes" />
                </div>

                <div id="divDespesas" class="myBorder">
                    <uc1:wucListaGrupo_Subgrupo runat="server" ID="cboGrupo" />
                </div>

                <div id="divDepartamento" class="myBorder">
                    <uc1:wucListaDepto runat="server" ID="cboDepto" />
                </div>

                <div id="divBotaoAtualizar" >
                    <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="Metropolis" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {cbPanel1.PerformCallback();}" />
                    </dx:ASPxButton>
                </div>

                <div id="divGrid1">
                    <dx:ASPxCallbackPanel ID="cbPanel1" runat="server" Width="1024px" ClientInstanceName="cbPanel1" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;">
                        <PanelCollection>
                            <dx:PanelContent runat="server" SupportsDisabledAttribute="both" >
                                <dx:ASPxGridView ID="grid1" runat="server" Theme="DevEx">

                                </dx:ASPxGridView>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

