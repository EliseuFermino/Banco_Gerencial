<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Acerto_Vendas.aspx.vb" Inherits="MemberPages_Manutencao_Acerto_Vendas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #sec01 {
            border-bottom : 4px;
            
        }

    </style>

    <link href="../../css/bootstrap.min.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <section id="sec01">

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h2 >Atualizar Realizado na Meta por Loja</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-1">
                    <asp:TextBox ID="txt_Ano" runat="server" AutoPostBack="false" placeholder="Ano" Width="100px" CssClass="form-control form-control-lg" ></asp:TextBox>                   
                </div>

                <div class="col-md-1">
                    <asp:TextBox ID="txt_Mes" runat="server" AutoPostBack="false" placeholder="nº do Mês" Width="100px" CssClass="form-control form-control-lg" ></asp:TextBox>                   
                </div>

                <div class="col-md-1">
                    <asp:TextBox ID="txt_Loja" runat="server" AutoPostBack="false" placeholder="nº da Loja" Width="100px" CssClass="form-control form-control-lg" ></asp:TextBox>                   
                </div>

                <div class="col-md-1">                    
                    <asp:Button ID="Button1" runat="server" Text="Atualizar" CssClass="btn btn-primary"  />
                </div>

            </div>
        </div>
    </section>

    

</asp:Content>

