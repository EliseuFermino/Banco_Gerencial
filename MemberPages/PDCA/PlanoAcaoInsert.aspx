<%@ Page Language="VB" AutoEventWireup="false" CodeFile="PlanoAcaoInsert.aspx.vb" Inherits="MemberPages_PDCA_PlanoAcaoInsert" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link href="../../css/bootstrap.css" rel="stylesheet" />

    <style type="text/css">

        .col-md-3 {
            padding-top: 5px;
            padding-bottom: 5px;             
        }

        .col-md-6 {
            padding-top: 5px;                      
        }

        .col-md-1 {
            padding-left: 2px;                       
        }

       

       

    </style>

</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="container">

<div class="jumbotron">
  <h1>Plano de Ação</h1>
  <p>Do (Execução)</p>
  

            <div class="row">    
                <div class="col-md-1 "><b>Causa</b></div>            
                <div class="col-md-6 ">                    
                    <asp:TextBox ID="txtCausa" TextMode="MultiLine" runat="server" Width="400px" Height="150px" ></asp:TextBox>
                </div>
            </div>

            <div class="row">    
                <div class="col-md-1"><b>Plano de Ação</b></div>            
                <div class="col-md-6 ">                    
                    <asp:TextBox ID="TextBox1" TextMode="MultiLine" runat="server" Width="400px" Height="150px" ></asp:TextBox>
                </div>
            </div>

            <div class="row">    
                <div class="col-md-1 "><b>Responsável</b></div>            
                <div class="col-md-3 ">                    
                    <asp:TextBox ID="TextBox2" runat="server" Width="200px" ></asp:TextBox>
                </div>
            </div>

            <div class="row">    
                <div class="col-md-1 "><b>Inicio</b></div>            
                <div class="col-md-3 ">                    
                    <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" Width="100px" Theme="PlasticBlue" Height="25px"></dx:ASPxDateEdit>
                </div>

                          
                <div class="col-md-3 ">  
                    <b>Prazo (dias)</b>                   
                    <asp:TextBox ID="TextBox3" runat="server" Width="50px" ></asp:TextBox>
                </div>

            </div>

        </div>
    </div>
        </div>
    </form>
</body>
</html>
