<%@ Page Title="Atas Reuniões" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="gestaoReunioesAta.aspx.vb" Inherits="MemberPages_Reunioes_Ata_gestaoReunioesAta" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <aspxcallbackpanel id="cbPanel" runat="server" width="95%" theme="Metropolis" clientinstancename="cbPanel" settingsloadingpanel-text="Atualizando">
        <panelcollection>
            <panelcontent>
                <div class="container justify-content-center" style="max-width: 98%" runat="server" id="divMenu" visible="True">
                    <div class="py-5 text-center">
                        <img class="d-block mx-auto mb-4" src="../../image/LogoCondor_Vermelho_25-sem-fundo.png" alt="" width="350" height="90">
                        <p class="lead">Envio e consulta de atas de reuniões</p>
                    </div>
                    <div class="row col-md-12 justify-content-center text-center" runat="server" id="divFiltros">
                        <div class="col-md-2 justify-content-center" style="justify-content: space-between;">
                            <span class="input-group-text justify-content-center">Registrar</span>
                            <asp:Button ID="btnNovaAta" Width="180px" Height="180px" CssClass="btn btn-lg" runat="server" OnClick="btnNovaAta_Click" Style="background-image: url('../../image/icons8-add-properties-80.png'); background-repeat: no-repeat; background-size: 180px" ToolTip="Registrar nova Ata" />
                        </div>
                        <div class="col-1" style="max-width: 50px"></div>
                        <div class="col-md-2 mb-1 justify-content-center" style="justify-content: space-between;">
                            <span class="input-group-text justify-content-center">Consultar</span>
                            <asp:Button ID="btnConsulta" Width="180px" Height="180px" CssClass="btn btn-lg justify-content-center" runat="server" OnClick="btnConsulta_Click" Style="background-image: url('../../image/icons8-search-property-80.png'); background-repeat: no-repeat; background-size: 180px" ToolTip="Consultar Atas" />

                        </div>
                    </div>
                </div>

                <div class="row col-11 justify-content-end" runat="server" style="padding: 25px 0 50px 0" id="divVoltar" visible="false">
                    <asp:Button runat="server" ID="btnVoltar" OnClick="btnVoltar_Click" autopostback="false" CssClass="btn btn-danger btn-lg" Text="Voltar" Width="100px" />
                </div>

                <%--Menu inserir nova ata--%>
                <div class="container justify-content-center" runat="server" id="divNovaAta" visible="false" style="padding: 0 50px 0 50px">
                    <hr class="mb-3">
                    <br />
                    <div class="col-md-12 justify-content-center">
                        <div class="row justify-content-center">
                            <div class="col-md-5">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Titulo</span>
                                    </div>
                                    <input type="text" class="form-control justify-content-center" maxlength="50" id="lblTitulo" runat="server">
                                </div>
                            </div>

                            <div class="col-md-5">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Assunto</span>
                                    </div>
                                    <input type="text" class="form-control justify-content-center" maxlength="50" id="lblAssunto" runat="server">
                                </div>
                            </div>
                            
                        </div>

                        <br />

                        <div class="row justify-content-sm-center">
                            <div class="col-auto" style="max-width: 200px">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Data</span>
                                    </div>
                                    <input type="text" class="form-control xs" autopostback="false" runat="server" id="lblData" />
                                </div>
                            </div>

                            <div class="col-auto" style="min-width: 200px">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Tipo</span>
                                    </div>
                                    <select id="selTipo" runat="server" class="form-control justify-content-center">
                                        <option value="" selected></option>
                                        <option value="Presencial">Presencial</option>
                                        <option value="On-line">On-line</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-auto">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Local</span>
                                    </div>
                                    <select id="selLocal" runat="server" class="form-control justify-content-center "></select>
                                </div>
                            </div>
                        </div>

                        <br />

                        <div class="row justify-content-center">

                            <div class="col-auto">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Lista de Acesso</span>
                                    </div>
                                    <select id="selAcesso" runat="server" class="form-control justify-content-center selectpicker" multiple="true"></select>
                                </div>
                            </div>

                            <div class="col-5">
                                <asp:FileUpload type="file" class="form-control justify-content-center" Style="height: auto" aria-label="file example" runat="server" ID="FileUpload" AllowMultiple="true" autopostback="false" />
                            </div>
                        </div>

                        <br />
                        <hr class="mb-3">
                        <br />

                        <div class="row justify-content-sm-center">
                            <button type="button" class="btn btn-primary btn-lg" style="width: auto" data-toggle="modal" data-target="#ModalConfirm">Enviar</button>
                        </div>

                        <br />

                        <div class="alert alert-success" id="success-alert" style="text-align: center">
                            <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>Successo! </strong>Foi criado uma nova ata seguindo os parâmetos informados. 
                            <br />
                            <br />
                            Para visualizar volte no menu anterior e acesse a opção <strong>Consulta</strong>.
                        </div>
                    </div>

                    <!-- Modal -->
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
                                    <asp:Button ID="btnChange" runat="server" Text="Enviar dados" OnClick="btnSubmit_Click" CssClass="btn btn-success btn-md justify-content-around" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Menu Consulta de Atas--%>
                <div id="divConsulta" runat="server" visible="false">
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
                            <asp:Button type="button" class="btn btn-info" runat="server" ID="btnFiltro" Style="height: 50px; width: 110px" OnClick="btnFiltrar_Click" Text="Aplicar filtro" />
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
                        <span class="input-group-text justify-content-center" style="height: 45px">Atas Registradas
                        <br />
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
            </panelcontent>
        </panelcollection>
    </aspxcallbackpanel>

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

    <script src="../../assets/bootstrap-5.0.2-dist/Modal/jquery.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/bootstrap.min.js"></script>
    <link href="../../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/jquery.min.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/moment.min.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../assets/datepickerRange/daterangepicker.css" />
    <link href="../../assets/bootstrap-select-1.13.14/select2.min.css" rel="stylesheet" />
    <script src="../../assets/bootstrap-select-1.13.14/select2.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

