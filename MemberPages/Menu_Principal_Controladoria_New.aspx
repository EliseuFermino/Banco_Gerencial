<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Menu_Principal_Controladoria_New.aspx.vb" Inherits="MemberPages_Menu_Principal_Controladoria_New" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Testando HTML LEFT</title>

    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/css_menu.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
   
        <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-light border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">Banco Gerencial </div>
      <div class="list-group list-group-flush">
        <a href="#" class="list-group-item list-group-item-action bg-light">Dashboard</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Shortcuts</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Overview</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Events</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a>
        <a href="#" class="list-group-item list-group-item-action bg-light">Status</a>
      </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
        <button class="btn btn-primary" id="menu-toggle">Menu</button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Link</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Dropdown
              </a>
              <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
              </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" >Bem-vindo, <asp:LoginName ID="LoginName1" runat="server" CssClass="username" /> ! </a> 
            </li>

            <li class="nav-item"> 
                 <p class="nav-link" ><asp:HyperLink ID="A2" runat="server"  NavigateUrl="~/Account/ChangePassword.aspx">Alterar Senha</asp:HyperLink> </p> 
            </li>

            <li class="nav-item">
                <p class="nav-link" ><asp:LoginStatus ID="LoginStatus1" runat="server" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="~/" /> </p>
            </li>

          </ul>
        </div>
      </nav>

      <div class="container-fluid">

          <div class="float-right">
                        <section id="login">
                        <asp:LoginView ID="LoginView1" runat="server" ViewStateMode="Disabled">
                            <AnonymousTemplate>
                                <ul>
                                    <li><a id="registerLink" runat="server" href="~/Account/Register.aspx">Register</a></li>
                                    <li><a id="loginLink" runat="server" href="~/Account/Login.aspx">Log in</a></li>
                                </ul>
                            </AnonymousTemplate>
                            <LoggedInTemplate>
                                <p>
                                                                                                                        
                                    
                                </p>
                            </LoggedInTemplate>
                        </asp:LoginView>
                    </section>          
                   </div>  <%--Login--%>

          <nav>
                <dx:ASPxMenu ID="ASPxMenu1" runat="server"  BorderBetweenItemAndSubMenu="HideAll" Font-Bold="False" Font-Names="Segoe UI" Font-Size="Small" ForeColor="#999999" SeparatorWidth="0px"  GutterWidth="500px" Visible="true">
                    <Paddings Padding="0px" />
                    <SeparatorPaddings Padding="0px" />
                    <Border BorderColor="White" BorderStyle="None" BorderWidth="0px" />
                </dx:ASPxMenu>               
        </nav>  <%--Menu Principal--%>   


        <h1 class="mt-4">Simple Sidebar</h1>
        <p>The starting state of the menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will change.</p>
        <p>Make sure to keep all page content within the <code>#page-content-wrapper</code>. The top navbar is optional, and just for demonstration. Just create an element with the <code>#menu-toggle</code> ID which will toggle the menu when clicked.</p>
      </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <%--<script src="vendor/jquery/jquery.min.js"></script>--%>

  <script src="../assets/js/jquery-2.1.4.min.js"></script>
  <script src="../js/bootstrap.bundle.min.js"></script>
  <%--<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>

  <!-- Menu Toggle Script -->
  <script>
      $("#menu-toggle").click(function (e) {
          e.preventDefault();
          $("#wrapper").toggleClass("toggled");
      });
  </script>


        <asp:SqlDataSource ID="AccessDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" SelectCommand="Menu.uspMenuDoUsuario" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idUsuario" SessionField="sUSUARIO" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>


    </form>
</body>
</html>
