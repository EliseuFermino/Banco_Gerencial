<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="menuPrincipal_Basic.aspx.vb" Inherits="MemberPages_menuPrincipal_Basic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <script src="../../assets/bootstrap-5.0.2-dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/jquery.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/bootstrap.min.js"></script>
    <link href="../../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../assets/bootstrap-5.0.2-dist/js/sidebars.js"></script>
    <link href="../../assets/bootstrap-5.0.2-dist/css/sidebars.css" rel="stylesheet" />
    <script src="../../assets/bootstrap-5.0.2-dist/js/bootstrap.js"></script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">



    <div class="row col-12" runat="server" style="padding: 25px 0 50px 0; min-height: 600px" id="div1" >
        <div class="container-fluid">
            <%--Descricao inicial--%>
            <div class="container justify-content-center" style="max-width: 98%; display: block" runat="server" id="divMenu">
                <div class="py-5 text-center">     
                    <br />
                    <br />
                    <br />
                    <img class="" src="../../image/LogoCondor_Vermelho_25-sem-fundo.png" alt="" width="240" height="60">
                    <br />
                    <br />
                    <br />
                    <h2>Dashboard - Banco Gerencial</h2>
                </div>
            </div>
        </div>
    </div>



</asp:Content>

