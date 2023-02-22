<%@ Page Title="Consulta de Ocorrências" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="atendimentoOcorrencias.aspx.vb" Inherits="MemberPages_Ocorrencias_atendimentoOcorrencias" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="justify-content-sm-center">
        <div class="py-5 text-center">
            <img class="d-block mx-auto mb-4" src="../../image/LogoCondor_Vermelho_25-sem-fundo.png" alt="" width="350" height="90">
            <p class="lead">Formulário de registro de ocorrências.</p>
        </div>

        <div class="col-lg-12 col-auto justify-content-sm-center w-auto" runat="server" id="divOcorrencia">
            <div class="row justify-content-center">
                <div class="col-auto justify-content-center">
                    <span class="input-group-text justify-content-sm-center" style="height: 45px">Ocorrências
                        <br />
                    </span>
                    <br />
                    <div class="row justify-content-center">
                        <asp:GridView ID="grvDados" HeaderStyle-BackColor="#CED4DA" HeaderStyle-ForeColor="Black" EnableTheming="True" KeyFieldName="Dia" Theme="SoftOrange"
                            RowStyle-BackColor="#E9ECEF" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000" GridLines="None"
                            runat="server" AutoGenerateColumns="false" BorderStyle="none" HeaderStyle-Height="40px" RowStyle-Height="50px" HeaderStyle-HorizontalAlign="Center"
                            RowStyle-HorizontalAlign="Center" OnRowDataBound="grvDados_RowDataBound">
                            <Columns>
                                <asp:BoundField DataField="id" ItemStyle-Width="10px" ItemStyle-ForeColor="White" ControlStyle-BackColor="White" ItemStyle-BackColor="White" />
                                <asp:BoundField DataField="Data_Requisicao" HeaderText="Data" ItemStyle-Width="155px" />
                                <asp:BoundField DataField="Solicitante" HeaderText="Solicitante" ItemStyle-Width="130px" />
                                <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-Width="130px" />
                                <asp:BoundField DataField="Setor" HeaderText="Setor" ItemStyle-Width="150px" />
                                <asp:TemplateField ItemStyle-Width="80px">
                                    <ItemTemplate>
                                        <asp:Button ID="Details" runat="server"
                                            Text="Detalhes" OnClick="Details_Click" CommandName='<%# Eval("id")%>' CssClass="btn btn-primary btn-sm" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <PagerStyle HorizontalAlign="Center" CssClass="GridPager" Height="50px" VerticalAlign="Middle" />
                        </asp:GridView>
                    </div>
                </div>

                <div class="col-md-4 col-auto justify-content-center" runat="server" id="divDetalhes" visible="false">
                    <div class="col-auto justify-content-sm-center">
                        <span class="input-group-text justify-content-sm-center" style="height: 45px">Detalhes
                        <br />
                        </span>
                        <br />

                        <%--Primeira Linha--%>
                        <div class="row col-auto">
                            <div class="col-md-6">
                                <span class="input-group-text justify-content-center">Solicitante</span>
                                <label runat="server" id="lblSol" class="form-control" style="text-align: center;"></label>
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
                                <span class="input-group-text justify-content-center">Classificação</span>
                                <label runat="server" id="lblClassif" class="form-control" style="text-align: center;"></label>
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
                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal" title="Atendimento">Atendimento</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <label runat="server" id="lblID" visible="false"></label>

    <!-- Modal -->
    <div class="modal fade w-auto h-auto" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Gestão da Ocorrência</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="modal-body">
                    <div class="row col-auto">
                        <div class="col-md-4">
                            <span class="input-group-text justify-content-center">Atendente</span>
                            <label id="lblAtendente" runat="server" style="text-align: center;" class="form-control"></label>
                        </div>

                        <div class="col-md-4">
                            <span class="input-group-text justify-content-center">Status</span>
                            <asp:DropDownList runat="server" ID="ddlStatusAtend" Style="text-align: center;" CssClass="form-control justify-content-lg-center">
                                <asp:ListItem Text="Em Análise" Value="Em Análise"></asp:ListItem>
                                <asp:ListItem Text="Em Atendimento" Value="Em Atendimento"></asp:ListItem>
                                <asp:ListItem Text="Aguardando Aprovação" Value="Aguardando Aprovação"></asp:ListItem>
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
                    </div>
                    <br />
                    <div class="row col-auto">
                        <div class="col-md-12">                            
                            <span class="input-group-text justify-content-center">Registro da Ocorrência</span>
                            <asp:FileUpload type="file" class="form-control justify-content-center" style="height: auto" aria-label="file example" runat="server" ID="uploadImage" AllowMultiple="true" autopostback="false" />
                        </div>
                    </div>
                    <br />
                    <div class="row col-auto">
                        <div class="col-md-12">
                            <span class="input-group-text justify-content-center">Observação</span>
                            <CKEditor:CKEditorControl Toolbar="Edit" ID="CKEditor1" BasePath="../../assets/CkEditor/ckeditor" runat="server"></CKEditor:CKEditorControl>
                        </div>
                    </div>
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Cancelar</button>
                    <asp:Button ID="btnChange" runat="server" Text="Salvar Alterações" OnClick="btnChange_Click" CssClass="btn btn-success btn-sm justify-content-around" />
                </div>
            </div>
        </div>
    </div>

    <script src="../../assets/bootstrap-5.0.2-dist/Modal/jquery.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/bootstrap.min.js"></script>

    <style>
        .modal-dialog {
            margin-left: auto;
            margin-right: auto;
            max-width: 850px;
        }
    </style>       

</asp:Content>

