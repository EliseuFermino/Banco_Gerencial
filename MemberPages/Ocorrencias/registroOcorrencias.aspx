<%@ Page Title="Registro de Ocorrências" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="registroOcorrencias.aspx.vb" Inherits="MemberPages_Ocorrencias_registroOcorrencias" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Dashboard.v18.2.Web.WebForms, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container">
        <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src="../../image/LogoCondor_Vermelho_25-sem-fundo.png" alt="" width="350" height="90">
            <p class="lead">Formulário de registro de ocorrências.</p>
        </div>

        <div class="row justify-content-sm-center" runat="server" id="divOcorrencia">
            <div class="col-md-12 order-md-1">
                <div class="row">
                    <div class="col-md-4 mb-1" runat="server">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Solicitante</span>
                            </div>
                            <input type="text" class="form-control justify-content-center" id="lblMatricula" runat="server" placeholder="Matricula" disabled="disabled">
                        </div>
                    </div>

                    <div class="col-md-4 mb-1">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Setor</span>
                            </div>
                            <input type="text" class="form-control justify-content-center" id="lblSetor" runat="server" required placeholder="Setor">
                        </div>
                    </div>

                    <div class="col-md-4 mb-1">
                        <asp:FileUpload type="file" class="form-control justify-content-center" aria-label="file example" runat="server" ID="uploadImage" AllowMultiple="true" autopostback="false" />
                    </div>

                </div>

                <br />
                <div class="row">
                    <div class="col-md-4 mb-1 justify-content-center" style="justify-content: space-between">
                        <span class="input-group-text justify-content-center">Gravidade</span>
                        <div class="form-control center">
                            <asp:RadioButtonList runat="server" ID="rdlGravidade" CssClass="form-label justify-content-center" RepeatDirection="Horizontal" CellSpacing="4">
                                <asp:ListItem Selected="True" Text="&nbsp1" Value="1" style="padding-left: 20px; padding-right: 10px"></asp:ListItem>
                                <asp:ListItem Text="&nbsp2" Value="2" style="padding-left: 25px; padding-right: 10px"></asp:ListItem>
                                <asp:ListItem Text="&nbsp3" Value="3" style="padding-left: 25px; padding-right: 10px"></asp:ListItem>
                                <asp:ListItem Text="&nbsp4" Value="4" style="padding-left: 25px; padding-right: 10px"></asp:ListItem>
                                <asp:ListItem Text="&nbsp5" Value="5" style="padding-left: 25px; padding-right: 10px"></asp:ListItem>
                            </asp:RadioButtonList>

                        </div>
                    </div>

                    <div class="col-md-4 mb-1 justify-content-center" style="justify-content: space-between">
                        <span class="input-group-text justify-content-center">Urgência</span>
                        <div class="form-control center">
                            <asp:RadioButtonList runat="server" ID="rdlUrgencia" CssClass="form-label justify-content-center" RepeatDirection="Horizontal" CellSpacing="4">
                                <asp:ListItem Selected="True" Text="&nbsp1" Value="1" style="padding-left: 20px; padding-right: 10px"></asp:ListItem>
                                <asp:ListItem Text="&nbsp2" Value="2" style="padding-left: 25px; padding-right: 10px"></asp:ListItem>
                                <asp:ListItem Text="&nbsp3" Value="3" style="padding-left: 25px; padding-right: 10px"></asp:ListItem>
                                <asp:ListItem Text="&nbsp4" Value="4" style="padding-left: 25px; padding-right: 10px"></asp:ListItem>
                                <asp:ListItem Text="&nbsp5" Value="5" style="padding-left: 25px; padding-right: 10px"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>

                    <div class="col-md-4 mb-1 justify-content-center" style="justify-content: space-between">
                        <span class="input-group-text justify-content-center">Tendência</span>
                        <div class="form-control center">
                            <asp:RadioButtonList runat="server" ID="rdlTendencia" CssClass="form-label justify-content-center" RepeatDirection="Horizontal" CellSpacing="4">
                                <asp:ListItem Selected="True" Text="&nbsp1" Value="1" style="padding-left: 20px; padding-right: 10px"></asp:ListItem>
                                <asp:ListItem Text="&nbsp2" Value="2" style="padding-left: 25px; padding-right: 10px"></asp:ListItem>
                                <asp:ListItem Text="&nbsp3" Value="3" style="padding-left: 25px; padding-right: 10px"></asp:ListItem>
                                <asp:ListItem Text="&nbsp4" Value="4" style="padding-left: 25px; padding-right: 10px"></asp:ListItem>
                                <asp:ListItem Text="&nbsp5" Value="5" style="padding-left: 25px; padding-right: 10px"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </div>
                
                <hr class="mb-3">
                <div class="mb-3">
                    <label for="descricao" class="input-group-text">Descrição da ocorrência:</label>
                    <div>
                        <CKEditor:CKEditorControl Toolbar="Edit" ID="CKEditor1" BasePath="../../assets/CkEditor/ckeditor" runat="server"></CKEditor:CKEditorControl>
                    </div>
                </div>

                <hr class="mb-3">

                <div class="row justify-content-sm-center">
                    <asp:Button class="btn btn-primary btn-lg" Style="width: auto" runat="server" autoPostBack="false" ID="btnSubmit" Text="Registrar ocorrência" OnClientClick="getValueEditor()" OnClick="btnSubmit_Click" />
                </div>

                <hr class="mb-3">

                <div class="row justify-content-sm-center">
                    <label id="lblStatus" runat="server"></label>
                </div>
            </div>
        </div>

        <div class="row justify-content-sm-center">
            <div class="col-md-6" id="divCarregamento" runat="server" visible="false">
                <hr class="mb-3">
                <div class="progress" style="height: 35px">
                    <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 100%">Carregando...</div>
                </div>
                <hr class="mb-3">
            </div>
        </div>
    </div>

    <div class="row justify-content-sm-center" runat="server" id="divSucesso" visible="false">
        <hr class="mb-3">
        <div class="col-md-4">
            <div class="card text-center text-white bg-success mb-4">
                <div class="card-header"></div>
                <div class="card-body">
                    <h5 class="card-title text-white">Sucesso!</h5>
                    <p class="card-text">
                        <br />
                        A ocorrência foi registrada com sucesso.
                        <br />
                        <br />
                        Você pode consultar as solicitações em aberto clicando no link abaixo.
                    </p>
                    <a class="btn btn-primary btn text-white" href="atendimentoOcorrencias.aspx">Clique aqui!</a>
                </div>
                <div class="card-footer text-muted">
                </div>
            </div>
        </div>
        <hr class="mb-3">
    </div>
    <!-- Principal JavaScript do Bootstrap
    ================================================== -->
    <!-- Foi colocado no final para a página carregar mais rápido -->
    <script src="../../assets/js/jquery-2.1.4.min.js"></script>
    <link href="../../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />

</asp:Content>

