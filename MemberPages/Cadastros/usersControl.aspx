<%@ Page Title="Gestão de Usuários" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="usersControl.aspx.vb" Inherits="MemberPages_Cadastros_usersControl" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <script src="../../assets/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/jquery.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/bootstrap.min.js"></script>
    <link href="../../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../assets/bootstrap-5.0.2-dist/js/sidebars.js"></script>
    <link href="../../assets/bootstrap-5.0.2-dist/css/sidebars.css" rel="stylesheet" />

    <script src="../../assets/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/jquery.min.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/moment.min.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../assets/datepickerRange/daterangepicker.css" />
    <link href="../../assets/bootstrap-select-1.13.14/select2.min.css" rel="stylesheet" />
    <script src="../../assets/bootstrap-select-1.13.14/select2.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>

        function alertSucess() {

            document.getElementById('MainContent_divNewUser').style.display = 'none';
            document.getElementById('success-alert').style.display = 'block';

        };

        function hiddenInit() {
            //alterar para block depois de funcionar inserir novo cadastro
            document.getElementById('MainContent_divMenu').style.display = 'none';
        };

        function showWindow(url) {

            document.getElementById('MainContent_divMenu').style.display = 'none';
            document.getElementById('MainContent_divNewUser').style.display = 'none';
            document.getElementById('MainContent_divFindUser').style.display = 'none';
            document.getElementById('MainContent_divAlterUser').style.display = 'none';
            document.getElementById('MainContent_divMenuExcecao').style.display = 'none';
            document.getElementById('MainContent_divNewRole').style.display = 'none';
            document.getElementById('MainContent_divParamMenu').style.display = 'none';

            if (url == "new_user") {
                document.getElementById('MainContent_divNewUser').style.display = 'block';
            }

            if (url == "find_user") {
                document.getElementById('MainContent_divFindUser').style.display = 'block';
            }

            if (url == "alter_user") {
                document.getElementById('MainContent_divAlterUser').style.display = 'block';
            }

            if (url == "exception_user") {
                document.getElementById('MainContent_divMenuExcecao').style.display = 'block';
            }

            if (url == "new_role") {
                document.getElementById('MainContent_divNewRole').style.display = 'block';
            }

            if (url == "param_menu") {
                document.getElementById('MainContent_divParamMenu').style.display = 'block';
            }
        };

        function collapseCheck(id) {
            document.getElementById('MainContent_divParamMenu');
        };

    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="row col-12" runat="server" style="padding: 25px 0 50px 0" id="div1">
        <div class="container-fluid bg-white">
            <div class="row flex-nowrap">

                <%--Menu lateral--%>
                <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0">
                    <div class="flex-shrink-0 p-3 bg-white">
                        <ul class="list-unstyled ps-0">
                            <li class="mb-3">
                                <%--<img class="d-block mx-auto mb-4" src="../../image/LogoCondor_Vermelho_25-sem-fundo.png" alt="" width="115" height="30">--%>
                            </li>
                            <li class="border-top my-3"></li>
                            <li class="mb-1">
                                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                    <li>Usuario</li>

                                    <li>
                                        <div class="collapse show" id="home-collapse">
                                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                                <li><a onclick="javascript:showWindow('new_user');" href="#" class="link-dark rounded">Cadastrar</a></li>
                                                <li><a onclick="javascript:showWindow('find_user');" href="#" class="link-dark rounded">Consultar</a></li>
                                                <li><a onclick="javascript:showWindow('alter_user');" href="#" class="link-dark rounded">Alterar</a></li>
                                                <li><a onclick="javascript:showWindow('exception_user');" href="#" class="link-dark rounded">Adicionar Menu(Exceção)</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <li class="border-top my-3"></li>
                            <li class="mb-1">
                                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                    <li>Perfil</li>
                                    <li>
                                        <div class="collapse show" id="dashboard-collapse" style="">
                                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                                <li><a onclick="javascript:showWindow('new_role');" href="#" class="link-dark rounded">Cadastrar</a></li>
                                                <li><a onclick="javascript:showWindow('param_menu');" href="#" class="link-dark rounded">Parametrizar Menus</a></li>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col text-center bg-white border-left">
                    <%--Contexto Aqui--%>
                    <aspxcallbackpanel id="cbPanel" runat="server" theme="Metropolis" clientinstancename="cbPanel" settingsloadingpanel-text="Atualizando">
                        <panelcollection>
                            <panelcontent>
                                <table cellspacing="1">
                                    <tr>
                                        <td>
                                            <dx:ASPxCallback ID="ASPxCallback" runat="server" ClientInstanceName="Callback">
                                                <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Show(); }" />
                                            </dx:ASPxCallback>

                                            <dx:ASPxLoadingPanel ID="ASPxLoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
                                                Modal="True" Text="Aguarde...">
                                            </dx:ASPxLoadingPanel>
                                        </td>
                                    </tr>
                                </table>

                                <%--Descricao inicial--%>
                                <div class="container justify-content-center" style="max-width: 98%; display: none" runat="server" id="divMenu">
                                    <div class="py-5 text-center">
                                        <img class="" src="../../image/LogoCondor_Vermelho_25-sem-fundo.png" alt="" width="240" height="60">
                                        <br />
                                        <br />
                                        <br />
                                        <h2>Gestão de usuários - Banco Gerencial</h2>
                                    </div>
                                </div>

                                <%--Usuário--%>
                                <%--Cadastro de Usuario--%>
                                <asp:Panel ID="panCadastroUsuario" runat="server" CssClass="justify-content-center">
                                    <div class="container justify-content-center" runat="server" id="divNewUser" style="padding: 15px 15px 15px 15px; display: block">
                                        <hr class="mb-3">
                                        <br />
                                        <div class="col-md-12">
                                            <div class="row justify-content-between">
                                                <div class="col-4">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Nome</span>
                                                        </div>
                                                        <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="txtFirstName" runat="server">
                                                    </div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Sobrenome</span>
                                                        </div>
                                                        <input type="text" class="form-control justify-content-center text-center" maxlength="100" id="txtLastName" runat="server">
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row justify-content-between">
                                                <div class="col-4">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Login</span>
                                                        </div>
                                                        <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="lblLogin" runat="server">
                                                    </div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <div class="input-group-prepend xs">
                                                                <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Email</span>
                                                            </div>
                                                        </div>
                                                        <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="txtEmail" runat="server">
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row justify-content-between">
                                                <div class="col-4">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <div class="input-group-prepend xs">
                                                                <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Matrícula</span>
                                                            </div>
                                                        </div>
                                                        <input type="number" class="form-control justify-content-center text-center" maxlength="50" id="txtMatricula" runat="server">
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <div class="input-group-prepend xs">
                                                                <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Perfil</span>
                                                            </div>
                                                        </div>
                                                        <asp:DropDownList class="form-control text-center" ID="selPerfilNewUser" runat="server" DataTextField="Desc" AutoPostBack="false"></asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-4">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <div class="input-group-prepend xs">
                                                                <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Tipo</span>
                                                            </div>
                                                        </div>
                                                        <div class="form-control" style="padding-top: 10px">
                                                            <div class="form-check form-check-inline form-switch">
                                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rdLoja" value="1" checked />
                                                                <label class="form-check-label" for="inlineRadio1">Loja</label>
                                                            </div>

                                                            <div class="form-check form-check-inline form-switch">
                                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rdAdm" value="2" />
                                                                <label class="form-check-label" for="inlineRadio2">Adm</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row justify-content-between text-center">
                                                <div class="col-2 justify-content-center" style="min-width: 100px">
                                                    <span class="col-auto input-group-text justify-content-center">É loja:</span>
                                                    <div class="form-control justify-content-center text-center">
                                                        <div class="form-check form-switch">
                                                            <input class="form-check-input" type="checkbox" id="isLoja" checked>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2 justify-content-center text-center">
                                                    <span class="col-auto input-group-text justify-content-center">Tipo</span>
                                                    <asp:DropDownList class="form-control text-center" ID="selTipo" runat="server" DataTextField="Desc" AutoPostBack="true" OnSelectedIndexChanged="selTipo_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                                <div class="col-8 justify-content-center text-center">
                                                    <span class="col-auto input-group-text justify-content-center">Filial</span>
                                                    <asp:DropDownList class="form-control " ID="selFilial" runat="server" DataTextField="Desc"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row justify-content-sm-center">
                                                <asp:Button runat="server" OnClick="btnSubmit_Click" Width="200px" class="btn btn-primary btn-md" Text="Cadastrar" ID="btnSubmit" />
                                            </div>
                                            <br />
                                            <hr class="mb-3">
                                        </div>
                                    </div>
                                </asp:Panel>

                                <%--Consulta de Usuario--%>
                                <asp:Panel ID="panConsultaUsuario" runat="server" CssClass="justify-content-center">
                                    <div id="divFindUser" style="display: none; padding: 15px 15px 15px 15px;" runat="server">
                                        <hr class="mb-3">
                                        <br />
                                        <div class="row col-12 justify-content-center">
                                            <div class="col-auto" style="width: 200px">
                                                <span class="input-group-text justify-content-center">Tipo</span>
                                                <select id="selConsulta" runat="server" class="form-control justify-content-center text-center">
                                                    <option value="1" selected="selected">Login</option>
                                                    <option value="2">Email</option>
                                                    <option value="3">Nome</option>
                                                </select>
                                            </div>
                                            <br />
                                            <div class="col-auto xs" style="width: 300px">
                                                <span class="input-group-text justify-content-center sm">Parâmetro</span>
                                                <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="txtParametro" runat="server">
                                                <%--<input type="text" class="form-control xs" name="daterange" autopostback="false" runat="server" id="daterange" />--%>
                                            </div>

                                            <div class="col-auto justify-content-center" style="padding: 20px 15px 15px 15px">
                                                <asp:Button runat="server" OnClick="btnFiltrar_Click" Width="125px" Height="35px" class="btn btn-primary btn-md" Text="Consultar" ID="btnFiltrar" />
                                            </div>

                                        </div>

                                        <p>
                                            <br />
                                        </p>

                                        <div class="container col-7 justify-content-center" runat="server" id="divGrid">
                                            <asp:GridView ID="grvDados" CssClass="gwFormat" HeaderStyle-BackColor="#CED4DA" HeaderStyle-ForeColor="Black" KeyFieldName="id"
                                                RowStyle-BackColor="#E9ECEF" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000" GridLines="None"
                                                runat="server" AutoGenerateColumns="false" BorderStyle="none" Style="margin: 0 auto 0 auto !important" HeaderStyle-Height="40px" RowStyle-Height="50px" HeaderStyle-HorizontalAlign="Center"
                                                RowStyle-HorizontalAlign="Center" EmptyDataText="<b>Não foram encontrados usuários para os parâmetros informados!</b>" CellPadding="15" CellSpacing="10" OnRowDataBound="grvDados_RowDataBound">
                                                <Columns>
                                                    <asp:BoundField DataField="Nome" HeaderText="Nome" />
                                                    <asp:BoundField DataField="Login" HeaderText="Login" />
                                                    <asp:BoundField DataField="Perfil" HeaderText="Perfil" />
                                                    <asp:BoundField DataField="data_criacao" HeaderText="Criação" />
                                                    <asp:BoundField DataField="data_login" HeaderText="Ultimo Login" />
                                                    <asp:BoundField DataField="Filial" HeaderText="Filial" />
                                                    <%--                                                    <asp:TemplateField ItemStyle-Width="80px">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnExcluir" runat="server" AutoPostBack="False" CommandName='<%# Eval("ID")%>' OnClientClick='var x = confirm("Tem certeza que deseja excluir o registro?"); if (x == false) {alertMsg();}; return x;' OnClick="btnExcluir_Click" CssClass="btn btn-danger btn-sm" Text="Excluir" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>
                                                </Columns>
                                                <PagerStyle HorizontalAlign="Center" Height="50px" VerticalAlign="Middle" CssClass="gwFormat" />
                                            </asp:GridView>
                                        </div>

                                    </div>
                                </asp:Panel>

                                <%--Alterar Usuario--%>
                                <asp:Panel ID="panAlteraUsuario" runat="server" CssClass="justify-content-center">
                                    <div class="container justify-content-center" runat="server" id="divAlterUser" style="padding: 15px 15px 15px 15px; display: none">

                                        <hr class="mb-3">
                                        <%--Resetar senha--%>
                                        <div class="row col-12 justify-content-center" style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                            <br />
                                            <span class="justify-content-center sm h5">Resetar Senha</span>
                                            <br />
                                            <br />

                                            <div class="col-4">
                                                <div class="input-group input-group xs" style="max-height: 30px">
                                                    <div class="input-group-prepend xs">
                                                        <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Login</span>
                                                    </div>
                                                    <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="txtLoginAlter" runat="server">
                                                </div>
                                            </div>

                                            <div class="col-4"></div>

                                            <div class="col-2 justify-content-end" style="padding-right: 25px">
                                                <asp:Button runat="server" OnClick="btnFiltrar_Click" Width="125px" Height="35px" class="btn btn-warning btn-md" Text="Executar" ID="btnResetarSenha" />
                                            </div>
                                        </div>
                                        <hr class="mb-3">

                                        <%--Alterar Perfil--%>
                                        <div class="row col-12 justify-content-center" style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                            <br />
                                            <span class="justify-content-center sm h5">Alterar Departamento</span>
                                            <br />
                                            <br />

                                            <div class="col-4">
                                                <div class="input-group input-group xs" style="max-height: 30px">
                                                    <div class="input-group-prepend xs">
                                                        <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Login</span>
                                                    </div>
                                                    <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="txtLoginAlterPerfil" runat="server">
                                                </div>
                                            </div>

                                            <div class="col-4">
                                                <div class="input-group input-group xs" style="max-height: 30px">
                                                    <div class="input-group-prepend xs">
                                                        <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Perfil</span>
                                                    </div>
                                                    <asp:DropDownList class="form-control text-center" ID="selPerfilAlterUser" runat="server" DataTextField="Desc" AutoPostBack="false"></asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="col-2 justify-content-center" style="padding-right: 25px">
                                                <asp:Button runat="server" OnClick="btnFiltrar_Click" Width="125px" Height="35px" class="btn btn-warning btn-md" Text="Executar" ID="Button1" />
                                            </div>
                                        </div>
                                        <hr class="mb-3">

                                        <%--Alterar Filial--%>
                                        <div class="row col-12 justify-content-center " style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                            <br />
                                            <span class="justify-content-center sm h5">Alterar Filial</span>
                                            <br />
                                            <br />

                                            <div class="col-3 justify-content-center">
                                                <div class="input-group input-group xs" style="max-height: 30px">
                                                    <div class="input-group-prepend xs">
                                                        <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Login</span>
                                                    </div>
                                                    <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="Text2" runat="server">
                                                </div>
                                            </div>

                                                <div class="col-2 justify-content-center">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <span class="col-auto input-group-text justify-content-center">Tipo</span>
                                                        </div>
                                                        <asp:DropDownList class="form-control text-center" ID="selTipoAlter" runat="server" DataTextField="Desc" AutoPostBack="true" OnSelectedIndexChanged="selTipoAlter_SelectedIndexChanged"></asp:DropDownList>
                                                    </div>
                                                </div>

                                                <div class="col-3 justify-content-center">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Filial</span>
                                                        </div>
                                                        <asp:DropDownList class="form-control " ID="selFilialAlter" runat="server" DataTextField="Desc"></asp:DropDownList>
                                                    </div>
                                                </div>

                                            <div class="col-2 justify-content-end" style="padding-right: 25px">
                                                <asp:Button runat="server" OnClick="btnFiltrar_Click" Width="125px" Height="35px" class="btn btn-warning btn-md" Text="Executar" ID="Button2" />
                                            </div>
                                        </div>
                                        <hr class="mb-3">

                                        <%--Inativar Usuário--%>
                                        <div class="row col-12 justify-content-center " style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                            <br />
                                            <span class="justify-content-center sm h5">Inativar Usuário</span>
                                            <br />
                                            <br />

                                            <div class="col-4 justify-content-center">
                                                <div class="input-group input-group xs" style="max-height: 30px">
                                                    <div class="input-group-prepend xs">
                                                        <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Login</span>
                                                    </div>
                                                    <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="txtLoginInativar" runat="server">
                                                </div>
                                            </div>

                                            <div class="col-4"></div>

                                            <div class="col-2 justify-content-end" style="padding-right: 25px">
                                                <asp:Button runat="server" OnClick="btnFiltrar_Click" Width="125px" Height="35px" class="btn btn-danger btn-md" Text="Executar" ID="Button4" />
                                            </div>
                                        </div>
                                        <hr class="mb-3">
                                    </div>
                                </asp:Panel>

                                <%--Adicionar Menu - Exceção--%>
                                <asp:Panel ID="panMenuExcecao" runat="server" CssClass="justify-content-center">
                                    <div class="container justify-content-center" runat="server" id="divMenuExcecao" style="padding: 15px 15px 15px 15px; display: none">

                                        <hr class="mb-3">

                                        <%--Adicionar Menu(Tela) Fora do perfil--%>
                                        <div class="row col-12 justify-content-center " style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                            <div class="row col-12 justify-content-center " style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                                <br />
                                                <span class="justify-content-center sm h5">Menu Personalizado (Fora do perfil)</span>
                                                <br />
                                                <br />

                                                <div class="col-4 justify-content-center">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Login</span>
                                                        </div>
                                                        <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="txtLoginEx" runat="server">
                                                    </div>
                                                </div>

                                                <div class="col-2 justify-content-end" style="padding-right: 25px">
                                                    <asp:Button runat="server" OnClick="btnBuscarEx_Click" Width="125px" Height="35px" class="btn btn-info btn-md" Text="Buscar" ID="btnBuscarEx" />
                                                </div>
                                            </div>

                                            <div class="row col-12 justify-content-center" runat="server" id="divTreeEx" visible="false" style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                                <div class="row col-12 justify-content-center " style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                                    <div class="col-1"></div>
                                                    <div class="col-5" style="background-color: white">
                                                        <br />
                                                        <span class="input-group-text justify-content-center"><b>(Barra de Menu)</b></span>
                                                        <asp:TreeView ID="tvwMenuHorExc" CssClass="wj-treeview w-auto border" runat="server" ShowLines="True" Width="200px"
                                                            BorderStyle="Dotted" ShowCheckBoxes="All">
                                                        </asp:TreeView>
                                                    </div>

                                                    <div class="col-5" style="background-color: white">
                                                        <br />
                                                        <span class="input-group-text justify-content-center"><b>(Menus Internos)</b></span>
                                                        <asp:TreeView ID="tvwMenuVertExc" CssClass="wj-treeview w-auto border" runat="server" ShowLines="True" Width="200px"
                                                            BorderStyle="Dotted" ShowCheckBoxes="All">
                                                        </asp:TreeView>
                                                    </div>
                                                    <div class="col-1"></div>
                                                </div>

                                                <br />

                                                <div class="col-12 justify-content-center" style="padding-right: 25px">
                                                    <asp:Button runat="server" OnClick="btnSalvarEx_Click" Width="125px" Height="35px" class="btn btn-success btn-md" Text="Salvar" ID="btnSalvarEx" />
                                                </div>
                                            </div>

                                        </div>

                                        <hr class="mb-3">
                                    </div>
                                </asp:Panel>

                                <%--Perfil--%>
                                <%--Cadastro de Perfil--%>
                                <asp:Panel ID="panCadastroPerfil" runat="server" CssClass="justify-content-center">
                                    <div class="container justify-content-center" runat="server" id="divNewRole" style="padding: 15px 15px 15px 15px; display: none">
                                        <hr class="mb-3">

                                        <%--Resetar senha--%>
                                        <div class="row col-12 justify-content-center" style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                            <br />
                                            <span class="justify-content-center sm h5">Novo Perfil</span>
                                            <br />
                                            <br />

                                            <div class="col-4">
                                                <div class="input-group input-group xs" style="max-height: 30px">
                                                    <div class="input-group-prepend xs">
                                                        <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Nome (Perfil)</span>
                                                    </div>
                                                    <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="Text1" runat="server">
                                                </div>
                                            </div>

                                            <div class="col-4"></div>

                                            <div class="col-2 justify-content-end" style="padding-right: 25px">
                                                <asp:Button runat="server" OnClick="btnFiltrar_Click" Width="125px" Height="35px" class="btn btn-warning btn-md" Text="Executar" ID="Button3" />
                                            </div>
                                        </div>
                                        <hr class="mb-3">

                                        <%--Alterar Perfil--%>
                                        <div class="row col-12 justify-content-center" style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                            <br />
                                            <span class="justify-content-center sm h5">Duplicar Perfil</span>
                                            <br />
                                            <br />

                                            <div class="col-4">
                                                <div class="input-group input-group xs" style="max-height: 30px">
                                                    <div class="input-group-prepend xs">
                                                        <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Perfil Modelo</span>
                                                    </div>
                                                    <select id="Select4" runat="server" class="form-control justify-content-center text-center">
                                                        <option value="0" selected>Selecione...</option>
                                                        <option value="2">Teste 2</option>
                                                        <option value="3">Teste 3</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="col-4">
                                                <div class="input-group input-group xs" style="max-height: 30px">
                                                    <div class="input-group-prepend xs">
                                                        <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Nome (Perfil)</span>
                                                    </div>
                                                    <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="Text4" runat="server">
                                                </div>
                                            </div>

                                            <div class="col-2 justify-content-center" style="padding-right: 25px">
                                                <asp:Button runat="server" OnClick="btnFiltrar_Click" Width="125px" Height="35px" class="btn btn-warning btn-md" Text="Executar" ID="Button5" />
                                            </div>
                                        </div>
                                        <hr class="mb-3">
                                    </div>
                                </asp:Panel>

                                <%--Parametrizar Menu--%>
                                <asp:Panel ID="panParametrizarMenus" runat="server" CssClass="justify-content-center">
                                    <div class="container justify-content-center" runat="server" id="divParamMenu" style="padding: 15px 15px 15px 15px; display: none">

                                        <hr class="mb-3">

                                        <%--Adicionar Menu(Tela) no perfil--%>
                                        <div class="row col-12 justify-content-center " style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                            <div class="row col-12 justify-content-center" style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                                <span class="justify-content-center sm h5">Parametrização de menus - Perfil</span>
                                                <br />
                                                <br />

                                                <div class="col-4 justify-content-center" runat="server">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Perfil</span>
                                                        </div>
                                                        <asp:DropDownList class="form-control text-center" ID="selPerfilMenu" runat="server" DataTextField="Desc" AutoPostBack="false"></asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="col-2 justify-content-end" style="padding-right: 25px">
                                                    <asp:Button runat="server" OnClick="btnFiltrarMenuPerfil_Click" Width="125px" Height="35px" class="btn btn-info btn-md" Text="Buscar" ID="btnFiltrarMenuPerfil" />
                                                </div>
                                            </div>


                                            <div class="row col-12 justify-content-center" runat="server" id="divTreePerfil" visible="false" style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                                <div class="row col-12 justify-content-center " style="background-color: #E9ECEF; padding: 20px 0 20px 0">
                                                    <div class="col-1"></div>
                                                    <div class="col-5" style="background-color: white">
                                                        <br />
                                                        <span class="input-group-text justify-content-center"><b>(Barra de Menu)</b></span>
                                                        <asp:TreeView ID="tvwMenuHor" CssClass="wj-treeview w-100 border" runat="server" ShowLines="True"
                                                            BorderStyle="Dotted" ShowCheckBoxes="All">
                                                        </asp:TreeView>
                                                    </div>

                                                    <div class="col-5" style="background-color: white">
                                                        <br />
                                                        <span class="input-group-text justify-content-center"><b>(Menus Internos)</b></span>
                                                        <asp:TreeView ID="tvwMenuVer" CssClass="wj-treeview w-100 border tag-important" runat="server" ShowLines="True"
                                                            BorderStyle="Dotted" ShowCheckBoxes="All">
                                                        </asp:TreeView>
                                                    </div>
                                                    <div class="col-1"></div>
                                                </div>

                                                <div class="col-12 justify-content-center" style="padding-right: 25px">
                                                    <asp:Button runat="server" OnClick="btnSalvarPerfis_Click" Width="125px" Height="35px" class="btn btn-info btn-md" Text="Salvar" ID="btnSalvarPerfis" />
                                                </div>
                                            </div>
                                        </div>

                                        <hr class="mb-3">
                                    </div>
                                </asp:Panel>

                            </panelcontent>
                        </panelcollection>
                    </aspxcallbackpanel>

                    <br />
                    <div class="row col-12 justify-content-center">
                        <div class="alert alert-success justify-content-center" id="success-alert" style="text-align: center; display: none; max-width: 500px">
                            <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>Successo! </strong>Usuário criado com sucesso!<br />
                            <br />
                            Para visualizar acesse a opção <strong>Consulta</strong>.
                        </div>
                    </div>
                    <br />
                </div>
            </div>
        </div>
    </div>


    <style>
        .modal-dialog {
            margin-left: auto;
            margin-right: auto;
            max-width: 850px;
        }

        .gwFormat td {
            padding: 8px 13px 8px 13px;
        }

        .container .header {
            background-color: #d3d3d3;
            padding: 2px;
            cursor: pointer;
            font-weight: bold;
        }

        .wj-treeview {
            font-size: 120%;
            margin-bottom: 8px;
        }

        /* custom tree styles */
        .custom-tree.wj-treeview {
            color: #80044d;
        }

            /* default nodes */
            .custom-tree.wj-treeview .wj-node {
            }

            /* level 0 and deeper nodes */
            .custom-tree.wj-treeview .wj-nodelist > .wj-node {
                font-size: 120%;
                font-weight: bold;
            }

            /* level 1 and deeper nodes (smaller font, vertical line along the left) */
            .custom-tree.wj-treeview .wj-nodelist > .wj-nodelist > .wj-node,
            .custom-tree.wj-treeview .wj-nodelist > .wj-nodelist > .wj-nodelist {
                font-size: 110%;
                font-weight: normal;
                border-left: 4px solid rgba(128, 4, 77, 0.3);
            }

                /* level 2 and deeper nodes (smaller font, thinner border) */
                .custom-tree.wj-treeview .wj-nodelist > .wj-nodelist > .wj-nodelist > .wj-node,
                .custom-tree.wj-treeview .wj-nodelist > .wj-nodelist > .wj-nodelist > .wj-nodelist {
                    font-size: 100%;
                    font-style: italic;
                    opacity: 0.8;
                    border-left: 2px solid rgba(128, 4, 77, 0.3);
                }

            /* expanded node glyph */
            .custom-tree.wj-treeview .wj-nodelist .wj-node:before {
                content: "\e114";
                font-family: 'Glyphicons Halflings';
                top: 4px;
                border: none;
                opacity: .3;
                transition: all .3s cubic-bezier(.4,0,.2,1);
            }

            /* collapsed node glyph */
            .custom-tree.wj-treeview .wj-nodelist .wj-node.wj-state-collapsed:before,
            .custom-tree.wj-treeview .wj-nodelist .wj-node.wj-state-collapsing:before {
                transform: rotate(-180deg);
                transition: all .3s cubic-bezier(.4,0,.2,1);
            }

            /* selected node */
            .custom-tree.wj-treeview .wj-node.wj-state-selected {
                color: white;
                background: rgba(128, 4, 77, 0.70);
            }
    </style>

    <script type="text/javascript"> 
        $(function () {

            $('input[name="ctl00$MainContent$daterange"]').daterangepicker({
                opens: 'left',
                maxDate: moment(),
                autoUpdateInput: false,
                locale: {
                    format: 'DD/MM/YYYY',
                    cancelLabel: 'Limpar',
                    applyLabel: 'Aplicar',
                    language: 'pt-br',
                    daysOfWeek: [
                        "Dom",
                        "Seg",
                        "Ter",
                        "Qua",
                        "Qui",
                        "Sex",
                        "Sab"
                    ],
                    monthNames: [
                        "Janeiro",
                        "Fevereiro",
                        "Março",
                        "Abril",
                        "Maio",
                        "Junho",
                        "Julho",
                        "Agosto",
                        "Setembro",
                        "Outubro",
                        "Novembro",
                        "Dezembro"
                    ]
                }
            });

            $('input[name="ctl00$MainContent$daterange"]').on('apply.daterangepicker', function (ev, picker) {
                $(this).val(picker.startDate.format('DD/MM/YYYY') + ' à ' + picker.endDate.format('DD/MM/YYYY'));
            });

            $('input[name="ctl00$MainContent$daterange"]').on('cancel.daterangepicker', function (ev, picker) {
                $(this).val('');
            });

            $('input[name="ctl00$MainContent$lblData"]').daterangepicker({
                opens: 'left',
                maxDate: moment(),
                autoUpdateInput: false,
                singleDatePicker: true,
                locale: {
                    format: 'DD/MM/YYYY',
                    cancelLabel: 'Limpar',
                    applyLabel: 'Aplicar',
                    language: 'pt-br',
                    daysOfWeek: [
                        "Dom",
                        "Seg",
                        "Ter",
                        "Qua",
                        "Qui",
                        "Sex",
                        "Sab"
                    ],
                    monthNames: [
                        "Janeiro",
                        "Fevereiro",
                        "Março",
                        "Abril",
                        "Maio",
                        "Junho",
                        "Julho",
                        "Agosto",
                        "Setembro",
                        "Outubro",
                        "Novembro",
                        "Dezembro"
                    ]
                }
            });

            $('input[name="ctl00$MainContent$lblData"]').on('apply.daterangepicker', function (ev, picker) {
                $(this).val(picker.startDate.format('DD/MM/YYYY'));
            });

            $('input[name="ctl00$MainContent$lblData"]').on('cancel.daterangepicker', function (ev, picker) {
                $(this).val('');
            });

        });

        $('.selectpicker').select2();
        $("#success-alert").hide();
        $("#dangerAlert").hide();

        $("#MainContent_dangerAlert").fadeTo(8000, 500).slideUp(500, function () {
            $("#MainContent_dangerAlert").slideUp(500);
        });

        function alertSucess() {
            $("#success-alert").fadeTo(8000, 500).slideUp(500, function () {
                $("#success-alert").slideUp(500);
            });
        }

        function alertExcluir() {
            $("#dangerAlert").fadeTo(8000, 500).slideUp(500, function () {
                $("#dangerAlert").slideUp(500);
            });
        }

        function alertMsg() {
            swal({
                title: "Atenção!",
                text: "Os dados excluídos não poderão ser recuperados!",
                icon: "warning",
                button: "Ok!"
            });
        }

        function alertCampos() {
            swal({
                title: "Atenção!",
                text: "Preencha todos os campos antes de prosseguir!",
                icon: "warning",
                button: "Voltar!"
            });

            var titulo = document.getElementById("MainContent_lblTitulo");
            var assunto = document.getElementById("MainContent_lblAssunto");
            var data = document.getElementById("MainContent_lblData");
            var tipo = document.getElementById("MainContent_selTipo");
            var local = document.getElementById("MainContent_selLocal");
            var acesso = document.getElementById("MainContent_selAcesso");
            var arquivo = document.getElementById("MainContent_FileUpload");

            if (titulo.value == "") {

                document.getElementById("MainContent_lblTitulo").classList.remove('is-invalid');
                document.getElementById("MainContent_lblTitulo").classList.remove('is-valid');
                document.getElementById("MainContent_lblTitulo").classList.add('is-invalid');
            }
            else {

                document.getElementById("MainContent_lblTitulo").classList.remove('is-invalid');
                document.getElementById("MainContent_lblTitulo").classList.remove('is-valid');
                document.getElementById("MainContent_lblTitulo").classList.add('is-valid');
            }

            if (assunto.value == "") {

                document.getElementById("MainContent_lblAssunto").classList.remove('is-invalid');
                document.getElementById("MainContent_lblAssunto").classList.remove('is-valid');
                document.getElementById("MainContent_lblAssunto").classList.add('is-invalid');
            }
            else {

                document.getElementById("MainContent_lblAssunto").classList.remove('is-invalid');
                document.getElementById("MainContent_lblAssunto").classList.remove('is-valid');
                document.getElementById("MainContent_lblAssunto").classList.add('is-valid');
            }

            if (data.value == "") {

                document.getElementById("MainContent_lblData").classList.remove('is-invalid');
                document.getElementById("MainContent_lblData").classList.remove('is-valid');
                document.getElementById("MainContent_lblData").classList.add('is-invalid');
            }
            else {

                document.getElementById("MainContent_lblData").classList.remove('is-invalid');
                document.getElementById("MainContent_lblData").classList.remove('is-valid');
                document.getElementById("MainContent_lblData").classList.add('is-valid');
            }

            if (tipo.value == "") {

                document.getElementById("MainContent_selTipo").classList.remove('is-invalid');
                document.getElementById("MainContent_selTipo").classList.remove('is-valid');
                document.getElementById("MainContent_selTipo").classList.add('is-invalid');
            }
            else {

                document.getElementById("MainContent_selTipo").classList.remove('is-invalid');
                document.getElementById("MainContent_selTipo").classList.remove('is-valid');
                document.getElementById("MainContent_selTipo").classList.add('is-valid');
            }

            if (local.value == "") {

                document.getElementById("MainContent_selLocal").classList.remove('is-invalid');
                document.getElementById("MainContent_selLocal").classList.remove('is-valid');
                document.getElementById("MainContent_selLocal").classList.add('is-invalid');
            }
            else {

                document.getElementById("MainContent_selLocal").classList.remove('is-invalid');
                document.getElementById("MainContent_selLocal").classList.remove('is-valid');
                document.getElementById("MainContent_selLocal").classList.add('is-valid');
            }

            if (acesso.value == "") {

                document.getElementById("MainContent_selAcesso").classList.remove('is-invalid');
                document.getElementById("MainContent_selAcesso").classList.remove('is-valid');
                document.getElementById("MainContent_selAcesso").classList.add('is-invalid');
            }
            else {

                document.getElementById("MainContent_selAcesso").classList.remove('is-invalid');
                document.getElementById("MainContent_selAcesso").classList.remove('is-valid');
                document.getElementById("MainContent_selAcesso").classList.add('is-valid');
            }

            if (arquivo.value == "") {

                document.getElementById("MainContent_FileUpload").classList.remove('is-invalid');
                document.getElementById("MainContent_FileUpload").classList.remove('is-valid');
                document.getElementById("MainContent_FileUpload").classList.add('is-invalid');
            }
            else {

                document.getElementById("MainContent_FileUpload").classList.remove('is-invalid');
                document.getElementById("MainContent_FileUpload").classList.remove('is-valid');
                document.getElementById("MainContent_FileUpload").classList.add('is-valid');
            }

            return false;
        }

        $(".header").click(function () {

            $header = $(this);
            //getting the next element
            $content = $header.next();
            //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.
            $content.slideToggle(100, function () {
                //execute this after slideToggle is done
                //change text of header based on visibility of content div
                $header.text(function () {
                    //change text based on condition
                    return $content.is(":visible") ? "Collapse" : "Expand";
                });
            });

        });

    </script>
</asp:Content>


