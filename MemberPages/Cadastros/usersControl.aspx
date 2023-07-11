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

            document.getElementById('MainContent_divNovaAta').style.display = 'block';

            $("#success-alert").fadeTo(8000, 500).slideUp(500, function () {
                $("#success-alert").slideUp(500);
            });
        };

        function hiddenInit() {
            document.getElementById('MainContent_divMenu').style.display = 'block';
        };

        function showWindow(url) {
            if (url == "new_user") {
                document.getElementById('MainContent_divMenu').style.display = 'none';
                document.getElementById('MainContent_divNovaAta').style.display = 'block';
                document.getElementById('MainContent_divConsulta').style.display = 'none';
            }

            if (url == "find_user") {
                document.getElementById('MainContent_divMenu').style.display = 'none';
                document.getElementById('MainContent_divNovaAta').style.display = 'none';
                document.getElementById('MainContent_divConsulta').style.display = 'block';

            }
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
                                                <li><a href="#" class="link-dark rounded">Alterar</a></li>
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
                                                <li><a href="#" class="link-dark rounded">Cadastrar</a></li>
                                                <li><a href="#" class="link-dark rounded">Consultar</a></li>
                                                <li><a href="#" class="link-dark rounded">Alterar</a></li>
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
                                                Modal="True" Text="Salvando. Aguarde...">
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

                                <%--Cadastro de Usuario--%>
                                <asp:Panel ID="panCadastroUsuario" runat="server" CssClass="justify-content-center">
                                    <br />
                                    <div class="container justify-content-center" runat="server" id="divNovaAta" style="padding: 0 50px 0 50px; display: none">
                                        <hr class="mb-3">
                                        <br />
                                        <div class="col-sm-12">
                                            <div class="row justify-content-center">
                                                <div class="col-auto justify-content-center" style="width: 350px">
                                                    <span class="col-auto input-group-text justify-content-center">Login</span>
                                                    <input type="text" class="form-control justify-content-center text-center" maxlength="50" id="lblLogin" runat="server">
                                                </div>
                                                <div class="col-auto justify-content-center" style="width: 350px">
                                                    <span class="col-auto input-group-text justify-content-center">Tipo</span>
                                                    <div class="form-control justify-content-center text-center">
                                                        <div class="form-check form-check-inline form-switch">
                                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="chkLoja" value="1" checked="checked">
                                                            <label class="form-check-label" for="inlineRadio1">Loja</label>
                                                        </div>
                                                        <div class="form-check form-check-inline form-switch">
                                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="chkAdm" value="2">
                                                            <label class="form-check-label" for="inlineRadio2">Adm</label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <br />

                                            <div class="row justify-content-center">

                                                <div class="col-auto justify-content-center text-center" style="width: 350px">
                                                    <span class="col-auto input-group-text justify-content-center">Departamento</span>
                                                    <select id="selLocal" runat="server" class="form-control justify-content-center text-left"></select>
                                                </div>

                                                <div class="col-auto justify-content-center" style="width: 350px">
                                                    <span class="col-auto input-group-text justify-content-center">É loja:</span>
                                                    <div class="form-control justify-content-center text-center">
                                                        <div class="form-check form-switch">
                                                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <br />

                                            <div class=" row justify-content-center text-center">
                                                <div class="col-auto justify-content-center text-center" style="width: 350px">
                                                    <span class="col-auto input-group-text justify-content-center">Tipo</span>
                                                    <asp:DropDownList class="form-control text-center" ID="selTipo" runat="server" DataTextField="Desc" AutoPostBack="true" OnSelectedIndexChanged="selTipo_SelectedIndexChanged"></asp:DropDownList>

                                                </div>
                                                <div class="col-auto justify-content-center text-center" style="width: 350px">
                                                    <span class="col-auto input-group-text justify-content-center">Filial</span>
                                                    <asp:DropDownList class="form-control " ID="selFilial" runat="server" DataTextField="Desc"></asp:DropDownList>
                                                </div>
                                            </div>

                                            <br />

                                            <div class="row justify-content-sm-center">
                                                <button type="button" class="btn btn-primary btn-md" style="width: auto" onclick="  ">Cadastrar</button>
                                            </div>

                                            <br />
                                            <hr class="mb-3">
                                        </div>

                                        <!-- Modal 
                                        <div class="modal fade w-auto h-auto" id="ModalConfirm" tabindex="-1" role="dialog" aria-labelledby="ModalAtendLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>

                                                    <div class="modal-body">
                                                        <div class="alert alert-warning" role="alert" style="text-align: center">
                                                            <div style="text-align: center">
                                                                <h5 class="modal-title" id="ModalAtendLabel"><strong>Atenção!</strong></h5>
                                                                <br />
                                                                <strong>Os dados enviados não poderão ser alterados!</strong>
                                                                <br />
                                                                <br />
                                                                <strong>você confirma que os dados informados estão corretos?</strong>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer justify-content-between">
                                                        <button type="button" class="btn btn-danger btn-md" data-dismiss="modal" runat="server" id="btnCancelar">Cancelar</button>
                                                        <asp:Button ID="btnChange" runat="server" Text="Enviar dados" CssClass="btn btn-success btn-md justify-content-around" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>-->

                                    </div>

                                    <div class="alert alert-success" id="success-alert" style="text-align: center">
                                        <button type="button" class="close" data-dismiss="alert">x</button>
                                        <strong>Successo! </strong>Usuário criado com sucesso!<br />
                                        <br />
                                        Para visualizar acesse a opção <strong>Consulta</strong>.
                                    </div>

                                </asp:Panel>

                                <%--Consulta de Usuario--%>
                                <asp:Panel ID="panConsultaUsuario" runat="server" CssClass="justify-content-center">
                                    <br />

                                    <div id="divConsulta" style="display: none" runat="server">
                                        <div class="row col-12 justify-content-center" runat="server" id="divFiltro">
                                            <br />
                                            <div class="col-auto xs">
                                                <span class="input-group-text justify-content-center sm">Data</span>
                                                <input type="text" class="form-control xs" name="daterange" autopostback="false" runat="server" id="daterange" />
                                            </div>

                                            <div class="col-auto">
                                                <span class="input-group-text justify-content-center">Local</span>
                                                <select id="selLocalConsulta" runat="server" class="form-control justify-content-center"></select>
                                            </div>

                                            <div class="col-auto justify-content-center" style="padding: 13px 0px 13px 0px">
                                                <dx:ASPxButton ID="btnFiltrar" runat="server" Text="Consultar" AutoPostBack="false" ForeColor="White" Font-Bold="true" CssClass="btn btn-info" OnClick="btnFiltrar_Click" CssFilePath="~/assets/bootstrap-5.0.2-dist/css/bootstrap.css">
                                                    <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Localizando informações...');}" />
                                                </dx:ASPxButton>
                                                <%--<asp:Button type="button" class="btn btn-info" runat="server" ID="btnFiltro" Style="height: 50px; width: 110px" OnClientClick="btnFiltrar_Click" Text="Aplicar filtro" />--%>
                                            </div>
                                            <p>
                                                <br />
                                            </p>
                                        </div>

                                        <div class="alert alert-danger" id="dangerAlert" style="text-align: center">
                                            <button type="button" class="close" data-dismiss="alert">x</button>
                                            <strong>Successo! </strong>O registro foi deletado.
                                        <br />
                                        </div>

                                        <div class="container col-7 justify-content-center" runat="server" id="divGrid">
                                            <span class="input-group-text justify-content-center" style="height: 45px">Atas Registradas<br />
                                            </span>
                                            <br />

                                            <asp:GridView ID="grvDados" CssClass="gwFormat" HeaderStyle-BackColor="#CED4DA" HeaderStyle-ForeColor="Black" KeyFieldName="id"
                                                RowStyle-BackColor="#E9ECEF" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000" GridLines="None"
                                                runat="server" AutoGenerateColumns="false" BorderStyle="none" Style="margin: 0 auto 0 auto !important" HeaderStyle-Height="40px" RowStyle-Height="50px" HeaderStyle-HorizontalAlign="Center"
                                                RowStyle-HorizontalAlign="Center" EmptyDataText="<b>Não existem registros para os parâmetros informados!</b>" CellPadding="15" CellSpacing="10" OnRowDataBound="grvDados_RowDataBound">
                                                <Columns>
                                                    <asp:BoundField DataField="id" HeaderText="ID" />
                                                    <asp:BoundField DataField="Titulo" HeaderText="Título" />
                                                    <asp:BoundField DataField="Assunto" HeaderText="Assunto" />
                                                    <asp:BoundField DataField="Data" HeaderText="Data" />
                                                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                                                    <asp:BoundField DataField="Unidade" HeaderText="Local" />
                                                    <asp:BoundField DataField="Arquivo" HeaderText="Arquivos" />
                                                    <asp:TemplateField ItemStyle-Width="80px">
                                                        <ItemTemplate>
                                                            <asp:Button ID="btnExcluir" runat="server" AutoPostBack="False" CommandName='<%# Eval("ID")%>' OnClientClick='var x = confirm("Tem certeza que deseja excluir o registro?"); if (x == false) {alertMsg();}; return x;' OnClick="btnExcluir_Click" CssClass="btn btn-danger btn-sm" Text="Excluir" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <PagerStyle HorizontalAlign="Center" Height="50px" VerticalAlign="Middle" CssClass="gwFormat" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <br />
                                </asp:Panel>

                            </panelcontent>
                        </panelcollection>
                    </aspxcallbackpanel>
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

    </script>
</asp:Content>


