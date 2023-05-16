<%@ Page Title="Checklist" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CheckListCondor.aspx.vb" Inherits="MemberPages_CheckListCondor" %>

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
                            <asp:Button ID="btnMenu_1" Width="140px" Height="45px" CssClass="btn btn-xs" Font-Size="10px" Text="Recebimento" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_1_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_2" Width="140px" Height="45px" CssClass="btn btn-xs" Font-Size="10px" Text="Depósito - Mercearia" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_2_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_3" Width="140px" Height="45px" CssClass="btn btn-xs" Font-Size="10px" Text="Depósito - Bazar" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_3_Click" Style="background-repeat: round" />
                        </div>
                    </div>
                    <div class="row col-md-12 justify-content-center text-center" style="padding-bottom: 15px">
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_4" Width="140px" Height="45px" CssClass="btn btn-xs" Font-Size="10px" Text="Depósito - Têxtil" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_4_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_5" Width="140px" Height="45px" CssClass="btn btn-xs" Font-Size="10px" Text="Depósito - Eletro" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_5_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_6" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Câmara de Congelados / Corredor de Perecíveis" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_6_Click" Style="background-repeat: round" />
                        </div>
                    </div>
                    <div class="row col-md-12 justify-content-center text-center" style="padding-bottom: 15px">
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_7" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Hortifruti (Armanezamento)" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_7_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_8" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Açougue" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_8_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_9" Width="140px" Height="45px" CssClass="btn btn-xs" Font-Size="10px" Text="Fiambreria" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_9_Click" Style="background-repeat: round" />
                        </div>
                    </div>
                    <div class="row col-md-12 justify-content-center text-center" style="padding-bottom: 15px">
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_10" Width="140px" Height="45px" CssClass="btn btn-xs" Font-Size="10px" Text="OPLS" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_10_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_11" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Padaria e Confeitaria" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_11_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_12" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Cozinha / Rotisseria / Refeitório" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_12_Click" Style="background-repeat: round" />
                        </div>
                    </div>
                    <div class="row col-md-12 justify-content-center text-center" style="padding-bottom: 15px">
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_13" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Hortifruti - Área de Vendas" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_13_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_14" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Area de Vendas" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_14_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_15" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Area de Vendas- (PAR)" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_15_Click" Style="background-repeat: round" />
                        </div>
                    </div>
                    <div class="row col-md-12 justify-content-center text-center" style="padding-bottom: 15px">
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_16" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Administrativo" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_16_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_17" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Banheiro / Vestiários" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_17_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_18" Width="140px" Height="45px" CssClass="btn btn-xs" Font-Size="10px" Text="Trocas" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_18_Click" Style="background-repeat: round" />
                        </div>
                    </div>
                    <div class="row col-md-12 justify-content-center text-center">
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_19" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Delivery" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_19_Click" Style="background-repeat: round" />
                        </div>
                        <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 0 15px 0 15px; font-size: 14px">
                            <asp:Button ID="btnMenu_20" Width="140px" Height="45px" CssClass="btn btn-xs btn-wrap-text" Font-Size="10px" Text="Frente de Caixa" ForeColor="White" AutoPostBack="False" runat="server" OnClick="btnMenu_20_Click" Style="background-repeat: round" />
                        </div>
                    </div>
                </div>

                <div class="row col-11 justify-content-end" runat="server" style="padding: 30px 0 15px 0" id="divVoltar" visible="false">

                    <asp:Button runat="server" ID="btnVoltar" OnClick="btnVoltar_Click" AutoPostBack="False" CssClass="btn btn-danger btn-lg" Text="Voltar" Width="100px" />

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

                        <div class="alert alert-danger" id="dangerAlert" style="text-align: center">
                            <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>Ocorreu um problema no salvamento da imagem!</strong>
                        </div>

                        <div class="alert alert-success" id="success-alert" style="text-align: center">
                            <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>A imagem foi salva com sucesso!</strong>
                        </div>

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
                                                    <h2><b>Recebimento</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">1.1</td>
                                            <td>Há orientação sobre as normativas para entrada de pessoas externas (entregadores, caminhoneiros, crianças) no recebimento?
                                            <asp:TextBox
                                                ID="txt1_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_1_Sim" runat="server" GroupName="grupo1_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_1_Nao" runat="server" GroupName="grupo1_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_1_NA" runat="server" GroupName="grupo1_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1--%>
                                        <tr>
                                            <td align="center">1.2</td>
                                            <td>O Fiscal de Loja do recebimento está presente 100% do tempo no recebimento?
                                            <asp:TextBox
                                                ID="txt1_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_2_Sim" runat="server" GroupName="grupo1_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_2_Nao" runat="server" GroupName="grupo1_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_2_NA" runat="server" GroupName="grupo1_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.2--%>
                                        <tr>
                                            <td align="center">1.3</td>
                                            <td>A conferência dos produtos vindos diretamente dos fornecedores ocorre no momento em que os mesmos são descarregados na doca? ( Após a faixa amarela)
                                            <asp:TextBox
                                                ID="txt1_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_3_Sim" runat="server" GroupName="grupo1_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_3_Nao" runat="server" GroupName="grupo1_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_3_NA" runat="server" GroupName="grupo1_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.3--%>
                                        <tr>
                                            <td align="center">1.4</td>
                                            <td>Os produtos são conferidos, sem a interferência do entregador/fornecedor?
                                            <asp:TextBox
                                                ID="txt1_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_4_Sim" runat="server" GroupName="grupo1_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_4_Nao" runat="server" GroupName="grupo1_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_4_NA" runat="server" GroupName="grupo1_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.4--%>
                                        <tr>
                                            <td align="center">1.5</td>
                                            <td>É verificada a qualidade e quantidade (embalagem, validade, aparência) dos produtos recebidos (entrada direta/CD)?
                                            <asp:TextBox
                                                ID="txt1_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_5_Sim" runat="server" GroupName="grupo1_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_5_Nao" runat="server" GroupName="grupo1_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_5_NA" runat="server" GroupName="grupo1_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.5--%>
                                        <tr>
                                            <td align="center">1.6</td>
                                            <td>É verificado o estado dos veículos (limpeza, organização e conservação) recebidos (entrada direta e CD)?
                                            <asp:TextBox
                                                ID="txt1_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_6_Sim" runat="server" GroupName="grupo1_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_6_Nao" runat="server" GroupName="grupo1_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_6_NA" runat="server" GroupName="grupo1_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.6--%>
                                        <tr>
                                            <td align="center">1.7</td>
                                            <td>As balanças estão limpas de FÁCIL ACESSO aos conferentes?
                                            <asp:TextBox
                                                ID="txt1_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_7_Sim" runat="server" GroupName="grupo1_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_7_Nao" runat="server" GroupName="grupo1_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_7_NA" runat="server" GroupName="grupo1_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.7--%>
                                        <tr>
                                            <td align="center">1.8</td>
                                            <td>O encarregado ou funcionário das seções envolvidas está acompanhando os recebimentos dos perecíveis?
                                            <asp:TextBox
                                                ID="txt1_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_8_Sim" runat="server" GroupName="grupo1_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_8_Nao" runat="server" GroupName="grupo1_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_8_NA" runat="server" GroupName="grupo1_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.8--%>
                                        <tr>
                                            <td align="center">1.9</td>
                                            <td>Após a conferência os produtos são encaminhados imediatamente para o seu local de armazenagem (principalmente os perecíveis)?
                                            <asp:TextBox
                                                ID="txt1_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_9_Sim" runat="server" GroupName="grupo1_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_9_Nao" runat="server" GroupName="grupo1_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_9_NA" runat="server" GroupName="grupo1_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_9" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.9--%>
                                        <tr>
                                            <td align="center">1.10</td>
                                            <td>Está sendo realizado o controle de temperatura dos produtos perecíveis recebidos (todas as cargas)? A planilha está corretamente preenchida? Termometro está calibrado?
                                            <asp:TextBox
                                                ID="txt1_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_10_Sim" runat="server" GroupName="grupo1_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_10_Nao" runat="server" GroupName="grupo1_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_10_NA" runat="server" GroupName="grupo1_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_10" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.10--%>
                                        <tr>
                                            <td align="center">1.11</td>
                                            <td>A vistoria é feita diariamente no descarte de lixo e papelões da loja pelo fiscal de loja?
                                            <asp:TextBox
                                                ID="txt1_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_11_Sim" runat="server" GroupName="grupo1_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_11_Nao" runat="server" GroupName="grupo1_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_11_NA" runat="server" GroupName="grupo1_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_11" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.11--%>
                                        <tr>
                                            <td align="center">1.12</td>
                                            <td>O controle de ocorrências do recebimento (entrada de NFs, devolução, temperatura, caminhões, irregularidades de recebimento) está sendo preenchido corretamente?
                                            <asp:TextBox
                                                ID="txt1_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_12_Sim" runat="server" GroupName="grupo1_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_12_Nao" runat="server" GroupName="grupo1_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_12_NA" runat="server" GroupName="grupo1_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_12" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.12--%>
                                        <tr>
                                            <td align="center">1.13</td>
                                            <td>A conferência dos P.A.R. é feita na área destinada? Os containers de transferência de PAR está sendo conferido no ato do recebimento?(Security Space)
                                            <asp:TextBox
                                                ID="txt1_13" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_13_Sim" runat="server" GroupName="grupo1_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_13_Nao" runat="server" GroupName="grupo1_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_13_NA" runat="server" GroupName="grupo1_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_13" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.13--%>
                                        <tr>
                                            <td align="center">1.14</td>
                                            <td>Após a conferência dos P.A.R., o responsável da seção encaminha as mercadorias diretamente para a área segregada?
                                            <asp:TextBox
                                                ID="txt1_14" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_14_Sim" runat="server" GroupName="grupo1_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_14_Nao" runat="server" GroupName="grupo1_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_14_NA" runat="server" GroupName="grupo1_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_14" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.14--%>
                                        <tr>
                                            <td align="center">1.15</td>
                                            <td>No momento da avaliação, o setor se encontrava limpo e organizado?
                                            <asp:TextBox
                                                ID="txt1_15" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_15_Sim" runat="server" GroupName="grupo1_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_15_Nao" runat="server" GroupName="grupo1_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_15_NA" runat="server" GroupName="grupo1_15" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_15" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_15" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.15--%>
                                        <tr>
                                            <td align="center">1.16</td>
                                            <td>No momento da avaliação, os funcionários utilizavam os EPI´s adequados para o recebimento?
                                            <asp:TextBox
                                                ID="txt1_16" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_16_Sim" runat="server" GroupName="grupo1_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_16_Nao" runat="server" GroupName="grupo1_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_16_NA" runat="server" GroupName="grupo1_16" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_16" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_16" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.16--%>
                                        <tr>
                                            <td align="center">1.17</td>
                                            <td>Todos os produtos que saem pelo recebimento são feitas por meio de Nota Fiscal? (Ex: Trocas, Assistência Técnica, transferências, etc.)Transferência somente com autorização Regional
                                            <asp:TextBox
                                                ID="txt1_17" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_17_Sim" runat="server" GroupName="grupo1_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_17_Nao" runat="server" GroupName="grupo1_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_17_NA" runat="server" GroupName="grupo1_17" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_17" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_17" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.17--%>
                                        <tr>
                                            <td align="center">1.18</td>
                                            <td>Todos os produtos que saem pelo Recebimento são conferidos pelo responsável do setor, com a presença de um Fiscal de Loja?
                                            <asp:TextBox
                                                ID="txt1_18" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_18_Sim" runat="server" GroupName="grupo1_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_18_Nao" runat="server" GroupName="grupo1_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_18_NA" runat="server" GroupName="grupo1_18" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_18" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_18" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.18--%>
                                        <tr>
                                            <td align="center">1.19</td>
                                            <td>Existem notas fiscais pendentes de acatamento (sem pedido, divergência de quantidade ou custo)?
                                            <asp:TextBox
                                                ID="txt1_19" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_19_Sim" runat="server" GroupName="grupo1_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_19_Nao" runat="server" GroupName="grupo1_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_19_NA" runat="server" GroupName="grupo1_19" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_19" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_19" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_19" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.19--%>

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
                        <%--1 - Recebimento--%>

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
                                                    <h2><b>Depósito - Mercearia </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">2.1</td>
                                            <td>Há orientação sobre as normativas para entrada de pessoas externas (fornecedores) no depósito?
                                            <asp:TextBox
                                                ID="txt2_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_1_Sim" runat="server" GroupName="grupo2_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_1_Nao" runat="server" GroupName="grupo2_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_1_NA" runat="server" GroupName="grupo2_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1--%>
                                        <tr>
                                            <td align="center">2.2</td>
                                            <td>O limite máximo de empilhamento é respeitado de modo a não existir risco de desabamento nem de ficar próximos a fiação elétrica?
                                            <asp:TextBox
                                                ID="txt2_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_2_Sim" runat="server" GroupName="grupo2_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_2_Nao" runat="server" GroupName="grupo2_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_2_NA" runat="server" GroupName="grupo2_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.2--%>
                                        <tr>
                                            <td align="center">2.3</td>
                                            <td>Os corredores estão limpos e desobstruídos?Há mercadorias caídas atrás dos racks e/ou debaixo dos pallets?
                                            <asp:TextBox
                                                ID="txt2_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_3_Sim" runat="server" GroupName="grupo2_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_3_Nao" runat="server" GroupName="grupo2_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_3_NA" runat="server" GroupName="grupo2_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.3--%>
                                        <tr>
                                            <td align="center">2.4</td>
                                            <td>O depósito está organizado em condições de se realizar o PVPS? Está sendo feito o PVPS?
                                            <asp:TextBox
                                                ID="txt2_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_4_Sim" runat="server" GroupName="grupo2_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_4_Nao" runat="server" GroupName="grupo2_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_4_NA" runat="server" GroupName="grupo2_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.4--%>
                                        <tr>
                                            <td align="center">2.5</td>
                                            <td>Todos os produtos auditados encontram-se dentro do prazo de validade?
                                            <asp:TextBox
                                                ID="txt2_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_5_Sim" runat="server" GroupName="grupo2_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_5_Nao" runat="server" GroupName="grupo2_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_5_NA" runat="server" GroupName="grupo2_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.5--%>
                                        <tr>
                                            <td align="center">2.6</td>
                                            <td>Os produtos estão armazenados de maneira que não se encontrem mercadorias soltas no depósito?
                                            <asp:TextBox
                                                ID="txt2_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_6_Sim" runat="server" GroupName="grupo2_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_6_Nao" runat="server" GroupName="grupo2_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_6_NA" runat="server" GroupName="grupo2_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.6--%>
                                        <tr>
                                            <td align="center">2.7</td>
                                            <td>Todas as caixas falsas armazenadas no depósito estão com espelho de caixa afixado (EAN, descrição, quantidade, validade)?
                                            <asp:TextBox
                                                ID="txt2_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_7_Sim" runat="server" GroupName="grupo2_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_7_Nao" runat="server" GroupName="grupo2_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_7_NA" runat="server" GroupName="grupo2_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.7--%>
                                        <tr>
                                            <td align="center">2.8</td>
                                            <td>As áreas segregadas estão adequadas no depósito de modo que os produtos permaneçam confinados (estrutura, cadeados, chaves e duplo controle de chaves)?
                                            <asp:TextBox
                                                ID="txt2_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_8_Sim" runat="server" GroupName="grupo2_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_8_Nao" runat="server" GroupName="grupo2_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_8_NA" runat="server" GroupName="grupo2_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.8--%>
                                        <tr>
                                            <td align="center">2.9</td>
                                            <td>Todos os PAR estão sendo etiquetados (alarmados) ainda na área segregada? (antes de irem para o chão de loja?)
                                            <asp:TextBox
                                                ID="txt2_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_9_Sim" runat="server" GroupName="grupo2_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_9_Nao" runat="server" GroupName="grupo2_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_9_NA" runat="server" GroupName="grupo2_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_9" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.9--%>
                                        <tr>
                                            <td align="center">2.10</td>
                                            <td>O depósito está organizado de maneira que não se encontre produtos alimentícios com não-alimentícios?
                                            <asp:TextBox
                                                ID="txt2_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_10_Sim" runat="server" GroupName="grupo2_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_10_Nao" runat="server" GroupName="grupo2_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_10_NA" runat="server" GroupName="grupo2_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_10" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.10--%>
                                        <tr>
                                            <td align="center">2.11</td>
                                            <td>As delimitações dos racks e áreas pulmões estão sinalizados? Os racks estão identificados para melhor organização?
                                            <asp:TextBox
                                                ID="txt2_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_11_Sim" runat="server" GroupName="grupo2_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_11_Nao" runat="server" GroupName="grupo2_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_11_NA" runat="server" GroupName="grupo2_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_11" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.11--%>
                                        <tr>
                                            <td align="center">2.12</td>
                                            <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados?
                                            <asp:TextBox
                                                ID="txt2_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_12_Sim" runat="server" GroupName="grupo2_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_12_Nao" runat="server" GroupName="grupo2_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_12_NA" runat="server" GroupName="grupo2_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_12" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.12--%>



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
                        <%--2 - Deposito Mercearia--%>

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
                                                    <h2><b>Depósito - Bazar </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">3.1</td>
                                            <td>Há orientação sobre as normativas para entrada de pessoas externas (fornecedores) no depósito?
                                            <asp:TextBox
                                                ID="txt3_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_1_Sim" runat="server" GroupName="grupo3_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_1_Nao" runat="server" GroupName="grupo3_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_1_NA" runat="server" GroupName="grupo3_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1--%>
                                        <tr>
                                            <td align="center">3.2</td>
                                            <td>Todos os produtos auditados encontram-se dentro do prazo de validade?
                                            <asp:TextBox
                                                ID="txt3_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_2_Sim" runat="server" GroupName="grupo3_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_2_Nao" runat="server" GroupName="grupo3_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_2_NA" runat="server" GroupName="grupo3_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.2--%>
                                        <tr>
                                            <td align="center">3.3</td>
                                            <td>Os corredores estão limpos e desobstruídos?Há mercadorias caídas atrás dos racks e/ou debaixo dos pallets?
                                            <asp:TextBox
                                                ID="txt3_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_3_Sim" runat="server" GroupName="grupo3_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_3_Nao" runat="server" GroupName="grupo3_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_3_NA" runat="server" GroupName="grupo3_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.3--%>
                                        <tr>
                                            <td align="center">3.4</td>
                                            <td>O limite máximo de empilhamento é respeitado de modo a não existir risco de desabamento nem de ficar próximos a fiação elétrica?
                                            <asp:TextBox
                                                ID="txt3_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_4_Sim" runat="server" GroupName="grupo3_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_4_Nao" runat="server" GroupName="grupo3_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_4_NA" runat="server" GroupName="grupo3_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.4--%>
                                        <tr>
                                            <td align="center">3.5</td>
                                            <td>Os corredores estão limpos e desobstruídos?
                                            <asp:TextBox
                                                ID="txt3_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_5_Sim" runat="server" GroupName="grupo3_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_5_Nao" runat="server" GroupName="grupo3_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_5_NA" runat="server" GroupName="grupo3_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.5--%>
                                        <tr>
                                            <td align="center">3.6</td>
                                            <td>Todas as embalagens estão lacradas de maneira que não encontre mercadorias soltas no depósito? (Ex: Brinquedos, Papelaria, e outros produtos frágeis)
                                            <asp:TextBox
                                                ID="txt3_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_6_Sim" runat="server" GroupName="grupo3_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_6_Nao" runat="server" GroupName="grupo3_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_6_NA" runat="server" GroupName="grupo3_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.6--%>
                                        <tr>
                                            <td align="center">3.7</td>
                                            <td>As áreas segregadas estão adequadas no depósito de modo que os produtos permaneçam confinados (estrutura, cadeados, chaves e duplo controle de chaves)?
                                            <asp:TextBox
                                                ID="txt3_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_7_Sim" runat="server" GroupName="grupo3_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_7_Nao" runat="server" GroupName="grupo3_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_7_NA" runat="server" GroupName="grupo3_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.7--%>
                                        <tr>
                                            <td align="center">3.8</td>
                                            <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados?
                                            <asp:TextBox
                                                ID="txt3_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_8_Sim" runat="server" GroupName="grupo3_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_8_Nao" runat="server" GroupName="grupo3_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_8_NA" runat="server" GroupName="grupo3_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.8--%>
                                        <tr>
                                            <td align="center">3.9</td>
                                            <td>Todos os PARs estão sendo etiquetados (alarmados) ainda na área segregada? (antes de irem para o chão de loja?)
                                            <asp:TextBox
                                                ID="txt3_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_9_Sim" runat="server" GroupName="grupo3_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_9_Nao" runat="server" GroupName="grupo3_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_9_NA" runat="server" GroupName="grupo3_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_9" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.9--%>

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
                        <%--3 - Deposito Bazar)--%>

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
                                                    <h2><b>Depósito - Têxtil </b></h2>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tr>
                                            <td align="center">4.1</td>
                                            <td>Há orientação sobre as normativas para entrada de pessoas externas (fornecedores) no depósito?
                                            <asp:TextBox
                                                ID="txt4_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_1_Sim" runat="server" GroupName="grupo4_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_1_Nao" runat="server" GroupName="grupo4_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_1_NA" runat="server" GroupName="grupo4_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1--%>
                                        <tr>
                                            <td align="center">4.2</td>
                                            <td>Os corredores estão limpos e desobstruídos?Há mercadorias caídas atrás dos racks e/ou debaixo dos pallets?
                                            <asp:TextBox
                                                ID="txt4_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_2_Sim" runat="server" GroupName="grupo4_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_2_Nao" runat="server" GroupName="grupo4_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_2_NA" runat="server" GroupName="grupo4_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.2--%>
                                        <tr>
                                            <td align="center">4.3</td>
                                            <td>Os produtos estão armazenados em caixas fechadas no interior do depósito?
                                            <asp:TextBox
                                                ID="txt4_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_3_Sim" runat="server" GroupName="grupo4_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_3_Nao" runat="server" GroupName="grupo4_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_3_NA" runat="server" GroupName="grupo4_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.3--%>
                                        <tr>
                                            <td align="center">4.4</td>
                                            <td>As áreas segregadas estão adequadas no depósito de modo que os produtos permaneçam confinados (estrutura, cadeados, chaves e duplo controle de chaves)?
                                            <asp:TextBox
                                                ID="txt4_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_4_Sim" runat="server" GroupName="grupo4_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_4_Nao" runat="server" GroupName="grupo4_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_4_NA" runat="server" GroupName="grupo4_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.4--%>
                                        <tr>
                                            <td align="center">4.5</td>
                                            <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados?
                                            <asp:TextBox
                                                ID="txt4_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_5_Sim" runat="server" GroupName="grupo4_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_5_Nao" runat="server" GroupName="grupo4_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_5_NA" runat="server" GroupName="grupo4_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.5--%>
                                        <tr>
                                            <td align="center">4.6</td>
                                            <td>Todos os PARs estão sendo etiquetados (alarmados) ainda na área segregada? (antes de irem para o chão de loja?)
                                            <asp:TextBox
                                                ID="txt4_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_6_Sim" runat="server" GroupName="grupo4_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_6_Nao" runat="server" GroupName="grupo4_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_6_NA" runat="server" GroupName="grupo4_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.6--%>
                                        <tr>
                                            <td align="center">4.7</td>
                                            <td>O limite máximo de empilhamento é respeitado de modo a não existir risco de desabamento nem de ficar próximos a fiação elétrica?
                                            <asp:TextBox
                                                ID="txt4_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_7_Sim" runat="server" GroupName="grupo4_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_7_Nao" runat="server" GroupName="grupo4_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_7_NA" runat="server" GroupName="grupo4_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.7--%>
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
                        <%--4 - Deposito Textil--%>

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
                                                    <h2><b>Depósito - Eletro</b></h2>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tr>
                                            <td align="center">5.1</td>
                                            <td>Há orientação sobre as normativas para entrada de pessoas externas (fornecedores) no depósito?
                                            <asp:TextBox
                                                ID="txt5_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_1_Sim" runat="server" GroupName="grupo5_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_1_Nao" runat="server" GroupName="grupo5_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_1_NA" runat="server" GroupName="grupo5_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1--%>
                                        <tr>
                                            <td align="center">5.2</td>
                                            <td>Os corredores estão limpos e desobstruídos?Há mercadorias caídas atrás dos racks e/ou debaixo dos pallets?
                                            <asp:TextBox
                                                ID="txt5_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_2_Sim" runat="server" GroupName="grupo5_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_2_Nao" runat="server" GroupName="grupo5_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_2_NA" runat="server" GroupName="grupo5_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.2--%>
                                        <tr>
                                            <td align="center">5.3</td>
                                            <td>Todos os produtos estão armazenados dentro da caixa original, sem ser encontrados itens soltos? As mercadorias estão armazenadas de forma segura?"
                                            <asp:TextBox
                                                ID="txt5_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_3_Sim" runat="server" GroupName="grupo5_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_3_Nao" runat="server" GroupName="grupo5_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_3_NA" runat="server" GroupName="grupo5_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.3--%>
                                        <tr>
                                            <td align="center">5.4</td>
                                            <td>As áreas segregadas estão adequadas no depósito de modo que os produtos permaneçam confinados (estrutura, cadeados, chaves e duplo controle de chaves)?
                                            <asp:TextBox
                                                ID="txt5_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_4_Sim" runat="server" GroupName="grupo5_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_4_Nao" runat="server" GroupName="grupo5_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_4_NA" runat="server" GroupName="grupo5_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.4--%>
                                        <tr>
                                            <td align="center">5.5</td>
                                            <td>Existe o controle de chaves do confinado de Celulares, Tablets, Notebooks e afins?
                                            <asp:TextBox
                                                ID="txt5_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_5_Sim" runat="server" GroupName="grupo5_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_5_Nao" runat="server" GroupName="grupo5_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_5_NA" runat="server" GroupName="grupo5_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.5--%>
                                        <tr>
                                            <td align="center">5.6</td>
                                            <td>As áreas de avarias ou sucata estão limpas, organizadas e sinalizadas?
                                            <asp:TextBox
                                                ID="txt5_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_6_Sim" runat="server" GroupName="grupo5_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_6_Nao" runat="server" GroupName="grupo5_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_6_NA" runat="server" GroupName="grupo5_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.6--%>
                                        <tr>
                                            <td align="center">5.7</td>
                                            <td>A área destinada para Assistência Técnica está limpa, organizada e sinalizada? Os produtos estão relacionados em planilha específica?
                                            <asp:TextBox
                                                ID="txt5_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_7_Sim" runat="server" GroupName="grupo5_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_7_Nao" runat="server" GroupName="grupo5_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_7_NA" runat="server" GroupName="grupo5_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.7--%>
                                        <tr>
                                            <td align="center">5.8</td>
                                            <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados?
                                            <asp:TextBox
                                                ID="txt5_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_8_Sim" runat="server" GroupName="grupo5_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_8_Nao" runat="server" GroupName="grupo5_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_8_NA" runat="server" GroupName="grupo5_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.8--%>
                                        <tr>
                                            <td align="center">5.9</td>
                                            <td>Todos os PAR estão sendo etiquetados (alarmados) ainda na área segregada? (antes de irem para o chão de loja?)
                                            <asp:TextBox
                                                ID="txt5_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_9_Sim" runat="server" GroupName="grupo5_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_9_Nao" runat="server" GroupName="grupo5_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_9_NA" runat="server" GroupName="grupo5_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_9" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.9--%>
                                        <tr>
                                            <td align="center">5.10</td>
                                            <td>O limite máximo de empilhamento é respeitado de modo a não existir risco de desabamento nem de ficar próximos a fiação elétrica?
                                                <asp:TextBox
                                                    ID="txt5_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_10_Sim" runat="server" GroupName="grupo5_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_10_Nao" runat="server" GroupName="grupo5_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_10_NA" runat="server" GroupName="grupo5_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.10--%>
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
                        <%--5 - Deposito Eletro--%>

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
                                                    <h2><b>Câmara de Congelados / Corredor Perecíveis</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">6.1</td>
                                            <td>O local de armazenamento está limpo e organizado, sem odores que caracterizem produtos impróprios para venda?
                                            <asp:TextBox
                                                ID="txt6_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_1_Sim" runat="server" GroupName="grupo6_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_1_Nao" runat="server" GroupName="grupo6_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_1_NA" runat="server" GroupName="grupo6_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.1--%>
                                        <tr>
                                            <td align="center">6.2</td>
                                            <td>Todos os produtos auditados encontram-se dentro do prazo de validade?
                                            <asp:TextBox
                                                ID="txt6_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_2_Sim" runat="server" GroupName="grupo6_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_2_Nao" runat="server" GroupName="grupo6_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_2_NA" runat="server" GroupName="grupo6_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.2--%>
                                        <tr>
                                            <td align="center">6.3</td>
                                            <td>O local de armazenamento está em perfeitas condições de manutenção para o uso?
                                            <asp:TextBox
                                                ID="txt6_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_3_Sim" runat="server" GroupName="grupo6_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_3_Nao" runat="server" GroupName="grupo6_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_3_NA" runat="server" GroupName="grupo6_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.3--%>
                                        <tr>
                                            <td align="center">6.4</td>
                                            <td>As mercadorias estão organizadas de forma que o empilhamento não representa risco de desabamento nem de ficar próximos a fiação elétrica?
                                            <asp:TextBox
                                                ID="txt6_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_4_Sim" runat="server" GroupName="grupo6_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_4_Nao" runat="server" GroupName="grupo6_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_4_NA" runat="server" GroupName="grupo6_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.4--%>
                                        <tr>
                                            <td align="center">6.5</td>
                                            <td>As edificações estão limpas e íntegras? Os ralos, luminárias e portas de acesso são mantidos limpos e em bom estado de conservação? (bolor, água estagnada, mau cheiro, acesso a pragas e vetores, infiltrações ou danos estruturais)
                                            <asp:TextBox
                                                ID="txt6_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_5_Sim" runat="server" GroupName="grupo6_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_5_Nao" runat="server" GroupName="grupo6_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_5_NA" runat="server" GroupName="grupo6_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.5--%>
                                        <tr>
                                            <td align="center">6.6</td>
                                            <td>Os corredores de perecíveis e áreas de trânsito estão livres para circulação? (sem pallets, carrinhos e outros objetos)
                                            <asp:TextBox
                                                ID="txt6_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_6_Sim" runat="server" GroupName="grupo6_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_6_Nao" runat="server" GroupName="grupo6_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_6_NA" runat="server" GroupName="grupo6_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.6--%>
                                        <tr>
                                            <td align="center">6.7</td>
                                            <td>O tanque da sala de higienização de caixas está limpo? Os produtos, equipamentos e utensílios de limpeza são adequados e estão em bom estado de conservação? A sala de higiene de caixas está sendo utilizada para o fim que se destina?
                                            <asp:TextBox
                                                ID="txt6_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_7_Sim" runat="server" GroupName="grupo6_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_7_Nao" runat="server" GroupName="grupo6_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_7_NA" runat="server" GroupName="grupo6_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.7--%>
                                        <tr>
                                            <td align="center">6.8</td>
                                            <td>As estantes e os pallets do depósito de embalagens estão limpos e íntegros? O mesmo está organizado, sem fardos abertos e embalagens soltas pelo setor?
                                            <asp:TextBox
                                                ID="txt6_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_8_Sim" runat="server" GroupName="grupo6_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_8_Nao" runat="server" GroupName="grupo6_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_8_NA" runat="server" GroupName="grupo6_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.8--%>
                                        <tr>
                                            <td align="center">6.9</td>
                                            <td>Os equipamentos de produtos de Limpeza (sala de Higienização estão integros e em bom estado de conservação (Bombas Pressurizadoras, Mangueiras, etc)
                                            <asp:TextBox
                                                ID="txt6_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_9_Sim" runat="server" GroupName="grupo6_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_9_Nao" runat="server" GroupName="grupo6_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_9_NA" runat="server" GroupName="grupo6_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_9" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.9--%>



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
                        <%--6 - Corredor Perecíveis (Armazenamento)--%>

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
                                                    <h2><b>Hortifruti (Armazenamento)</b></h2>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tr>
                                            <td align="center">7.1</td>
                                            <td>A câmara e/ou local de armazenamento está limpo e organizado, sem odores que caracterizem produtos impróprios para venda?
                                            <asp:TextBox
                                                ID="txt7_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_1_Sim" runat="server" GroupName="grupo7_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_1_Nao" runat="server" GroupName="grupo7_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_1_NA" runat="server" GroupName="grupo7_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1--%>
                                        <tr>
                                            <td align="center">7.2</td>
                                            <td>A câmara e/ou local de armazenamento está em perfeitas condições de manutenção para o uso?
                                            <asp:TextBox
                                                ID="txt7_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_2_Sim" runat="server" GroupName="grupo7_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_2_Nao" runat="server" GroupName="grupo7_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_2_NA" runat="server" GroupName="grupo7_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.2--%>
                                        <tr>
                                            <td align="center">7.3</td>
                                            <td>A planilha de higienização está  sendo preenchida na frequência correta? E a identificação de rastreabilidade está sendo mantida nas caixas originais?
                                            <asp:TextBox
                                                ID="txt7_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_3_Sim" runat="server" GroupName="grupo7_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_3_Nao" runat="server" GroupName="grupo7_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_3_NA" runat="server" GroupName="grupo7_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.3--%>
                                        <tr>
                                            <td align="center">7.4</td>
                                            <td>As papeleiras, saboneteiras, pias de higienização e lixeiras estão limpas, íntegras e corretamente abastecidas?
                                            <asp:TextBox
                                                ID="txt7_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_4_Sim" runat="server" GroupName="grupo7_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_4_Nao" runat="server" GroupName="grupo7_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_4_NA" runat="server" GroupName="grupo7_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.4--%>
                                        <tr>
                                            <td align="center">7.5</td>
                                            <td>Dentro da sala de armazenamento, as caixas são empilhadas de forma correta e segura (sem oferecer riscos as mercadorias e ao ambiente?)
                                            <asp:TextBox
                                                ID="txt7_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_5_Sim" runat="server" GroupName="grupo7_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_5_Nao" runat="server" GroupName="grupo7_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_5_NA" runat="server" GroupName="grupo7_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.5--%>
                                        <tr>
                                            <td align="center">7.6</td>
                                            <td>O PVPS é cumprido corretamente? (Observar o grau de maturação dos produtos. Mais verde embaixo, mais maduro em cima)
                                            <asp:TextBox
                                                ID="txt7_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_6_Sim" runat="server" GroupName="grupo7_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_6_Nao" runat="server" GroupName="grupo7_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_6_NA" runat="server" GroupName="grupo7_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.6--%>
                                        <tr>
                                            <td align="center">7.7</td>
                                            <td>As quebras conhecidas do setor são descartadas diariamente, evitando a maturação de outros produtos?
                                            <asp:TextBox
                                                ID="txt7_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_7_Sim" runat="server" GroupName="grupo7_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_7_Nao" runat="server" GroupName="grupo7_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_7_NA" runat="server" GroupName="grupo7_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.7--%>
                                        <tr>
                                            <td align="center">7.8</td>
                                            <td>Os produtos impróprios para consumo estão armazenados na área identificada e sinalizada? A área está limpa e organizada?
                                            <asp:TextBox
                                                ID="txt7_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_8_Sim" runat="server" GroupName="grupo7_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_8_Nao" runat="server" GroupName="grupo7_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_8_NA" runat="server" GroupName="grupo7_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.8--%>
                                        <tr>
                                            <td align="center">7.9</td>
                                            <td>Está sendo realizado o repasse das mercadorias impróprias de forma adequada? Todos ao produtos (ovos e produtos embalados) estão dentro da validade?
                                            <asp:TextBox
                                                ID="txt7_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_9_Sim" runat="server" GroupName="grupo7_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_9_Nao" runat="server" GroupName="grupo7_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_9_NA" runat="server" GroupName="grupo7_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_9" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.9--%>
                                        <tr>
                                            <td align="center">7.10</td>
                                            <td>O acesso de pessoas ao local de armazenamento é feito com o uso dos EPI´s obrigatórios?
                                            <asp:TextBox
                                                ID="txt7_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_10_Sim" runat="server" GroupName="grupo7_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_10_Nao" runat="server" GroupName="grupo7_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_10_NA" runat="server" GroupName="grupo7_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_10" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.10--%>

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
                        <%--7 - Hortifruti (Armazenamento)--%>

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
                                                    <h2><b>Açougue </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">8.1</td>
                                            <td>A câmara/ laboratório está limpa e organizada e em perfeitas condições de manutenção?
                                            <asp:TextBox
                                                ID="txt8_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_1_Sim" runat="server" GroupName="grupo8_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_1_Nao" runat="server" GroupName="grupo8_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_1_NA" runat="server" GroupName="grupo8_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1--%>
                                        <tr>
                                            <td align="center">8.2</td>
                                            <td>Os equipamentos de produtos de Limpeza estão íntegros e em bom estado de conservação (Bombas Pressurizadoras, Mangueiras, etc.)
                                            <asp:TextBox
                                                ID="txt8_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_2_Sim" runat="server" GroupName="grupo8_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_2_Nao" runat="server" GroupName="grupo8_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_2_NA" runat="server" GroupName="grupo8_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.2--%>
                                        <tr>
                                            <td align="center">8.3</td>
                                            <td>Todos os produtos encontram-se armazenados de forma que não estejam em contato direto com o chão ou dentro de carrinhos?
                                            <asp:TextBox
                                                ID="txt8_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_3_Sim" runat="server" GroupName="grupo8_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_3_Nao" runat="server" GroupName="grupo8_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_3_NA" runat="server" GroupName="grupo8_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.3--%>
                                        <tr>
                                            <td align="center">8.4</td>
                                            <td>O armazenamento de produtos está separado entre carne bovina, suina e de aves? (evitando a contaminação cruzada)
                                            <asp:TextBox
                                                ID="txt8_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_4_Sim" runat="server" GroupName="grupo8_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_4_Nao" runat="server" GroupName="grupo8_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_4_NA" runat="server" GroupName="grupo8_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.4--%>
                                        <tr>
                                            <td align="center">8.5</td>
                                            <td>O PVPS é cumprido corretamente?
                                            <asp:TextBox
                                                ID="txt8_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_5_Sim" runat="server" GroupName="grupo8_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_5_Nao" runat="server" GroupName="grupo8_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_5_NA" runat="server" GroupName="grupo8_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.5--%>
                                        <tr>
                                            <td align="center">8.6</td>
                                            <td>Os produtos vindos do Recebimento são armazenados imediatamente dentro da câmara?
                                            <asp:TextBox
                                                ID="txt8_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_6_Sim" runat="server" GroupName="grupo8_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_6_Nao" runat="server" GroupName="grupo8_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_6_NA" runat="server" GroupName="grupo8_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.6--%>
                                        <tr>
                                            <td align="center">8.7</td>
                                            <td>As quebras conhecidas são lançadas e descartadas diariamente? Os produtos de trocas são encaminhados diariamente para o local adequado?
                                            <asp:TextBox
                                                ID="txt8_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_7_Sim" runat="server" GroupName="grupo8_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_7_Nao" runat="server" GroupName="grupo8_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_7_NA" runat="server" GroupName="grupo8_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.7--%>
                                        <tr>
                                            <td align="center">8.8</td>
                                            <td>Os descartes de sebo e osso são acompanhados pelo Fiscal de Loja? Se encontrado produtos de Ag. 23, estão relacionados?
                                            <asp:TextBox
                                                ID="txt8_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_8_Sim" runat="server" GroupName="grupo8_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_8_Nao" runat="server" GroupName="grupo8_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_8_NA" runat="server" GroupName="grupo8_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.8--%>
                                        <tr>
                                            <td align="center">8.9</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade?
                                            <asp:TextBox
                                                ID="txt8_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_9_Sim" runat="server" GroupName="grupo8_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_9_Nao" runat="server" GroupName="grupo8_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_9_NA" runat="server" GroupName="grupo8_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_9" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.9--%>
                                        <tr>
                                            <td align="center">8.10</td>
                                            <td>Toda a produção armazenada nas câmaras possui etiqueta de identificação e validade?
                                            <asp:TextBox
                                                ID="txt8_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_10_Sim" runat="server" GroupName="grupo8_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_10_Nao" runat="server" GroupName="grupo8_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_10_NA" runat="server" GroupName="grupo8_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_10" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.10--%>
                                        <tr>
                                            <td align="center">8.11</td>
                                            <td>O acesso de pessoas às câmaras é feito com o uso dos EPI´s obrigatórios?
                                            <asp:TextBox
                                                ID="txt8_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_11_Sim" runat="server" GroupName="grupo8_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_11_Nao" runat="server" GroupName="grupo8_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_11_NA" runat="server" GroupName="grupo8_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_11" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.11--%>
                                        <tr>
                                            <td align="center">8.12</td>
                                            <td>Os funcionários do setor fazem uso de toucas, uniformes limpos e sem adornos, esmaltes, maquiagem, perfume, barba etc.?
                                            <asp:TextBox
                                                ID="txt8_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_12_Sim" runat="server" GroupName="grupo8_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_12_Nao" runat="server" GroupName="grupo8_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_12_NA" runat="server" GroupName="grupo8_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_12" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.12--%>
                                        <tr>
                                            <td align="center">8.13</td>
                                            <td>A planilha de higienização  e rastreabilidade do setor está sendo preenchida corretamente e na frequência adequada?
                                            <asp:TextBox
                                                ID="txt8_13" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_13_Sim" runat="server" GroupName="grupo8_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_13_Nao" runat="server" GroupName="grupo8_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_13_NA" runat="server" GroupName="grupo8_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_13" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.13--%>
                                        <tr>
                                            <td align="center">8.14</td>
                                            <td>As papeleiras, saboneteiras, pias de higienização e lixeiras estão limpas, íntegras e corretamente abastecidas?
                                            <asp:TextBox
                                                ID="txt8_14" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_14_Sim" runat="server" GroupName="grupo8_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_14_Nao" runat="server" GroupName="grupo8_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_14_NA" runat="server" GroupName="grupo8_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_14" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.14--%>
                                        <tr>
                                            <td align="center">8.15</td>
                                            <td>O local de manipulação (mesas) e os utensílios utilizados (facas, chairas e tábuas) estão limpos e íntegros? Os utensílios estão armazenados em local adequado?
                                            <asp:TextBox
                                                ID="txt8_15" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_15_Sim" runat="server" GroupName="grupo8_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_15_Nao" runat="server" GroupName="grupo8_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_15_NA" runat="server" GroupName="grupo8_15" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_15" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_15" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.15--%>
                                        <tr>
                                            <td align="center">8.16</td>
                                            <td>Os equipamentos (moedor, serra-fita, balcões)  esta sendo bem higienizados, com frequência adequada e de forma a retirar completamente os resíduos (sem sujidades antigas)? O moedor, quando não está em uso, está com as aberturas protegidas?
                                            <asp:TextBox
                                                ID="txt8_16" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_16_Sim" runat="server" GroupName="grupo8_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_16_Nao" runat="server" GroupName="grupo8_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_16_NA" runat="server" GroupName="grupo8_16" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_16" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_16" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.16--%>
                                        <tr>
                                            <td align="center">8.17</td>
                                            <td>O local de armazenamento de embalagens é mantido limpo, com as portas fechadas, sem embalagens sujas ou objetos estranhos?
                                            <asp:TextBox
                                                ID="txt8_17" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_17_Sim" runat="server" GroupName="grupo8_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_17_Nao" runat="server" GroupName="grupo8_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_17_NA" runat="server" GroupName="grupo8_17" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_17" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_17" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.17--%>
                                        <tr>
                                            <td align="center">8.18</td>
                                            <td>Os absorventes de carne estão armazenados em local limpo e protegido, exclusivo para esta finalidade?
                                            <asp:TextBox
                                                ID="txt8_18" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_18_Sim" runat="server" GroupName="grupo8_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_18_Nao" runat="server" GroupName="grupo8_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_18_NA" runat="server" GroupName="grupo8_18" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_18" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_18" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.18--%>
                                        <tr>
                                            <td align="center">8.19</td>
                                            <td>Não há presença de caixas de papelão ou fardos de embalagens sobre as bancadas de manipulação ou em contato direto com os alimentos?
                                            <asp:TextBox
                                                ID="txt8_19" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_19_Sim" runat="server" GroupName="grupo8_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_19_Nao" runat="server" GroupName="grupo8_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_19_NA" runat="server" GroupName="grupo8_19" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_19" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_19" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_19" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.19--%>
                                        <tr>
                                            <td align="center">8.20</td>
                                            <td>O transporte e o armazenamento dos alimentos é realizado de forma adequada (carrinhos ou cubas exclusivos do setor; armazenamento em caixas limpas, uso de caixas brancas não vazadas para alimentos em processo de manipulação)?
                                            <asp:TextBox
                                                ID="txt8_20" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_20_Sim" runat="server" GroupName="grupo8_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_20_Nao" runat="server" GroupName="grupo8_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_20_NA" runat="server" GroupName="grupo8_20" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_20" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_20" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_20" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.20--%>
                                        <tr>
                                            <td align="center">8.21</td>
                                            <td>A troca de preço está sendo feita de maneira adequada, utilizando data retroativa (quando necessário) conforme procedimento?
                                            <asp:TextBox
                                                ID="txt8_21" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_21_Sim" runat="server" GroupName="grupo8_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_21_Nao" runat="server" GroupName="grupo8_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_21_NA" runat="server" GroupName="grupo8_21" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_21" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_21" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_21" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.21--%>
                                        <tr>
                                            <td align="center">8.22</td>
                                            <td>A produção estocada na câmara foi manipulada no dia ou no máximo no dia anterior?
                                            <asp:TextBox
                                                ID="txt8_22" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_22_Sim" runat="server" GroupName="grupo8_22" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_22_Nao" runat="server" GroupName="grupo8_22" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_22_NA" runat="server" GroupName="grupo8_22" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_22" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_22" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_22" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.22--%>
                                        <tr>
                                            <td align="center">8.23</td>
                                            <td>A carne moída é feita com cortes dentro da validade e com qualidade satisfatória (cor e odor), não havendo reprocessamento da mesma após tempo de exposição?
                                            <asp:TextBox
                                                ID="txt8_23" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_23_Sim" runat="server" GroupName="grupo8_23" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_23_Nao" runat="server" GroupName="grupo8_23" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_23_NA" runat="server" GroupName="grupo8_23" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_23" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_23" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_23" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.23--%>
                                        <tr>
                                            <td align="center">8.24</td>
                                            <td>O tempo mínimo de exposição para produtos perecíveis que estão fora da câmara (máximo 1 hora) esta sendo respeitado?
                                            <asp:TextBox
                                                ID="txt8_24" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_24_Sim" runat="server" GroupName="grupo8_24" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_24_Nao" runat="server" GroupName="grupo8_24" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_24_NA" runat="server" GroupName="grupo8_24" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_24" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_24" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_24" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.24--%>

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
                        <%--8 - Açougue--%>

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
                                                    <h2><b>Fiambreria </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">9.1</td>
                                            <td>A câmara/ laboratório está limpa e organizada e em perfeitas condições de manutenção?
                                            <asp:TextBox
                                                ID="txt9_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_1_Sim" runat="server" GroupName="grupo9_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_1_Nao" runat="server" GroupName="grupo9_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_1_NA" runat="server" GroupName="grupo9_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1--%>
                                        <tr>
                                            <td align="center">9.2</td>
                                            <td>Os equipamentos de produtos de Limpeza estão íntegros e em bom estado de conservação (Bombas Pressurizadoras, Mangueiras, etc.)
                                            <asp:TextBox
                                                ID="txt9_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_2_Sim" runat="server" GroupName="grupo9_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_2_Nao" runat="server" GroupName="grupo9_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_2_NA" runat="server" GroupName="grupo9_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.2--%>
                                        <tr>
                                            <td align="center">9.3</td>
                                            <td>As papeleiras, saboneteiras, pia de higienização e lixeiras estão limpas, íntegras e corretamente abastecidas?
                                            <asp:TextBox
                                                ID="txt9_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_3_Sim" runat="server" GroupName="grupo9_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_3_Nao" runat="server" GroupName="grupo9_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_3_NA" runat="server" GroupName="grupo9_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.3--%>
                                        <tr>
                                            <td align="center">9.4</td>
                                            <td>O limite máximo de empilhamento é respeitado de modo a não existir risco de desabamento nem de ficar próximos a fiação elétrica?
                                            <asp:TextBox
                                                ID="txt9_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_4_Sim" runat="server" GroupName="grupo9_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_4_Nao" runat="server" GroupName="grupo9_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_4_NA" runat="server" GroupName="grupo9_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.4--%>
                                        <tr>
                                            <td align="center">9.5</td>
                                            <td>O PVPS é cumprido corretamente?
                                            <asp:TextBox
                                                ID="txt9_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_5_Sim" runat="server" GroupName="grupo9_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_5_Nao" runat="server" GroupName="grupo9_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_5_NA" runat="server" GroupName="grupo9_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.5--%>
                                        <tr>
                                            <td align="center">9.6</td>
                                            <td>Os produtos vindos do Recebimento são armazenados imediatamente dentro da câmara?
                                            <asp:TextBox
                                                ID="txt9_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_6_Sim" runat="server" GroupName="grupo9_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_6_Nao" runat="server" GroupName="grupo9_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_6_NA" runat="server" GroupName="grupo9_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.6--%>
                                        <tr>
                                            <td align="center">9.7</td>
                                            <td>As quebras conhecidas são lançadas e descartadas diariamente? Os produtos de trocas são encaminhados diariamente para o local adequado?
                                            <asp:TextBox
                                                ID="txt9_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_7_Sim" runat="server" GroupName="grupo9_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_7_Nao" runat="server" GroupName="grupo9_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_7_NA" runat="server" GroupName="grupo9_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.7--%>
                                        <tr>
                                            <td align="center">9.8</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade?
                                            <asp:TextBox
                                                ID="txt9_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_8_Sim" runat="server" GroupName="grupo9_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_8_Nao" runat="server" GroupName="grupo9_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_8_NA" runat="server" GroupName="grupo9_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.8--%>
                                        <tr>
                                            <td align="center">9.9</td>
                                            <td>Toda a produção armazenada nas câmaras possui etiqueta de identificação e validade?
                                            <asp:TextBox
                                                ID="txt9_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_9_Sim" runat="server" GroupName="grupo9_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_9_Nao" runat="server" GroupName="grupo9_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_9_NA" runat="server" GroupName="grupo9_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_9" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.9--%>
                                        <tr>
                                            <td align="center">9.10</td>
                                            <td>O acesso de pessoas as câmaras é feito com o uso dos EPI´s obrigatórios?
                                            <asp:TextBox
                                                ID="txt9_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_10_Sim" runat="server" GroupName="grupo9_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_10_Nao" runat="server" GroupName="grupo9_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_10_NA" runat="server" GroupName="grupo9_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_10" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.10--%>
                                        <tr>
                                            <td align="center">9.11</td>
                                            <td>Os funcionários do setor fazem uso de toucas, uniformes limpos e sem adornos, esmaltes, maquiagem, perfume, barba etc.?
                                            <asp:TextBox
                                                ID="txt9_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_11_Sim" runat="server" GroupName="grupo9_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_11_Nao" runat="server" GroupName="grupo9_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_11_NA" runat="server" GroupName="grupo9_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_11" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.11--%>
                                        <tr>
                                            <td align="center">9.12</td>
                                            <td>A planilha de higienização e rastreabilidade do setor está sendo preenchida corretamente e na frequência adequada?
                                            <asp:TextBox
                                                ID="txt9_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_12_Sim" runat="server" GroupName="grupo9_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_12_Nao" runat="server" GroupName="grupo9_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_12_NA" runat="server" GroupName="grupo9_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_12" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.12--%>
                                        <tr>
                                            <td align="center">9.13</td>
                                            <td>O local de manipulação (mesas) e os utensílios utilizados estão limpos e íntegros? Os utensílios estão armazenados em local adequado?
                                            <asp:TextBox
                                                ID="txt9_13" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_13_Sim" runat="server" GroupName="grupo9_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_13_Nao" runat="server" GroupName="grupo9_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_13_NA" runat="server" GroupName="grupo9_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_13" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.13--%>
                                        <tr>
                                            <td align="center">9.14</td>
                                            <td>Os equipamentos (fatiadoras, floculadora, máquina de vácuo) estão sendo bem higienizados, com frequência adequada e de forma a retirar completamente os resíduos (sem sujidades antigas)?
                                            <asp:TextBox
                                                ID="txt9_14" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_14_Sim" runat="server" GroupName="grupo9_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_14_Nao" runat="server" GroupName="grupo9_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_14_NA" runat="server" GroupName="grupo9_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_14" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.14--%>
                                        <tr>
                                            <td align="center">9.15</td>
                                            <td>As fatiadoras estão sendo utilizadas de forma a evitar a contaminação entre produtos de origens diferentes (com resíduos de queijos e vermelhos)?
                                            <asp:TextBox
                                                ID="txt9_15" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_15_Sim" runat="server" GroupName="grupo9_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_15_Nao" runat="server" GroupName="grupo9_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_15_NA" runat="server" GroupName="grupo9_15" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_15" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_15" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.15--%>
                                        <tr>
                                            <td align="center">9.16</td>
                                            <td>O local de armazenamento de embalagens é mantido limpo, com as portas fechadas, sem embalagens sujas ou objetos estranhos?
                                            <asp:TextBox
                                                ID="txt9_16" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_16_Sim" runat="server" GroupName="grupo9_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_16_Nao" runat="server" GroupName="grupo9_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_16_NA" runat="server" GroupName="grupo9_16" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_16" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_16" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.16--%>
                                        <tr>
                                            <td align="center">9.17</td>
                                            <td>Não há presença de caixas de papelão ou fardos de embalagens sobre as bancadas de manipulação ou em contato direto com os alimentos?
                                            <asp:TextBox
                                                ID="txt9_17" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_17_Sim" runat="server" GroupName="grupo9_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_17_Nao" runat="server" GroupName="grupo9_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_17_NA" runat="server" GroupName="grupo9_17" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_17" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_17" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.17--%>
                                        <tr>
                                            <td align="center">9.18</td>
                                            <td>O transporte e o armazenamento dos alimentos é realizado de forma adequada (carrinhos ou cubas exclusivos do setor; armazenamento em caixas brancas limpas)?
                                            <asp:TextBox
                                                ID="txt9_18" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_18_Sim" runat="server" GroupName="grupo9_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_18_Nao" runat="server" GroupName="grupo9_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_18_NA" runat="server" GroupName="grupo9_18" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_18" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_18" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.18--%>
                                        <tr>
                                            <td align="center">9.19</td>
                                            <td>A troca de preço está sendo feita de maneira adequada, utilizando data retroativa (quando necessário) conforme procedimento?
                                            <asp:TextBox
                                                ID="txt9_19" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_19_Sim" runat="server" GroupName="grupo9_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_19_Nao" runat="server" GroupName="grupo9_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_19_NA" runat="server" GroupName="grupo9_19" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_19" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_19" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_19" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.19--%>
                                        <tr>
                                            <td align="center">9.20</td>
                                            <td>A produção estocada na câmara foi manipulada no dia ou no máximo no dia anterior?
                                            <asp:TextBox
                                                ID="txt9_20" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_20_Sim" runat="server" GroupName="grupo9_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_20_Nao" runat="server" GroupName="grupo9_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_20_NA" runat="server" GroupName="grupo9_20" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_20" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_20" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_20" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.20--%>
                                        <tr>
                                            <td align="center">9.21</td>
                                            <td>O tempo mínimo de exposição para produtos perecíveis que estão fora da câmara (máximo 1 hora) está sendo respeitado ?
                                            <asp:TextBox
                                                ID="txt9_21" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_21_Sim" runat="server" GroupName="grupo9_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_21_Nao" runat="server" GroupName="grupo9_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_21_NA" runat="server" GroupName="grupo9_21" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_21" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_21" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_21" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.21--%>

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
                        <%--9 - Fiambreria--%>

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
                                                    <h2><b>O.P.L.S.</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">10.1</td>
                                            <td>A câmara está limpa e organizada e em perfeitas condições de manutenção?
                                            <asp:TextBox
                                                ID="txt10_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_1_Sim" runat="server" GroupName="grupo10_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_1_Nao" runat="server" GroupName="grupo10_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_1_NA" runat="server" GroupName="grupo10_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1--%>
                                        <tr>
                                            <td align="center">10.2</td>
                                            <td>O limite máximo de empilhamento é respeitado de modo a não existir risco de desabamento nem de ficar próximos a fiação elétrica?
                                            <asp:TextBox
                                                ID="txt10_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_2_Sim" runat="server" GroupName="grupo10_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_2_Nao" runat="server" GroupName="grupo10_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_2_NA" runat="server" GroupName="grupo10_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.2--%>
                                        <tr>
                                            <td align="center">10.3</td>
                                            <td>O PVPS é cumprido corretamente?
                                            <asp:TextBox
                                                ID="txt10_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_3_Sim" runat="server" GroupName="grupo10_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_3_Nao" runat="server" GroupName="grupo10_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_3_NA" runat="server" GroupName="grupo10_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.3--%>
                                        <tr>
                                            <td align="center">10.4</td>
                                            <td>Os produtos vindos do Recebimento são armazenados imediatamente dentro da câmara?
                                            <asp:TextBox
                                                ID="txt10_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_4_Sim" runat="server" GroupName="grupo10_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_4_Nao" runat="server" GroupName="grupo10_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_4_NA" runat="server" GroupName="grupo10_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.4--%>
                                        <tr>
                                            <td align="center">10.5</td>
                                            <td>As quebras conhecidas são lançadas e descartadas diariamente? Os produtos de trocas são encaminhados diariamente para o local adequado?
                                            <asp:TextBox
                                                ID="txt10_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_5_Sim" runat="server" GroupName="grupo10_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_5_Nao" runat="server" GroupName="grupo10_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_5_NA" runat="server" GroupName="grupo10_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.5--%>
                                        <tr>
                                            <td align="center">10.6</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade?
                                            <asp:TextBox
                                                ID="txt10_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_6_Sim" runat="server" GroupName="grupo10_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_6_Nao" runat="server" GroupName="grupo10_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_6_NA" runat="server" GroupName="grupo10_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.6--%>
                                        <tr>
                                            <td align="center">10.7</td>
                                            <td>Os funcionários do setor fazem uso de toucas, uniformes limpos e sem adornos, esmaltes, maquiagem, perfume, barba etc.?
                                            <asp:TextBox
                                                ID="txt10_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_7_Sim" runat="server" GroupName="grupo10_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_7_Nao" runat="server" GroupName="grupo10_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_7_NA" runat="server" GroupName="grupo10_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.7--%>
                                        <tr>
                                            <td align="center">10.8</td>
                                            <td>O acesso de pessoas as câmaras é feito com o uso dos EPI´s obrigatórios?
                                            <asp:TextBox
                                                ID="txt10_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_8_Sim" runat="server" GroupName="grupo10_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_8_Nao" runat="server" GroupName="grupo10_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_8_NA" runat="server" GroupName="grupo10_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
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
                        <%--10 - OPLS--%>

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
                                                    <h2><b>Padaria e Confeitaria</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">11.1</td>
                                            <td>A câmara/ laboratório está limpa e organizada e em perfeitas condições de manutenção?
                                            <asp:TextBox
                                                ID="txt11_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_1_Sim" runat="server" GroupName="grupo11_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_1_Nao" runat="server" GroupName="grupo11_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_1_NA" runat="server" GroupName="grupo11_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1--%>
                                        <tr>
                                            <td align="center">11.2</td>
                                            <td>O PVPS é cumprido corretamente?
                                            <asp:TextBox
                                                ID="txt11_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_2_Sim" runat="server" GroupName="grupo11_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_2_Nao" runat="server" GroupName="grupo11_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_2_NA" runat="server" GroupName="grupo11_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.2--%>
                                        <tr>
                                            <td align="center">11.3</td>
                                            <td>As papeleiras, saboneteiras e lixeiras estão limpas, íntegras e corretamente abastecidas?
                                            <asp:TextBox
                                                ID="txt11_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_3_Sim" runat="server" GroupName="grupo11_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_3_Nao" runat="server" GroupName="grupo11_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_3_NA" runat="server" GroupName="grupo11_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.3--%>
                                        <tr>
                                            <td align="center">11.4</td>
                                            <td>Os equipamentos de produtos de Limpeza estão íntegros e em bom estado de conservação (Bombas Pressurizadoras, Mangueiras, etc.)
                                            <asp:TextBox
                                                ID="txt11_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_4_Sim" runat="server" GroupName="grupo11_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_4_Nao" runat="server" GroupName="grupo11_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_4_NA" runat="server" GroupName="grupo11_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.4--%>
                                        <tr>
                                            <td align="center">11.5</td>
                                            <td>Os produtos vindos do Recebimento são armazenados imediatamente dentro da câmara?
                                            <asp:TextBox
                                                ID="txt11_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_5_Sim" runat="server" GroupName="grupo11_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_5_Nao" runat="server" GroupName="grupo11_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_5_NA" runat="server" GroupName="grupo11_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.5--%>
                                        <tr>
                                            <td align="center">11.6</td>
                                            <td>As quebras conhecidas são lançadas e descartadas diariamente? Os produtos de trocas são encaminhados diariamente para o local adequado?
                                            <asp:TextBox
                                                ID="txt11_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_6_Sim" runat="server" GroupName="grupo11_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_6_Nao" runat="server" GroupName="grupo11_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_6_NA" runat="server" GroupName="grupo11_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.6--%>
                                        <tr>
                                            <td align="center">11.7</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade?
                                            <asp:TextBox
                                                ID="txt11_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_7_Sim" runat="server" GroupName="grupo11_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_7_Nao" runat="server" GroupName="grupo11_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_7_NA" runat="server" GroupName="grupo11_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.7--%>
                                        <tr>
                                            <td align="center">11.8</td>
                                            <td>Toda a produção armazenada nas câmaras possui etiqueta de identificação e validade?
                                            <asp:TextBox
                                                ID="txt11_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_8_Sim" runat="server" GroupName="grupo11_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_8_Nao" runat="server" GroupName="grupo11_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_8_NA" runat="server" GroupName="grupo11_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.8--%>
                                        <tr>
                                            <td align="center">11.9</td>
                                            <td>O processo de descongelamento técnico é feito corretamente conforme orientação do Setor de Qualidade/ HSA?
                                            <asp:TextBox
                                                ID="txt11_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_9_Sim" runat="server" GroupName="grupo11_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_9_Nao" runat="server" GroupName="grupo11_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_9_NA" runat="server" GroupName="grupo11_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_9" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.9--%>
                                        <tr>
                                            <td align="center">11.10</td>
                                            <td>O acesso de pessoas as câmaras é feito com o uso dos EPI´s obrigatórios?
                                            <asp:TextBox
                                                ID="txt11_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_10_Sim" runat="server" GroupName="grupo11_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_10_Nao" runat="server" GroupName="grupo11_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_10_NA" runat="server" GroupName="grupo11_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_10" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.10--%>
                                        <tr>
                                            <td align="center">11.11</td>
                                            <td>Os funcionários do setor fazem uso de toucas, uniformes limpos e sem adornos, esmaltes, maquiagem, perfume, barba etc.?
                                            <asp:TextBox
                                                ID="txt11_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_11_Sim" runat="server" GroupName="grupo11_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_11_Nao" runat="server" GroupName="grupo11_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_11_NA" runat="server" GroupName="grupo11_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_11" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.11--%>
                                        <tr>
                                            <td align="center">11.12</td>
                                            <td>A planilha de higienização do setor está sendo preenchida corretamente e na frequência adequada?
                                            <asp:TextBox
                                                ID="txt11_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_12_Sim" runat="server" GroupName="grupo11_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_12_Nao" runat="server" GroupName="grupo11_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_12_NA" runat="server" GroupName="grupo11_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_12" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.12--%>
                                        <tr>
                                            <td align="center">11.13</td>
                                            <td>O local de manipulação (mesas) e os utensílios utilizados estão limpos e íntegros? Os utensílios estão armazenados em local adequado?
                                            <asp:TextBox
                                                ID="txt11_13" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_13_Sim" runat="server" GroupName="grupo11_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_13_Nao" runat="server" GroupName="grupo11_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_13_NA" runat="server" GroupName="grupo11_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_13" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.13--%>
                                        <tr>
                                            <td align="center">11.14</td>
                                            <td>Os equipamentos (coifa, masseiras, modeladora, divisora, cilindro, estufa, fornos, dosadora, moinho, fatiadora, batedeiras) estão sendo bem higienizados (sem sujidades antigas)?  O moedor quando não está em uso, está com as aberturas protegidas?
                                            <asp:TextBox
                                                ID="txt11_14" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_14_Sim" runat="server" GroupName="grupo11_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_14_Nao" runat="server" GroupName="grupo11_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_14_NA" runat="server" GroupName="grupo11_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_14" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.14--%>
                                        <tr>
                                            <td align="center">11.15</td>
                                            <td>O local de armazenamento de embalagens é mantido limpo, com as portas fechadas, sem embalagens sujas ou objetos estranhos?
                                            <asp:TextBox
                                                ID="txt11_15" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_15_Sim" runat="server" GroupName="grupo11_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_15_Nao" runat="server" GroupName="grupo11_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_15_NA" runat="server" GroupName="grupo11_15" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_15" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_15" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.15--%>
                                        <tr>
                                            <td align="center">11.16</td>
                                            <td>Não há presença de caixas de papelão ou fardos de embalagens sobre as bancadas de manipulação ou em contato direto com os alimentos?
                                            <asp:TextBox
                                                ID="txt11_16" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_16_Sim" runat="server" GroupName="grupo11_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_16_Nao" runat="server" GroupName="grupo11_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_16_NA" runat="server" GroupName="grupo11_16" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_16" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_16" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.16--%>
                                        <tr>
                                            <td align="center">11.17</td>
                                            <td>O transporte e o armazenamento dos alimentos é realizado de forma adequada (carrinhos ou cubas exclusivos do setor; armazenamento em caixas brancas/ carrinhos furgões limpos)?
                                            <asp:TextBox
                                                ID="txt11_17" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_17_Sim" runat="server" GroupName="grupo11_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_17_Nao" runat="server" GroupName="grupo11_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_17_NA" runat="server" GroupName="grupo11_17" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_17" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_17" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.17--%>
                                        <tr>
                                            <td align="center">11.18</td>
                                            <td>A troca de preço está sendo feita de maneira adequada, utilizando data retroativa (quando necessário) conforme procedimento?
                                            <asp:TextBox
                                                ID="txt11_18" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_18_Sim" runat="server" GroupName="grupo11_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_18_Nao" runat="server" GroupName="grupo11_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_18_NA" runat="server" GroupName="grupo11_18" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_18" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_18" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.18--%>
                                        <tr>
                                            <td align="center">11.19</td>
                                            <td>A produção estocada na câmara foi manipulada no dia ou no máximo no dia anterior?
                                            <asp:TextBox
                                                ID="txt11_19" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_19_Sim" runat="server" GroupName="grupo11_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_19_Nao" runat="server" GroupName="grupo11_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_19_NA" runat="server" GroupName="grupo11_19" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_19" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_19" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_19" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.19--%>
                                        <tr>
                                            <td align="center">11.20</td>
                                            <td>O tempo mínimo de exposição para produtos perecíveis que estão fora da câmara(máximo 1 hora) esta sendo respeitado?
                                            <asp:TextBox
                                                ID="txt11_20" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_20_Sim" runat="server" GroupName="grupo11_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_20_Nao" runat="server" GroupName="grupo11_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_20_NA" runat="server" GroupName="grupo11_20" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_20" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_20" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_20" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.20--%>
                                        <tr>
                                            <td align="center">11.21</td>
                                            <td>Os pães separados para a produção de farinha de rosca estão identificados para este fim e são selecionados (somente linha do pão francês)? O processo completo (torrar, moer, embalar e identificar individualmente) está ocorrendo em no máximo dois dias?
                                            <asp:TextBox
                                                ID="txt11_21" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_21_Sim" runat="server" GroupName="grupo11_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_21_Nao" runat="server" GroupName="grupo11_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_21_NA" runat="server" GroupName="grupo11_21" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_21" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_21" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_21" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.21--%>

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
                        <%--11 - Padaria e Confeitaria--%>

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
                                                    <h2><b>Cozinha / Rotisseria / Refeitorio</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">12.1</td>
                                            <td>A câmara/ laboratório está limpa e organizada e em perfeitas condições de manutenção?
                                            <asp:TextBox
                                                ID="txt12_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_1_Sim" runat="server" GroupName="grupo12_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_1_Nao" runat="server" GroupName="grupo12_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_1_NA" runat="server" GroupName="grupo12_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.1--%>
                                        <tr>
                                            <td align="center">12.2</td>
                                            <td>Os equipamentos de produtos de Limpeza estão íntegros e em bom estado de conservação (Bombas Pressurizadoras, Mangueiras, etc.)
                                            <asp:TextBox
                                                ID="txt12_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_2_Sim" runat="server" GroupName="grupo12_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_2_Nao" runat="server" GroupName="grupo12_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_2_NA" runat="server" GroupName="grupo12_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.2--%>
                                        <tr>
                                            <td align="center">12.3</td>
                                            <td>A geladeira está limpa e organizada de forma a evitar contaminação (produtos crus para baixo; prontos para cima)?
                                            <asp:TextBox
                                                ID="txt12_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_3_Sim" runat="server" GroupName="grupo12_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_3_Nao" runat="server" GroupName="grupo12_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_3_NA" runat="server" GroupName="grupo12_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.3--%>
                                        <tr>
                                            <td align="center">12.4</td>
                                            <td>A coleta de amostras de todas as refeições preparadas é realizada diariamente (100g de cada alimento)? São mantidas armazenadas por 3 dias?
                                            <asp:TextBox
                                                ID="txt12_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_4_Sim" runat="server" GroupName="grupo12_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_4_Nao" runat="server" GroupName="grupo12_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_4_NA" runat="server" GroupName="grupo12_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.4--%>
                                        <tr>
                                            <td align="center">12.5</td>
                                            <td>A planilha de higienização do setor está sendo preenchida corretamente e na frequência adequada?
                                            <asp:TextBox
                                                ID="txt12_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_5_Sim" runat="server" GroupName="grupo12_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_5_Nao" runat="server" GroupName="grupo12_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_5_NA" runat="server" GroupName="grupo12_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.5--%>
                                        <tr>
                                            <td align="center">12.6</td>
                                            <td>As papeleiras, saboneteiras e lixeiras estão limpas, íntegras e corretamente abastecidas?
                                            <asp:TextBox
                                                ID="txt12_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_6_Sim" runat="server" GroupName="grupo12_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_6_Nao" runat="server" GroupName="grupo12_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_6_NA" runat="server" GroupName="grupo12_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.6--%>
                                        <tr>
                                            <td align="center">12.7</td>
                                            <td>O local de manipulação (mesas) e os utensílios utilizados estão limpos e íntegros? Os utensílios estão armazenados em local adequado?
                                            <asp:TextBox
                                                ID="txt12_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_7_Sim" runat="server" GroupName="grupo12_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_7_Nao" runat="server" GroupName="grupo12_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_7_NA" runat="server" GroupName="grupo12_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.7--%>
                                        <tr>
                                            <td align="center">12.8</td>
                                            <td>Os equipamentos (coifa, multiprocessador, fogão, forno, fritadeira, liquidificador, suqueira, buffet) estão sendo bem higienizados, com frequência adequada e de forma a retirar completamente os resíduos (sem sujidades antigas)?
                                            <asp:TextBox
                                                ID="txt12_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_8_Sim" runat="server" GroupName="grupo12_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_8_Nao" runat="server" GroupName="grupo12_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_8_NA" runat="server" GroupName="grupo12_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.8--%>
                                        <tr>
                                            <td align="center">12.9</td>
                                            <td>O local de armazenamento de embalagens é mantido limpo, com as portas fechadas, sem embalagens sujas ou objetos estranhos?
                                            <asp:TextBox
                                                ID="txt12_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_9_Sim" runat="server" GroupName="grupo12_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_9_Nao" runat="server" GroupName="grupo12_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_9_NA" runat="server" GroupName="grupo12_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_9" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.9--%>
                                        <tr>
                                            <td align="center">12.10</td>
                                            <td>Não há presença de caixas de papelão ou fardos de embalagens sobre as bancadas de manipulação ou em contato direto com os alimentos?
                                            <asp:TextBox
                                                ID="txt12_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_10_Sim" runat="server" GroupName="grupo12_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_10_Nao" runat="server" GroupName="grupo12_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_10_NA" runat="server" GroupName="grupo12_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_10" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.10--%>
                                        <tr>
                                            <td align="center">12.11</td>
                                            <td>O transporte e o armazenamento dos alimentos é realizado de forma adequada (carrinhos ou cubas exclusivos do setor; armazenamento em caixas brancas limpas)?
                                            <asp:TextBox
                                                ID="txt12_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_11_Sim" runat="server" GroupName="grupo12_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_11_Nao" runat="server" GroupName="grupo12_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_11_NA" runat="server" GroupName="grupo12_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_11" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.11--%>
                                        <tr>
                                            <td align="center">12.12</td>
                                            <td>O tempo mínimo de exposição para produtos perecíveis e as preparações prontas que estão fora da câmara/ geladeira (máximo 1 hora) esta sendo respeitado?
                                            <asp:TextBox
                                                ID="txt12_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_12_Sim" runat="server" GroupName="grupo12_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_12_Nao" runat="server" GroupName="grupo12_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_12_NA" runat="server" GroupName="grupo12_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_12" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.12--%>
                                        <tr>
                                            <td align="center">12.13</td>
                                            <td>Está sendo realizado o controle de temperatura diário dos alimentos expostos no refeitório e no balcão da rotisseria? A planilha está sendo preenchida corretamente?
                                            <asp:TextBox
                                                ID="txt12_13" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_13_Sim" runat="server" GroupName="grupo12_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_13_Nao" runat="server" GroupName="grupo12_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_13_NA" runat="server" GroupName="grupo12_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_13" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.13--%>
                                        <tr>
                                            <td align="center">12.14</td>
                                            <td>A higienização das hortifrutícolas está sendo realizada de maneira correta (uso de SUMAVEG ou água sanitária)?
                                            <asp:TextBox
                                                ID="txt12_14" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_14_Sim" runat="server" GroupName="grupo12_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_14_Nao" runat="server" GroupName="grupo12_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_14_NA" runat="server" GroupName="grupo12_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_14" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.14--%>
                                        <tr>
                                            <td align="center">12.15</td>
                                            <td>A produção estocada na câmara foi manipulada no dia ou no máximo no dia anterior?
                                            <asp:TextBox
                                                ID="txt12_15" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_15_Sim" runat="server" GroupName="grupo12_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_15_Nao" runat="server" GroupName="grupo12_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_15_NA" runat="server" GroupName="grupo12_15" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_15" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_15" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.15--%>
                                        <tr>
                                            <td align="center">12.16</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade e após abertos estão corretamente identificados?
                                            <asp:TextBox
                                                ID="txt12_16" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_16_Sim" runat="server" GroupName="grupo12_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_16_Nao" runat="server" GroupName="grupo12_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_16_NA" runat="server" GroupName="grupo12_16" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_16" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_16" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.16--%>
                                        <tr>
                                            <td align="center">12.17</td>
                                            <td>Os funcionários do setor fazem uso de toucas, uniformes limpos e sem adornos, esmaltes, maquiagem, perfume, barba etc.?
                                            <asp:TextBox
                                                ID="txt12_17" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_17_Sim" runat="server" GroupName="grupo12_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_17_Nao" runat="server" GroupName="grupo12_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_17_NA" runat="server" GroupName="grupo12_17" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_17" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_17" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.17--%>
                                        <tr>
                                            <td align="center">12.18</td>
                                            <td>Os balcões da rotisseria estão sendo bem higienizados, com frequência adequada e de forma a retirar completamente os resíduos (sem sujidades antigas)?
                                            <asp:TextBox
                                                ID="txt12_18" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_18_Sim" runat="server" GroupName="grupo12_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_18_Nao" runat="server" GroupName="grupo12_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_18_NA" runat="server" GroupName="grupo12_18" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_18" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_18" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.18--%>

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
                        <%--12 - Cozinha / Rotisseria / Refeitorio--%>

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
                                                    <h2><b>Hortifruti - Area de Vendas</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">13.1</td>
                                            <td>A exposição dos produtos é feita de forma controlada (sem exposições excessivamente agressivas), de forma a não comprometer a qualidade dos produtos? Anote os produtos irregulares.
                                            <asp:TextBox
                                                ID="txt13_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_1_Sim" runat="server" GroupName="grupo13_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_1_Nao" runat="server" GroupName="grupo13_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_1_NA" runat="server" GroupName="grupo13_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.1--%>
                                        <tr>
                                            <td align="center">13.2</td>
                                            <td>O balcão de refrigeração encontra-se limpo e abastecido corretamente? (Sem obstruir a saída de ar refrigerado)
                                            <asp:TextBox
                                                ID="txt13_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_2_Sim" runat="server" GroupName="grupo13_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_2_Nao" runat="server" GroupName="grupo13_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_2_NA" runat="server" GroupName="grupo13_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.2--%>
                                        <tr>
                                            <td align="center">13.3</td>
                                            <td>A pia, papeleiras, saboneteiras e lixeiras estão limpas, íntegras e corretamente abastecidas?
                                            <asp:TextBox
                                                ID="txt13_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_3_Sim" runat="server" GroupName="grupo13_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_3_Nao" runat="server" GroupName="grupo13_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_3_NA" runat="server" GroupName="grupo13_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.3--%>
                                        <tr>
                                            <td align="center">13.4</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade? (Considerar granjeiros e fracionados).
                                            <asp:TextBox
                                                ID="txt13_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_4_Sim" runat="server" GroupName="grupo13_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_4_Nao" runat="server" GroupName="grupo13_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_4_NA" runat="server" GroupName="grupo13_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.4--%>
                                        <tr>
                                            <td align="center">13.5</td>
                                            <td>A qualidade dos produtos expostos está satisfatória? Ocorre o repasse de forma adequada?
                                            <asp:TextBox
                                                ID="txt13_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_5_Sim" runat="server" GroupName="grupo13_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_5_Nao" runat="server" GroupName="grupo13_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_5_NA" runat="server" GroupName="grupo13_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.5--%>
                                        <tr>
                                            <td align="center">13.6</td>
                                            <td>As bancas, vascas e o piso estão limpos e abastecidos sem ruptura?
                                            <asp:TextBox
                                                ID="txt13_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_6_Sim" runat="server" GroupName="grupo13_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_6_Nao" runat="server" GroupName="grupo13_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_6_NA" runat="server" GroupName="grupo13_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.6--%>
                                        <tr>
                                            <td align="center">13.7</td>
                                            <td>As balanças estão limpas e com o lacre íntegro?
                                            <asp:TextBox
                                                ID="txt13_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_7_Sim" runat="server" GroupName="grupo13_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_7_Nao" runat="server" GroupName="grupo13_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_7_NA" runat="server" GroupName="grupo13_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.7--%>
                                        <tr>
                                            <td align="center">13.8</td>
                                            <td>O ambiente está limpo, organizado, sem acúmulos de água no piso, lixo espalhado pelo setor ou produtos em contato direto com o piso?
                                            <asp:TextBox
                                                ID="txt13_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_8_Sim" runat="server" GroupName="grupo13_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_8_Nao" runat="server" GroupName="grupo13_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_8_NA" runat="server" GroupName="grupo13_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.8--%>
                                        <tr>
                                            <td align="center">13.9</td>
                                            <td>A planilha de higienização do setor está sendo preenchida corretamente e na frequência adequada?
                                            <asp:TextBox
                                                ID="txt13_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_9_Sim" runat="server" GroupName="grupo13_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_9_Nao" runat="server" GroupName="grupo13_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_9_NA" runat="server" GroupName="grupo13_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_9" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.9--%>
                                        <tr>
                                            <td align="center">13.10</td>
                                            <td>Os produtos hortifrutigranjeiros que necessitam de identificação de rastreabilidade estão devidamente identificados?
                                            <asp:TextBox
                                                ID="txt13_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_10_Sim" runat="server" GroupName="grupo13_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_10_Nao" runat="server" GroupName="grupo13_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_10_NA" runat="server" GroupName="grupo13_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_10" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.10--%>

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
                        <%--13 - Hortifruti - Area de Vendas--%>

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
                                                    <h2><b>Area de Vendas</b></h2>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tr>
                                            <td align="center">14.1</td>
                                            <td>O limite de exposição e o cartazeamento nos balcões (resfriados e congelados) é respeitado, de forma que a saída de ar refrigerado não esteja bloqueada?
                                            <asp:TextBox
                                                ID="txt14_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_1_Sim" runat="server" GroupName="grupo14_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_1_Nao" runat="server" GroupName="grupo14_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_1_NA" runat="server" GroupName="grupo14_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.1--%>
                                        <tr>
                                            <td align="center">14.2</td>
                                            <td>Os balcões refrigerados encontram-se em condições adequadas de limpeza e manutenção?
                                            <asp:TextBox
                                                ID="txt14_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_2_Sim" runat="server" GroupName="grupo14_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_2_Nao" runat="server" GroupName="grupo14_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_2_NA" runat="server" GroupName="grupo14_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.2--%>
                                        <tr>
                                            <td align="center">14.3</td>
                                            <td>As gôndolas se encontram devidamente limpas, abastecidas e organizadas?
                                            <asp:TextBox
                                                ID="txt14_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_3_Sim" runat="server" GroupName="grupo14_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_3_Nao" runat="server" GroupName="grupo14_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_3_NA" runat="server" GroupName="grupo14_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.3--%>
                                        <tr>
                                            <td align="center">14.4</td>
                                            <td>O PVPS é cumprido corretamente?
                                            <asp:TextBox
                                                ID="txt14_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_4_Sim" runat="server" GroupName="grupo14_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_4_Nao" runat="server" GroupName="grupo14_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_4_NA" runat="server" GroupName="grupo14_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.4--%>
                                        <tr>
                                            <td align="center">14.5</td>
                                            <td>A área de vendas está organizada, sem caixas de produtos para serem abastecidos espalhados pelos corredores ou em contato direto com o piso?
                                            <asp:TextBox
                                                ID="txt14_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_5_Sim" runat="server" GroupName="grupo14_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_5_Nao" runat="server" GroupName="grupo14_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_5_NA" runat="server" GroupName="grupo14_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.5--%>
                                        <tr>
                                            <td align="center">14.6</td>
                                            <td>Os produtos estão armazenados de forma segura, não oferecendo riscos à segurança dos clientes?
                                            <asp:TextBox
                                                ID="txt14_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_6_Sim" runat="server" GroupName="grupo14_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_6_Nao" runat="server" GroupName="grupo14_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_6_NA" runat="server" GroupName="grupo14_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.6--%>
                                        <tr>
                                            <td align="center">14.7</td>
                                            <td>Os produtos auditados na amostra estão precificados e com etiqueta correta? (Verificar circular de preços e relatar inconformidades)
                                            <asp:TextBox
                                                ID="txt14_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_7_Sim" runat="server" GroupName="grupo14_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_7_Nao" runat="server" GroupName="grupo14_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_7_NA" runat="server" GroupName="grupo14_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.7--%>
                                        <tr>
                                            <td align="center">14.8</td>
                                            <td>Todos os produtos encontram-se dentro do prazo de validade?
                                            <asp:TextBox
                                                ID="txt14_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_8_Sim" runat="server" GroupName="grupo14_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_8_Nao" runat="server" GroupName="grupo14_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_8_NA" runat="server" GroupName="grupo14_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.8--%>

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
                        <%--14 - Area de Vendas--%>

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
                                                    <h2><b>Area de Vendas (PAR)</b></h2>
                                                </td>
                                            </tr>
                                        </thead>
                                        <tr>
                                            <td align="center">15.1</td>
                                            <td>Os PAR estão expostos de forma segura e controlável?
                                            <asp:TextBox
                                                ID="txt15_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_1_Sim" runat="server" GroupName="grupo15_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_1_Nao" runat="server" GroupName="grupo15_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_1_NA" runat="server" GroupName="grupo15_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto15_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile15_1" runat="server" onchange="" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto15_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 15.1--%>
                                        <tr>
                                            <td align="center">15.2</td>
                                            <td>Os PAR possuem sensores e/ou alarmes em todas as unidades expostas?
                                            <asp:TextBox
                                                ID="txt15_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_2_Sim" runat="server" GroupName="grupo15_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_2_Nao" runat="server" GroupName="grupo15_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_2_NA" runat="server" GroupName="grupo15_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto15_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile15_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto15_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 15.2--%>
                                        <tr>
                                            <td align="center">15.3</td>
                                            <td>Os PAR da seção de eletro possuem sensores, estão amarrados com cabo de aço ou expostos em balcão trancado?
                                            <asp:TextBox
                                                ID="txt15_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_3_Sim" runat="server" GroupName="grupo15_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_3_Nao" runat="server" GroupName="grupo15_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_3_NA" runat="server" GroupName="grupo15_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto15_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile15_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto15_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 15.3--%>

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
                        <%--15 - Area de Vendas (PAR)--%>

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
                                                    <h2><b>Administrativo </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">16.1</td>
                                            <td>Os lançamentos da Agenda 23 (quebra conhecida) são realizados diariamente em sua totalidade?
                                            <asp:TextBox
                                                ID="txt16_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_1_Sim" runat="server" GroupName="grupo16_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_1_Nao" runat="server" GroupName="grupo16_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_1_NA" runat="server" GroupName="grupo16_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.1--%>
                                        <tr>
                                            <td align="center">16.2</td>
                                            <td>Os lançamentos da Agenda 23 são analisados diariamente pelos Encarregados e Gerentes de Setor? (Verificar assinaturas no log).
                                            <asp:TextBox
                                                ID="txt16_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_2_Sim" runat="server" GroupName="grupo16_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_2_Nao" runat="server" GroupName="grupo16_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_2_NA" runat="server" GroupName="grupo16_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.2--%>
                                        <tr>
                                            <td align="center">16.3</td>
                                            <td>As guias de movimentação interna (Ag. 69, 70, 245, 705) são utilizadas corretamente, e os dados são lançados no sistema diariamente? (Verificar se possuem todas as assinaturas)
                                            <asp:TextBox
                                                ID="txt16_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_3_Sim" runat="server" GroupName="grupo16_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_3_Nao" runat="server" GroupName="grupo16_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_3_NA" runat="server" GroupName="grupo16_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.3--%>
                                        <tr>
                                            <td align="center">16.4</td>
                                            <td>A tesouraria encontra-se sem a presença de objetos estranhos ao setor? (itens de uso pessoal, bolsas, carteiras, etc.)
                                            <asp:TextBox
                                                ID="txt16_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_4_Sim" runat="server" GroupName="grupo16_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_4_Nao" runat="server" GroupName="grupo16_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_4_NA" runat="server" GroupName="grupo16_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.4--%>
                                        <tr>
                                            <td align="center">16.5</td>
                                            <td>Esta sendo cumprido o processo semanal do checklist da Informática / Frente de Caixa?
                                            <asp:TextBox
                                                ID="txt16_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_5_Sim" runat="server" GroupName="grupo16_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_5_Nao" runat="server" GroupName="grupo16_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_5_NA" runat="server" GroupName="grupo16_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.5--%>
                                        <tr>
                                            <td align="center">16.6</td>
                                            <td>Os indicadores de resultado (quebras, trocas, inventário, checklist, etc) estão expostos e atualizados no painel de gestão a vista?
                                            <asp:TextBox
                                                ID="txt16_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_6_Sim" runat="server" GroupName="grupo16_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_6_Nao" runat="server" GroupName="grupo16_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_6_NA" runat="server" GroupName="grupo16_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.6--%>
                                        <tr>
                                            <td align="center">16.7</td>
                                            <td>Todos os itens encontrados nos setores encontram-se com etiqueta de movimentação interna?
                                            <asp:TextBox
                                                ID="txt16_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_7_Sim" runat="server" GroupName="grupo16_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_7_Nao" runat="server" GroupName="grupo16_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd16_7_NA" runat="server" GroupName="grupo16_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto16_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile16_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto16_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 16.7--%>

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
                        <%--16 - Administrativo--%>

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
                                                    <h2><b>Banheiro / Vestiário</b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">17.1</td>
                                            <td>Os banheiros encontram-se limpos, organizados?
                                            <asp:TextBox
                                                ID="txt17_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_1_Sim" runat="server" GroupName="grupo17_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_1_Nao" runat="server" GroupName="grupo17_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_1_NA" runat="server" GroupName="grupo17_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.1--%>
                                        <tr>
                                            <td align="center">17.2</td>
                                            <td>As papeleiras e saboneteiras estão abastecidas corretamente e limpas? As lixeiras são dotadas de tampa e acionadas sem contato manual? (para banheiros de perecíveis uso obrigatório do sabonete antisséptico)
                                            <asp:TextBox
                                                ID="txt17_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_2_Sim" runat="server" GroupName="grupo17_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_2_Nao" runat="server" GroupName="grupo17_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_2_NA" runat="server" GroupName="grupo17_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.2--%>
                                        <tr>
                                            <td align="center">17.3</td>
                                            <td>O fraldário encontra-se limpo, abastecido organizado e com a almofada de superfície impermeável em condições de uso?
                                            <asp:TextBox
                                                ID="txt17_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_3_Sim" runat="server" GroupName="grupo17_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_3_Nao" runat="server" GroupName="grupo17_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_3_NA" runat="server" GroupName="grupo17_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.3--%>
                                        <tr>
                                            <td align="center">17.4</td>
                                            <td>Nos vestiários os armários individuais dos funcionários estão em boas condições de uso? (sem ferrugem, limpos e íntegros)
                                            <asp:TextBox
                                                ID="txt17_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_4_Sim" runat="server" GroupName="grupo17_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_4_Nao" runat="server" GroupName="grupo17_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_4_NA" runat="server" GroupName="grupo17_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.4--%>
                                        <tr>
                                            <td align="center">17.5</td>
                                            <td>As instalações sanitárias estão íntegras, em bom estado de conservação e sem acúmulo de lixo? (Bolor, água estagnada, vetores, presença de fiação exposta, fechamento das portas adequado, vasos sanitários com tampa e assento).
                                            <asp:TextBox
                                                ID="txt17_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_5_Sim" runat="server" GroupName="grupo17_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_5_Nao" runat="server" GroupName="grupo17_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd17_5_NA" runat="server" GroupName="grupo17_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto17_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile17_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto17_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 17.5--%>

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
                        <%--17 - Banheiro--%>

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
                                                    <b>Trocas</b>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">18.1</td>
                                            <td>As áreas de trocas e avarias estão limpas, organizadas e sinalizadas?
                                            <asp:TextBox
                                                ID="txt18_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_1_Sim" runat="server" GroupName="grupo18_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_1_Nao" runat="server" GroupName="grupo18_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_1_NA" runat="server" GroupName="grupo18_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.1--%>
                                        <tr>
                                            <td align="center">18.2</td>
                                            <td>O local para as trocas de PERECÍVEIS, estão sinalizados, limpos e organizados?
                                            <asp:TextBox
                                                ID="txt18_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_2_Sim" runat="server" GroupName="grupo18_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_2_Nao" runat="server" GroupName="grupo18_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_2_NA" runat="server" GroupName="grupo18_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.2--%>
                                        <tr>
                                            <td align="center">18.3</td>
                                            <td>As mercadorias que possuem troca são armazenadas separadas por fornecedor com identificação nas caixas?
                                            <asp:TextBox
                                                ID="txt18_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_3_Sim" runat="server" GroupName="grupo18_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_3_Nao" runat="server" GroupName="grupo18_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_3_NA" runat="server" GroupName="grupo18_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.3--%>
                                        <tr>
                                            <td align="center">18.4</td>
                                            <td>As trocas CD são enviadas dentro do cronograma estipulado e com os pallets no padrão exigido?
                                            <asp:TextBox
                                                ID="txt18_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_4_Sim" runat="server" GroupName="grupo18_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_4_Nao" runat="server" GroupName="grupo18_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_4_NA" runat="server" GroupName="grupo18_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.4--%>
                                        <tr>
                                            <td align="center">18.5</td>
                                            <td>A loja está dando as tratativas para as trocas paradas no setor a mais de 30 dias?
                                            <asp:TextBox
                                                ID="txt18_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_5_Sim" runat="server" GroupName="grupo18_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_5_Nao" runat="server" GroupName="grupo18_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_5_NA" runat="server" GroupName="grupo18_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.5--%>
                                        <tr>
                                            <td align="center">18.6</td>
                                            <td>Os itens que estão armazenados no setor, realmente possuem contrato de trocas?
                                            <asp:TextBox
                                                ID="txt18_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_6_Sim" runat="server" GroupName="grupo18_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_6_Nao" runat="server" GroupName="grupo18_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_6_NA" runat="server" GroupName="grupo18_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.6--%>
                                        <tr>
                                            <td align="center">18.7</td>
                                            <td>Está sendo verificado as condições dos produtos enviados ao CD para evitar risco de contaminação
 ( pragas, cheiro ruins, com embalagens violadas, outros)?
                                            <asp:TextBox
                                                ID="txt18_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_7_Sim" runat="server" GroupName="grupo18_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_7_Nao" runat="server" GroupName="grupo18_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_7_NA" runat="server" GroupName="grupo18_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.7--%>
                                        <tr>
                                            <td align="center">18.8</td>
                                            <td>A loja está com valor de trocas compatível de modo que o % fique compatível com a meta da empresa? ( Meta 0,40%)
                                            <asp:TextBox
                                                ID="txt18_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_8_Sim" runat="server" GroupName="grupo18_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_8_Nao" runat="server" GroupName="grupo18_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd18_8_NA" runat="server" GroupName="grupo18_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto18_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile18_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto18_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 18.8--%>

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
                        <%--18 - Segurança Patrimonial--%>

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
                                                    <b>Delivery</b>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">19.1</td>
                                            <td>Existe controle de acesso as mercadorias do delivery?
                                            <asp:TextBox
                                                ID="txt19_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_1_Sim" runat="server" GroupName="grupo19_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_1_Nao" runat="server" GroupName="grupo19_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_1_NA" runat="server" GroupName="grupo19_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto19_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile19_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto19_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 19.1--%>
                                        <tr>
                                            <td align="center">19.2</td>
                                            <td>As caixas para entregas estão limpas e organizadas? A caixas com mercadorias não estão em contato com o piso?
                                            <asp:TextBox
                                                ID="txt19_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_2_Sim" runat="server" GroupName="grupo19_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_2_Nao" runat="server" GroupName="grupo19_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_2_NA" runat="server" GroupName="grupo19_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto19_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile19_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto19_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 19.2--%>
                                        <tr>
                                            <td align="center">19.3</td>
                                            <td>Todos os produtos separados no setor estão registrados?
                                            <asp:TextBox
                                                ID="txt19_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_3_Sim" runat="server" GroupName="grupo19_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_3_Nao" runat="server" GroupName="grupo19_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_3_NA" runat="server" GroupName="grupo19_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto19_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile19_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto19_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 19.3--%>
                                        <tr>
                                            <td align="center">19.4</td>
                                            <td>A saída de mercadorias do Delivery, são conferidas?
                                            <asp:TextBox
                                                ID="txt19_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_4_Sim" runat="server" GroupName="grupo19_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_4_Nao" runat="server" GroupName="grupo19_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_4_NA" runat="server" GroupName="grupo19_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto19_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile19_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto19_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 19.4--%>
                                        <tr>
                                            <td align="center">19.5</td>
                                            <td>A planilha foi auditada pelo enc de segurança e está com a assinatura?
                                            <asp:TextBox
                                                ID="txt19_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_5_Sim" runat="server" GroupName="grupo19_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_5_Nao" runat="server" GroupName="grupo19_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_5_NA" runat="server" GroupName="grupo19_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto19_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile19_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto19_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 19.5--%>
                                        <tr>
                                            <td align="center">19.6</td>
                                            <td>Está sendo aferido a temperatura das mercadorias que estão armazenadas no freezer?
                                            <asp:TextBox
                                                ID="txt19_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_6_Sim" runat="server" GroupName="grupo19_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_6_Nao" runat="server" GroupName="grupo19_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_6_NA" runat="server" GroupName="grupo19_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto19_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile19_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto19_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 19.6--%>
                                        <tr>
                                            <td align="center">19.7</td>
                                            <td>As mercadorias de perecíveis estão armazenadas em local apropriado aguardando entrega? A mesma está identificada para associar de qual compra é?
                                            <asp:TextBox
                                                ID="txt19_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_7_Sim" runat="server" GroupName="grupo19_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_7_Nao" runat="server" GroupName="grupo19_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd19_7_NA" runat="server" GroupName="grupo19_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto19_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile19_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto19_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 19.7--%>

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
                        <%--19 - Frente de Caixa--%>

                        <asp:Panel ID="panDados20" runat="server" Visible="false" Style="border: solid 1px #c0c0c0; padding: 5px;">
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
                                                    <b>Frente de Caixa</b>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">20.1</td>
                                            <td>Os carrinhos, cestas de compras, displays de encartes e PDV's encontram-se em condições adequadas de uso e limpos?
                                            <asp:TextBox
                                                ID="txt20_1" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_1_Sim" runat="server" GroupName="grupo20_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_1_Nao" runat="server" GroupName="grupo20_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_1_NA" runat="server" GroupName="grupo20_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_1" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.1--%>
                                        <tr>
                                            <td align="center">20.2</td>
                                            <td>Os desacopladores, desmagnetizadores e antenas estão funcionando adequadamente?
                                            <asp:TextBox
                                                ID="txt20_2" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_2_Sim" runat="server" GroupName="grupo20_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_2_Nao" runat="server" GroupName="grupo20_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_2_NA" runat="server" GroupName="grupo20_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_2" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.2--%>
                                        <tr>
                                            <td align="center">20.3</td>
                                            <td>Os produtos com entrega em domicílio estão em local apropriado, seguro e sem a presença de produtos perecíveis?
                                            <asp:TextBox
                                                ID="txt20_3" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_3_Sim" runat="server" GroupName="grupo20_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_3_Nao" runat="server" GroupName="grupo20_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_3_NA" runat="server" GroupName="grupo20_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_3" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.3--%>
                                        <tr>
                                            <td align="center">20.4</td>
                                            <td>Os fiscais de caixa estão em posse de seus crachás? (Todos cientes de que o uso do crachá é de uso pessoal e intransferível)
                                            <asp:TextBox
                                                ID="txt20_4" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_4_Sim" runat="server" GroupName="grupo20_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_4_Nao" runat="server" GroupName="grupo20_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_4_NA" runat="server" GroupName="grupo20_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_4" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.4--%>
                                        <tr>
                                            <td align="center">20.5</td>
                                            <td>O porta sacolas está sendo utilizado de forma adequada?
                                            <asp:TextBox
                                                ID="txt20_5" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_5_Sim" runat="server" GroupName="grupo20_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_5_Nao" runat="server" GroupName="grupo20_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_5_NA" runat="server" GroupName="grupo20_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_5" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.5--%>
                                        <tr>
                                            <td align="center">20.6</td>
                                            <td>Os displays e armários de cigarros encontram-se íntegros, fechados com cadeado/chave e acesso controlado?
                                            <asp:TextBox
                                                ID="txt20_6" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_6_Sim" runat="server" GroupName="grupo20_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_6_Nao" runat="server" GroupName="grupo20_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_6_NA" runat="server" GroupName="grupo20_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_6" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.6--%>
                                        <tr>
                                            <td align="center">20.7</td>
                                            <td>O procedimento para a venda de cigarros (Fiscal de Caixa entregar o cigarro ao cliente) está se cumprindo corretamente?
                                            <asp:TextBox
                                                ID="txt20_7" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_7_Sim" runat="server" GroupName="grupo20_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_7_Nao" runat="server" GroupName="grupo20_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_7_NA" runat="server" GroupName="grupo20_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_7" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.7--%>
                                        <tr>
                                            <td align="center">20.8</td>
                                            <td>Os operadores estão atentos aos grandes volumes e possíveis itens nas partes baixas dos carrinhos? (Verificar etiquetas de OK)
                                            <asp:TextBox
                                                ID="txt20_8" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_8_Sim" runat="server" GroupName="grupo20_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_8_Nao" runat="server" GroupName="grupo20_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_8_NA" runat="server" GroupName="grupo20_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_8" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.8--%>
                                        <tr>
                                            <td align="center">20.9</td>
                                            <td>Os operadores estão atentos as características (sabores, fragrâncias, etc) dos produtos registrados que são similares NO MOMENTO DO REGISTRO NO CHECKOUT?
                                            <asp:TextBox
                                                ID="txt20_9" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_9_Sim" runat="server" GroupName="grupo20_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_9_Nao" runat="server" GroupName="grupo20_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_9_NA" runat="server" GroupName="grupo20_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_9" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.9--%>
                                        <tr>
                                            <td align="center">20.10</td>
                                            <td>Os produtos com divergências de preço são registrados em planilha específica e informados aos responsáveis dos setores? (Conferir Planilhas)
                                            <asp:TextBox
                                                ID="txt20_10" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_10_Sim" runat="server" GroupName="grupo20_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_10_Nao" runat="server" GroupName="grupo20_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_10_NA" runat="server" GroupName="grupo20_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_10" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.10--%>
                                        <tr>
                                            <td align="center">20.11</td>
                                            <td>As passagens dos caixas sem operação estão bloqueadas e trancados de forma adequada?
                                            <asp:TextBox
                                                ID="txt20_11" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_11_Sim" runat="server" GroupName="grupo20_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_11_Nao" runat="server" GroupName="grupo20_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_11_NA" runat="server" GroupName="grupo20_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_11" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.11--%>
                                        <tr>
                                            <td align="center">20.12</td>
                                            <td>As desistências dos clientes são devolvidas periodicamente aos seus setores? (Principalmente perecíveis)
                                            <asp:TextBox
                                                ID="txt20_12" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_12_Sim" runat="server" GroupName="grupo20_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_12_Nao" runat="server" GroupName="grupo20_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_12_NA" runat="server" GroupName="grupo20_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_12" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.12--%>
                                        <tr>
                                            <td align="center">20.13</td>
                                            <td>Todas as mercadorias vindas de troca são recebidas com os cupons fiscais? (Conferir cupons vistados)
                                            <asp:TextBox
                                                ID="txt20_13" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_13_Sim" runat="server" GroupName="grupo20_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_13_Nao" runat="server" GroupName="grupo20_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_13_NA" runat="server" GroupName="grupo20_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_13" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.13--%>
                                        <tr>
                                            <td align="center">20.14</td>
                                            <td>As planilhas de devoluções ou trocas dos setores de Eletrônicos, Têxtil e Bazar estão corretamente preenchidas e rubricadas pelo Gerente de Departamento ou Encarregado do Setor? (Conferir planilhas)
                                            <asp:TextBox
                                                ID="txt20_14" runat="server" Width="350" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_14_Sim" runat="server" GroupName="grupo20_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_14_Nao" runat="server" GroupName="grupo20_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd20_14_NA" runat="server" GroupName="grupo20_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto20_14" runat="server" ImageUrl="~/image/camera-icon_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile20_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto20_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" Width="20px" Height="20px" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 20.14--%>

                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td colspan="8" align="center">
                                                    <dx:ASPxButton ID="btnGrupo20" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>
                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--20 - Câmara de Congelados--%>
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

        $("#success-alert").hide();
        $("#dangerAlert").hide();

        maxData();

        function alertSucessImg() {
            $("#success-alert").fadeTo(8000, 500).slideUp(500, function () {
                $("#success-alert").slideUp(500);
            });
        }

        function alertError() {
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

         //function createPDF() {
        //    var pdf = new jsPDF('p', 'pt', 'a4');
        //    var d = new Date().toISOString().slice(0, 19).replace(/-/g, "");
        //    filename = 'report_' + d + '.pdf';
        //    // source can be HTML-formatted string, or a reference
        //    // to an actual DOM element from which the text will be scraped.
        //    source = document.getElementById('MainContent_renderRel');

        //    // we support special element handlers. Register them with jQuery-style
        //    // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
        //    // There is no support for any other type of selectors
        //    // (class, of compound) at this time.
        //    specialElementHandlers = {
        //        // element with id of "bypass" - jQuery style selector
        //        '#bypassme': function (element, renderer) {
        //            // true = "handled elsewhere, bypass text extraction"
        //            return true
        //        }
        //    };
        //    margins = {
        //        top: 15,
        //        bottom: 15,
        //        left: 35,
        //        width: 552
        //    };
        //    // all coords and widths are in jsPDF instance's declared units
        //    // 'inches' in this case
        //    pdf.fromHTML(
        //        source, // HTML string or DOM elem ref.
        //        margins.left, // x coord
        //        margins.top, { // y coord
        //        'width': margins.width, // max width of content on PDF
        //        'elementHandlers': specialElementHandlers
        //    },

        //        function (dispose) {
        //            // dispose: object with X, Y of the last line add to the PDF
        //            //          this allow the insertion of new lines after html
        //            pdf.save(filename);
        //        }, margins);
        //}

    </script>

</asp:Content>



