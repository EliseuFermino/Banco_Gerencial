<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Copy (2) of Default.aspx.vb" Inherits="Default2" %>


    <!DOCTYPE html>
    <html lang="pt-br">
        <head>
            <title>Banco Gerencial</title>

            <link rel="icon" href="../img/favicon.ico" />            
            <link href="css/bootstrap.min.css" rel="stylesheet" />

            <link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:300|Arbutus+Slab' rel='stylesheet' type='text/css'>

            <link href="css/bootstrap.css" rel="stylesheet" />
            <link href="css/cover.css" rel="stylesheet" />            
            

            <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        </head>

        <body>
                 
        <form runat="server">  
         
        <p>
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" Visible="False">Registre-se</asp:HyperLink>
            <%--se você não tem uma conta.--%>
        </p>


        <div class="container-fluid" >       

          <div class="inner cover">
            <h1 class="cover-heading">Banco Gerencial</h1>
            <p class="lead"></p>
            
          </div>

        <asp:Login ID="Login1" runat="server" ViewStateMode="Disabled" RenderOuterTable="false" FailureText="Acesso Negado. Informe o Usuario e Senha ou talvez seu Usuario e / ou Senha esteja errado.">
            <LayoutTemplate>

               
                <div class="form-inline" runat="server">
                    
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" class="sr-only" AssociatedControlID="UserName">Usuário</asp:Label>
                        <asp:TextBox runat="server" ID="UserName" TextMode="SingleLine" CssClass="form-control" placeholder="Informe o Usuário"  />    
                    </div>

                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" class="sr-only" AssociatedControlID="Password">Senha</asp:Label>
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="Informe a Senha" />
                     </div>

                    <asp:CheckBox runat="server" ID="RememberMe" Visible="False" />
                    <asp:Label ID="Label3" runat="server" AssociatedControlID="RememberMe" 
                        CssClass="checkbox" Visible="False">Lembrar-me?</asp:Label>
                         
                               
                    <asp:Button ID="Button1" runat="server" CommandName="Login" Text="Acessar Banco Gerencial" CssClass="btn btn-primary" />
                    <br />
                    <br />

        <div class="row">
            <div class=" col-md-offset-3 col-md-3">
                <asp:Button ID="Button3" runat="server"  Text="Desbloquear Usuário" CssClass="btn btn-danger" OnClick="Button2_Click" />

            </div>
        </div>

                    
                    <br />
                    <br />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="alert alert-danger"  ErrorMessage="Obrigatório. O 'Nome' do Usuario deve ser fornecido." />--%>
                    <br />
                    <br />
                    <br />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="alert alert-danger" ErrorMessage="Obrigatório. A 'Senha' do Usuario deve ser fornecida." />--%>
                    <br />
                     <h3 class="validation-summary-errors alert-danger " ><asp:Literal runat="server" ID="FailureText" /></h3>
                </div>
            </LayoutTemplate>
        </asp:Login>

        <br />
        <br />



<%--         <div class="mastfoot">
            <div class="inner">
              <p>by Controladoria</p>
            </div>
          </div>--%>

          </div>



       

        <script src="../Scripts/jquery-2.2.3.min.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script src="../js/smooth-scroll.js"></script>

        <script>

            $("#team img").tooltip();

            smoothScroll.init({
                speed: 1500
            });

        </script>
        </form>
    </body>

</html>