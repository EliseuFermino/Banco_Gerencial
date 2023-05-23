<%@ Page Title="Alterar Datas - Pontuação Checklist" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="EliminarDiasCalculoChecklist.aspx.vb" Inherits="MemberPages_Checklist_Manutencao_EliminarDiasCalculoChecklist" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wuciListaLojasComApoio.ascx" TagName="wuciListaLojasComApoio" TagPrefix="uc3" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <style type="text/css">
        .Aumentar_Espaco {
            margin-top: 10px
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <br />
    <br />

    <div class="container-fluid" style="max-width: 600px">
        <div class="row justify-content-between">
            <div class="col-md-6">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Data</span>
                    </div>
                    <input type="date" class="form-control xs" autopostback="true" runat="server" id="txtData" />
                </div>
                <br />
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">Filial</span>
                    </div>
                    <asp:DropDownList class="form-control" ID="selFilial" runat="server" ></asp:DropDownList>
                    <%--<select id="selFilial" runat="server" class="form-control justify-content-center"></select>--%>
                </div>
            </div>

            <div class="col-md-3">
                <div class="col-auto justify-content-between">
                    <asp:Button ID="btnBuscar" runat="server" style="width:98px" Text="Pesquisar" Font-Bold="true" CssClass="btn btn-warning" OnClick="btnBuscar_Click" />
                </div>
                <br />
                <div class="col-auto" runat="server" id="divRecalc">
                    <asp:Button ID="btn_Cadastrar_Dia" runat="server" style="width:98px" Text="Cadastrar" Font-Bold="true" CssClass="btn btn-primary" />
                </div>
            </div>
            <div class="col-md-3">
                <div class="col-auto">
                    <asp:Button ID="btn_Recalcular" runat="server" style="width:98px" Text="Recalcular" Font-Bold="true" CssClass="btn btn-success" />
                </div>
                <br />
                <div class="col-auto justify-content-end" >
                    <asp:Button ID="btn_Excluir" runat="server" style="width:98px" Text="Excluir" Font-Bold="true" CssClass="btn btn-danger" />
                </div>
            </div>
        </div>

        <br />

        <div class="row justify-content-sm-center" runat="server" id="divGrid" >
            <div class="col-auto">
                <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="600px">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" VisibleIndex="0" Width="250px">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Data" FieldName="DiaFeriado" VisibleIndex="1">
                        </dx:GridViewDataDateColumn>
                    </Columns>
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" />
                    <SettingsText EmptyDataRow="Nenhuma Data de Feriado Cadastrado" />
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="usp_BuscarDatasFeriados" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

    <br />

    <script src="../../../assets/bootstrap-5.0.2-dist/Modal/jquery.min.js"></script>
    <script src="../../../assets/bootstrap-5.0.2-dist/Modal/bootstrap.min.js"></script>
    <link href="../../../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />


</asp:Content>

