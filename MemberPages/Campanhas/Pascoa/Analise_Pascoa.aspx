<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Analise_Pascoa.aspx.vb" Inherits="MemberPages_Campanhas_Pascoa_Analise_Pascoa" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>

<%@ Register Src="../../../Controles/wucBotaoExcel.ascx" TagName="wucBotaoExcel" TagPrefix="uc1" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wuc_Pascoa_Grafico_Pizza_Participacao.ascx" TagPrefix="uc1" TagName="wuc_Pascoa_Grafico_Pizza_Participacao" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <style type="text/css">
        #divTitulo {
            float: left;
            margin-left: 5px;
            margin-top: 4px;
            font-size: large;
            font-weight: bold;
        }

        #divTitulo1 {
            float: left;
            margin-left: 5px;
            margin-top: 4px;
            font-size: large;
            font-weight: bold;
        }

        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 70px;
            width: 164px;
        }

        .auto-style3 {
            width: 460px;
            font-weight: 700;
        }

        .auto-style4 {
            width: 183px;
        }

        .auto-style5 {
            width: 390px;
            text-align: center;
        }
    </style>

    <link href="../../../assets/css/ace.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">


    <%----------------------------------------------------------------------------------------------------------------------------------------------%>

    <div class="container-fluid">

        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Dashboard - Comercial
        <small>Consultas</small>


            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Principal</a></li>

            </ol>

        </section>

        <div class="row">
            <div class="col-md-2">
                <dx:ASPxComboBox ID="cboCod" runat="server" EnableTheming="True" SelectedIndex="0" Font-Size="Large" Width="200px" DropDownRows="9" Native="True">
                    <Items>
                        <dx:ListEditItem Selected="True" Text="Total Páscoa" Value="0" />
                        <dx:ListEditItem Text="Ovos" Value="2" />
                        <dx:ListEditItem Text="Caixa de Bombom" Value="1" />
                        <dx:ListEditItem Text="Outros Chocolates" Value="9" />
                        <dx:ListEditItem Text="Colomba" Value="4" />
                        <dx:ListEditItem Text="Bacalhau" Value="5" />
                        <dx:ListEditItem Text="Barras de Chocolate" Value="6" />
                        <dx:ListEditItem Text="Chocolate Presentes" Value="7" />
                        <dx:ListEditItem Text="Azeitonas" Value="10" />
                        <dx:ListEditItem Text="Peixes Enlatados" Value="11" />
                        <dx:ListEditItem Text="Azeites" Value="12" />
                        <dx:ListEditItem Text="Mundo Chocolates" Value="100" />
                    </Items>
                </dx:ASPxComboBox>
            </div>

            <div class="col-md-4">
                <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" AutoPostBack="false" />
            </div>

            <div class="col-md-2">
                <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue">
                    <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
                </dx:ASPxButton>
            </div>

        </div>


        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
            <Images>
                <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
            </Images>

            <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>


                    <div class="row">

                        <div class="col-md-12">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 class="widget-title"><span class="fa fa-th">&nbsp &nbsp</span><asp:Label ID="lblTitulo_Capa" runat="server" Text="Capa - Total da Páscoa"></asp:Label></h4>

                                    <div class="widget-toolbar">
                                        <a href="#" data-action="collapse">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>

                                        <a href="#" data-action="close">
                                            <i class="ace-icon fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main">
                                        <table class="auto-style1">
                                            <%--Atingimento--%>
                                            <tr>
                                                <td colspan="8" style="background-color: lightgray; text-align: left; font-size: 20px; height: 5px; padding: 0px; border: 1px solid darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                                                    <table class="dxflInternalEditorTable_Office2010Silver">
                                                        <tr>
                                                            <td class="auto-style3">
                                                                <asp:Label ID="lblPeriodo1" runat="server" Text="Label" Style="font-size: medium"></asp:Label>
                                                            </td>
                                                            <td class="auto-style4"></td>
                                                            <td class="auto-style5"></td>
                                                            <td></td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6" rowspan="1" style="background-color: lightgray; text-align: center; font-size: 20px; height: 5px; padding: 0px; border: solid; border-width: 1px; border-color: darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                                                    <b>
                                                        <asp:Label ID="lblDescricaoAT" runat="server" Text="Label"></asp:Label></b>&nbsp;</td>
                                                <td colspan="2" rowspan="1" style="background-color: gray; text-align: center; font-size: 20px; height: 5px; padding: 0px; border: solid; border-width: 1px; border-color: darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                                                    <b>
                                                        <asp:Label ID="lblAnoAT" runat="server" Text="Label" ForeColor="White"></asp:Label></b>
                                                </td>
                                            </tr>
                                            <%--Diferença Margem Realizada--%>
                                            <tr>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: darkblue; color: white; height: 70px; text-align: center; width: 220px">
                                                    <asp:Label ID="lblTituloReal" runat="server" Text="Realizado Páscoa Total"></asp:Label>
                                                    <br />
                                                    R$
                                                    <asp:Label ID="lblRealPascoa" runat="server" Text="0" Font-Size="35px"></asp:Label>
                                                </td>
                                                <%--Diferença Lucratividade--%>
                                                <td style="border-style: solid; border-color: inherit; border-width: 1px; font-size: 20px; background-color: darkred; color: white; text-align: center;" class="auto-style2">Crescimento
                                                    <br />
                                                    <asp:Label ID="lblCrescimento" runat="server" Text="0" Font-Size="50px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Participação--%>

                                                <td style="border: solid; border-width: 1px; font-size: 18px; background-color: darkorange; color: white; height: 70px; text-align: center; width: 90px">Margem PDV
                                                    <br />
                                                    <asp:Label ID="lblMargemPDV" runat="server" Text="0" Font-Size="25px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Meta Pascoa--%>
                                                <td style="border: solid; border-width: 1px; font-size: 18px; background-color: #58c72c; color: white; height: 70px; text-align: center; width: 90px">Margem Final
                                                    <br />
                                                    <asp:Label ID="lblMargemFinal" runat="server" Text="0" Font-Size="25px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Meta Pascoa--%>

                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: chocolate; color: white; height: 70px; text-align: center; width: 200px">Lucratividade
                                                    <br />
                                                    R$
                                                    <asp:Label ID="lblLucratividade" runat="server" Text="0" Font-Size="35px"></asp:Label>
                                                </td>
                                                <%--Crescimento--%>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: darkslategray; color: white; height: 70px; text-align: center; width: 180px">Participação
                                                    <br />
                                                    <asp:Label ID="lblParticipacao" runat="server" Text="0" Font-Size="50px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Dados 2012--%>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: darkgreen; color: white; height: 70px; text-align: center; width: 220px">
                                                    <asp:Label ID="lblTituloMeta" runat="server" Text="Meta Pascoa Total"></asp:Label>
                                                    <br />
                                                    R$
                                                    <asp:Label ID="lblMetaPascoa" runat="server" Text="0" Font-Size="35px"></asp:Label>
                                                </td>
                                                <%--Diferenças--%>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: gray; color: white; height: 70px; text-align: center; width: 180px">Atingimento
                                                    <br />
                                                    <asp:Label ID="lblPercentualAtingimento" runat="server" Text="0" Font-Size="50px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Informações Diferença--%>
                                            </tr>
                                            <%--Atingimento--%>

                                            <tr>
                                                <td colspan="5" rowspan="1" style="color: slategray">
                                                    <asp:Label ID="lblPeriodo2" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <%--Diferença Margem Realizada--%>

                                            <tr>
                                                <td colspan="6" rowspan="1" style="background-color: lightgray; text-align: center; font-size: 20px; height: 5px; padding: 0px; border: solid; border-width: 1px; border-color: darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                                                    <b>
                                                        <asp:Label ID="lblDescricaoAA" runat="server" Text="Label"></asp:Label></b>
                                                </td>
                                                <td colspan="2" rowspan="1" style="background-color: gray; text-align: center; font-size: 20px; height: 5px; padding: 0px; border: solid; border-width: 1px; border-color: darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                                                    <b>
                                                        <asp:Label ID="lblAnoAA" runat="server" Text="0"></asp:Label></b>
                                                </td>
                                            </tr>
                                            <%--Diferença Lucratividade--%>

                                            <tr>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: darkblue; color: white; height: 70px; text-align: center; width: 220px">
                                                    <asp:Label ID="lblTituloRealAA" runat="server" Text="Realizado Páscoa Total"></asp:Label>
                                                    <br />
                                                    R$
                                                    <asp:Label ID="lblRealPascoaAA" runat="server" Text="0" Font-Size="35px"></asp:Label>
                                                </td>
                                                <%--Participação--%>
                                                <td style="border-style: solid; border-color: inherit; border-width: 1px; font-size: 20px; background-color: darkred; color: white; text-align: center;" class="auto-style2">Crescimento
                                                    <br />
                                                    &nbsp;<asp:Label ID="lblCrescimentoAA" runat="server" Text="0" Font-Size="50px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Meta Pascoa--%>

                                                <td style="border: solid; border-width: 1px; font-size: 18px; background-color: darkorange; color: white; height: 70px; text-align: center; width: 90px">Margem PDV
                                                    <br />
                                                    <asp:Label ID="lblMargemPDV_AA" runat="server" Text="0" Font-Size="25px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Crescimento--%>
                                                <td style="border: solid; border-width: 1px; font-size: 18px; background-color: #58c72c; color: white; height: 70px; text-align: center; width: 90px">Margem Final
                                                    <br />
                                                    <asp:Label ID="lblMargemFinal_AA" runat="server" Text="0" Font-Size="25px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Crescimento--%>

                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: chocolate; color: white; height: 70px; text-align: center; width: 200px">Lucratividade
                                                    <br />
                                                    R$
                                                    <asp:Label ID="lblLucratividadeAA" runat="server" Text="0" Font-Size="35px"></asp:Label>
                                                </td>
                                                <%--Informações Diferença--%>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: darkslategray; color: white; height: 70px; text-align: center; width: 180px">Participação
                                                    <br />
                                                    <asp:Label ID="lblParticipacaoAA" runat="server" Text="0" Font-Size="50px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Diferenças--%>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: darkblue; color: white; height: 70px; text-align: center; width: 220px">
                                                    <asp:Label ID="lblTituloMetaAA" runat="server" Text="Realizado Pascoa Total"></asp:Label>
                                                    <br />
                                                    R$
                                                    <asp:Label ID="lblMetaPascoaAA" runat="server" Text="0" Font-Size="35px"></asp:Label>
                                                </td>
                                                <%--Informações Diferença--%>

                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: gray; color: white; height: 70px; text-align: center; width: 180px">Atingimento
                                                    <br />
                                                    <asp:Label ID="lblPercentualAtingimentoAA" runat="server" Text="0" Font-Size="50px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Atingimento--%>
                                            </tr>
                                            <%--Diferença Margem Realizada--%>



                                            <tr>
                                                <td colspan="5" rowspan="1" style="color: slategray">
                                                    <asp:Label ID="lblPeriodo3" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <%--Diferença Lucratividade--%>

                                            <tr>
                                                <td colspan="6" rowspan="1" style="background-color: lightgray; text-align: center; font-size: 20px; height: 5px; padding: 0px; border: solid; border-width: 1px; border-color: darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                                                    <b>
                                                        <asp:Label ID="lblDescricaoAA1" runat="server" Text="Label"></asp:Label></b>&nbsp;</td>
                                                <td colspan="2" rowspan="1" style="background-color: gray; text-align: center; font-size: 20px; height: 5px; padding: 0px; border: solid; border-width: 1px; border-color: darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                                                    <b>
                                                        <asp:Label ID="lblAnoAA1" runat="server" Text="0"></asp:Label></b>
                                                </td>
                                            </tr>
                                            <%--Participação--%>

                                            <tr>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: darkblue; color: white; height: 70px; text-align: center; width: 220px">
                                                    <asp:Label ID="lblTituloRealAA1" runat="server" Text="Realizado Páscoa Total"></asp:Label>
                                                    <br />
                                                    R$
                                                    <asp:Label ID="lblRealPascoaAA1" runat="server" Text="0" Font-Size="35px"></asp:Label>
                                                </td>
                                                <%--Meta Pascoa--%>
                                                <td style="border-style: solid; border-color: inherit; border-width: 1px; font-size: 20px; background-color: darkred; color: white; text-align: center;" class="auto-style2">Crescimento
                                                    <br />
                                                    <asp:Label ID="lblCrescimentoAA1" runat="server" Text="0" Font-Size="50px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Crescimento--%>
                                                <td style="border: solid; border-width: 1px; font-size: 18px; background-color: darkorange; color: white; height: 70px; text-align: center; width: 90px">Margem PDV<br />
                                                    <asp:Label ID="lblMargemPDV_AA1" runat="server" Text="0" Font-Size="25px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Informações Diferença--%>
                                                <td style="border: solid; border-width: 1px; font-size: 18px; background-color: #58c72c; color: white; height: 70px; text-align: center; width: 90px">Margem Final
                                                    <br />
                                                    <asp:Label ID="lblMargemFinal_AA1" runat="server" Text="0" Font-Size="25px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Informações Diferença--%>

                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: chocolate; color: white; height: 70px; text-align: center; width: 200px">Lucratividade
                                                    <br />
                                                    R$
                                                    <asp:Label ID="lblLucratividadeAA1" runat="server" Text="0" Font-Size="35px"></asp:Label>
                                                </td>
                                                <%--Atingimento--%>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: darkslategray; color: white; height: 70px; text-align: center; width: 180px">Participação
                                                    <br />
                                                    <asp:Label ID="lblParticipacaoAA1" runat="server" Text="0" Font-Size="50px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Diferença Margem Realizada--%>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: darkblue; color: white; height: 70px; text-align: center; width: 220px">
                                                    <asp:Label ID="lblTituloMetaAA1" runat="server" Text="Meta Pascoa Total"></asp:Label>
                                                    <br />
                                                    R$
                                                    <asp:Label ID="lblMetaPascoaAA1" runat="server" Text="0" Font-Size="35px"></asp:Label>
                                                </td>
                                                <%--Diferença Lucratividade--%>

                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: gray; color: white; height: 70px; text-align: center; width: 180px">Atingimento
                                                    <br />
                                                    <asp:Label ID="lblPercentualAtingimentoAA1" runat="server" Text="0" Font-Size="50px" Font-Bold="True"></asp:Label>
                                                </td>
                                                <%--Participação--%>
                                            </tr>

                                            <%--Meta Pascoa--%>
                                            <tr>
                                                <td colspan="7" rowspan="1" style="background-color: lightgray; text-align: center; font-size: 20px; height: 5px; padding: 0px; border: solid; border-width: 1px; border-color: darkgray; border-top-left-radius: 4px; border-bottom-right-radius: 4px; border-bottom-left-radius: 4px; border-top-right-radius: 4px">
                                                    <b>Diferenças</b>
                                                </td>
                                            </tr>
                                            <%--Crescimento--%>

                                            <tr>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: darkblue; color: white; height: 70px; text-align: center; width: 220px">
                                                    <asp:Label ID="lblTituloRealDif" runat="server" Text="Valor"></asp:Label>
                                                    <br />
                                                    R$
                                                    <asp:Label ID="lblRealPascoaDif" runat="server" Text="0" Font-Size="35px"></asp:Label>
                                                </td>
                                                <%--Informações Diferença--%>
                                                <td style="border-style: solid; border-color: inherit; border-width: 1px; font-size: 20px; background-color: gray; color: white; text-align: center;" class="auto-style2">Percentual
                                                    <br />
                                                    <asp:Label ID="lblPercentualAtingimentoDif" runat="server" Text="0" Font-Size="50px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Atingimento--%>
                                                <td style="border: solid; border-width: 1px; font-size: 18px; background-color: darkorange; color: white; height: 70px; text-align: center; width: 90px">Margem PDV
                                                    <br />
                                                    <asp:Label ID="lblMargemPDV_Dif" runat="server" Text="0" Font-Size="25px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Diferença Margem Realizada--%>
                                                <td style="border: solid; border-width: 1px; font-size: 18px; background-color: #58c72c; color: white; height: 70px; text-align: center; width: 90px">Margem Final
                                                    <br />
                                                    <asp:Label ID="lblMargemFinal_Dif" runat="server" Text="0" Font-Size="25px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: chocolate; color: white; height: 70px; text-align: center; width: 100px">Lucratividade
                                                    <br />
                                                    <asp:Label ID="lblLucratividadeDif" runat="server" Text="0" Font-Size="35px"></asp:Label>
                                                </td>
                                                <%--Diferença Lucratividade--%>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: darkslategray; color: white; height: 70px; text-align: center; width: 180px">Percentual
                                                    <br />
                                                    <asp:Label ID="lblParticipacaoDif" runat="server" Text="0" Font-Size="50px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Participação--%>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: forestgreen; color: white; height: 70px; text-align: center; width: 220px">
                                                    <asp:Label ID="lblTituloMetaDif" runat="server" Text="Valor"></asp:Label>
                                                    <br />
                                                    R$
                                                    <asp:Label ID="lblMetaPascoaDif" runat="server" Text="0" Font-Size="35px"></asp:Label>
                                                </td>
                                                <%--Meta Pascoa--%>
                                                <td style="border: solid; border-width: 1px; font-size: 20px; background-color: darkred; color: white; height: 70px; text-align: center; width: 180px">Percentual
                                                    <br />
                                                    <asp:Label ID="lblCrescimentoDif" runat="server" Text="0" Font-Size="50px" Font-Bold="true"></asp:Label>
                                                </td>
                                                <%--Crescimento--%>
                                            </tr>
                                            <%--Informações Diferença--%>
                                        </table>


                                        <%--------------	--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.span -->


                    </div>


                    <div class="row">

                        <div class="col-lg-12">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 class="widget-title"><span class="fa fa-pie-chart">&nbsp</span> Gráfico de Participação das Categorias de Páscoa</h4>

                                    <div class="widget-toolbar">
                                        <a href="#" data-action="collapse">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>

                                        <a href="#" data-action="close">
                                            <i class="ace-icon fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main">

                                        <dxchartsui:WebChartControl ID="graf_Participacao" runat="server"
                                            BackColor="Transparent" DataSourceID="dsCrescimento"
                                            Height="350px" CrosshairEnabled="True" AutoLayout="True" Width="1000px">
                                            <SeriesSerializable>
                                                <cc1:Series ArgumentDataMember="Descricao" Name="Series 1" ValueDataMembersSerializable="VendaAA1" ArgumentScaleType="Qualitative" LabelsVisibility="True" SynchronizePointOptions="False" LegendName="Default Legend">
                                                    <viewserializable>
                                                        <cc1:DoughnutSeriesView RuntimeExploding="False" ExplodeMode="MaxValue">
                                                        </cc1:DoughnutSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:DoughnutSeriesLabel LineVisible="True" EnableAntialiasing="True" ResolveOverlappingMode="Default">
                                                            <fillstyle>
                                                                <optionsserializable>
                                                                    <cc1:SolidFillOptions />
                                                                </optionsserializable>
                                                            </fillstyle>
                                                            <pointoptionsserializable>
                                                                <cc1:PiePointOptions>
                                                                    <valuenumericoptions format="Percent" />
                                                                </cc1:PiePointOptions>
                                                            </pointoptionsserializable>
                                                        </cc1:DoughnutSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PiePointOptions PointView="Argument">
                                                            <valuenumericoptions format="Percent" />
                                                        </cc1:PiePointOptions>
                                                    </legendpointoptionsserializable>
                                                </cc1:Series>
                                                <cc1:Series ArgumentDataMember="Descricao" Name="Series 2" ValueDataMembersSerializable="VendaAA" ArgumentScaleType="Qualitative" CrosshairHighlightPoints="True" CrosshairLabelVisibility="True" LabelsVisibility="True" ShowInLegend="False" SynchronizePointOptions="False">
                                                    <viewserializable>
                                                        <cc1:DoughnutSeriesView RuntimeExploding="False" ExplodeMode="MaxValue">
                                                        </cc1:DoughnutSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:DoughnutSeriesLabel LineVisible="True" EnableAntialiasing="True" ResolveOverlappingMode="Default">
                                                            <fillstyle>
                                                                <optionsserializable>
                                                                    <cc1:SolidFillOptions />
                                                                </optionsserializable>
                                                            </fillstyle>
                                                            <pointoptionsserializable>
                                                                <cc1:PiePointOptions>
                                                                    <valuenumericoptions format="Percent" />
                                                                </cc1:PiePointOptions>
                                                            </pointoptionsserializable>
                                                        </cc1:DoughnutSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PiePointOptions PointView="Argument">
                                                            <valuenumericoptions format="Percent" />
                                                        </cc1:PiePointOptions>
                                                    </legendpointoptionsserializable>
                                                </cc1:Series>
                                                <cc1:Series ArgumentDataMember="Descricao" Name="Series 3" ValueDataMembersSerializable="Venda" ArgumentScaleType="Qualitative" CrosshairHighlightPoints="True" CrosshairLabelVisibility="True" LabelsVisibility="True" ShowInLegend="False" SynchronizePointOptions="False">
                                                    <viewserializable>
                                                        <cc1:DoughnutSeriesView RuntimeExploding="False" ExplodeMode="MaxValue">
                                                        </cc1:DoughnutSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:DoughnutSeriesLabel LineVisible="True" EnableAntialiasing="True" ResolveOverlappingMode="Default">
                                                            <fillstyle>
                                                                <optionsserializable>
                                                                    <cc1:SolidFillOptions />
                                                                </optionsserializable>
                                                            </fillstyle>
                                                            <pointoptionsserializable>
                                                                <cc1:PiePointOptions>
                                                                    <valuenumericoptions format="Percent" />
                                                                </cc1:PiePointOptions>
                                                            </pointoptionsserializable>
                                                        </cc1:DoughnutSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PiePointOptions PointView="Argument">
                                                            <valuenumericoptions format="Percent" />
                                                        </cc1:PiePointOptions>
                                                    </legendpointoptionsserializable>
                                                </cc1:Series>
                                            </SeriesSerializable>
                                            <SeriesTemplate>
                                                <viewserializable>
                                                    <cc1:DoughnutSeriesView RuntimeExploding="False">
                                                    </cc1:DoughnutSeriesView>
                                                </viewserializable>

                                                <labelserializable>
                                                    <cc1:DoughnutSeriesLabel LineVisible="True">
                                                        <fillstyle>
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                        <pointoptionsserializable>
                                                            <cc1:PiePointOptions>
                                                            </cc1:PiePointOptions>
                                                            <cc1:PointOptions></cc1:PointOptions>
                                                        </pointoptionsserializable>
                                                    </cc1:DoughnutSeriesLabel>
                                                </labelserializable>

                                                <pointoptionsserializable>
                                                    <cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
                                                </pointoptionsserializable>

                                                <legendpointoptionsserializable>
                                                    <cc1:PiePointOptions>
                                                    </cc1:PiePointOptions>
                                                </legendpointoptionsserializable>
                                            </SeriesTemplate>

                                            <DiagramSerializable>
                                                <cc1:SimpleDiagram EqualPieSize="False"></cc1:SimpleDiagram>
                                            </DiagramSerializable>

                                            <FillStyle FillMode="Empty"></FillStyle>
                                            <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside"
                                                BackColor="Transparent" Direction="LeftToRight"></Legend>
                                            <Titles>
                                                <cc1:ChartTitle Font="Tahoma, 14pt" Text="Comparativo de Páscoa - 2020, 2021 e 2022" TextColor="128, 128, 128" Indent="1" WordWrap="True" />
                                            </Titles>

                                            <CrosshairOptions>
                                                <commonlabelpositionserializable>
                                                    <cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
                                                </commonlabelpositionserializable>
                                            </CrosshairOptions>

                                            <ToolTipOptions>
                                                <tooltippositionserializable>
                                                    <cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
                                                </tooltippositionserializable>
                                            </ToolTipOptions>
                                        </dxchartsui:WebChartControl>

                                        <asp:SqlDataSource ID="dsCrescimento" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>"
                                            SelectCommand="Pascoa.uspGraficoParticipacao" SelectCommandType="StoredProcedure" EnableCaching="False">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.span -->


                    </div>

                    <div class="row">

                        <div class="col-lg-12">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 class="widget-title"><span class="fa fa-pie-chart">&nbsp</span> Gráfico de Participação - Categorias de Páscoa com Mundo Chocolate</h4>

                                    <div class="widget-toolbar">
                                        <a href="#" data-action="collapse">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>

                                        <a href="#" data-action="close">
                                            <i class="ace-icon fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main">

                                        <dxchartsui:WebChartControl ID="graph_Mundo_Chocolate" runat="server"
                                            BackColor="Transparent" DataSourceID="dsCrescimento_Mundo"
                                            Height="350px" CrosshairEnabled="True" AutoLayout="True" Width="1000px">
                                            <SeriesSerializable>
                                                <cc1:Series ArgumentDataMember="Descricao" Name="Series 1" ValueDataMembersSerializable="VendaAA1" ArgumentScaleType="Qualitative" LabelsVisibility="True" SynchronizePointOptions="False" LegendName="Default Legend">
                                                    <viewserializable>
                                                        <cc1:DoughnutSeriesView RuntimeExploding="False" ExplodeMode="MaxValue">
                                                        </cc1:DoughnutSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:DoughnutSeriesLabel LineVisible="True" EnableAntialiasing="True" ResolveOverlappingMode="Default">
                                                            <fillstyle>
                                                                <optionsserializable>
                                                                    <cc1:SolidFillOptions />
                                                                </optionsserializable>
                                                            </fillstyle>
                                                            <pointoptionsserializable>
                                                                <cc1:PiePointOptions>
                                                                    <valuenumericoptions format="Percent" />
                                                                </cc1:PiePointOptions>
                                                            </pointoptionsserializable>
                                                        </cc1:DoughnutSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PiePointOptions PointView="Argument">
                                                            <valuenumericoptions format="Percent" />
                                                        </cc1:PiePointOptions>
                                                    </legendpointoptionsserializable>
                                                </cc1:Series>
                                                <cc1:Series ArgumentDataMember="Descricao" Name="Series 2" ValueDataMembersSerializable="VendaAA" ArgumentScaleType="Qualitative" CrosshairHighlightPoints="True" CrosshairLabelVisibility="True" LabelsVisibility="True" ShowInLegend="False" SynchronizePointOptions="False">
                                                    <viewserializable>
                                                        <cc1:DoughnutSeriesView RuntimeExploding="False" ExplodeMode="MaxValue">
                                                        </cc1:DoughnutSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:DoughnutSeriesLabel LineVisible="True" EnableAntialiasing="True" ResolveOverlappingMode="Default">
                                                            <fillstyle>
                                                                <optionsserializable>
                                                                    <cc1:SolidFillOptions />
                                                                </optionsserializable>
                                                            </fillstyle>
                                                            <pointoptionsserializable>
                                                                <cc1:PiePointOptions>
                                                                    <valuenumericoptions format="Percent" />
                                                                </cc1:PiePointOptions>
                                                            </pointoptionsserializable>
                                                        </cc1:DoughnutSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PiePointOptions PointView="Argument">
                                                            <valuenumericoptions format="Percent" />
                                                        </cc1:PiePointOptions>
                                                    </legendpointoptionsserializable>
                                                </cc1:Series>
                                                <cc1:Series ArgumentDataMember="Descricao" Name="Series 3" ValueDataMembersSerializable="Venda" ArgumentScaleType="Qualitative" CrosshairHighlightPoints="True" CrosshairLabelVisibility="True" LabelsVisibility="True" ShowInLegend="False" SynchronizePointOptions="False">
                                                    <viewserializable>
                                                        <cc1:DoughnutSeriesView RuntimeExploding="False" ExplodeMode="MaxValue">
                                                        </cc1:DoughnutSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:DoughnutSeriesLabel LineVisible="True" EnableAntialiasing="True" ResolveOverlappingMode="Default">
                                                            <fillstyle>
                                                                <optionsserializable>
                                                                    <cc1:SolidFillOptions />
                                                                </optionsserializable>
                                                            </fillstyle>
                                                            <pointoptionsserializable>
                                                                <cc1:PiePointOptions>
                                                                    <valuenumericoptions format="Percent" />
                                                                </cc1:PiePointOptions>
                                                            </pointoptionsserializable>
                                                        </cc1:DoughnutSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PiePointOptions PointView="Argument">
                                                            <valuenumericoptions format="Percent" />
                                                        </cc1:PiePointOptions>
                                                    </legendpointoptionsserializable>
                                                </cc1:Series>
                                            </SeriesSerializable>
                                            <SeriesTemplate>
                                                <viewserializable>
                                                    <cc1:DoughnutSeriesView RuntimeExploding="False">
                                                    </cc1:DoughnutSeriesView>
                                                </viewserializable>

                                                <labelserializable>
                                                    <cc1:DoughnutSeriesLabel LineVisible="True">
                                                        <fillstyle>
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                        <pointoptionsserializable>
                                                            <cc1:PiePointOptions>
                                                            </cc1:PiePointOptions>
                                                            <cc1:PointOptions></cc1:PointOptions>
                                                        </pointoptionsserializable>
                                                    </cc1:DoughnutSeriesLabel>
                                                </labelserializable>

                                                <pointoptionsserializable>
                                                    <cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
                                                </pointoptionsserializable>

                                                <legendpointoptionsserializable>
                                                    <cc1:PiePointOptions>
                                                    </cc1:PiePointOptions>
                                                </legendpointoptionsserializable>
                                            </SeriesTemplate>

                                            <DiagramSerializable>
                                                <cc1:SimpleDiagram EqualPieSize="False"></cc1:SimpleDiagram>
                                            </DiagramSerializable>

                                            <FillStyle FillMode="Empty"></FillStyle>
                                            <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside"
                                                BackColor="Transparent" Direction="LeftToRight"></Legend>
                                            <Titles>
                                                <cc1:ChartTitle Font="Tahoma, 14pt" Text="Comparativo de Páscoa - 2020, 2021 e 2022" TextColor="128, 128, 128" Indent="1" WordWrap="True" />
                                            </Titles>

                                            <CrosshairOptions>
                                                <commonlabelpositionserializable>
                                                    <cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
                                                </commonlabelpositionserializable>
                                            </CrosshairOptions>

                                            <ToolTipOptions>
                                                <tooltippositionserializable>
                                                    <cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
                                                </tooltippositionserializable>
                                            </ToolTipOptions>
                                        </dxchartsui:WebChartControl>

                                        <asp:SqlDataSource ID="dsCrescimento_Mundo" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>"
                                            SelectCommand="Pascoa.uspGraficoParticipacao_Mundo" SelectCommandType="StoredProcedure" EnableCaching="True">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.span -->


                    </div>


                    <div class="row">

                        <div class="col-lg-12">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 class="widget-title"><span class="fa fa-tasks">&nbsp </span>Atingimento de Metas</h4>

                                    <div class="widget-toolbar">
                                        <a href="#" data-action="collapse">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>

                                        <a href="#" data-action="close">
                                            <i class="ace-icon fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main">

                                        <dxwgv:ASPxGridView ID="gridMeta" runat="server" AutoGenerateColumns="False"
                                            CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue"
                                            DataSourceID="dsMeta" KeyFieldName="Descricao" Width="1000px" Theme="DevEx">
                                            <SettingsBehavior AllowFocusedRow="True" />
                                            <FormatConditions>
                                                <dx:GridViewFormatConditionIconSet FieldName="percCresc" Format="PositiveNegativeArrowsColored" />
                                                <dx:GridViewFormatConditionIconSet FieldName="indAting" Format="Signs3" />
                                            </FormatConditions>
                                            <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css"
                                                CssPostfix="Office2003_Blue">
                                                <Header ImageSpacing="5px" SortingImageSpacing="5px" HorizontalAlign="Center">
                                                </Header>
                                                <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                                                <Footer Font-Bold="True">
                                                </Footer>
                                                <LoadingPanel ImageSpacing="10px">
                                                </LoadingPanel>
                                                <TitlePanel Font-Size="Medium" ForeColor="#666666">
                                                </TitlePanel>
                                            </Styles>
                                            <SettingsAdaptivity>
                                                <AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
                                            </SettingsAdaptivity>

                                            <SettingsPager>
                                                <AllButton Text="All">
                                                </AllButton>
                                                <NextPageButton Text="Next &gt;">
                                                </NextPageButton>
                                                <PrevPageButton Text="&lt; Prev">
                                                </PrevPageButton>
                                            </SettingsPager>
                                            <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                                <DetailCollapsedButton Height="12px"
                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"
                                                    Width="11px" />
                                                <DetailExpandedButton Height="12px"
                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                                <FilterRowButton Height="13px" Width="13px" />
                                                <CollapsedButton Height="12px"
                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"
                                                    Width="11px" />
                                                <ExpandedButton Height="12px"
                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png"
                                                    Width="11px" />
                                            </Images>
                                            <SettingsText Title="Comparativo de Total de Páscoa - Meta x Realizado" />
                                            <TotalSummary>
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaAA" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Meta" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Real" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Part" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                            </TotalSummary>
                                            <Columns>
                                                <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="Descricao"
                                                    VisibleIndex="0" Width="130px">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="VendaAA"
                                                    VisibleIndex="1" Width="85px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dxwgv:GridViewDataTextColumn>

                                                <dxwgv:GridViewDataTextColumn Caption="Meta 2013" FieldName="Meta"
                                                    VisibleIndex="2" Width="85px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <CellStyle ForeColor="#009900">
                                                    </CellStyle>
                                                    <FooterCellStyle ForeColor="#009900">
                                                    </FooterCellStyle>
                                                </dxwgv:GridViewDataTextColumn>

                                                <dxwgv:GridViewDataProgressBarColumn Caption="% Ating." FieldName="Part"
                                                    VisibleIndex="5" Width="80px">
                                                    <FooterCellStyle HorizontalAlign="Center">
                                                    </FooterCellStyle>
                                                </dxwgv:GridViewDataProgressBarColumn>

                                                <dxwgv:GridViewDataTextColumn FieldName="Real" VisibleIndex="3" Width="85px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <CellStyle ForeColor="Blue">
                                                    </CellStyle>
                                                    <FooterCellStyle ForeColor="Blue">
                                                    </FooterCellStyle>
                                                </dxwgv:GridViewDataTextColumn>

                                                <dxwgv:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc" ToolTip="Percentual de crescimento sobre o ano anterior" VisibleIndex="6" Width="70px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dxwgv:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn Caption="#" FieldName="indAting" ShowInCustomizationForm="True" VisibleIndex="4" Width="12px">
                                                </dx:GridViewDataTextColumn>

                                            </Columns>
                                            <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True"
                                                VerticalScrollableHeight="267" ShowFooter="True" />

                                            <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>

                                            <StylesEditors>
                                                <ProgressBar Height="25px">
                                                </ProgressBar>
                                            </StylesEditors>
                                        </dxwgv:ASPxGridView>

                                        <asp:SqlDataSource ID="dsMeta" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>"
                                            SelectCommand="Pascoa.uspBuscarComparativo" SelectCommandType="StoredProcedure" EnableCaching="False">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="1" Name="idCampanha" Type="Byte" />
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                                <asp:SessionParameter DefaultValue="" Name="Cod" SessionField="sCOD" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.span -->

                    </div>

                    <div class="row">

                        <div class="col-md-12">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 class="widget-title"><span class="fa fa-calendar">&nbsp </span>Campanha de Páscoa - Por Dia</h4>

                                    <div class="widget-toolbar">
                                        <a href="#" data-action="collapse">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>

                                        <a href="#" data-action="close">
                                            <i class="ace-icon fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main">

                                        <%--------------	--%>

                                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" KeyFieldName="Dia" Width="100%">
                                            <Toolbars>
                                                <dx:GridViewToolbar EnableAdaptivity="true">
                                                    <Items>
                                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" />
                                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" />
                                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" />
                                                    </Items>
                                                </dx:GridViewToolbar>
                                            </Toolbars>
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="OvosVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CaixaVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CoelhoVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ColombaVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="BacalhauVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="BarrasVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalVolume" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="OvosVolume" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CaixaVolume" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CoelhoVolume" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ColombaVolume" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="BacalhauVolume" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="BarrasVolume" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalMargemVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="OvosMargemVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CaixaMargemVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CoelhoMargemVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ColombaMargemVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="BacalhauMargemVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="BarrasMargemVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="TotalMargem" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="OvosMargem" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="CaixaMargem" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="CoelhoMargem" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ColombaMargem" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="BacalhauMargem" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="BarrasMargem" SummaryType="Custom" />
                                            </TotalSummary>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalVlr" ShowInGroupFooterColumn="TotalVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="OvosVlr" ShowInGroupFooterColumn="OvosVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CaixaVlr" ShowInGroupFooterColumn="CaixaVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CoelhoVlr" ShowInGroupFooterColumn="CoelhoVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ColombaVlr" ShowInGroupFooterColumn="ColombaVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="BacalhauVlr" ShowInGroupFooterColumn="BacalhauVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="BarrasVlr" ShowInGroupFooterColumn="BarrasVlr" SummaryType="Sum" />

                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalVolume" ShowInGroupFooterColumn="TotalVolume" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="OvosVolume" ShowInGroupFooterColumn="OvosVolume" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CaixaVolume" ShowInGroupFooterColumn="CaixaVolume" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CoelhoVolume" ShowInGroupFooterColumn="CoelhoVolume" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ColombaVolume" ShowInGroupFooterColumn="ColombaVolume" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="BacalhauVolume" ShowInGroupFooterColumn="BacalhauVolume" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="BarrasVolume" ShowInGroupFooterColumn="BarrasVolume" SummaryType="Sum" />

                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalMargemVlr" ShowInGroupFooterColumn="TotalMargemVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="OvosMargemVlr" ShowInGroupFooterColumn="OvosMargemVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CaixaMargemVlr" ShowInGroupFooterColumn="CaixaMargemVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="CoelhoMargemVlr" ShowInGroupFooterColumn="CoelhoMargemVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ColombaMargemVlr" ShowInGroupFooterColumn="ColombaMargemVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="BacalhauMargemVlr" ShowInGroupFooterColumn="BacalhauMargemVlr" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="BarrasMargemVlr" ShowInGroupFooterColumn="BarrasMargemVlr" SummaryType="Sum" />

                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="TotalMargem" ShowInGroupFooterColumn="TotalMargem" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="OvosMargem" ShowInGroupFooterColumn="OvosMargem" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="CaixaMargem" ShowInGroupFooterColumn="CaixaMargem" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="CoelhoMargem" ShowInGroupFooterColumn="CoelhoMargem" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ColombaMargem" ShowInGroupFooterColumn="ColombaMargem" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="BacalhauMargem" ShowInGroupFooterColumn="BacalhauMargem" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="BarrasMargem" ShowInGroupFooterColumn="BarrasMargem" SummaryType="Custom" />

                                            </GroupSummary>

                                            <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                                            <Columns>
                                                <dx:GridViewCommandColumn Visible="False" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="Dia" VisibleIndex="2" FixedStyle="Left" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="&nbsp;{0:dd/MM/yyyy} " EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="True" ShowFilterRowMenu="True" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="NomeDia" VisibleIndex="3" Caption="Desc." FixedStyle="Left" Width="60px">
                                                    <Settings AllowAutoFilter="False" />
                                                    <CellStyle>
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                    </CellStyle>
                                                    <FooterCellStyle>
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                    </FooterCellStyle>
                                                    <GroupFooterCellStyle>
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                    </GroupFooterCellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewBandColumn Caption="Ovos" VisibleIndex="5">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="OvosVolume" VisibleIndex="0" Caption="Volume" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="OvosVlr" VisibleIndex="1" Caption="R$" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle ForeColor="Blue">
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="OvosMargem" VisibleIndex="3" Caption="Margem" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </CellStyle>
                                                            <FooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="OvosMargemVlr" VisibleIndex="2" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="Caixa" VisibleIndex="6">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="CaixaVolume" VisibleIndex="0" Caption="Volume" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="CaixaVlr" VisibleIndex="1" Caption="R$" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle ForeColor="Blue">
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="CaixaMargem" VisibleIndex="3" Caption="Margem" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </CellStyle>
                                                            <FooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="CaixaMargemVlr" VisibleIndex="2" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="Coelhinho" VisibleIndex="7">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="CoelhoVolume" VisibleIndex="0" Caption="Volume" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="CoelhoVlr" VisibleIndex="1" Caption="R$" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle ForeColor="Blue">
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="CoelhoMargem" VisibleIndex="3" Caption="Margem" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </CellStyle>
                                                            <FooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="CoelhoMargemVlr" VisibleIndex="2" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="Colomba" VisibleIndex="8">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="ColombaVolume" VisibleIndex="0" Caption="Volume" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="ColombaVlr" VisibleIndex="1" Caption="R$" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle ForeColor="Blue">
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="ColombaMargem" VisibleIndex="3" Caption="Margem" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </CellStyle>
                                                            <FooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="ColombaMargemVlr" VisibleIndex="2" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="Bacalhau" VisibleIndex="16">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="BacalhauVolume" VisibleIndex="0" Caption="Volume" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="BacalhauVlr" VisibleIndex="1" Caption="R$" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle ForeColor="Blue">
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="BacalhauMargem" VisibleIndex="3" Caption="Margem" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </CellStyle>
                                                            <FooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="BacalhauMargemVlr" VisibleIndex="2" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="Barras" VisibleIndex="18">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="BarrasVolume" VisibleIndex="0" Caption="Volume" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="BarrasVlr" VisibleIndex="1" Caption="R$" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle ForeColor="Blue">
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="BarrasMargem" VisibleIndex="3" Caption="Margem" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </CellStyle>
                                                            <FooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </FooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="BarrasMargemVlr" VisibleIndex="2" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="Total" VisibleIndex="4">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="TotalVolume" VisibleIndex="0" Caption="Volume" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="TotalVlr" VisibleIndex="1" Caption="R$" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle ForeColor="Blue">
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="TotalMargem" VisibleIndex="3" Caption="Margem" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </CellStyle>
                                                            <FooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="TotalMargemVlr" VisibleIndex="2" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <HeaderStyle BackColor="Silver" />
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewDataTextColumn Caption="Mês" FieldName="Mes" VisibleIndex="1" Width="50px" FixedStyle="Left">
                                                    <CellStyle HorizontalAlign="Center">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                            <SettingsAdaptivity>
                                                <AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
                                            </SettingsAdaptivity>

                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowGroupPanel="True" ShowGroupFooter="VisibleAlways" />
                                            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                            <Styles>
                                                <Header HorizontalAlign="Center">
                                                </Header>
                                                <AlternatingRow BackColor="#F2F2F2">
                                                </AlternatingRow>
                                                <FocusedRow BackColor="#FFFF99" Font-Bold="True" ForeColor="#0066FF">
                                                </FocusedRow>
                                                <Footer Font-Bold="True">
                                                </Footer>
                                            </Styles>
                                        </dx:ASPxGridView>

                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Pascoa.uspBuscarTotalDaPascoaPorDia" SelectCommandType="StoredProcedure" EnableCaching="False">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>



                                        <%--------------	--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.span -->


                    </div>

                    <div class="row">

                        <div class="col-md-12">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 class="widget-title"><span class="fa fa-industry"></span>&nbsp Campanha de Páscoa - Total por Loja</h4>

                                    <div class="widget-toolbar">
                                        <a href="#" data-action="collapse">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>

                                        <a href="#" data-action="close">
                                            <i class="ace-icon fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main">

                                        <%--------------	--%>

                                        <div id="divTitulo">
                                            <asp:Label ID="lblTitulo" runat="server" Text="Label" Font-Bold="False" ForeColor="#666666"></asp:Label>
                                        </div>

                                        <div id="divTitulo1">
                                            <asp:Label ID="lblTitulo1" runat="server" Font-Bold="False" ForeColor="#666666" Text="Label"></asp:Label>
                                        </div>


                                        <dxwgv:ASPxGridView ID="grid_Total" runat="server"
                                            AutoGenerateColumns="False"
                                            CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css"
                                            CssPostfix="Office2003_Blue" DataSourceID="dsSuper"
                                            Width="100%" KeyFieldName="idFilial" Theme="DevEx" EnableTheming="True">
                                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                            <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css"
                                                CssPostfix="Office2003_Blue">
                                                <Header ImageSpacing="5px" SortingImageSpacing="5px" HorizontalAlign="Center">
                                                </Header>
                                                <AlternatingRow BackColor="#EAF5FF">
                                                </AlternatingRow>
                                                <Footer Font-Bold="True">
                                                </Footer>
                                                <LoadingPanel ImageSpacing="10px">
                                                </LoadingPanel>
                                                <TitlePanel ForeColor="#666666" Font-Bold="True" Font-Size="Medium">
                                                </TitlePanel>
                                            </Styles>
                                            <SettingsAdaptivity>
                                                <AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
                                            </SettingsAdaptivity>

                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                                <CollapsedButton Height="12px"
                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"
                                                    Width="11px" />
                                                <ExpandedButton Height="12px"
                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                                <DetailCollapsedButton Height="12px"
                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"
                                                    Width="11px" />
                                                <DetailExpandedButton Height="12px"
                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                                <FilterRowButton Height="13px" Width="13px" />
                                            </Images>
                                            <SettingsText Title="Análise da Páscoa 2012" />
                                            <Toolbars>
                                                <dx:GridViewToolbar EnableAdaptivity="true">
                                                    <Items>
                                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                                    </Items>
                                                </dx:GridViewToolbar>
                                            </Toolbars>
                                            <TotalSummary>
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresQtde" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaAA" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresVenda" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="MargemAA" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Margem" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dif" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroAA" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Lucro" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresLucro" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeEstoque" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalQuilos" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrEstoque" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAA" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difCliente" SummaryType="Custom" />
                                            </TotalSummary>
                                            <Columns>

                                                <dxwgv:GridViewDataTextColumn FieldName="idFilial" Visible="false" Caption="Filial" Width="40" VisibleIndex="0" FixedStyle="Left">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn FieldName="Descricao" Caption="Descrição" Width="140px" VisibleIndex="1" FixedStyle="Left">
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>

                                                <dxwgv:GridViewBandColumn Caption="Volume" ToolTip="Comparativo do ano atual versus ano anterior do volume de vendas de ovos de páscoa." VisibleIndex="2">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="QtdeAA" VisibleIndex="0" Width="90px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="Qtde" VisibleIndex="1" Width="90px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresQtde" VisibleIndex="2" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                </dxwgv:GridViewBandColumn>
                                                <dxwgv:GridViewBandColumn Caption="Vendas R$" ToolTip="Comparativo do ano atual versus ano anterior das vendas de ovos de páscoa." VisibleIndex="3">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="VendaAA" VisibleIndex="0" Width="90px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="Venda" VisibleIndex="1" Width="90px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresVenda" VisibleIndex="2" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                </dxwgv:GridViewBandColumn>
                                                <dxwgv:GridViewBandColumn Caption="Margem com Sell-Out" ToolTip="Comparativo do ano atual versus ano anterior da margem de ovos de páscoa." VisibleIndex="4" Name="bandMargem">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="MargemAA" VisibleIndex="0" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="2014" FieldName="Margem" VisibleIndex="1" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Dif." FieldName="Dif" VisibleIndex="2" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                </dxwgv:GridViewBandColumn>

                                                <dxwgv:GridViewBandColumn Caption="Nº de Clientes" ToolTip="Número de clientes que compraram Ovos de Páscoa" VisibleIndex="6">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="numCliente" VisibleIndex="1" Width="85px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="numClienteAA" VisibleIndex="0" Width="85px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Dif." FieldName="difCliente" ToolTip="Diferença de número de clientes entre esse ano e ano passado." VisibleIndex="2" Width="70px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                </dxwgv:GridViewBandColumn>

                                                <dxwgv:GridViewDataTextColumn FieldName="Ordem" VisibleIndex="9" Visible="false">
                                                </dxwgv:GridViewDataTextColumn>

                                                <dxwgv:GridViewBandColumn Caption="Lucro" ToolTip="Comparativo do ano atual versus ano anterior da lucratividade de ovos de páscoa." VisibleIndex="5" Name="bandLucro" Visible="False">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="LucroAA" VisibleIndex="0" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="Lucro" VisibleIndex="1" Width="70px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresLucro" VisibleIndex="2" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                </dxwgv:GridViewBandColumn>

                                                <dxwgv:GridViewBandColumn Caption="Estoques" VisibleIndex="8" Name="bandEstoque" Visible="False">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="Volume" FieldName="QtdeEstoque" VisibleIndex="0" Width="70px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vlrEstoque" ToolTip="Valor do estoque pelo Custo Condor" VisibleIndex="2" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Peso" FieldName="TotalQuilos" ToolTip="Peso multiplicado de cada ovos" VisibleIndex="1" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                </dxwgv:GridViewBandColumn>

                                            </Columns>
                                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                            <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True"
                                                VerticalScrollableHeight="400" ShowFooter="True" HorizontalScrollBarMode="Visible" />

                                            <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>

                                            <StylesEditors>
                                                <ProgressBar Height="25px">
                                                </ProgressBar>
                                            </StylesEditors>
                                        </dxwgv:ASPxGridView>

                                        <asp:SqlDataSource ID="dsSuper" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>"
                                            SelectCommand="Pascoa.uspBuscarAnaliseTotalPorCod" SelectCommandType="StoredProcedure" EnableCaching="False">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="idCampanha" SessionField="sCAMPANHA" />
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                                <asp:SessionParameter Name="Cod" SessionField="sCOD" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <%--------------	--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.span -->


                    </div>


                    <div class="row" id="container_Itens" runat="server" visible="false">

                        <div class="col-md-12">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 class="widget-title"><span class="fa fa-shopping-cart">&nbsp</span>Todos Itens da Categoria</h4>

                                    <div class="widget-toolbar">
                                        <a href="#" data-action="collapse">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>

                                        <a href="#" data-action="close">
                                            <i class="ace-icon fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main">

                                        <dxwgv:ASPxGridView ID="gridTodosItens" runat="server" AutoGenerateColumns="False" DataSourceID="dsTodos" EnableTheming="True" Theme="DevEx" Width="100%" KeyFieldName="CodProduto">
                                            <Toolbars>
                                                <dx:GridViewToolbar EnableAdaptivity="true">
                                                    <Items>
                                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" />
                                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" />
                                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar CSV" />
                                                    </Items>
                                                </dx:GridViewToolbar>
                                            </Toolbars>
                                            <TotalSummary>
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Sum" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercial" SummaryType="Sum" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeEstoque" SummaryType="Sum" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalQuilos" SummaryType="Sum" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrEstoque" SummaryType="Sum" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrEstoque_Venda" SummaryType="Sum" />
                                            </TotalSummary>
                                            <GroupSummary>
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" ShowInGroupFooterColumn="QtdVendas" SummaryType="Sum" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" ShowInGroupFooterColumn="Venda" SummaryType="Sum" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercial" ShowInGroupFooterColumn="LucroComercial" SummaryType="Sum" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="percMargem" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeEstoque" ShowInGroupFooterColumn="qtdeEstoque" SummaryType="Sum" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalQuilos" ShowInGroupFooterColumn="TotalQuilos" SummaryType="Sum" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrEstoque" ShowInGroupFooterColumn="vlrEstoque" SummaryType="Sum" />
                                            </GroupSummary>

                                            <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                                            <Columns>
                                                <dxwgv:GridViewDataTextColumn Caption="Cod" FieldName="CodProduto" VisibleIndex="1" Width="60px" FixedStyle="Left">
                                                    <Settings AutoFilterCondition="Contains" />
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="DescProduto" VisibleIndex="2" Width="210px" FixedStyle="Left">
                                                    <Settings AutoFilterCondition="Contains" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <CellStyle Wrap="False">
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                    </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewBandColumn Caption="Vendas" VisibleIndex="3">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" VisibleIndex="0" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="Venda" VisibleIndex="1" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Lucro" FieldName="LucroComercial" VisibleIndex="2" Width="70px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="% Mrg" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Preço Médio" FieldName="preco_medio" UnboundType="Decimal" VisibleIndex="4" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                </dxwgv:GridViewBandColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Pos." FieldName="Ranking" VisibleIndex="0" Width="40px" ToolTip="Posição" FixedStyle="Left">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <CellStyle HorizontalAlign="Center">
                                                    </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Fornecedor" FieldName="descFornecedor" VisibleIndex="7" Width="150px">
                                                    <Settings AutoFilterCondition="Contains" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewBandColumn Caption="Estoques" VisibleIndex="8">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="Volume" FieldName="qtdeEstoque" VisibleIndex="0" Width="70px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Peso" FieldName="TotalQuilos" VisibleIndex="1" Width="70px" Visible="False">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="R$ pelo Custo" FieldName="vlrEstoque" VisibleIndex="2" Width="120px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="R$ pelo Preço Médio" FieldName="vlrEstoque_Venda" UnboundType="Decimal" VisibleIndex="3" Width="130px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                </dxwgv:GridViewBandColumn>
                                            </Columns>
                                            <SettingsBehavior ColumnResizeMode="Control" />
                                            <SettingsAdaptivity>
                                                <AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
                                            </SettingsAdaptivity>

                                            <SettingsPager PageSize="18">
                                            </SettingsPager>
                                            <Settings ShowTitlePanel="True" ShowFooter="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="450" ShowGroupPanel="true" ShowGroupFooter="VisibleAlways" ShowFilterRow="True" HorizontalScrollBarMode="Visible" />
                                            <SettingsText Title="Ovos de Páscoa - Todos Itens" EmptyDataRow="Não há informações disponiveis" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                            <Styles>
                                                <Header HorizontalAlign="Center">
                                                </Header>
                                                <Footer Font-Bold="True">
                                                </Footer>
                                                <GroupFooter BackColor="#DDDDDD" Font-Bold="True">
                                                </GroupFooter>
                                                <TitlePanel Font-Bold="True" Font-Size="Medium">
                                                </TitlePanel>
                                                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"></FocusedRow>
                                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>


                                            </Styles>
                                        </dxwgv:ASPxGridView>

                                        <asp:SqlDataSource ID="dsTodos" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Pascoa.uspBuscarTodosItens" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                <asp:SessionParameter Name="Cod" SessionField="sCOD" Type="Byte" />
                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.span -->


                    </div>


                    <%------------------------------------------------------------------------------------------------------------------------------------------------------%>

                    <div class="row">

                        <div class="col-md-12">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 class="widget-title"><span class="glyphicon glyphicon-list-alt"></span>Particiapação dos Ovos de Páscoa</h4>

                                    <div class="widget-toolbar">
                                        <a href="#" data-action="collapse">
                                            <i class="ace-icon fa fa-chevron-up"></i>
                                        </a>

                                        <a href="#" data-action="close">
                                            <i class="ace-icon fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>

                                <div class="widget-body">
                                    <div class="widget-main">

                                        <dx:ASPxGridView ID="gridParticipacao" runat="server" AutoGenerateColumns="False" DataSourceID="dsParticipacao" EnableTheming="True" Theme="SoftOrange" Width="100%" KeyboardSupport="True" KeyFieldName="DateAbrev1">
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <Settings ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Auto" ShowGroupFooter="VisibleAlways" />
                                            <SettingsBehavior AllowFocusedRow="True" AllowFixedGroups="True" />
                                            <SettingsResizing ColumnResizeMode="Control" />
                                            <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
                                            <SettingsText HeaderFilterShowAll="Todos Grupos" />
                                            <Columns>
                                                <dx:GridViewCommandColumn Visible="False" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="-&gt; " FieldName="descSemana" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px" FixedStyle="Left" ReadOnly="True" SortIndex="0" SortOrder="Ascending" GroupIndex="0">
                                                    <Settings AllowHeaderFilter="False" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn Caption="Período" FieldName="DateAbrev1" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewBandColumn Caption="2021" ShowInCustomizationForm="True" VisibleIndex="3" Name="gridParticipacao_AA">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartVendaAA" ShowInCustomizationForm="True" ToolTip="Percentual de Atingimento" VisibleIndex="1" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle Font-Bold="False">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="2022" ShowInCustomizationForm="True" VisibleIndex="4" Name="gridParticipacao_AT">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle ForeColor="#009900">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="#009900">
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle ForeColor="#009900">
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle ForeColor="Blue">
                                                            </GroupFooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Dif. M x R" FieldName="difMeta" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" ToolTip="Diferença Meta x Realizado">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle BackColor="#009900" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingMeta" ShowInCustomizationForm="True" ToolTip="% de Atingimento de Meta" VisibleIndex="3" Width="65px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle BackColor="#009900" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartVendaAT" ShowInCustomizationForm="True" VisibleIndex="4" Width="65px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>


                                                <dx:GridViewBandColumn Caption="2021 x 2022" ShowInCustomizationForm="True" VisibleIndex="5" Name="gridParticipacao_Diferenca">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difVenda" ShowInCustomizationForm="True" ToolTip="Diferença entre o Ano de 2020 e 2019" VisibleIndex="0" Width="90px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCresc" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>


                                                <dx:GridViewBandColumn Caption="Participação Acumulada" ShowInCustomizationForm="True" VisibleIndex="7">
                                                    <HeaderStyle BackColor="Gray" />
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="2021" FieldName="running_percPartVendaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle BackColor="Gray" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="2022" FieldName="running_percPartVendaAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="75px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle BackColor="Gray" />
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>


                                                <dx:GridViewBandColumn Caption="Venda Acumulada" ShowInCustomizationForm="True" VisibleIndex="6">
                                                    <HeaderStyle BackColor="Gray" />
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="2021" FieldName="running_vlrVendaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle BackColor="Gray" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="2022" FieldName="running_vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle BackColor="Gray" />
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="running_percCrescVenda" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento da Venda Acumulada" VisibleIndex="2" Width="70px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle BackColor="Gray" />
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>


                                                <dx:GridViewDataTextColumn FieldName="Datekey" ShowInCustomizationForm="True" SortIndex="1" SortOrder="Ascending" Visible="False" VisibleIndex="8">
                                                </dx:GridViewDataTextColumn>


                                            </Columns>
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difMeta" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartVendaAA" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartVendaAT" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMeta" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVenda" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                            </TotalSummary>

                                            <GroupSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" ShowInGroupFooterColumn="vlrVendaAA" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" ShowInGroupFooterColumn="vlrVendaAT" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" ShowInGroupFooterColumn="vlrMeta" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difMeta" ShowInGroupFooterColumn="difMeta" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartVendaAA" ShowInGroupFooterColumn="percPartVendaAA" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartVendaAT" ShowInGroupFooterColumn="percPartVendaAT" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMeta" ShowInGroupFooterColumn="percAtingMeta" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVenda" ShowInGroupFooterColumn="difVenda" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" ShowInGroupFooterColumn="percCresc" SummaryType="Custom" />

                                            </GroupSummary>

                                            <Styles>
                                                <Header HorizontalAlign="Center">
                                                </Header>
                                                <GroupRow BackColor="#FF8B3E" Font-Bold="False" ForeColor="White">
                                                </GroupRow>
                                                <AlternatingRow BackColor="#E1E1E1">
                                                </AlternatingRow>
                                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                </FocusedRow>
                                                <Footer Font-Bold="True" BackColor="#CCFF99">
                                                </Footer>
                                                <GroupFooter Font-Bold="True">
                                                </GroupFooter>
                                            </Styles>
                                        </dx:ASPxGridView>

                                        <asp:SqlDataSource ID="dsParticipacao" runat="server" ConnectionString="<%$ ConnectionStrings:gerTempConnectionString %>" SelectCommand="Campanhas.uspBuscar_Acompanhamento_Dia" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                <asp:SessionParameter Name="idCampanha" SessionField="sCAMPANHA" Type="Byte" />
                                                <asp:SessionParameter Name="Cod" SessionField="sCOD" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>




                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.span -->


                    </div>


                    <asp:Label ID="lblError" runat="server" Text="Label" ForeColor="Red" Visible="false"></asp:Label>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>


    </div>



    <br />



    <script src="../../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../../js/bootstrap.min.js"></script>
    <script src="../../../plugins/fastclick/fastclick.min.js"></script>
    <script src="../../../dist/js/app.min.js"></script>
    <script src="../../../plugins/sparkline/jquery.sparkline.min.js"></script>

    <script src="../../../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="../../../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="../../../plugins/slimScroll/jquery.slimscroll.min.js"></script>


    <script src="../../../dist/js/pages/dashboard2.js"></script>
    <script src="../../../dist/js/demo.js"></script>


    <script src="../../../assets/js/jquery-ui.custom.min.js"></script>
    <script src="../../../assets/js/jquery.ui.touch-punch.min.js"></script>
    <script src="../../../assets/js/chosen.jquery.min.js"></script>
    <script src="../../../assets/js/spinbox.min.js"></script>
    <script src="../../../assets/js/bootstrap-datepicker.min.js"></script>
    <script src="../../../assets/js/bootstrap-timepicker.min.js"></script>
    <script src="../../../assets/js/moment.min.js"></script>
    <script src="../../../assets/js/daterangepicker.min.js"></script>
    <script src="../../../assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="../../../assets/js/bootstrap-colorpicker.min.js"></script>
    <script src="../../../assets/js/jquery.knob.min.js"></script>
    <script src="../../../assets/js/autosize.min.js"></script>
    <script src="../../../assets/js/jquery.inputlimiter.min.js"></script>
    <script src="../../../assets/js/jquery.maskedinput.min.js"></script>
    <script src="../../../assets/js/bootstrap-tag.min.js"></script>

    <!-- ace scripts -->
    <script src="../../../assets/js/ace-elements.min.js"></script>
    <script src="../../../assets/js/ace.min.js"></script>

</asp:Content>

