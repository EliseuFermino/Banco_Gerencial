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

    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script>

        function alertSucess(param) {
            //document.getElementById('MainContent_divNewUser').style.display = 'none';
            //document.getElementById('success-alert').style.display = 'block';

            swal({
                title: "Sucesso!",
                text: "As informações foram gravadas com sucesso!",
                icon: "success",
                button: "Voltar!"
            });

            showWindow(param);
        };

        function alertErro(param) {
            //document.getElementById('MainContent_divNewUser').style.display = 'none';
            //document.getElementById('danger-alert').style.display = 'block';

            swal({
                title: "Erro!",
                text: "Guarde as informações e entre em contato com o suporte - Controladoria",
                icon: "error",
                button: "Voltar!",
                return: false
            });

            showWindow(param);
        };

        function hiddenInit() {
            //alterar para block depois de funcionar inserir novo cadastro
            document.getElementById('MainContent_divMenu').style.display = 'block';
        };

        function showWindow(url) {

            document.getElementById('MainContent_divMenu').style.display = 'none';
            document.getElementById('MainContent_divNewUser').style.display = 'none';
            document.getElementById('MainContent_divFindUser').style.display = 'none';
            document.getElementById('MainContent_divAlterUser').style.display = 'none';
            document.getElementById('MainContent_divMenuExcecao').style.display = 'none';
            document.getElementById('MainContent_divNewRole').style.display = 'none';
            document.getElementById('MainContent_divParamMenu').style.display = 'none';
            document.getElementById('MainContent_divNewMenu').style.display = 'none';

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

            if (url == "new_menu") {
                document.getElementById('MainContent_divNewMenu').style.display = 'block';
            }
        };

        function alertTxt(elementId) {

            var x = document.getElementById(elementId);

            if (x.value == "") {

                document.getElementById(elementId).classList.remove('is-invalid');
                document.getElementById(elementId).classList.remove('is-valid');
                document.getElementById(elementId).classList.add('is-invalid');
            }
            else {

                document.getElementById(elementId).classList.remove('is-invalid');
                document.getElementById(elementId).classList.remove('is-valid');
                document.getElementById(elementId).classList.add('is-valid');
            }
        }

        function alertSelect(elementId) {

            var x = document.getElementById(elementId);

            if (x.value == "0") {

                document.getElementById(elementId).classList.remove('is-invalid');
                document.getElementById(elementId).classList.remove('is-valid');
                document.getElementById(elementId).classList.add('is-invalid');
            }
            else {

                document.getElementById(elementId).classList.remove('is-invalid');
                document.getElementById(elementId).classList.remove('is-valid');
                document.getElementById(elementId).classList.add('is-valid');
            }
        }

        function alertCampos() {

            swal({
                title: "Atenção!",
                text: "Preencha todos os campos antes de prosseguir!",
                icon: "warning",
                button: "Voltar!",
                return: false
            });

            alertTxt("MainContent_txtFirstName");
            alertTxt("MainContent_txtLastName");
            alertTxt("MainContent_txtLoginNew");
            alertTxt("MainContent_txtEmail");
            alertSelect("MainContent_selPerfilNewUser");

            showWindow("new_user");

            return false;
        };

        function alertCamposAlterDepto() {

            swal({
                title: "Atenção!",
                text: "Preencha todos os campos antes de prosseguir!",
                icon: "warning",
                button: "Voltar!",
                return: false
            });

            alertTxt("MainContent_txtLoginAlterPerfil");
            alertSelect("MainContent_selPerfilAlterUser");

            showWindow("alter_user");

            return false;
        };

        function alertCamposResetSenha() {

            swal({
                title: "Atenção!",
                text: "Preencha todos os campos antes de prosseguir!",
                icon: "warning",
                button: "Voltar!",
                return: false
            });

            alertTxt("MainContent_txtLoginReset");

            showWindow("alter_user");

            return false;
        };

        function alertCamposAlterFilial() {

            swal({
                title: "Atenção!",
                text: "Preencha todos os campos antes de prosseguir!",
                icon: "warning",
                button: "Voltar!",
                return: false
            });

            alertTxt("MainContent_txtLoginAlterFilial");

            showWindow("alter_user");

            return false;
        };

        function alertCamposInativar() {

            swal({
                title: "Atenção!",
                text: "Preencha todos os campos antes de prosseguir!",
                icon: "warning",
                button: "Voltar!",
                return: false
            });

            alertTxt("MainContent_txtLoginInativar");

            showWindow("alter_user");

            return false;
        };

        function alertCamposNewPerfil() {

            swal({
                title: "Atenção!",
                text: "Preencha todos os campos antes de prosseguir!",
                icon: "warning",
                button: "Voltar!",
                return: false
            });

            alertTxt("MainContent_txtNewPerfil");

            showWindow("new_role");

            return false;
        };

        function alertCamposNewPerfilModel() {

            swal({
                title: "Atenção!",
                text: "Preencha todos os campos antes de prosseguir!",
                icon: "warning",
                button: "Voltar!",
                return: false
            });

            alertTxt("MainContent_txtDuplicarPerfil");
            alertSelect("MainContent_selPerfilDuplicar");

            showWindow("new_role");

            return false;
        };

        function alertTeste(param, menu) {

            swal({
                title: "Atenção!",
                text: param,
                icon: "warning",
                button: "Ok!",
                return: false
            });

            showWindow(menu);

            return false;
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
                                        <div class="collapse show" id="user-collapse">
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
                                        <div class="collapse show" id="perfil-collapse" style="">
                                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                                <li><a onclick="javascript:showWindow('new_role');" href="#" class="link-dark rounded">Cadastrar</a></li>
                                                <li><a onclick="javascript:showWindow('param_menu');" href="#" class="link-dark rounded">Parametrizar Menus</a></li>
                                            </ul>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <li class="border-top my-3"></li>
                            <li class="mb-1" style="display: block">
                                <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                    <li>Menu</li>
                                    <li>
                                        <div class="collapse show" id="menu-collapse" style="">
                                            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                                                <li><a onclick="javascript:showWindow('new_menu');" href="#" class="link-dark rounded">Cadastrar Menu</a></li>
                                            </ul>
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
                                <asp:Panel ID="panCadastroUsuario" runat="server" CssClass="justify-content-center" DefaultButton="btnSubmit">
                                    <div class="container justify-content-center" runat="server" id="divNewUser" style="padding: 15px 15px 15px 15px; display: none">
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
                                                        <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="txtLoginNew" runat="server">
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
                                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rdLoja" runat="server" value="Loja" checked />
                                                                <label class="form-check-label" for="inlineRadio1">Loja</label>
                                                            </div>

                                                            <div class="form-check form-check-inline form-switch">
                                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rdAdm" runat="server" value="Adm" />
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
                                                            <input class="form-check-input" type="checkbox" id="isLoja" runat="server" checked>
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
                                <asp:Panel ID="panConsultaUsuario" runat="server" CssClass="justify-content-center" DefaultButton="btnConsulta">
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
                                                    <option value="4">Perfil</option>
                                                </select>
                                            </div>
                                            <br />
                                            <div class="col-auto xs" style="width: 300px" runat="server">
                                                <span class="input-group-text justify-content-center sm">Parâmetro</span>
                                                <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="txtParamConsulta" runat="server">
                                            </div>

                                            <div class="col-auto justify-content-center" style="padding: 20px 15px 15px 15px">
                                                <asp:Button runat="server" OnClick="btnConsulta_Click" Width="125px" Height="35px" class="btn btn-primary btn-md" Text="Consultar" ID="btnConsulta" />
                                            </div>

                                        </div>

                                        <p>
                                            <br />
                                        </p>

                                        <div class="container col-12 justify-content-center" runat="server" id="divGrid">
                                            <asp:GridView ID="grvDados" CssClass="gwFormat" HeaderStyle-BackColor="#CED4DA" HeaderStyle-ForeColor="Black" KeyFieldName="id"
                                                RowStyle-BackColor="#E9ECEF" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000" GridLines="None"
                                                runat="server" AutoGenerateColumns="false" BorderStyle="none" Style="margin: 0 auto 0 auto !important" HeaderStyle-Height="40px" RowStyle-Height="50px" HeaderStyle-HorizontalAlign="Center"
                                                RowStyle-HorizontalAlign="Center" EmptyDataText="<b>Não foram encontrados usuários para os parâmetros informados!</b>" CellPadding="15" CellSpacing="10" OnRowDataBound="grvDados_RowDataBound">
                                                <Columns>
                                                    <asp:BoundField DataField="Name" HeaderText="Nome" />
                                                    <asp:BoundField DataField="Login" HeaderText="Login" />
                                                    <asp:BoundField DataField="Email" HeaderText="Email" />
                                                    <asp:BoundField DataField="Depto" HeaderText="Perfil" />
                                                    <asp:BoundField DataField="CreateDate" HeaderText="Criação" />
                                                    <asp:BoundField DataField="LastLoginDate" HeaderText="Ultimo Login" />
                                                    <asp:BoundField DataField="FilialDesc" HeaderText="Filial" />
                                                    <asp:BoundField DataField="Ativo" HeaderText="Status" />
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

                                            <div class="col-4" runat="server">
                                                <div class="input-group input-group xs" style="max-height: 30px">
                                                    <div class="input-group-prepend xs">
                                                        <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Login</span>
                                                    </div>
                                                    <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="txtLoginReset" runat="server">
                                                </div>
                                            </div>

                                            <div class="col-4"></div>

                                            <div class="col-2 justify-content-end" style="padding-right: 25px">
                                                <asp:Button runat="server" OnClick="btnResetarSenha_Click" Width="125px" Height="35px" class="btn btn-warning btn-md" Text="Executar" ID="btnResetarSenha" />
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
                                                <asp:Button runat="server" OnClick="btnAlterDepto_Click" Width="125px" Height="35px" class="btn btn-warning btn-md" Text="Executar" ID="btnAlterDepto" />
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
                                                    <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="txtLoginAlterFilial" runat="server">
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
                                                <asp:Button runat="server" OnClick="btnAlterFilial_Click" Width="125px" Height="35px" class="btn btn-warning btn-md" Text="Executar" ID="btnAlterFilial" />
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
                                                <asp:Button runat="server" OnClick="btnBlockUser_Click" Width="125px" Height="35px" class="btn btn-danger btn-md" Text="Executar" ID="btnBlockUser" />
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

                                        <%--Novo Perfil--%>
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
                                                    <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="txtNewPerfil" runat="server">
                                                </div>
                                            </div>

                                            <div class="col-4"></div>

                                            <div class="col-2 justify-content-end" style="padding-right: 25px">
                                                <asp:Button runat="server" OnClick="btnNewPerfil_Click" Width="125px" Height="35px" class="btn btn-warning btn-md" Text="Executar" ID="btnNewPerfil" />
                                            </div>
                                        </div>
                                        <hr class="mb-3">

                                        <%--Duplicar Perfil--%>
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
                                                    <asp:DropDownList class="form-control text-center" ID="selPerfilDuplicar" runat="server" DataTextField="Desc" AutoPostBack="false"></asp:DropDownList>
                                                </div>
                                            </div>

                                            <div class="col-4">
                                                <div class="input-group input-group xs" style="max-height: 30px" runat="server">
                                                    <div class="input-group-prepend xs">
                                                        <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Nome (Perfil)</span>
                                                    </div>
                                                    <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="txtDuplicarPerfil" runat="server">
                                                </div>
                                            </div>

                                            <div class="col-2 justify-content-center" style="padding-right: 25px">
                                                <asp:Button runat="server" OnClick="btnDuplicarPerfil_Click" Width="125px" Height="35px" class="btn btn-warning btn-md" Text="Executar" ID="btnDuplicarPerfil" />
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

                                <%--Menu--%>
                                <%--Cadastro de Menu--%>
                                <asp:Panel ID="pnlNewMenu" runat="server" CssClass="justify-content-center">
                                    <div class="container justify-content-center" runat="server" id="divNewMenu" style="padding: 15px 15px 15px 15px; display: none">
                                        <hr class="mb-3">
                                        <br />
                                        <div class="col-md-12">
                                            <div class="row justify-content-between">
                                                <div class="col-4 justify-content-center" style="min-width: 100px">
                                                    <span class="col-auto input-group-text justify-content-center">Tipo</span>
                                                    <div class="justify-content-center text-center">
                                                       <div class="form-control" style="padding-top: 10px">
                                                            <div class="form-check form-check-inline form-switch">
                                                                <label class="form-check-label" for="rdlMenu">Barra de Menu</label>
                                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rdlMenuBarra" runat="server" value="1" checked />
                                                            </div>
                                                            <div class="form-check form-check-inline form-switch">
                                                                <label class="form-check-label" for="rdlMenu">Menu Interno</label>
                                                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="rdlMenuInterno" runat="server" value="2" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <div class="input-group-prepend xs">
                                                                <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Matrícula</span>
                                                            </div>
                                                        </div>
                                                        <input type="number" class="form-control justify-content-center text-center" maxlength="50" id="Number1" runat="server">
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <div class="input-group-prepend xs">
                                                                <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Perfil</span>
                                                            </div>
                                                        </div>
                                                        <asp:DropDownList class="form-control text-center" ID="DropDownList1" runat="server" DataTextField="Desc" AutoPostBack="false"></asp:DropDownList>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row justify-content-between">
                                                <div class="col-4">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Nome</span>
                                                        </div>
                                                        <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="Text1" runat="server">
                                                    </div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Sobrenome</span>
                                                        </div>
                                                        <input type="text" class="form-control justify-content-center text-center" maxlength="100" id="Text2" runat="server">
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
                                                        <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="Text3" runat="server">
                                                    </div>
                                                </div>
                                                <div class="col-8">
                                                    <div class="input-group input-group xs" style="max-height: 30px">
                                                        <div class="input-group-prepend xs">
                                                            <div class="input-group-prepend xs">
                                                                <span class="col-auto input-group-text justify-content-center" style="min-width: 110px">Email</span>
                                                            </div>
                                                        </div>
                                                        <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="Text4" runat="server">
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row justify-content-between text-center">
                                                <div class="col-2 justify-content-center" style="min-width: 100px">
                                                    <span class="col-auto input-group-text justify-content-center">É loja:</span>
                                                    <div class="form-control justify-content-center text-center">
                                                        <div class="form-check form-switch">
                                                            <input class="form-check-input" type="checkbox" id="Checkbox1" runat="server" checked>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-2 justify-content-center text-center">
                                                    <span class="col-auto input-group-text justify-content-center">Tipo</span>
                                                    <asp:DropDownList class="form-control text-center" ID="DropDownList2" runat="server" DataTextField="Desc" AutoPostBack="true" OnSelectedIndexChanged="selTipo_SelectedIndexChanged"></asp:DropDownList>
                                                </div>
                                                <div class="col-8 justify-content-center text-center">
                                                    <span class="col-auto input-group-text justify-content-center">Filial</span>
                                                    <asp:DropDownList class="form-control " ID="DropDownList3" runat="server" DataTextField="Desc"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <br />
                                            <div class="row justify-content-sm-center">
                                                <asp:Button runat="server" OnClick="btnSubmit_Click" Width="200px" class="btn btn-primary btn-md" Text="Cadastrar" ID="Button1" />
                                            </div>
                                            <br />
                                            <hr class="mb-3">
                                        </div>
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

                        <div class="alert alert-danger justify-content-center" id="danger-alert" style="text-align: center; display: none; max-width: 500px">
                            <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>Erro! </strong>Ocorreu um erro na criação do usuário!<br />
                            <br />
                            Valide as informações e qualquer coisa entre em contato com o suporte.
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

</asp:Content>


