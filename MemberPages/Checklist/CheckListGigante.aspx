<%@ Page Title="Checklist - Gigante" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CheckListGigante.aspx.vb" Inherits="MemberPages_CheckListGigante" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="../../Controles/wucAguarde.ascx" TagName="wucAguarde" TagPrefix="uc3" %>
<%@ Register Src="~/Controles/wuciListaDia.ascx" TagPrefix="uc2" TagName="wuciListaDia" %>
<%@ Register Src="~/Controles/wuciListaLojasComApoio.ascx" TagPrefix="uc2" TagName="wuciListaLojasComApoio" %>
<%@ Register Src="../../Controles/wucAguardeRoda.ascx" TagName="wucAguardeRoda" TagPrefix="uc1" %>
<%@ Register Src="../../Controles/wucListaLojasComCorporacao.ascx" TagName="wucListaLojasComCorporacao" TagPrefix="uc4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../Styles/style.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/canvas2image@1.0.5/canvas2image.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/jquery.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/bootstrap.min.js"></script>
    <script src="../../js/bootstrap.js"></script>

    <style>
        .btn-wrap-text {
            white-space: normal !important;
            word-wrap: break-word !important;
        }

        .modal-dialog {
            margin-left: auto;
            margin-right: auto;
            max-width: 850px;
        }

        .fileEscondido {
            overflow: hidden;
            position: relative;
        }

            .fileEscondido input[type=file] {
                opacity: 0;
                font-size: 15px;
                position: absolute;
                right: 0px;
                top: 0px;
                opacity: 0;
                cursor: pointer;
            }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
    </p>

    <aspxcallbackpanel id="UpdatePanel1" runat="server" width="95%" theme="Metropolis" clientinstancename="LoadingPanel" settingsloadingpanel-text="Aguarde...">
        <panelcollection>
            <panelcontent>

                <div class="container col-12 justify-content-center" style="padding: 30px 0 30px 0; max-width: 98%; font-size: 12px" runat="server" id="divMenu">
                    <div class="row col-md-12 justify-content-center text-center">
                        <div class="col-auto xs">
                            <%--<uc2:wuciListaDia runat="server" ID="cboDia" />--%>
                            <div class="input-group">
                                <span class="input-group-text" style="font-size: 10px; height: 30px">Dia:</span>
                                <input type="date" class="form-control xs" autopostback="true" runat="server" style="font-size: 10px; height: 30px" id="txtData" onchange="btnAtualizar_Click" />
                                <%--                            <asp:TextBox ID="txtData" runat="server" Font-Size="10px" Height="30px" type="date" AutoPostBack="true" class="form-control xs" On OnTextChanged="btnAtualizar_Click"></asp:TextBox>--%>
                            </div>

                        </div>
                        <div class=" row col-auto">
                            <%--<uc4:wucListaLojasComCorporacao ID="cboFilial" runat="server" />--%>

                            <div class="col col-auto" style="max-width: 200px; max-height: 30px;">
                                <div class="input-group input-group xs">
                                    <div class="input-group-prepend" style="max-height: 30px">
                                        <div class="input-group-text" style="font-size: 10px">Filial</div>
                                    </div>
                                    <asp:DropDownList class="form-control" Font-Size="10px" Height="30px" ID="selFilial" runat="server" DataTextField="Desc"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col col-auto" style="width: auto;">
                                <div class="input-group ">
                                    <div class="input-group-prepend" style="max-height: 30px">
                                        <div class="input-group-text" style="font-size: 10px">Tipo</div>
                                    </div>
                                    <asp:DropDownList class="form-control" ID="selTipo" Font-Size="10px" Width="110px" Height="30px" runat="server" DataTextField="Desc" AutoPostBack="true" OnSelectedIndexChanged="selTipo_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="col-auto">
                            <dx:ASPxButton ID="btnAtualizar" runat="server" Height="30px" Font-Size="10px" Text="Atualizar" AutoPostBack="True" CssClass="btn-sm">
                                <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Buscando informações...');}" />
                            </dx:ASPxButton>
                        </div>
                        <div class="col-auto">
                            <dx:ASPxButton ID="btnPDF" runat="server" Font-Size="10px" Height="30px" Enabled="false" Text="Relatório" CssClass="btn-sm">
                                <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Gerando Relatório...');}" />
                            </dx:ASPxButton>
                        </div>
                    </div>

                    <div class="row col-md-12 justify-content-center text-center">
                        <asp:Label ID="lblError" runat="server" Text="Label" Visible="false"></asp:Label>
                        <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                    </div>

                    <br />
                    <div class="row col-md-12 justify-content-center text-center" style="padding-bottom: 15px">
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_1" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Recebimento (Docas/Pátio)" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_1_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_2" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Recebimento (Sala_Digitação)" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_2_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_3" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Trocas" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_3_Click" Style="background-repeat: round" />
                        </div>
                    </div>

                    <div class="row col-md-12 justify-content-center text-center" style="padding-bottom: 15px">
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_4" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Armanezamento (Depósito Seco)" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_4_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_5" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Armanezamento (Antecâmara Climatizada)" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_5_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_6" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Armanezamento (Depósito Climatizado)" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_6_Click" Style="background-repeat: round" />
                        </div>
                    </div>

                    <div class="row col-md-12 justify-content-center text-center" style="padding-bottom: 15px">
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_7" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Armanezamento (Hortifruti)" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_7_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_8" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Armanezamento (Padaria/Confeitaria)" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_8_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_9" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Area de Vendas (Perecíveis)" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_9_Click" Style="background-repeat: round" />
                        </div>
                    </div>

                    <div class="row col-md-12 justify-content-center text-center" style="padding-bottom: 15px">
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_10" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Area de Vendas (Hortifruti)" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_10_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_11" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Area de Vendas (P.A.R.)" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_11_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_12" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Area de Vendas (Geral)" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_12_Click" Style="background-repeat: round" />
                        </div>
                    </div>

                    <div class="row col-md-12 justify-content-center text-center" style="padding-bottom: 15px">
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_13" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Frente de caixa" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_13_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_14" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Retira" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_14_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_15" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Televendas" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_15_Click" Style="background-repeat: round" />
                        </div>
                    </div>

                    <div class="row col-md-12 justify-content-center text-center" style="padding-bottom: 15px">
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_16" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Segurança Patrimonial" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_16_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_17" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Cozinha" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_17_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_18" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Administrativo" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_18_Click" Style="background-repeat: round" />
                        </div>
                    </div>

                    <div class="row col-md-12 justify-content-center text-center">
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_19" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Banheiros" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_19_Click" Style="background-repeat: round" />
                        </div>
                    </div>
                </div>

                <div class="row col-11 justify-content-end" runat="server" style="padding: 30px 0 15px 0" id="divVoltar" visible="false">

                    <asp:Button runat="server" ID="btnVoltar" OnClick="btnVoltar_Click" AutoPostBack="False" CssClass="btn btn-danger btn-lg" Text="Voltar" Width="100px" />


                </div>

                <div class="row col-md-12 justify-content-center text-center">
                    <div class="col-auto justify-content-center">
                        <div class="alert alert-danger" id="dangerAlert" style="text-align: center; display: none">
                            <strong>Ocorreu um problema no salvamento da imagem!</strong>
                        </div>

                        <div class="alert alert-success" id="success-alert" style="text-align: center; display: none">
                            <strong>A imagem foi salva com sucesso!</strong>
                        </div>
                    </div>
                </div>

                <div class="row col-md-12 justify-content-center text-center">
                    <div class="col-auto justify-content-center">

                        <table cellspacing="1">
                            <tr>
                                <td>
                                    <dx:ASPxCallback ID="ASPxCallback" runat="server" ClientInstanceName="Callback">
                                        <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Show(); }" />
                                    </dx:ASPxCallback>

                                    <dx:ASPxLoadingPanel ID="ASPxLoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
                                        Modal="True" Text="Salvando. Aguarde...">
                                    </dx:ASPxLoadingPanel>
                                </td>
                            </tr>
                        </table>


                        <asp:Panel ID="panDados1" runat="server" CssClass="justify-content-center" Visible="false" Style="border: solid 1px #c0c0c0; align-content: center">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Recebimento (Docas/Pátio)</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">1.1</td>
                                            <td>Setor de Recebimento (incluindo a Plataforma de Recebimento e pátio) encontram-se limpo e organizado? 
                                                <asp:TextBox ID="txt1_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_1_Sim" runat="server" GroupName="grupo1_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_1_Nao" runat="server" GroupName="grupo1_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_1_NA" runat="server" GroupName="grupo1_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1--%>
                                        <tr>
                                            <td align="center">1.2</td>
                                            <td>A compactadora de lixo encontra-se trancada com cadeado, com abertura controlada?
                                                <asp:TextBox ID="txt1_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_2_Sim" runat="server" GroupName="grupo1_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_2_Nao" runat="server" GroupName="grupo1_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_2_NA" runat="server" GroupName="grupo1_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.2--%>
                                        <tr>
                                            <td align="center">1.3</td>
                                            <td>Quando não estão em horário de funcionamento, as portas das docas estão devidamente fechadas?
                                                <asp:TextBox ID="txt1_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_3_Sim" runat="server" GroupName="grupo1_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_3_Nao" runat="server" GroupName="grupo1_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_3_NA" runat="server" GroupName="grupo1_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.3--%>
                                        <tr>
                                            <td align="center">1.4</td>
                                            <td>Todo descarte de produtos (Ag. 23) está sendo verificado e acompanhado pelo Fiscal de Doca?
                                                <asp:TextBox ID="txt1_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_4_Sim" runat="server" GroupName="grupo1_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_4_Nao" runat="server" GroupName="grupo1_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_4_NA" runat="server" GroupName="grupo1_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.4--%>
                                        <tr>
                                            <td align="center">1.5</td>
                                            <td>Todos os funcionários e promotores transitando na área de conferência estão autorizadas e com uso do EPI adequado?
                                                <asp:TextBox ID="txt1_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_5_Sim" runat="server" GroupName="grupo1_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_5_Nao" runat="server" GroupName="grupo1_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_5_NA" runat="server" GroupName="grupo1_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.5--%>
                                        <tr>
                                            <td align="center">1.6</td>
                                            <td>Está sendo realizada a verificação de temperatura da mercadoria perecível (todas as cargas) no ato do recebimento? A planilha está sendo preenchida corretamente? O termomêtro está calibrado?
                                                <asp:TextBox ID="txt1_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_6_Sim" runat="server" GroupName="grupo1_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_6_Nao" runat="server" GroupName="grupo1_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_6_NA" runat="server" GroupName="grupo1_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.6--%>
                                        <tr>
                                            <td align="center">1.7</td>
                                            <td>Os pallets Full (doca) estão saindo do Recebimento para loja, câmaras climatizadas e / ou depósito com o crachá de identificação preenchidos corretamente? 
                                                <asp:TextBox ID="txt1_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_7_Sim" runat="server" GroupName="grupo1_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_7_Nao" runat="server" GroupName="grupo1_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_7_NA" runat="server" GroupName="grupo1_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.7--%>
                                        <tr>
                                            <td align="center">1.8</td>
                                            <td>A balança do recebimento está calibrada? (verificar checklist CPD).
                                                <asp:TextBox ID="txt1_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_8_Sim" runat="server" GroupName="grupo1_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_8_Nao" runat="server" GroupName="grupo1_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_8_NA" runat="server" GroupName="grupo1_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.8--%>
                                        <tr>
                                            <td align="center">1.9</td>
                                            <td>O Fiscal de Doca realiza a vistoria no descarte de lixo, papelão e plástico?
                                                <asp:TextBox ID="txt1_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_9_Sim" runat="server" GroupName="grupo1_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_9_Nao" runat="server" GroupName="grupo1_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_9_NA" runat="server" GroupName="grupo1_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.9--%>
                                        <tr>
                                            <td align="center">1.10</td>
                                            <td>Está sendo verificada a validade dos produtos no ato de conferência, respeitando o tolerância de 2 /3 (dois terços) da data de fabricação para entregas de Fornecedores Diretos?
                                                <asp:TextBox ID="txt1_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_10_Sim" runat="server" GroupName="grupo1_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_10_Nao" runat="server" GroupName="grupo1_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_10_NA" runat="server" GroupName="grupo1_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.10--%>
                                        <tr>
                                            <td align="center">1.11</td>
                                            <td>Os Encarregados de Perecíveis acompanham o recebimento de produtos, avaliando o frescor, qualidade, validade, com abertura das caixas dos produtos recebidos? 
                                                <asp:TextBox ID="txt1_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_11_Sim" runat="server" GroupName="grupo1_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_11_Nao" runat="server" GroupName="grupo1_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_11_NA" runat="server" GroupName="grupo1_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.11--%>
                                        <tr>
                                            <td align="center">1.12</td>
                                            <td>Toda conferência é realizada sem interferência de terceiros (entregador, motorista, promotor, etc)?
                                                <asp:TextBox ID="txt1_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_12_Sim" runat="server" GroupName="grupo1_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_12_Nao" runat="server" GroupName="grupo1_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_12_NA" runat="server" GroupName="grupo1_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.12--%>
                                        <tr>
                                            <td align="center">1.13</td>
                                            <td>O formulário de controle de pallets recebido pela empresa terceirizada, está sendo preenchido corretamente?
                                                <asp:TextBox ID="txt1_13" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_13_Sim" runat="server" GroupName="grupo1_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_13_Nao" runat="server" GroupName="grupo1_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_13_NA" runat="server" GroupName="grupo1_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.13--%>
                                        <tr>
                                            <td align="center">1.14</td>
                                            <td>Toda saída de mercadoria pelo Setor de Recebimento está sendo realizada através de emissão de Nota Fiscal?
                                                <asp:TextBox ID="txt1_14" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_14_Sim" runat="server" GroupName="grupo1_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_14_Nao" runat="server" GroupName="grupo1_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_14_NA" runat="server" GroupName="grupo1_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.14--%>
                                        <tr>
                                            <td align="center">1.15</td>
                                            <td>O controle de ocorrências do recebimento (entrada de NFs, devolução, temperatura, caminhões, irregularidades de recebimento) está sendo preenchido corretamente?
                                                <asp:TextBox ID="txt1_15" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_15_Sim" runat="server" GroupName="grupo1_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_15_Nao" runat="server" GroupName="grupo1_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_15_NA" runat="server" GroupName="grupo1_15" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_15" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_15" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.15--%>
                                        <tr>
                                            <td align="center">1.16</td>
                                            <td>As pallets cheps estão empilhados corretamente sem oferecer riscos de queda e acidentes?
                                                <asp:TextBox ID="txt1_16" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_16_Sim" runat="server" GroupName="grupo1_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_16_Nao" runat="server" GroupName="grupo1_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_16_NA" runat="server" GroupName="grupo1_16" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_16" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_16" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.16--%>
                                        <tr>
                                            <td align="center">1.17</td>
                                            <td>Os pallets e contentores estão organizadas sem acúmulos de água e / ou mercadorias? A devolução é feita periódicamente ao CD?
                                                <asp:TextBox ID="txt1_17" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_17_Sim" runat="server" GroupName="grupo1_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_17_Nao" runat="server" GroupName="grupo1_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_17_NA" runat="server" GroupName="grupo1_17" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_17" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_17" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.17--%>
                                        <tr>
                                            <td align="center">1.18</td>
                                            <td>O portão de acesso para carga e descarga do Setor de Recebimento, encontra-se fechado fora do horário de funcionamento do recebimento?
                                                <asp:TextBox ID="txt1_18" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_18_Sim" runat="server" GroupName="grupo1_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_18_Nao" runat="server" GroupName="grupo1_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_18_NA" runat="server" GroupName="grupo1_18" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_18" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_18" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.18--%>

                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo1" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>
                                    </tbody>
                                </table>
                            </p>

                        </asp:Panel>
                        <%--1 - Recebimento (Docas/Pátio)--%>

                        <asp:Panel ID="panDados2" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>

                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Recebimento (Sala Digitação)</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">2.1</td>
                                            <td>Todas as notas fiscais estão acatadas? (Sem falta de pedido, divergência de quantidade ou custo)?
                                                <asp:TextBox ID="txt2_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_1_Sim" runat="server" GroupName="grupo2_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_1_Nao" runat="server" GroupName="grupo2_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_1_NA" runat="server" GroupName="grupo2_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1--%>
                                        <tr>
                                            <td align="center">2.2</td>
                                            <td>As notas sem acatar estão sendo passadas diariamente para correção ao setor responsável?
                                                <asp:TextBox ID="txt2_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_2_Sim" runat="server" GroupName="grupo2_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_2_Nao" runat="server" GroupName="grupo2_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_2_NA" runat="server" GroupName="grupo2_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.2--%>
                                        <tr>
                                            <td align="center">2.3</td>
                                            <td>Há orientação sobre as normativas para entrada de pessoas externas (entregadores, caminhoneiros, crianças) no recebimento?
                                                <asp:TextBox ID="txt2_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_3_Sim" runat="server" GroupName="grupo2_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_3_Nao" runat="server" GroupName="grupo2_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_3_NA" runat="server" GroupName="grupo2_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.3--%>

                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo2" runat="server" Text="Enviar">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--2 - Recebimento (Sala Digitação)--%>

                        <asp:Panel ID="panDados3" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">

                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>

                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Trocas</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">3.1</td>
                                            <td>As áreas de trocas e avarias estão limpa, organizada e sinalizada?
                                                <asp:TextBox ID="txt3_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_1_Sim" runat="server" GroupName="grupo3_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_1_Nao" runat="server" GroupName="grupo3_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_1_NA" runat="server" GroupName="grupo3_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1--%>
                                        <tr>
                                            <td align="center">3.2</td>
                                            <td>O local para as trocas de PERECÍVEIS, estão sinalizados, limpo e organizados?
                                                <asp:TextBox ID="txt3_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_2_Sim" runat="server" GroupName="grupo3_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_2_Nao" runat="server" GroupName="grupo3_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_2_NA" runat="server" GroupName="grupo3_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.2--%>
                                        <tr>
                                            <td align="center">3.3</td>
                                            <td>As mercadorias que possuem troca são armazenadas separadas por fornecedor com identificação nas caixas?
                                                <asp:TextBox ID="txt3_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_3_Sim" runat="server" GroupName="grupo3_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_3_Nao" runat="server" GroupName="grupo3_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_3_NA" runat="server" GroupName="grupo3_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.3--%>
                                        <tr>
                                            <td align="center">3.4</td>
                                            <td>As trocas CD são enviadas dentro do cronograma estipulado e com os pallets no padrão exigido?
                                                <asp:TextBox ID="txt3_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_4_Sim" runat="server" GroupName="grupo3_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_4_Nao" runat="server" GroupName="grupo3_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_4_NA" runat="server" GroupName="grupo3_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.4--%>
                                        <tr>
                                            <td align="center">3.5</td>
                                            <td>A loja está dando as tratativas para as trocas paradas no setor a mais de 30 dias?
                                                <asp:TextBox ID="txt3_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_5_Sim" runat="server" GroupName="grupo3_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_5_Nao" runat="server" GroupName="grupo3_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_5_NA" runat="server" GroupName="grupo3_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.5--%>
                                        <tr>
                                            <td align="center">3.6</td>
                                            <td>Os itens que estão armazenados no setor, realmente possuem contrato de trocas?
                                                <asp:TextBox ID="txt3_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_6_Sim" runat="server" GroupName="grupo3_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_6_Nao" runat="server" GroupName="grupo3_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_6_NA" runat="server" GroupName="grupo3_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.6--%>
                                        <tr>
                                            <td align="center">3.7</td>
                                            <td>Está sendo verificado as condições dos produtos enviados ao CD para evitar risco de contaminação (pragas, cheiro ruins, com embalagens violadas, outros)?
                                                <asp:TextBox ID="txt3_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_7_Sim" runat="server" GroupName="grupo3_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_7_Nao" runat="server" GroupName="grupo3_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_7_NA" runat="server" GroupName="grupo3_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.7--%>
                                        <tr>
                                            <td align="center">3.8</td>
                                            <td>A loja está com valor de trocas compatível de modo que o percentual fique aceitável com a meta da empresa?
                                                <asp:TextBox ID="txt3_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_8_Sim" runat="server" GroupName="grupo3_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_8_Nao" runat="server" GroupName="grupo3_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_8_NA" runat="server" GroupName="grupo3_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.8--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo3" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--3 - Trocas--%>

                        <asp:Panel ID="panDados4" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Armanezamento (Depósito Seco)</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">4.1</td>
                                            <td>Há orientação sobre as normativas para entrada de pessoas externas (fornecedores) no depósito?
                                                <asp:TextBox ID="txt4_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_1_Sim" runat="server" GroupName="grupo4_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_1_Nao" runat="server" GroupName="grupo4_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_1_NA" runat="server" GroupName="grupo4_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1--%>
                                        <tr>
                                            <td align="center">4.2</td>
                                            <td>A área do depósito encontra-se limpa e organizada, sem a presença de mercadorias caídas atrás e debaixo dos racks?
                                                <asp:TextBox ID="txt4_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_2_Sim" runat="server" GroupName="grupo4_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_2_Nao" runat="server" GroupName="grupo4_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_2_NA" runat="server" GroupName="grupo4_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.2--%>
                                        <tr>
                                            <td align="center">4.3</td>
                                            <td>Os corredores estão livres para passagem de empilhadeira? (Sem mercadorias soltas, caixas ou pallets/ equipamentos obstruindo a passagem)
                                                <asp:TextBox ID="txt4_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_3_Sim" runat="server" GroupName="grupo4_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_3_Nao" runat="server" GroupName="grupo4_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_3_NA" runat="server" GroupName="grupo4_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.3--%>
                                        <tr>
                                            <td align="center">4.4</td>
                                            <td>Os locais onde a empilhadeira está operando encontra-se devidamente isolada e identificada, afim de evitar riscos de acidentes?
                                                <asp:TextBox ID="txt4_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_4_Sim" runat="server" GroupName="grupo4_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_4_Nao" runat="server" GroupName="grupo4_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_4_NA" runat="server" GroupName="grupo4_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.4--%>
                                        <tr>
                                            <td align="center">4.5</td>
                                            <td>Quando presente, os produtos impróprios para consumo armazenados no depósito, estão segregados e /ou confinados, identificados e organizados por Fornecedor?
                                                <asp:TextBox ID="txt4_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_5_Sim" runat="server" GroupName="grupo4_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_5_Nao" runat="server" GroupName="grupo4_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_5_NA" runat="server" GroupName="grupo4_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.5--%>
                                        <tr>
                                            <td align="center">4.6</td>
                                            <td>Os Funcionários, Promotores e Terceiros utilizam os EPI adequados para realização das atividades?
                                                <asp:TextBox ID="txt4_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_6_Sim" runat="server" GroupName="grupo4_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_6_Nao" runat="server" GroupName="grupo4_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_6_NA" runat="server" GroupName="grupo4_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.6--%>
                                        <tr>
                                            <td align="center">4.7</td>
                                            <td>Os pallets Full (doca) armazenados encontram-se com o crachá de identificação no local correto? O preenchimento dos dados está correto?
                                                <asp:TextBox ID="txt4_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_7_Sim" runat="server" GroupName="grupo4_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_7_Nao" runat="server" GroupName="grupo4_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_7_NA" runat="server" GroupName="grupo4_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.7--%>
                                        <tr>
                                            <td align="center">4.8</td>
                                            <td>Os produtos estão armazenados de maneira que não se encontrem mercadorias soltas no depósito?
                                                <asp:TextBox ID="txt4_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_8_Sim" runat="server" GroupName="grupo4_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_8_Nao" runat="server" GroupName="grupo4_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_8_NA" runat="server" GroupName="grupo4_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.8--%>
                                        <tr>
                                            <td align="center">4.9</td>
                                            <td>Todas as caixas falsas armazenadas no depósito estão com espelho de caixa afixado (EAN, descrição, quantidade, validade)?
                                                <asp:TextBox ID="txt4_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_9_Sim" runat="server" GroupName="grupo4_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_9_Nao" runat="server" GroupName="grupo4_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_9_NA" runat="server" GroupName="grupo4_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.9--%>
                                        <tr>
                                            <td align="center">4.10</td>
                                            <td>Os produtos auditados encontram-se dentro do prazo de validade?
                                                <asp:TextBox ID="txt4_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_10_Sim" runat="server" GroupName="grupo4_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_10_Nao" runat="server" GroupName="grupo4_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_10_NA" runat="server" GroupName="grupo4_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.10--%>
                                        <tr>
                                            <td align="center">4.11</td>
                                            <td>O depósito está organizado de maneira que não se encontre produtos alimentícios com não-alimentícios?
                                                <asp:TextBox ID="txt4_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_11_Sim" runat="server" GroupName="grupo4_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_11_Nao" runat="server" GroupName="grupo4_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_11_NA" runat="server" GroupName="grupo4_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.11--%>
                                        <tr>
                                            <td align="center">4.12</td>
                                            <td>As delimitações dos racks e áreas pulmões estão sinalizados? Os racks estão identificados para melhor organização?
                                                <asp:TextBox ID="txt4_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_12_Sim" runat="server" GroupName="grupo4_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_12_Nao" runat="server" GroupName="grupo4_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_12_NA" runat="server" GroupName="grupo4_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.12--%>
                                        <tr>
                                            <td align="center">4.13</td>
                                            <td>As mercadorias armazenadas respeitam a regra do PVPS?
                                                <asp:TextBox ID="txt4_13" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_13_Sim" runat="server" GroupName="grupo4_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_13_Nao" runat="server" GroupName="grupo4_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_13_NA" runat="server" GroupName="grupo4_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.13--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo4" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--4 - Armanezamento (Depósito Seco)--%>

                        <asp:Panel ID="panDados5" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>

                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Armazenamento (Antecâmara Climatizada)</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">5.1</td>
                                            <td>Há orientação sobre as normativas para entrada de pessoas externas (fornecedores) na antecâmara?
                                                <asp:TextBox ID="txt5_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_1_Sim" runat="server" GroupName="grupo5_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_1_Nao" runat="server" GroupName="grupo5_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_1_NA" runat="server" GroupName="grupo5_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1--%>
                                        <tr>
                                            <td align="center">5.2</td>
                                            <td>A antecâmara encontra-se limpa e organizada?
                                                <asp:TextBox ID="txt5_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_2_Sim" runat="server" GroupName="grupo5_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_2_Nao" runat="server" GroupName="grupo5_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_2_NA" runat="server" GroupName="grupo5_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.2--%>
                                        <tr>
                                            <td align="center">5.3</td>
                                            <td>Os produtos impróprios para consumo encontram-se em local adequado (separado das demais mercadorias), identificado, limpo e organizado?
                                                <asp:TextBox ID="txt5_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_3_Sim" runat="server" GroupName="grupo5_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_3_Nao" runat="server" GroupName="grupo5_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_3_NA" runat="server" GroupName="grupo5_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.3--%>
                                        <tr>
                                            <td align="center">5.4</td>
                                            <td>Todos os produtos armazenados na antecâmara atendem as recomendações do fornecedor quanto a temperatura?
                                                <asp:TextBox ID="txt5_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_4_Sim" runat="server" GroupName="grupo5_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_4_Nao" runat="server" GroupName="grupo5_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_4_NA" runat="server" GroupName="grupo5_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.4--%>
                                        <tr>
                                            <td align="center">5.5</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade?
                                                <asp:TextBox ID="txt5_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_5_Sim" runat="server" GroupName="grupo5_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_5_Nao" runat="server" GroupName="grupo5_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_5_NA" runat="server" GroupName="grupo5_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.5--%>
                                        <tr>
                                            <td align="center">5.6</td>
                                            <td>A planilha de higienização está preenchida corretamente?
                                                <asp:TextBox ID="txt5_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_6_Sim" runat="server" GroupName="grupo5_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_6_Nao" runat="server" GroupName="grupo5_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_6_NA" runat="server" GroupName="grupo5_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.6--%>
                                        <tr>
                                            <td align="center">5.7</td>
                                            <td>Os Funcionários, Promotores e Terceiros utilizam os EPI adequados para realização das atividades?
                                                <asp:TextBox ID="txt5_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_7_Sim" runat="server" GroupName="grupo5_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_7_Nao" runat="server" GroupName="grupo5_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_7_NA" runat="server" GroupName="grupo5_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.7--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo5" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--5 - Armazenamento (Antecâmara Climatizada)--%>

                        <asp:Panel ID="panDados6" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Armanezamento (Depósito Climatizado)</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">6.1</td>
                                            <td>As câmaras climatizadas estão limpas e organizadas?
                                                <asp:TextBox ID="txt6_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_1_Sim" runat="server" GroupName="grupo6_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_1_Nao" runat="server" GroupName="grupo6_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_1_NA" runat="server" GroupName="grupo6_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.1--%>
                                        <tr>
                                            <td align="center">6.2</td>
                                            <td>As edificações estão limpas e íntegras? Os ralos, luminárias e portas de acesso são mantidos limpos e em bom estado de conservação? (bolor, água estagnada, mau cheiro, acesso a pragas e vetores, infiltrações ou danos estruturais)
                                                <asp:TextBox ID="txt6_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_2_Sim" runat="server" GroupName="grupo6_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_2_Nao" runat="server" GroupName="grupo6_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_2_NA" runat="server" GroupName="grupo6_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.2--%>
                                        <tr>
                                            <td align="center">6.3</td>
                                            <td>O cronograma de higienização é realizado conforme normativa? A planilha está sendo preenchida corretamente?
                                                <asp:TextBox ID="txt6_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_3_Sim" runat="server" GroupName="grupo6_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_3_Nao" runat="server" GroupName="grupo6_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_3_NA" runat="server" GroupName="grupo6_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.3--%>
                                        <tr>
                                            <td align="center">6.4</td>
                                            <td>Os produtos estão armazenados de maneira que não se encontrem mercadorias soltas na câmara?
                                                <asp:TextBox ID="txt6_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_4_Sim" runat="server" GroupName="grupo6_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_4_Nao" runat="server" GroupName="grupo6_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_4_NA" runat="server" GroupName="grupo6_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.4--%>
                                        <tr>
                                            <td align="center">6.5</td>
                                            <td>Todas as caixas falsas possuem espelho de identificação, contendo: código, descrição quantidade e data de validade do produto?
                                                <asp:TextBox ID="txt6_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_5_Sim" runat="server" GroupName="grupo6_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_5_Nao" runat="server" GroupName="grupo6_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_5_NA" runat="server" GroupName="grupo6_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.5--%>
                                        <tr>
                                            <td align="center">6.6</td>
                                            <td>Os pallets Full (doca) armazenados encontram-se com o crachá de identificação no local correto? O preenchimento dos dados está correto?
                                                <asp:TextBox ID="txt6_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_6_Sim" runat="server" GroupName="grupo6_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_6_Nao" runat="server" GroupName="grupo6_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_6_NA" runat="server" GroupName="grupo6_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.6--%>
                                        <tr>
                                            <td align="center">6.7</td>
                                            <td>Existem mercadorias vencidas ou impróprias para consumo, armazenadas junto com mercadorias boas? (citar o setor correspondente).
                                                <asp:TextBox ID="txt6_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_7_Sim" runat="server" GroupName="grupo6_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_7_Nao" runat="server" GroupName="grupo6_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_7_NA" runat="server" GroupName="grupo6_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.7--%>
                                        <tr>
                                            <td align="center">6.8</td>
                                            <td>Os pallets alocados nas câmaras frias, atendem o layout definido para identificação da categoria de produto?
                                                <asp:TextBox ID="txt6_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_8_Sim" runat="server" GroupName="grupo6_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_8_Nao" runat="server" GroupName="grupo6_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_8_NA" runat="server" GroupName="grupo6_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.8--%>
                                        <tr>
                                            <td align="center">6.9</td>
                                            <td>Toda mercadoria que necessita de armazenamento climatizado encontram-se dentro da câmara adequada? (Verificar se há produtos congelados na câmara de resfriados ou vice-versa)
                                                <asp:TextBox ID="txt6_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_9_Sim" runat="server" GroupName="grupo6_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_9_Nao" runat="server" GroupName="grupo6_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_9_NA" runat="server" GroupName="grupo6_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.9--%>
                                        <tr>
                                            <td align="center">6.10</td>
                                            <td>As mercadorias armazenadas nas câmaras estão respeitando o PVPS?
                                                <asp:TextBox ID="txt6_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_10_Sim" runat="server" GroupName="grupo6_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_10_Nao" runat="server" GroupName="grupo6_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_10_NA" runat="server" GroupName="grupo6_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.10--%>
                                        <tr>
                                            <td align="center">6.11</td>
                                            <td>Existem mercadorias armazenadas de forma indevida?  (Produtos em contato direto no chão, em carrinhos de clientes, palletiras, etc.)
                                                <asp:TextBox ID="txt6_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_11_Sim" runat="server" GroupName="grupo6_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_11_Nao" runat="server" GroupName="grupo6_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_11_NA" runat="server" GroupName="grupo6_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.11--%>
                                        <tr>
                                            <td align="center">6.12</td>
                                            <td>Todos os produtos com peso variável, estão pesados corretamente? (com data de validade visível e sem etiquetas sobrepostas)
                                                <asp:TextBox ID="txt6_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_12_Sim" runat="server" GroupName="grupo6_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_12_Nao" runat="server" GroupName="grupo6_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_12_NA" runat="server" GroupName="grupo6_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.12--%>
                                        <tr>
                                            <td align="center">6.13</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade?
                                                <asp:TextBox ID="txt6_13" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_13_Sim" runat="server" GroupName="grupo6_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_13_Nao" runat="server" GroupName="grupo6_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_13_NA" runat="server" GroupName="grupo6_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.13--%>
                                        <tr>
                                            <td align="center">6.14</td>
                                            <td>As câmaras estão em perfeitas condições de uso? (Sem acúmulo de gelo ou água no piso, borrachas de vedação, cortinas, temperatura adequada)
                                                <asp:TextBox ID="txt6_14" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_14_Sim" runat="server" GroupName="grupo6_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_14_Nao" runat="server" GroupName="grupo6_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_14_NA" runat="server" GroupName="grupo6_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.14--%>
                                        <tr>
                                            <td align="center">6.15</td>
                                            <td>Os locais onde a empilhadeira está operando encontram-se defidamente isolada e identificada, afim de evitar riscos de acidentes?
                                                <asp:TextBox ID="txt6_15" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_15_Sim" runat="server" GroupName="grupo6_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_15_Nao" runat="server" GroupName="grupo6_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_15_NA" runat="server" GroupName="grupo6_15" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_15" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_15" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.15--%>
                                        <tr>
                                            <td align="center">6.16</td>
                                            <td>Os Funcionários, Promotores e Terceiros utilizam os EPI adequados para realização das atividades?
                                                <asp:TextBox ID="txt6_16" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_16_Sim" runat="server" GroupName="grupo6_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_16_Nao" runat="server" GroupName="grupo6_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_16_NA" runat="server" GroupName="grupo6_16" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_16" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_16" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.16--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo6" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--6 - Armanezamento (Depósito Climatizado)--%>

                        <asp:Panel ID="panDados7" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Armazenamento (Hortifruti)</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">7.1</td>
                                            <td>As balanças do setor estão higienizadase calibradas (conferir checklist CPD)?
                                                <asp:TextBox ID="txt7_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_1_Sim" runat="server" GroupName="grupo7_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_1_Nao" runat="server" GroupName="grupo7_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_1_NA" runat="server" GroupName="grupo7_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1--%>
                                        <tr>
                                            <td align="center">7.2</td>
                                            <td>A quebra conhecida está sendo realizada diariamente, em sua totalidade e com o devido acompanhamento?
                                                <asp:TextBox ID="txt7_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_2_Sim" runat="server" GroupName="grupo7_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_2_Nao" runat="server" GroupName="grupo7_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_2_NA" runat="server" GroupName="grupo7_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.2--%>
                                        <tr>
                                            <td align="center">7.3</td>
                                            <td>Dentro da sala de armazenamento, as caixas são empilhadas de forma correta e segura (sem oferecer riscos as mercadorias e ao ambiente?)
                                                <asp:TextBox ID="txt7_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_3_Sim" runat="server" GroupName="grupo7_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_3_Nao" runat="server" GroupName="grupo7_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_3_NA" runat="server" GroupName="grupo7_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.3--%>
                                        <tr>
                                            <td align="center">7.4</td>
                                            <td>Está sendo realizado o repasse das mercadorias impróprias para venda de forma adequada? Todos ao produtos (ovos e produtos embalados) estão dentro da validade?
                                                <asp:TextBox ID="txt7_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_4_Sim" runat="server" GroupName="grupo7_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_4_Nao" runat="server" GroupName="grupo7_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_4_NA" runat="server" GroupName="grupo7_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.4--%>
                                        <tr>
                                            <td align="center">7.5</td>
                                            <td>O armazenamento na câmara está sendo realizado corretamente, atendendo o PVPS e / ou grau de maturação do produto?
                                                <asp:TextBox ID="txt7_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_5_Sim" runat="server" GroupName="grupo7_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_5_Nao" runat="server" GroupName="grupo7_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_5_NA" runat="server" GroupName="grupo7_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.5--%>
                                        <tr>
                                            <td align="center">7.6</td>
                                            <td>A câmara / laboratório encontram-se limpos, organizados e em perfeitas condições de manutenção? A planilha de higienização está preenchida corretamente?
                                                <asp:TextBox ID="txt7_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_6_Sim" runat="server" GroupName="grupo7_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_6_Nao" runat="server" GroupName="grupo7_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_6_NA" runat="server" GroupName="grupo7_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.6--%>
                                        <tr>
                                            <td align="center">7.7</td>
                                            <td>E a identificação de rastreabilidade está sendo mantida nas caixas originais?
                                                <asp:TextBox ID="txt7_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_7_Sim" runat="server" GroupName="grupo7_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_7_Nao" runat="server" GroupName="grupo7_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_7_NA" runat="server" GroupName="grupo7_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.7--%>
                                        <tr>
                                            <td align="center">7.8</td>
                                            <td>O local de armazenamento (incluindo papeleiras e saboneteiras) encontra-se limpo e organizado?
                                                <asp:TextBox ID="txt7_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_8_Sim" runat="server" GroupName="grupo7_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_8_Nao" runat="server" GroupName="grupo7_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_8_NA" runat="server" GroupName="grupo7_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.8--%>
                                        <tr>
                                            <td align="center">7.9</td>
                                            <td>Os Funcionários, Promotores e Terceiros utilizam os EPI adequados para realização das atividades?
                                                <asp:TextBox ID="txt7_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_9_Sim" runat="server" GroupName="grupo7_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_9_Nao" runat="server" GroupName="grupo7_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_9_NA" runat="server" GroupName="grupo7_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.9--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo7" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>

                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--7 - Armazenamento (Hortifruti)--%>

                        <asp:Panel ID="panDados8" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Armazenamento (Padaria/Confeitaria)</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">8.1</td>
                                            <td>O local de armazenamento/ freezer dentro do setor (incluindo papeleiras e saboneteiras) está em perfeitas condições de uso, limpo e organizado, sem odores que caracterizem produtos impróprios para consumo?
                                                <asp:TextBox ID="txt8_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_1_Sim" runat="server" GroupName="grupo8_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_1_Nao" runat="server" GroupName="grupo8_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_1_NA" runat="server" GroupName="grupo8_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1--%>
                                        <tr>
                                            <td align="center">8.2</td>
                                            <td>A troca de preço está sendo feita de maneira adequada, utilizando data retroativa (quando necessário) conforme procedimento?
                                                <asp:TextBox ID="txt8_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_2_Sim" runat="server" GroupName="grupo8_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_2_Nao" runat="server" GroupName="grupo8_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_2_NA" runat="server" GroupName="grupo8_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.2--%>
                                        <tr>
                                            <td align="center">8.3</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade?
                                                <asp:TextBox ID="txt8_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_3_Sim" runat="server" GroupName="grupo8_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_3_Nao" runat="server" GroupName="grupo8_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_3_NA" runat="server" GroupName="grupo8_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.3--%>
                                        <tr>
                                            <td align="center">8.4</td>
                                            <td>As quebras conhecidas são lançadas e descartadas diariamente? Os produtos de trocas são encaminhados diariamente para o local adequado?
                                                <asp:TextBox ID="txt8_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_4_Sim" runat="server" GroupName="grupo8_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_4_Nao" runat="server" GroupName="grupo8_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_4_NA" runat="server" GroupName="grupo8_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.4--%>
                                        <tr>
                                            <td align="center">8.5</td>
                                            <td>Os equipamentos (coifa, fornos, moinho, carrinhos estufa, etc) estão sendo bem higienizados (sem sujidades antigas)?  O moedor quando não está em uso, está com as aberturas protegidas?
                                                <asp:TextBox ID="txt8_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_5_Sim" runat="server" GroupName="grupo8_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_5_Nao" runat="server" GroupName="grupo8_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_5_NA" runat="server" GroupName="grupo8_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.5--%>
                                        <tr>
                                            <td align="center">8.6</td>
                                            <td>Os produtos vindos do recebimento são armazenados imediatamente em local adequado?
                                                <asp:TextBox ID="txt8_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_6_Sim" runat="server" GroupName="grupo8_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_6_Nao" runat="server" GroupName="grupo8_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_6_NA" runat="server" GroupName="grupo8_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.6--%>
                                        <tr>
                                            <td align="center">8.7</td>
                                            <td>Os pães separados para a produção de farinha de rosca estão identificados para este fim e são selecionados (somente linha do pão francês)? O processo completo (torrar, moer, embalar e identificar individualmente) está ocorrendo em no máximo dois dias?
                                                <asp:TextBox ID="txt8_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_7_Sim" runat="server" GroupName="grupo8_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_7_Nao" runat="server" GroupName="grupo8_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_7_NA" runat="server" GroupName="grupo8_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.7--%>
                                        <tr>
                                            <td align="center">8.8</td>
                                            <td>Toda a produção/ insumos armazenada possui etiqueta de identificação, data de validade e estão armazenados na temperatura conforme orientação do fabricante?
                                                <asp:TextBox ID="txt8_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_8_Sim" runat="server" GroupName="grupo8_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_8_Nao" runat="server" GroupName="grupo8_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_8_NA" runat="server" GroupName="grupo8_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.8--%>
                                        <tr>
                                            <td align="center">8.9</td>
                                            <td>O processo de descongelamento técnico é feito corretamente conforme orientação do setor de Qualidade/ HSA?
                                                <asp:TextBox ID="txt8_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_9_Sim" runat="server" GroupName="grupo8_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_9_Nao" runat="server" GroupName="grupo8_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_9_NA" runat="server" GroupName="grupo8_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.9--%>
                                        <tr>
                                            <td align="center">8.10</td>
                                            <td>O acesso de pessoas as áreas internas é feito com o uso de uniformes EPI´s obrigatórios adequados?
                                                <asp:TextBox ID="txt8_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_10_Sim" runat="server" GroupName="grupo8_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_10_Nao" runat="server" GroupName="grupo8_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_10_NA" runat="server" GroupName="grupo8_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.10--%>
                                        <tr>
                                            <td align="center">8.11</td>
                                            <td>Os colaboradores, promotores e terceiros (técnicos) seguem as regras de asseio pessoal, não fazendo uso de adornos (brincos, anéis, pulseiras, etc), barba, maquiagem e esmalte?
                                                <asp:TextBox ID="txt8_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_11_Sim" runat="server" GroupName="grupo8_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_11_Nao" runat="server" GroupName="grupo8_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_11_NA" runat="server" GroupName="grupo8_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.11--%>
                                        <tr>
                                            <td align="center">8.12</td>
                                            <td>Todos os insumos em utilização (abertas) possuem etiqueta de identificação e com preenchimento correto?
                                                <asp:TextBox ID="txt8_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_12_Sim" runat="server" GroupName="grupo8_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_12_Nao" runat="server" GroupName="grupo8_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_12_NA" runat="server" GroupName="grupo8_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.12--%>
                                        <tr>
                                            <td align="center">8.13</td>
                                            <td>A planilha de higienização está preenchida corretamente?
                                                <asp:TextBox ID="txt8_13" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_13_Sim" runat="server" GroupName="grupo8_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_13_Nao" runat="server" GroupName="grupo8_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_13_NA" runat="server" GroupName="grupo8_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.13--%>
                                        <tr>
                                            <td align="center">8.14</td>
                                            <td>Todos os produtos (insumos e finalizados) encontram-se dentro do prazo de validade?
                                                <asp:TextBox ID="txt8_14" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_14_Sim" runat="server" GroupName="grupo8_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_14_Nao" runat="server" GroupName="grupo8_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_14_NA" runat="server" GroupName="grupo8_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.14--%>
                                        <tr>
                                            <td align="center">8.15</td>
                                            <td>Os Funcionários, Promotores e Terceiros utilizam os EPI, toucas adequados para realização das atividades?
                                                <asp:TextBox ID="txt8_15" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_15_Sim" runat="server" GroupName="grupo8_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_15_Nao" runat="server" GroupName="grupo8_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_15_NA" runat="server" GroupName="grupo8_15" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_15" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_15" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.15--%>



                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo8" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>

                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--8 - Armazenamento (Padaria/Confeitaria)--%>

                        <asp:Panel ID="panDados9" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>

                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Area de Vendas (Perecíveis)</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">9.1</td>
                                            <td>As quebras conhecidas dos setores são descartadas diariamente em sua totalidade?
                                                <asp:TextBox ID="txt9_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_1_Sim" runat="server" GroupName="grupo9_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_1_Nao" runat="server" GroupName="grupo9_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_1_NA" runat="server" GroupName="grupo9_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1--%>
                                        <tr>
                                            <td align="center">9.2</td>
                                            <td>O abastecimento está atendendo o PVPS?
                                                <asp:TextBox ID="txt9_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_2_Sim" runat="server" GroupName="grupo9_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_2_Nao" runat="server" GroupName="grupo9_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_2_NA" runat="server" GroupName="grupo9_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.2--%>
                                        <tr>
                                            <td align="center">9.3</td>
                                            <td>Os balcões de exposição encontram-se abastecidos corretamente? (Obedecendo os limites de exposição e cartazeamento sem obstrução das saídas de ar)
                                                <asp:TextBox ID="txt9_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_3_Sim" runat="server" GroupName="grupo9_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_3_Nao" runat="server" GroupName="grupo9_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_3_NA" runat="server" GroupName="grupo9_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.3--%>
                                        <tr>
                                            <td align="center">9.4</td>
                                            <td>Todos os produtos expostos estão com suas respectivas etiquetas de preço em local visível?
                                                <asp:TextBox ID="txt9_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_4_Sim" runat="server" GroupName="grupo9_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_4_Nao" runat="server" GroupName="grupo9_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_4_NA" runat="server" GroupName="grupo9_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.4--%>
                                        <tr>
                                            <td align="center">9.5</td>
                                            <td>Todos os produtos com peso variável, estão pesados corretamente? (com data de validade visível e sem etiquetas sobrepostas)
                                                <asp:TextBox ID="txt9_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_5_Sim" runat="server" GroupName="grupo9_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_5_Nao" runat="server" GroupName="grupo9_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_5_NA" runat="server" GroupName="grupo9_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.5--%>
                                        <tr>
                                            <td align="center">9.6</td>
                                            <td>Os balcões e ilhas de exposição estão higienizados sem evidências de sujidades antigas e funcionando corretamente?
                                                <asp:TextBox ID="txt9_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_6_Sim" runat="server" GroupName="grupo9_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_6_Nao" runat="server" GroupName="grupo9_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_6_NA" runat="server" GroupName="grupo9_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.6--%>
                                        <tr>
                                            <td align="center">9.7</td>
                                            <td>Os produtos auditados na circular de preços estão precificados corretamente? 
                                                <asp:TextBox ID="txt9_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_7_Sim" runat="server" GroupName="grupo9_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_7_Nao" runat="server" GroupName="grupo9_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_7_NA" runat="server" GroupName="grupo9_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.7--%>
                                        <tr>
                                            <td align="center">9.8</td>
                                            <td>O setor encontra-se limpo, organizado e com a planilha preenchida corretamente?
                                                <asp:TextBox ID="txt9_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_8_Sim" runat="server" GroupName="grupo9_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_8_Nao" runat="server" GroupName="grupo9_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_8_NA" runat="server" GroupName="grupo9_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.8--%>
                                        <tr>
                                            <td align="center">9.9</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade?
                                                <asp:TextBox ID="txt9_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_9_Sim" runat="server" GroupName="grupo9_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_9_Nao" runat="server" GroupName="grupo9_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_9_NA" runat="server" GroupName="grupo9_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.9--%>
                                        <tr>
                                            <td align="center">9.10</td>
                                            <td>Os pedidos do Entreposto estão sendo realizados com critérios, atendendo a necessidade da loja, evitando excessos? (Analisar Cobertura de Estoque)
                                                <asp:TextBox ID="txt9_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_10_Sim" runat="server" GroupName="grupo9_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_10_Nao" runat="server" GroupName="grupo9_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_10_NA" runat="server" GroupName="grupo9_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.10--%>
                                        <tr>
                                            <td align="center">9.11</td>
                                            <td>Os produtos auditados na circular de preços estão precificados corretamente? 
                                                <asp:TextBox ID="txt9_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_11_Sim" runat="server" GroupName="grupo9_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_11_Nao" runat="server" GroupName="grupo9_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_11_NA" runat="server" GroupName="grupo9_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.11--%>



                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo9" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>

                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--9 - Area de Vendas (Perecíveis)--%>

                        <asp:Panel ID="panDados10" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">

                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>

                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Area de Vendas (Hortifruti)</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">10.1</td>
                                            <td>Todas as balanças estão limpas, higienizadas e calibradas sem variação de pesos?
                                                <asp:TextBox ID="txt10_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_1_Sim" runat="server" GroupName="grupo10_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_1_Nao" runat="server" GroupName="grupo10_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_1_NA" runat="server" GroupName="grupo10_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1--%>
                                        <tr>
                                            <td align="center">10.2</td>
                                            <td>O PVPS é seguido corretamente (respeitando a validade ou o grau de maturação dos produtos), realizando a virada da vasca em todas as reposições?
                                                <asp:TextBox ID="txt10_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_2_Sim" runat="server" GroupName="grupo10_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_2_Nao" runat="server" GroupName="grupo10_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_2_NA" runat="server" GroupName="grupo10_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.2--%>
                                        <tr>
                                            <td align="center">10.3</td>
                                            <td>As bancas, vascas e o piso estão limpos e abastecidos sem ruptura?
                                                <asp:TextBox ID="txt10_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_3_Sim" runat="server" GroupName="grupo10_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_3_Nao" runat="server" GroupName="grupo10_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_3_NA" runat="server" GroupName="grupo10_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.3--%>
                                        <tr>
                                            <td align="center">10.4</td>
                                            <td>Todas as bancas estão com a etiqueta de identificação de rastreabilidade correta e visível para o cliente? 
                                                <asp:TextBox ID="txt10_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_4_Sim" runat="server" GroupName="grupo10_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_4_Nao" runat="server" GroupName="grupo10_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_4_NA" runat="server" GroupName="grupo10_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.4--%>
                                        <tr>
                                            <td align="center">10.5</td>
                                            <td>Todos os produtos atendem os requisitos mínimos de frescor e qualidade ao cliente?
                                                <asp:TextBox ID="txt10_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_5_Sim" runat="server" GroupName="grupo10_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_5_Nao" runat="server" GroupName="grupo10_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_5_NA" runat="server" GroupName="grupo10_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.5--%>
                                        <tr>
                                            <td align="center">10.6</td>
                                            <td>Os produtos auditados na circular de preços estão precificados corretamente? 
                                                <asp:TextBox ID="txt10_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_6_Sim" runat="server" GroupName="grupo10_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_6_Nao" runat="server" GroupName="grupo10_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_6_NA" runat="server" GroupName="grupo10_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.6--%>
                                        <tr>
                                            <td align="center">10.7</td>
                                            <td>A planilha de higienização do setor está sendo preenchida corretamente e na frequência adequada?
                                                <asp:TextBox ID="txt10_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_7_Sim" runat="server" GroupName="grupo10_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_7_Nao" runat="server" GroupName="grupo10_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_7_NA" runat="server" GroupName="grupo10_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.7--%>
                                        <tr>
                                            <td align="center">10.8</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade e/ ou próprios para consumo?
                                                <asp:TextBox ID="txt10_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_8_Sim" runat="server" GroupName="grupo10_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_8_Nao" runat="server" GroupName="grupo10_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_8_NA" runat="server" GroupName="grupo10_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.8--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo10" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--10 - Area de Vendas (Hortifruti)--%>

                        <asp:Panel ID="panDados11" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Area de Vendas (P.A.R.)</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">11.1</td>
                                            <td>Os PAR's estão expostos de forma segura e controlada?  (Ex's: pilhas, whisky, cigarros, mochilas, aparelhos de barbear, baterias, pneus, carnes nobres, Nutella, fórmula infantil, etc.)
                                                <asp:TextBox ID="txt11_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_1_Sim" runat="server" GroupName="grupo11_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_1_Nao" runat="server" GroupName="grupo11_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_1_NA" runat="server" GroupName="grupo11_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1--%>
                                        <tr>
                                            <td align="center">11.2</td>
                                            <td>Os PAR's possuem sensores e /ou alarmes adequados em todas as unidades expostas? 
                                                <asp:TextBox ID="txt11_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_2_Sim" runat="server" GroupName="grupo11_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_2_Nao" runat="server" GroupName="grupo11_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_2_NA" runat="server" GroupName="grupo11_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.2--%>
                                        <tr>
                                            <td align="center">11.3</td>
                                            <td>Os PAR's estão confinados em local segregado (armários fechados frente de caixa, confinados maleiros, armário baterias) e com controle de acesso?
                                                <asp:TextBox ID="txt11_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_3_Sim" runat="server" GroupName="grupo11_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_3_Nao" runat="server" GroupName="grupo11_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_3_NA" runat="server" GroupName="grupo11_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.3--%>


                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo11" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--11 - Area de Vendas (P.A.R.)--%>

                        <asp:Panel ID="panDados12" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Area de vendas (Geral)</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">12.1</td>
                                            <td>A área de Vendas está organizada, sem caixas e pallets com produtos para serem abastecidos espalhados pelos corredores?
                                                <asp:TextBox ID="txt12_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_1_Sim" runat="server" GroupName="grupo12_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_1_Nao" runat="server" GroupName="grupo12_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_1_NA" runat="server" GroupName="grupo12_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.1--%>
                                        <tr>
                                            <td align="center">12.2</td>
                                            <td>Não existem produtos caídos na parte de baixo ou na parte de trás das estruturas porta pallet?
                                                <asp:TextBox ID="txt12_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_2_Sim" runat="server" GroupName="grupo12_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_2_Nao" runat="server" GroupName="grupo12_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_2_NA" runat="server" GroupName="grupo12_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.2--%>
                                        <tr>
                                            <td align="center">12.3</td>
                                            <td>As gôndolas se encontram devidamente abastecidas, limpas e organizadas?
                                                <asp:TextBox ID="txt12_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_3_Sim" runat="server" GroupName="grupo12_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_3_Nao" runat="server" GroupName="grupo12_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_3_NA" runat="server" GroupName="grupo12_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.3--%>
                                        <tr>
                                            <td align="center">12.4</td>
                                            <td>Os produtos estão armazenados no maleiro e aéreo de forma segura, não oferecendo riscos à segurança dos clientes?
                                                <asp:TextBox ID="txt12_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_4_Sim" runat="server" GroupName="grupo12_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_4_Nao" runat="server" GroupName="grupo12_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_4_NA" runat="server" GroupName="grupo12_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.4--%>
                                        <tr>
                                            <td align="center">12.5</td>
                                            <td>O PVPS é cumprido corretamente?
                                                <asp:TextBox ID="txt12_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_5_Sim" runat="server" GroupName="grupo12_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_5_Nao" runat="server" GroupName="grupo12_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_5_NA" runat="server" GroupName="grupo12_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.5--%>
                                        <tr>
                                            <td align="center">12.6</td>
                                            <td>Os pallets Full do aéreo encontram-se com o crachá de identificação e em local correto?
                                                <asp:TextBox ID="txt12_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_6_Sim" runat="server" GroupName="grupo12_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_6_Nao" runat="server" GroupName="grupo12_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_6_NA" runat="server" GroupName="grupo12_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.6--%>
                                        <tr>
                                            <td align="center">12.7</td>
                                            <td>Os locais onde a empilhadeira está operando encontram-se defidamente isolada e identificadas, afim de evitar riscos de acidentes?
                                                <asp:TextBox ID="txt12_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_7_Sim" runat="server" GroupName="grupo12_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_7_Nao" runat="server" GroupName="grupo12_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_7_NA" runat="server" GroupName="grupo12_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.7--%>
                                        <tr>
                                            <td align="center">12.8</td>
                                            <td>Os produtos auditados na circular de preços estão precificados corretamente (com preço e preço correto)? 
                                                <asp:TextBox ID="txt12_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_8_Sim" runat="server" GroupName="grupo12_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_8_Nao" runat="server" GroupName="grupo12_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_8_NA" runat="server" GroupName="grupo12_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.8--%>
                                        <tr>
                                            <td align="center">12.9</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade?
                                                <asp:TextBox ID="txt12_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_9_Sim" runat="server" GroupName="grupo12_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_9_Nao" runat="server" GroupName="grupo12_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_9_NA" runat="server" GroupName="grupo12_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.9--%>



                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo12" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--12 - Area de vendas (Geral)--%>

                        <asp:Panel ID="panDados13" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Frente de Caixa</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">13.1</td>
                                            <td>Os checkouts estão limpos e organizados? 
                                                <asp:TextBox ID="txt13_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_1_Sim" runat="server" GroupName="grupo13_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_1_Nao" runat="server" GroupName="grupo13_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_1_NA" runat="server" GroupName="grupo13_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.1--%>
                                        <tr>
                                            <td align="center">13.2</td>
                                            <td>As passagens entre os PDV's encontram-se devidamente trancadas quando estão fora de operação?
                                                <asp:TextBox ID="txt13_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_2_Sim" runat="server" GroupName="grupo13_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_2_Nao" runat="server" GroupName="grupo13_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_2_NA" runat="server" GroupName="grupo13_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.2--%>
                                        <tr>
                                            <td align="center">13.3</td>
                                            <td>O procedimento para a venda de cigarros (Fiscal de Caixa entregar o cigarro ao cliente) está se cumprindo corretamente?
                                                <asp:TextBox ID="txt13_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_3_Sim" runat="server" GroupName="grupo13_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_3_Nao" runat="server" GroupName="grupo13_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_3_NA" runat="server" GroupName="grupo13_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.3--%>
                                        <tr>
                                            <td align="center">13.4</td>
                                            <td>Os fiscais de caixa estão em posse de seus crachás? (Todos cientes de que o uso do crachá é de uso pessoal e intransferível)
                                                <asp:TextBox ID="txt13_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_4_Sim" runat="server" GroupName="grupo13_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_4_Nao" runat="server" GroupName="grupo13_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_4_NA" runat="server" GroupName="grupo13_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.4--%>
                                        <tr>
                                            <td align="center">13.5</td>
                                            <td>O porta sacolas está sendo utilizado de forma adequada?
                                                <asp:TextBox ID="txt13_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_5_Sim" runat="server" GroupName="grupo13_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_5_Nao" runat="server" GroupName="grupo13_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_5_NA" runat="server" GroupName="grupo13_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.5--%>
                                        <tr>
                                            <td align="center">13.6</td>
                                            <td>Os desacopladores, desmagnetizadores e antenas estão funcionando adequadamente?
                                                <asp:TextBox ID="txt13_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_6_Sim" runat="server" GroupName="grupo13_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_6_Nao" runat="server" GroupName="grupo13_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_6_NA" runat="server" GroupName="grupo13_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.6--%>
                                        <tr>
                                            <td align="center">13.7</td>
                                            <td>Na ausência de Operador de Caixa, os PDV's encontram-se bloqueados?
                                                <asp:TextBox ID="txt13_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_7_Sim" runat="server" GroupName="grupo13_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_7_Nao" runat="server" GroupName="grupo13_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_7_NA" runat="server" GroupName="grupo13_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.7--%>
                                        <tr>
                                            <td align="center">13.8</td>
                                            <td>A planilha de Divergência de Preço é preenchida corretamente, contemplando as assinaturas dos envolvidos?
                                                <asp:TextBox ID="txt13_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_8_Sim" runat="server" GroupName="grupo13_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_8_Nao" runat="server" GroupName="grupo13_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_8_NA" runat="server" GroupName="grupo13_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.8--%>
                                        <tr>
                                            <td align="center">13.9</td>
                                            <td>A Segurança Patrimonial acompanha e confere as devoluções de clientes (cancelamento de cupons)? 
                                                <asp:TextBox ID="txt13_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_9_Sim" runat="server" GroupName="grupo13_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_9_Nao" runat="server" GroupName="grupo13_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_9_NA" runat="server" GroupName="grupo13_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.9--%>
                                        <tr>
                                            <td align="center">13.10</td>
                                            <td>A Segurança Patrimonial acompanha as Sangrias realizadas nos PDV´s presencial ou via CFTV?
                                                <asp:TextBox ID="txt13_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_10_Sim" runat="server" GroupName="grupo13_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_10_Nao" runat="server" GroupName="grupo13_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_10_NA" runat="server" GroupName="grupo13_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.10--%>
                                        <tr>
                                            <td align="center">13.11</td>
                                            <td>As compras em grandes volumes e ou caixas fechadas, estão sendo conferidas e multiplicadas pelo Fiscal de Caixa?
                                                <asp:TextBox ID="txt13_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_11_Sim" runat="server" GroupName="grupo13_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_11_Nao" runat="server" GroupName="grupo13_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_11_NA" runat="server" GroupName="grupo13_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.11--%>
                                        <tr>
                                            <td align="center">13.12</td>
                                            <td>Os carrinhos e cestinhas destinados aos clientes encontram-se devidamente higienizados e em condições de uso?
                                                <asp:TextBox ID="txt13_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_12_Sim" runat="server" GroupName="grupo13_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_12_Nao" runat="server" GroupName="grupo13_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_12_NA" runat="server" GroupName="grupo13_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.12--%>
                                        <tr>
                                            <td align="center">13.13</td>
                                            <td>Esta sendo realizado monitoramento no estacionamento afim de evitar acúmulo de carrinhos?
                                                <asp:TextBox ID="txt13_13" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_13_Sim" runat="server" GroupName="grupo13_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_13_Nao" runat="server" GroupName="grupo13_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_13_NA" runat="server" GroupName="grupo13_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.13--%>



                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo13" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--13 - Frente de Caixa--%>

                        <asp:Panel ID="panDados14" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Retira</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">14.1</td>
                                            <td>O portão do PDV exclusivo Retira, encontra-se trancado?
                                                <asp:TextBox ID="txt14_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_1_Sim" runat="server" GroupName="grupo14_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_1_Nao" runat="server" GroupName="grupo14_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_1_NA" runat="server" GroupName="grupo14_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.1--%>
                                        <tr>
                                            <td align="center">14.2</td>
                                            <td>Existe controle de acesso ao setor de retira?
                                                <asp:TextBox ID="txt14_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_2_Sim" runat="server" GroupName="grupo14_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_2_Nao" runat="server" GroupName="grupo14_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_2_NA" runat="server" GroupName="grupo14_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.2--%>
                                        <tr>
                                            <td align="center">14.3</td>
                                            <td>A porta do setor de retira esta sendo mantida trancada quando não estiver em processo de conferência / saída de mercadorias?
                                                <asp:TextBox ID="txt14_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_3_Sim" runat="server" GroupName="grupo14_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_3_Nao" runat="server" GroupName="grupo14_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_3_NA" runat="server" GroupName="grupo14_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.3--%>
                                        <tr>
                                            <td align="center">14.4</td>
                                            <td>As planilhas de controle do Setor de Retira, estão preenchidas corretamente?
                                                <asp:TextBox ID="txt14_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_4_Sim" runat="server" GroupName="grupo14_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_4_Nao" runat="server" GroupName="grupo14_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_4_NA" runat="server" GroupName="grupo14_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.4--%>
                                        <tr>
                                            <td align="center">14.5</td>
                                            <td>A saída de mercadorias pelo setor de Retira, é realizada sempre com acompanhamento do responsável pelo setor (Encarregado, gerente adjunto ou gerente geral) junto com a Segurança Patrimonial?
                                                <asp:TextBox ID="txt14_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_5_Sim" runat="server" GroupName="grupo14_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_5_Nao" runat="server" GroupName="grupo14_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_5_NA" runat="server" GroupName="grupo14_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.5--%>
                                        <tr>
                                            <td align="center">14.6</td>
                                            <td>Todos os produtos separados no setor de retira estão faturados e dentro do prazo de validade? 
                                                <asp:TextBox ID="txt14_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_6_Sim" runat="server" GroupName="grupo14_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_6_Nao" runat="server" GroupName="grupo14_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_6_NA" runat="server" GroupName="grupo14_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.6--%>
                                        <tr>
                                            <td align="center">14.7</td>
                                            <td>Setor de retira encontra-se limpo e organizado?
                                                <asp:TextBox ID="txt14_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_7_Sim" runat="server" GroupName="grupo14_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_7_Nao" runat="server" GroupName="grupo14_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_7_NA" runat="server" GroupName="grupo14_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.7--%>
                                        <tr>
                                            <td align="center">14.8</td>
                                            <td>Toda mercadoria no setor de retira aguardando retirada, possuem cópia (frente e verso) da nota fiscal (ou cupom) fixada em cada pallet?
                                                <asp:TextBox ID="txt14_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_8_Sim" runat="server" GroupName="grupo14_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_8_Nao" runat="server" GroupName="grupo14_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_8_NA" runat="server" GroupName="grupo14_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.8--%>
                                        <tr>
                                            <td align="center">14.9</td>
                                            <td>As quantidades de mercadorias separadas no setor de retira, condizem com as quantidades das notas fiscais emitidas?
                                                <asp:TextBox ID="txt14_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_9_Sim" runat="server" GroupName="grupo14_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_9_Nao" runat="server" GroupName="grupo14_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_9_NA" runat="server" GroupName="grupo14_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.9--%>
                                        <tr>
                                            <td align="center">14.10</td>
                                            <td>Toda mercadoria não perecível já faturada, encontra-se no espaço confinado do setor de retira?
                                                <asp:TextBox ID="txt14_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_10_Sim" runat="server" GroupName="grupo14_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_10_Nao" runat="server" GroupName="grupo14_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_10_NA" runat="server" GroupName="grupo14_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.10--%>


                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo14" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--14 - Retira--%>

                        <asp:Panel ID="panDados15" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Televendas</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">15.1</td>
                                            <td>Existem pedidos de venda pendente do dia anterior separado no setor de retira?
                                                <asp:TextBox ID="txt15_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_1_Sim" runat="server" GroupName="grupo15_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_1_Nao" runat="server" GroupName="grupo15_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_1_NA" runat="server" GroupName="grupo15_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto15_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile15_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto15_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 15.1--%>
                                        <tr>
                                            <td align="center">15.2</td>
                                            <td>Todas as notas fiscais de venda do televendas são diariamente direcionadas para o setor de Tesouraria?
                                                <asp:TextBox ID="txt15_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_2_Sim" runat="server" GroupName="grupo15_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_2_Nao" runat="server" GroupName="grupo15_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_2_NA" runat="server" GroupName="grupo15_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto15_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile15_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto15_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 15.2--%>
                                        <tr>
                                            <td align="center">15.3</td>
                                            <td>Produtos Perecíveis climatizados, estão separados e identificados na câmara?
                                                <asp:TextBox ID="txt15_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_3_Sim" runat="server" GroupName="grupo15_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_3_Nao" runat="server" GroupName="grupo15_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_3_NA" runat="server" GroupName="grupo15_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto15_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile15_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto15_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 15.3--%>
                                        <tr>
                                            <td align="center">15.4</td>
                                            <td>Todos os produtos faturados e separados no setor de retira, estão dentro do prazo para retirada?
                                                <asp:TextBox ID="txt15_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_4_Sim" runat="server" GroupName="grupo15_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_4_Nao" runat="server" GroupName="grupo15_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_4_NA" runat="server" GroupName="grupo15_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto15_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile15_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto15_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 15.4--%>
                                        <tr>
                                            <td align="center">15.5</td>
                                            <td>Está sendo realizada a dupla aferição para produtos com peso variável na saída do PDV? (Dupla conferência: peso e quantidade de volumes.)
                                                <asp:TextBox ID="txt15_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_5_Sim" runat="server" GroupName="grupo15_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_5_Nao" runat="server" GroupName="grupo15_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_5_NA" runat="server" GroupName="grupo15_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto15_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile15_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto15_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 15.5--%>



                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo15" runat="server" Text="Enviar" AutoPostBack="false">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>
                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--15 - Televendas--%>

                        <asp:Panel ID="panDados16" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Segurança Patrimonial</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">16.1</td>
                                            <td>O teste do Gerador de Energia está sendo realizado semanalmente? (verificar planilha)
                                                <asp:TextBox ID="txt16_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_1_Sim" runat="server" GroupName="grupo16_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_1_Nao" runat="server" GroupName="grupo16_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_1_NA" runat="server" GroupName="grupo16_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.1--%>
                                        <tr>
                                            <td align="center">16.2</td>
                                            <td>O Checklist de Abertura e Fechamento da loja, está sendo executado diariamente? (verificar planilha e assinaturas)
                                                <asp:TextBox ID="txt16_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_2_Sim" runat="server" GroupName="grupo16_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_2_Nao" runat="server" GroupName="grupo16_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_2_NA" runat="server" GroupName="grupo16_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.2--%>
                                        <tr>
                                            <td align="center">16.3</td>
                                            <td>O log das portas de emergência está preenchido corretamente?
                                                <asp:TextBox ID="txt16_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_3_Sim" runat="server" GroupName="grupo16_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_3_Nao" runat="server" GroupName="grupo16_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_3_NA" runat="server" GroupName="grupo16_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.3--%>
                                        <tr>
                                            <td align="center">16.4</td>
                                            <td>A loja realiza o teste nas portas de saída de emergência e botão de pânico? (verificar planilhas)
                                                <asp:TextBox ID="txt16_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_4_Sim" runat="server" GroupName="grupo16_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_4_Nao" runat="server" GroupName="grupo16_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_4_NA" runat="server" GroupName="grupo16_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.4--%>
                                        <tr>
                                            <td align="center">16.5</td>
                                            <td>Os Equipamentos de segurança da loja são testados diariamente? 
                                                <asp:TextBox ID="txt16_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_5_Sim" runat="server" GroupName="grupo16_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_5_Nao" runat="server" GroupName="grupo16_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_5_NA" runat="server" GroupName="grupo16_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.5--%>
                                        <tr>
                                            <td align="center">16.6</td>
                                            <td>Operador de CFTV encontra-se 100% do tempo no setor? (a partir da abertura da loja pelo plantão)
                                                <asp:TextBox ID="txt16_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_6_Sim" runat="server" GroupName="grupo16_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_6_Nao" runat="server" GroupName="grupo16_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_6_NA" runat="server" GroupName="grupo16_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.6--%>
                                        <tr>
                                            <td align="center">16.7</td>
                                            <td>Todos os hidrantes, extintores e portas de emergências encontram-se desobstruídos? (Específicar local)
                                                <asp:TextBox ID="txt16_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_7_Sim" runat="server" GroupName="grupo16_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_7_Nao" runat="server" GroupName="grupo16_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_7_NA" runat="server" GroupName="grupo16_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.7--%>
                                        <tr>
                                            <td align="center">16.8</td>
                                            <td>Todos os produtos comprados por colaboradores, para uso e consumo no interior da loja, possuem Etiqueta de Segurança?
                                                <asp:TextBox ID="txt16_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_8_Sim" runat="server" GroupName="grupo16_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_8_Nao" runat="server" GroupName="grupo16_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_8_NA" runat="server" GroupName="grupo16_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.8--%>
                                        <tr>
                                            <td align="center">16.9</td>
                                            <td>Os armários destinados para uso dos colaboradores no vestiário encontram-se em condições de uso?
                                                <asp:TextBox ID="txt16_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_9_Sim" runat="server" GroupName="grupo16_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_9_Nao" runat="server" GroupName="grupo16_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_9_NA" runat="server" GroupName="grupo16_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.9--%>
                                        <tr>
                                            <td align="center">16.10</td>
                                            <td>O Fiscal de Loja está sempre presente no pódio da entrada da loja?
                                                <asp:TextBox ID="txt16_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_10_Sim" runat="server" GroupName="grupo16_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_10_Nao" runat="server" GroupName="grupo16_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_10_NA" runat="server" GroupName="grupo16_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.10--%>
                                        <tr>
                                            <td align="center">16.11</td>
                                            <td>A Central de Alarme de Incêndio está operante?
                                                <asp:TextBox ID="txt16_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_11_Sim" runat="server" GroupName="grupo16_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_11_Nao" runat="server" GroupName="grupo16_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_11_NA" runat="server" GroupName="grupo16_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.11--%>
                                        <tr>
                                            <td align="center">16.12</td>
                                            <td>Esta sendo utilizada as placas de identificação de piso molhado?
                                                <asp:TextBox ID="txt16_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_12_Sim" runat="server" GroupName="grupo16_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_12_Nao" runat="server" GroupName="grupo16_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_12_NA" runat="server" GroupName="grupo16_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.12--%>



                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo16" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--16 - Segurança Patrimonial--%>

                        <asp:Panel ID="panDados17" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Cozinha</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">17.1</td>
                                            <td>O cardápio definido pela matriz é seguido corretamente?
                                                <asp:TextBox ID="txt17_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_1_Sim" runat="server" GroupName="grupo17_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_1_Nao" runat="server" GroupName="grupo17_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_1_NA" runat="server" GroupName="grupo17_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.1--%>
                                        <tr>
                                            <td align="center">17.2</td>
                                            <td>Os funcionários do setor fazem uso de toucas, uniformes, EPI's e seguem as regras de asseio pessoal, não fazendo uso de adornos (brincos, anéis, pulseiras, etc), barba, maquiagem e esmalte?
                                                <asp:TextBox ID="txt17_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_2_Sim" runat="server" GroupName="grupo17_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_2_Nao" runat="server" GroupName="grupo17_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_2_NA" runat="server" GroupName="grupo17_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.2--%>
                                        <tr>
                                            <td align="center">17.3</td>
                                            <td>Todos os insumos em utilização (abertos) possuem etiqueta de identificação e com preenchimento correto?
                                                <asp:TextBox ID="txt17_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_3_Sim" runat="server" GroupName="grupo17_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_3_Nao" runat="server" GroupName="grupo17_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_3_NA" runat="server" GroupName="grupo17_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.3--%>
                                        <tr>
                                            <td align="center">17.4</td>
                                            <td>A cozinha encontra-se limpa e organizada (piso, paredes, mesas, equipamentos, lixeiras, papeleiras e saboneteira), sem acúmulos de água no piso e /ou lixos espalhados pelo setor?
                                                <asp:TextBox ID="txt17_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_4_Sim" runat="server" GroupName="grupo17_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_4_Nao" runat="server" GroupName="grupo17_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_4_NA" runat="server" GroupName="grupo17_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.4--%>
                                        <tr>
                                            <td align="center">17.5</td>
                                            <td>A planilha de higienização está preenchida corretamente?
                                                <asp:TextBox ID="txt17_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_5_Sim" runat="server" GroupName="grupo17_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_5_Nao" runat="server" GroupName="grupo17_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_5_NA" runat="server" GroupName="grupo17_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.5--%>
                                        <tr>
                                            <td align="center">17.6</td>
                                            <td>Os equipamentos são higienizados, na frequência adequada e de forma a retirar completamente os resíduos (sem sujidades antigas)? 
                                                <asp:TextBox ID="txt17_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_6_Sim" runat="server" GroupName="grupo17_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_6_Nao" runat="server" GroupName="grupo17_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_6_NA" runat="server" GroupName="grupo17_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.6--%>
                                        <tr>
                                            <td align="center">17.7</td>
                                            <td>A geladeira está organizada de forma a evitar contaminação cruzada entre alimentos?  (Produtos crus na parte de baixo; prontos ou em preparação na parte de cima.)
                                                <asp:TextBox ID="txt17_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_7_Sim" runat="server" GroupName="grupo17_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_7_Nao" runat="server" GroupName="grupo17_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_7_NA" runat="server" GroupName="grupo17_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.7--%>
                                        <tr>
                                            <td align="center">17.8</td>
                                            <td>As coletas de amostras de todas as refeições (100g de cada alimento) preparadas é realizada para todas as refeições e mantidas armazenadas por 3 dias?
                                                <asp:TextBox ID="txt17_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_8_Sim" runat="server" GroupName="grupo17_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_8_Nao" runat="server" GroupName="grupo17_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_8_NA" runat="server" GroupName="grupo17_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.8--%>
                                        <tr>
                                            <td align="center">17.9</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade?
                                                <asp:TextBox ID="txt17_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_9_Sim" runat="server" GroupName="grupo17_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_9_Nao" runat="server" GroupName="grupo17_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_9_NA" runat="server" GroupName="grupo17_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.9--%>
                                        <tr>
                                            <td align="center">17.10</td>
                                            <td>A aferição de temperatura do buffet está, respeitando intervalo definido pela empresa? A planilha está sendo preenchida corretamente?
                                                <asp:TextBox ID="txt17_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_10_Sim" runat="server" GroupName="grupo17_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_10_Nao" runat="server" GroupName="grupo17_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_10_NA" runat="server" GroupName="grupo17_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.10--%>
                                        <tr>
                                            <td align="center">17.11</td>
                                            <td>A higienização das hortifrutícolas está sendo realizada de maneira correta (uso de SUMAVEG ou água sanitária)?
                                                <asp:TextBox ID="txt17_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_11_Sim" runat="server" GroupName="grupo17_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_11_Nao" runat="server" GroupName="grupo17_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_11_NA" runat="server" GroupName="grupo17_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.11--%>
                                        <tr>
                                            <td align="center">17.12</td>
                                            <td>O processo de descongelamento técnico é feito corretamente conforme orientação do setor de Higiene e Segurança Alimentar (HSA)?
                                                <asp:TextBox ID="txt17_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_12_Sim" runat="server" GroupName="grupo17_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_12_Nao" runat="server" GroupName="grupo17_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_12_NA" runat="server" GroupName="grupo17_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.12--%>



                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo17" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--17 - Cozinha--%>

                        <asp:Panel ID="panDados18" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Adiministrativo</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">18.1</td>
                                            <td>Os Gerentes, encarregados ou responsáveis pelos setores estão analisando diariamente o lançamento das movimentações internas? (Conferir assinaturas nos relatórios e log de acompanhamento)
                                                <asp:TextBox ID="txt18_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_1_Sim" runat="server" GroupName="grupo18_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_1_Nao" runat="server" GroupName="grupo18_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_1_NA" runat="server" GroupName="grupo18_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.1--%>
                                        <tr>
                                            <td align="center">18.2</td>
                                            <td>Não foram encontrados objetos estranhos ao ambiente da tesouraria? 
                                                <asp:TextBox ID="txt18_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_2_Sim" runat="server" GroupName="grupo18_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_2_Nao" runat="server" GroupName="grupo18_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_2_NA" runat="server" GroupName="grupo18_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.2--%>
                                        <tr>
                                            <td align="center">18.3</td>
                                            <td>Está sendo realizado lançamento das movimentações internas (Agendas 023, 069, 245, 705) diariamente no sistema?
                                                <asp:TextBox ID="txt18_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_3_Sim" runat="server" GroupName="grupo18_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_3_Nao" runat="server" GroupName="grupo18_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_3_NA" runat="server" GroupName="grupo18_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.3--%>
                                        <tr>
                                            <td align="center">18.4</td>
                                            <td>O lançamento da Agenda 23 (furto e degustação) é realizado diariamente?
                                                <asp:TextBox ID="txt18_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_4_Sim" runat="server" GroupName="grupo18_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_4_Nao" runat="server" GroupName="grupo18_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_4_NA" runat="server" GroupName="grupo18_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.4--%>
                                        <tr>
                                            <td align="center">18.5</td>
                                            <td>Checklist da Informática / Frente de Caixa esta sendo realizado corretamente?
                                                <asp:TextBox ID="txt18_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_5_Sim" runat="server" GroupName="grupo18_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_5_Nao" runat="server" GroupName="grupo18_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_5_NA" runat="server" GroupName="grupo18_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.5--%>
                                        <tr>
                                            <td align="center">18.6</td>
                                            <td>Os indicadores de resultado (quebras, trocas, inventário, checklist, etc) estão expostos e atualizados no painel de gestão a vista?
                                                <asp:TextBox ID="txt18_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_6_Sim" runat="server" GroupName="grupo18_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_6_Nao" runat="server" GroupName="grupo18_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_6_NA" runat="server" GroupName="grupo18_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.6--%>
                                        <tr>
                                            <td align="center">18.7</td>
                                            <td>Todos os itens encontrados nos setores encontram-se com etiqueta de movimentação interna?
                                                <asp:TextBox ID="txt18_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_7_Sim" runat="server" GroupName="grupo18_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_7_Nao" runat="server" GroupName="grupo18_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_7_NA" runat="server" GroupName="grupo18_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.7--%>



                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo18" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--18 - Adiministrativo--%>

                        <asp:Panel ID="panDados19" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Banheiros</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">19.1</td>
                                            <td>Os banheiros encontram-se limpos, organizados?
                                                <asp:TextBox ID="txt19_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_1_Sim" runat="server" GroupName="grupo19_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_1_Nao" runat="server" GroupName="grupo19_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_1_NA" runat="server" GroupName="grupo19_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto19_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile19_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto19_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 19.1--%>
                                        <tr>
                                            <td align="center">19.2</td>
                                            <td>As papeleiras e saboneteiras estão abastecidas corretamente e limpas? As lixeiras são dotadas de tampa e acionadas sem contato manual? (para banheiros de perecíveis uso obrigatório do sabonete antisséptico)
                                                <asp:TextBox ID="txt19_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_2_Sim" runat="server" GroupName="grupo19_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_2_Nao" runat="server" GroupName="grupo19_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_2_NA" runat="server" GroupName="grupo19_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto19_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile19_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto19_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 19.2--%>
                                        <tr>
                                            <td align="center">19.3</td>
                                            <td>O fraldário encontra-se limpo, abastecido organizado e com a almofada de superfície impermeável em condições de uso?
                                                <asp:TextBox ID="txt19_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_3_Sim" runat="server" GroupName="grupo19_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_3_Nao" runat="server" GroupName="grupo19_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_3_NA" runat="server" GroupName="grupo19_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto19_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile19_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto19_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 19.3--%>
                                        <tr>
                                            <td align="center">19.4</td>
                                            <td>Nos vestiários os armários individuais dos funcionários estão em boas condições de uso? (sem ferrugem, limpos e íntegros)
                                                <asp:TextBox ID="txt19_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_4_Sim" runat="server" GroupName="grupo19_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_4_Nao" runat="server" GroupName="grupo19_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_4_NA" runat="server" GroupName="grupo19_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto19_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile19_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto19_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 19.4--%>
                                        <tr>
                                            <td align="center">19.5</td>
                                            <td>As instalações sanitárias estão íntegras, em bom estado de conservação e sem acúmulo de lixo? (Bolor, água estagnada, vetores, presença de fiação exposta, fechamento das portas adequado, vasos sanitários com tampa e assento).
                                                <asp:TextBox ID="txt19_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_5_Sim" runat="server" GroupName="grupo19_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_5_Nao" runat="server" GroupName="grupo19_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_5_NA" runat="server" GroupName="grupo19_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto19_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile19_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto19_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 19.5--%>



                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo19" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>
                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--19 - Banheiros--%>
                    </div>
                </div>

            </panelcontent>
        </panelcollection>
    </aspxcallbackpanel>

    <!-- Modal Sucesso -->
    <div class="modal fade w-auto h-auto" id="ModalSucess" tabindex="-1" role="dialog" aria-labelledby="ModalSucess" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="alert alert-success" role="alert" style="text-align: center">
                        <div style="text-align: center">
                            <br />
                            <strong>Os dados foram gravados com sucesso!</strong>
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-success btn-md" data-dismiss="modal">Ok</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Erro Imagem-->
    <div class="modal fade w-auto h-auto" id="ModalErro" tabindex="-1" role="dialog" aria-labelledby="ModalErro" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="alert alert-danger" role="alert" style="text-align: center">
                        <div style="text-align: center">
                            <br />
                            <strong>Nenhuma imagem foi carregada!!!</strong>
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-warning btn-md" data-dismiss="modal">Ok</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Sucesso -->
    <div class="modal fade w-auto h-auto" id="ModalSucessImg" tabindex="-1" role="dialog" aria-labelledby="ModalSucessImg" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="alert alert-success" role="alert" style="text-align: center">
                        <div style="text-align: center">
                            <br />
                            <strong>A imagem foi carregada com sucesso!!!</strong>
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container" style="max-width: 80%; font-size: 12pt; display: none" id="renderRel" runat="server">
    </div>

    <script>

        function alertSucessImg() {

            var display = document.getElementById("success-alert").style.display;
            if (display == "none")
                document.getElementById("success-alert").style.display = 'block';
            else
                document.getElementById("success-alert").style.display = 'none';

            $("#success-alert").fadeTo(8000, 500).slideUp(500, function () {
                $("#success-alert").slideUp(500);
            });
        }

        function alertError() {

            var display = document.getElementById("dangerAlert").style.display;
            if (display == "none")
                document.getElementById("dangerAlert").style.display = 'block';
            else
                document.getElementById("dangerAlert").style.display = 'none';

            $("#dangerAlert").fadeTo(8000, 500).slideUp(500, function () {
                $("#dangerAlert").slideUp(500);
            });
        }

        function alertSucess() {
            $('#ModalSucess').modal('show');
            $("#ModalSucess").slideUp(500);
        }

        function maxData() {

            try {
                MainContent_txtData.max = new Date().toISOString().split("T")[0];
                //document.getElementById('MainContent_txtData').valueAsDate = new Date();

            } catch (e) {
                console.log(e.message)
                // Unexpected token n in JSON at position 2
            }
        }

        maxData();


    </script>


</asp:Content>



