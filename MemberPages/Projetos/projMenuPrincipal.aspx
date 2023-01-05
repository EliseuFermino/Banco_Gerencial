<%@ Page Title="Projetos - Menu Principal" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="projMenuPrincipal.aspx.vb" Inherits="Ranking_projMenuPrincipal" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxrp" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxp" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxpc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

 <script type="text/javascript">
        function RedesenhoProcesso() { 
            //Session["myvar"].ToString()%>== '1')
            
        }
    </script>

    <style type="text/css">

       html {            
                overflow-x:hidden;            
            }

        #moldura {
                width:1000px; 
                margin: 0 auto ;                      
            }

        #divLayout {
            float: left;
            border: 2px solid Gray;
            height: 650px;
            width: 1000px;
            margin-top: 15px;
            border-radius: 15px;
            background-color:Beige;
            
            
        }

        .divQquadrante {
            float: left;
            border: 1px solid gray;
            height: 150px;
            width: 236px;
            margin-top: 10px;
            margin-left: 10px;
            border-radius: 10px;
            background-color: #B0E2FF;
            text-align: center;
            
        }

        #divTitulo {
            float: left;
            border: 1px solid gray;
            height: 60px;
            width: 980px;
            margin-top: 10px;
            margin-left: 10px;
            border-radius: 10px;
            background-color:#CDC8B1;
            text-align: center;
            font-size: 40px;
            color: #8B8B83;
            font-weight:bold;   
        }

        .style3
        {
            width: 100%;
            border-collapse: collapse;
        }
        .style4
        {
            width: 287px;
        }
        .style5
        {
            width: 287px;
            height: 88px;
        }
        .style6
        {
            height: 88px;
        }
        .style7
        {
            width: 287px;
            height: 39px;
        }
        .style8
        {
            height: 39px;
        }
    .style9
    {
        height: 23px;
    }

       #divListaProjetos {
            float: left;            
            margin-top: 10px;
            margin-left: 10px;             
        }

       #divBotaoIr {
            float: left;            
            margin-top: 7px;
            margin-left: 10px;             
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="moldura">
        <div id="divLayout">
            <div id="divTitulo">Carteira de Projetos</div>

            <div id="divListaProjetos">
                <dxe:ASPxComboBox ID="cboListaProjetos" runat="server" DataSourceID="dsListaProjetos" TextField="descProjeto" ValueField="idProjeto"></dxe:ASPxComboBox>                
                <asp:SqlDataSource ID="dsListaProjetos" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="uspBuscarProjetosUsuario" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="userName" SessionField="sUSUARIO" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>

            <div id="divBotaoIr">
                <dxe:ASPxButton ID="btnIr" runat="server" Text="Ir" Theme="Metropolis" ></dxe:ASPxButton>
            </div>
           
        </div>
    </div>

    <%-----------------------------------------------------------------------------------------------------------------------------------%>

    <p>

