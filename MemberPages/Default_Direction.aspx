<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default_Direction.aspx.vb" Inherits="Default_Direction" %>


    <!DOCTYPE html>
    <html lang="pt-br">
        <head>
            <title>Banco Gerencial</title>

            <%--<link rel="icon" href="../img/favicon.ico" />    --%>        
            

            <%--<link href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:300|Arbutus+Slab' rel='stylesheet' type='text/css'>--%>

                     
         
            <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />

            <link href="../css/bootstrap.min.css" rel="stylesheet" />
            <link href="../css/cover.css" rel="stylesheet" />   
        </head>

  <body>
                 
        <form runat="server">

        <div class="container-fluid" >       

          <div class="inner cover">
            <h1 class="cover-heading"></h1>
            <p class="lead"></p>

              <br />

            <div class="row">

                 <div class="col-md-12">
                     <asp:Button ID="btn_BancoGerencial" runat="server" CommandName="Login" Text="Acessar Banco Gerencial" CssClass="btn btn-lg btn-primary" />
                 </div>

            </div>

              <br />
               <br />

            <div class="row">

                 <div class="col-md-12">
                     <asp:Button ID="btn_Posto" runat="server" CommandName="Login" Text="Celular" CssClass="btn btn-lg btn-danger" />
                 </div>

            </div>
            
          </div>



        <br />
        <br />

        

       </div>


        </form>
    </body>

</html>