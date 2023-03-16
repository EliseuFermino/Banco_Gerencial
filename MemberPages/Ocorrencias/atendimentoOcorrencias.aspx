<%@ Page Title="Consulta de Ocorrências" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="atendimentoOcorrencias.aspx.vb" Inherits="MemberPages_Ocorrencias_atendimentoOcorrencias" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <aspxcallbackpanel id="cbPanel" runat="server" width="100%" theme="Metropolis" clientinstancename="cbPanel" settingsloadingpanel-text="Atualizando">
        <panelcollection>
            <panelcontent>
                <div class="container justify-content-center" style="max-width: 98%">
                    <%-- <div class="py-5 text-center">
                        <img class="d-block mx-auto mb-4" src="../../image/LogoCondor_Vermelho_25-sem-fundo.png" alt="" width="350" height="90">
                        <p class="lead">Formulário de registro de ocorrências.</p>
                    </div>--%>
                    <p class="lead py-3 text-center">Gestão de Ocorrências</p>
                    <div class="row col-12 justify-content-center" runat="server" id="divFiltros">
                        <div class="col-md-10 justify-content-sm-center">
                            <span class="input-group-text justify-content-sm-center" style="height: 45px">Filtros
                        <br />
                            </span>
                            <br />
                            <div class="row col-auto justify-content-center sm">
                                <div class="col-auto xs">
                                    <span class="input-group-text justify-content-center sm">Data</span>
                                    <input type="text" class="form-control xs" name="daterange" autopostback="false" runat="server" id="daterange" />
                                </div>

                                <div class="col-auto">
                                    <span class="input-group-text justify-content-center">Unidade</span>
                                    <select id="selUnidade" runat="server" class="form-control justify-content-center"></select>
                                </div>

                                <div class="col-auto">
                                    <span class="input-group-text justify-content-center">Status</span>
                                    <select id="selStatus" runat="server" class="form-control justify-content-center"></select>
                                </div>

                                <div class="col-auto justify-content-center" style="padding: 13px 0px 13px 0px">
                                    <asp:Button type="button" class="btn btn-info" runat="server" ID="btnFiltro" Style="height: 50px; width: 110px" OnClick="btnFiltrar_Click" Text="Aplicar filtro" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />

                    <div class="row col-12 justify-content-center" runat="server" id="divOcorrencia">
                        <div class="col-6 justify-content-center">
                            <span class="input-group-text justify-content-sm-center" style="height: 45px">Ocorrências
                        <br />
                            </span>
                            <br />
                            <div class="row justify-content-center">
                                <asp:GridView ID="grvDados" CssClass="gwFormat" HeaderStyle-BackColor="#CED4DA" HeaderStyle-ForeColor="Black" EnableTheming="True" KeyFieldName="Dia" Theme="SoftOrange"
                                    RowStyle-BackColor="#E9ECEF" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000" GridLines="None"
                                    runat="server" AutoGenerateColumns="false" BorderStyle="none" HeaderStyle-Height="40px" RowStyle-Height="50px" HeaderStyle-HorizontalAlign="Center"
                                    RowStyle-HorizontalAlign="Center" EmptyDataText="<b>Nesse momento não existem ocorrências em aberto!</b>" CellPadding="15" CellSpacing="10">
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="ID" />
                                        <asp:BoundField DataField="Data_Requisicao" HeaderText="Data" />
                                        <asp:BoundField DataField="Solicitante" HeaderText="Solicitante" />
                                        <asp:BoundField DataField="Assunto" HeaderText="Assunto" />
                                        <asp:BoundField DataField="Unidade" HeaderText="Unidade" />
                                        <asp:TemplateField ItemStyle-Width="80px">
                                            <ItemTemplate>
                                                <asp:Button ID="Details" runat="server"
                                                    Text="Detalhes" OnClick="Details_Click" CommandName='<%# Eval("ID")%>' CssClass="btn btn-primary btn-sm" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <PagerStyle HorizontalAlign="Center" CssClass="GridPager" Height="50px" VerticalAlign="Middle" />
                                </asp:GridView>

                            </div>
                        </div>

                        <div class="col-6 justify-content-center" runat="server" id="divDetalhes" visible="false">
                            <div class="col-auto justify-content-sm-center">
                                <span class="input-group-text justify-content-sm-center" style="height: 45px">Detalhes
                        <br />
                                </span>
                                <br />

                                <%--Primeira Linha--%>
                                <div class="row col-auto">
                                    <div class="col-md-6">
                                        <span class="input-group-text justify-content-center">Atendente</span>
                                        <label runat="server" id="lblAtendente" class="form-control" style="text-align: center;"></label>
                                    </div>

                                    <div class="col-md-6">
                                        <span class="input-group-text justify-content-center">Setor</span>
                                        <label runat="server" id="lblSetor" class="form-control" style="text-align: center;"></label>
                                    </div>
                                </div>
                                <br />

                                <%--Segunda Linha--%>
                                <div class="row col-auto">
                                    <div class="col-md-6">
                                        <span class="input-group-text justify-content-center">Status</span>
                                        <label runat="server" id="lblStatus" class="form-control h-auto" style="text-align: center; font-size: 14px"></label>
                                    </div>

                                    <div class="col-md-6">
                                        <span class="input-group-text justify-content-center">Arquivos</span>
                                        <div class=" form-control justify-content-lg-center" runat="server" style="text-align: center;" id="divImgs">
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <%--Terceira Linha--%>
                                <div class="row col-auto">
                                    <div class="col-md-12">
                                        <span class="input-group-text justify-content-center">Descrição</span>
                                        <div id="divDesc" class="form-control h-auto justify-content-center" runat="server">
                                        </div>
                                    </div>
                                </div>
                                <br />

                                <div class="row col-auto justify-content-center">
                                    <div class="justify-content-center">
                                        <br />
                                        <button type="button" class="btn btn-success btn-md" data-toggle="modal" runat="server" id="btnAtend" data-target="#ModalAtend" title="Atendimento">Atendimento</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <label runat="server" id="lblID" visible="false"></label>

                <!-- Modal -->
                <div class="modal fade w-auto h-auto" id="ModalAtend" tabindex="-1" role="dialog" aria-labelledby="ModalAtendLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="ModalAtendLabel">Gestão da Ocorrência</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <div class="row col-auto">
                                    <div class="col-md-4">
                                        <span class="input-group-text justify-content-center">Status</span>
                                        <asp:DropDownList runat="server" AutoPostBack="false" ID="ddlStatusAtend" Style="text-align: center;" CssClass="form-control justify-content-lg-center">
                                            <asp:ListItem Text="Em Análise" Value="Em Análise"></asp:ListItem>
                                            <asp:ListItem Text="Aguardando Orçamento/Aprovação" Value="Aguardando Orçamento/Aprovação"></asp:ListItem>
                                            <asp:ListItem Text="Em Atendimento" Value="Em Atendimento"></asp:ListItem>
                                            <asp:ListItem Text="Improcedente" Value="Improcedente"></asp:ListItem>
                                            <asp:ListItem Text="Finalizado" Value="Finalizado"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-md-4">
                                        <span class="input-group-text justify-content-center">Classificação</span>
                                        <asp:DropDownList runat="server" ID="ddlClassifcAtend" Style="text-align: center;" CssClass="form-control justify-content-lg-center">
                                            <asp:ListItem Text="Baixa" Value="Baixa"></asp:ListItem>
                                            <asp:ListItem Text="Média" Value="Média"></asp:ListItem>
                                            <asp:ListItem Text="Média-Alta" Value="Média-Alta"></asp:ListItem>
                                            <asp:ListItem Text="Alta" Value="Alta"></asp:ListItem>
                                            <asp:ListItem Text="Urgente" Value="Urgente"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-md-4">
                                        <span class="input-group-text justify-content-center">Custo</span>
                                        <input type="text" runat="server" id="txtCusto" style="text-align: center" class="form-control" />
                                    </div>
                                </div>
                                <br />
                                <div class="row col-auto">
                                    <div class="col-md-6">
                                        <span class="input-group-text justify-content-center">Registro da Ocorrência</span>
                                        <asp:FileUpload type="file" class="form-control justify-content-center" Style="height: auto" aria-label="file example" runat="server" ID="uploadImage" AllowMultiple="true" autopostback="false" />
                                    </div>
                                    <div class="col-md-6">
                                        <span class="input-group-text justify-content-center">Arquivos</span>
                                        <div class=" form-control justify-content-lg-center" runat="server" style="text-align: center;" id="divArquivosAtend">
                                        </div>
                                    </div>
                                </div>
                                <br />
                                <div class="alert alert-danger" role="alert" style="text-align: center">
                                    <p class="alert-heading" style='text-align: center;'><span style='font-size: 20px;'><strong>Atenção!</strong></span></p>
                                    <ul style="text-align: left; font-size: 12px">
                                        <li>Ao selecionar o status <strong>Finalizado</strong> é obrigatorio descrever na observação o motivo e informar o custo.
                                        </li>
                                        <li>Ao selecionar o status <strong>Improcedente</strong> é obrigatorio descrever na observação o motivo.
                                        </li>
                                    </ul>
                                </div>
                                <div class="row col-auto">
                                    <div class="col-md-12">
                                        <span class="input-group-text justify-content-center">Observação</span>
                                        <CKEditor:CKEditorControl Toolbar="Edit" ID="CKEditor1" BasePath="../../assets/CkEditor/ckeditor" runat="server"></CKEditor:CKEditorControl>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer justify-content-between">
                                <button type="button" class="btn btn-danger btn-md" data-dismiss="modal" runat="server" id="btnCancelar">Cancelar</button>
                                <asp:Button ID="btnChange" runat="server" Text="Salvar Alterações" OnClick="btnChange_Click" CssClass="btn btn-success btn-md justify-content-around" />
                            </div>
                        </div>
                    </div>
                </div>
            </panelcontent>
        </panelcollection>
    </aspxcallbackpanel>

    <script src="../../assets/bootstrap-5.0.2-dist/Modal/jquery.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/bootstrap.min.js"></script>

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

    <script src="../../js/bootstrap.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/jquery.min.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/moment.min.js"></script>
    <script type="text/javascript" src="../../assets/datepickerRange/daterangepicker.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../assets/datepickerRange/daterangepicker.css" />

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
        });

        function setInputFilter(textbox, inputFilter, errMsg) {
            ["input", "keydown", "keyup", "contextmenu", "drop", "focusout"].forEach(function (event) {
                textbox.addEventListener(event, function (e) {
                    if (inputFilter(this.value)) {
                        // Accepted value
                        if (["keydown", "mousedown", "focusout"].indexOf(e.type) >= 0) {
                            this.classList.remove("input-error");
                            this.setCustomValidity("");
                        }
                        this.oldValue = this.value;
                        this.oldSelectionStart = this.selectionStart;
                        this.oldSelectionEnd = this.selectionEnd;
                    } else if (this.hasOwnProperty("oldValue")) {
                        // Rejected value - restore the previous one
                        this.classList.add("input-error");
                        this.setCustomValidity(errMsg);
                        this.reportValidity();
                        this.value = this.oldValue;
                        this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
                    } else {
                        // Rejected value - nothing to restore
                        this.value = "";
                    }
                });
            });
        }

        setInputFilter(document.getElementById("MainContent_txtCusto"), function (value) {
            return /^-?\d*[.,]?\d{0,2}$/.test(value);
        }, "Informe um valor válido");

    </script>


</asp:Content>