<dxp:PanelContent runat="server">
    <table class="style1">
        <tr>
            <td>
                <table align="center" bgcolor="#487DBD" cellpadding="0" class="style3">
                    <tr>
                        <td align="center" class="style5" valign="middle">
                            <dxe:ASPxHyperLink ID="btn_RedesenhoProcesso" runat="server" 
                                ImageUrl="~/image/proj_Menu_RedesenhoProcessos.png" Text="ASPxHyperLink" 
                                NavigateUrl="planej01_Ficha.aspx" >
                                <ClientSideEvents Click="function(s, e) {RedesenhoProcesso();}" />                                
                            </dxe:ASPxHyperLink>
                            <br />
                        </td>
                        <td align="center" class="style6" valign="middle">
                            <dxe:ASPxHyperLink ID="btn_Logistica" runat="server" 
                                ImageUrl="~/image/proj_Menu_Logistica.png" Text="ASPxHyperLink" 
                                NavigateUrl="planej01_Ficha.aspx">
                            </dxe:ASPxHyperLink>
                        </td>
                        <td align="center" class="style6" valign="middle">
                            <dxe:ASPxHyperLink ID="btn_GestaoEstoques" runat="server" 
                                ImageUrl="~/image/proj_Menu_GestaoEstoque.png" Text="ASPxHyperLink" 
                                NavigateUrl="planej01_Ficha.aspx">
                            </dxe:ASPxHyperLink>
                        </td>
                        <td class="style6">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="style7" valign="top">
                            <dxe:ASPxLabel ID="lbl_Coordenador_01" runat="server" ForeColor="Yellow" 
                                Text="Áurea">
                            </dxe:ASPxLabel>
                        </td>
                        <td align="center" class="style8" valign="top">
                            <dxe:ASPxLabel ID="lbl_Coordenador_02" runat="server" ForeColor="Yellow" 
                                Text="Luis">
                            </dxe:ASPxLabel>
                        </td>
                        <td align="center" class="style8" valign="top">
                            <dxe:ASPxLabel ID="lbl_Coordenador_03" runat="server" ForeColor="Yellow" 
                                Text="João Luis">
                            </dxe:ASPxLabel>
                        </td>
                        <td class="style8">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="style4" valign="middle">
                            <dxe:ASPxHyperLink ID="btn_GestaoEconomica" runat="server" 
                                ImageUrl="~/image/proj_Menu_GestaoEconomicaFinanceira.png" 
                                Text="ASPxHyperLink" NavigateUrl="planej01_Ficha.aspx">
                            </dxe:ASPxHyperLink>
                            <br />
                        </td>
                        <td align="center" valign="middle">
                            <dxe:ASPxHyperLink ID="btn_Pessoas" runat="server" 
                                ImageUrl="~/image/proj_Menu_Pessoas.png" Text="ASPxHyperLink" 
                                NavigateUrl="planej01_Ficha.aspx">
                            </dxe:ASPxHyperLink>
                        </td>
                        <td align="center" valign="middle">
                            <dxe:ASPxHyperLink ID="btn_GerenciamentoMix" runat="server" 
                                ImageUrl="~/image/proj_Menu_GerenciaMixCategoria.png" Text="ASPxHyperLink" 
                                NavigateUrl="planej01_Ficha.aspx">
                            </dxe:ASPxHyperLink>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" class="style7" valign="top">
                            <dxe:ASPxLabel ID="lbl_Coordenador_4" runat="server" ForeColor="Yellow" 
                                Text="Adailton">
                            </dxe:ASPxLabel>
                        </td>
                        <td align="center" class="style8" valign="top">
                            <dxe:ASPxLabel ID="lbl_Coordenador_05" runat="server" ForeColor="Yellow" 
                                Text="Renato">
                            </dxe:ASPxLabel>
                        </td>
                        <td align="center" class="style8" valign="top">
                            <dxe:ASPxLabel ID="lbl_Coordenador_06" runat="server" ForeColor="Yellow" 
                                Text="Bernardo">
                            </dxe:ASPxLabel>
                        </td>
                        <td class="style8">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="style4" valign="middle">
                            <dxe:ASPxHyperLink ID="btn_ManutencaoLimpeza" runat="server" 
                                ImageUrl="~/image/proj_Menu_ManutencaoLimpeza.png" Text="ASPxHyperLink" 
                                NavigateUrl="planej01_Ficha.aspx">
                            </dxe:ASPxHyperLink>
                            <br />
                        </td>
                        <td align="center" valign="middle">
                            <dxe:ASPxHyperLink ID="btn_CRM" runat="server" 
                                ImageUrl="~/image/proj_Menu_CRM.png" Text="ASPxHyperLink" 
                                NavigateUrl="planej01_Ficha.aspx">
                            </dxe:ASPxHyperLink>
                        </td>
                        <td align="center" valign="middle">
                            <dxe:ASPxHyperLink ID="btn_AmplicaoLojas" runat="server" 
                                ImageUrl="~/image/proj_Menu_AmpliacaoAdequacaoLojas.png" 
                                Text="ASPxHyperLink" NavigateUrl="planej01_Ficha.aspx">
                            </dxe:ASPxHyperLink>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" class="style7" valign="top">
                            <dxe:ASPxLabel ID="lbl_Coordenador_07" runat="server" ForeColor="Yellow" 
                                Text="Edison">
                            </dxe:ASPxLabel>
                        </td>
                        <td align="center" class="style8" valign="top">
                            <dxe:ASPxLabel ID="lbl_Coordenador_08" runat="server" ForeColor="Yellow" 
                                Text="Elaine">
                            </dxe:ASPxLabel>
                        </td>
                        <td align="center" class="style8" valign="top">
                            <dxe:ASPxLabel ID="lbl_Coordenador_09" runat="server" ForeColor="Yellow" 
                                Text="Aliceu">
                            </dxe:ASPxLabel>
                        </td>
                        <td class="style8">
                        </td>
                    </tr>
                    <tr>
                        <td class="style4">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
                </dxp:PanelContent>
</PanelCollection>
            
            
        </dxrp:ASPxRoundPanel>
    </p>
<table class="style1">
    <tr>
        <td>
            <asp:Label ID="lblDesc" runat="server" Text="Label" Visible="False"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style9">
            </td>
        <td class="style9">
            </td>
    </tr>
</table>
<p>
        <br />
    </p>
</asp:Content>

