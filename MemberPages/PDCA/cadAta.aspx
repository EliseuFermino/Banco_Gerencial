<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cadAta.aspx.vb" Inherits="MemberPages_cadAta" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wuciListaLojasComApoio.ascx" TagPrefix="uc1" TagName="wuciListaLojasComApoio" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Plano de Ação</title>

    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
  


    <style type="text/css">

        #divCabecalho {
            margin-top: 5px;
            padding: 5px;
            border: 1px solid Gray;          
        }

        .divBordas {            
            border-bottom: 1px solid Gray;
            border-left: 1px solid Gray;
            border-right: 1px solid Gray;   
            padding-bottom: 5px;        
        }

        .row {
            padding-top: 4px;
        }

        body {
            background:url("../../img/Image_Italian.jpg")
        }

        .fundo {
            background-color: rgba(252, 248, 227, 0.85)
        }

        .fundo1 {
            background-color: rgba(180, 178, 178, 0.85) 
        }

        .fundo2 {
            background-color: rgba(222, 221, 221, 0.85) 
        }

        .fundo3 {
            background-color: rgba(60, 59, 59, 0.85) 
        }

        .Negrito {
            font-weight:bold;
        }

        #form1{
            padding-top: 60px;
        }    
        .margem_right_5px {
            margin-right: 5px;
        }

        .TextoCor {
            color: #23527c;
        }

    </style>
    


</head>
<body>    

        <nav class="navbar navbar-fixed-top" style="background-color: #fff ;">
          <div class="container-fluid">
            <div class="navbar-header ">
              <a class="navbar-brand " href="../menuPrincipal.aspx"><img src="/image/logocondor_vermelho_25.jpg" height="25" width="130 " alt="Condor" /></a>
            </div>
            <ul class="nav navbar-nav">
              <li class="active Negrito"><a href="../menuPrincipal.aspx"><span class="glyphicon glyphicon-home"></span> Menu Principal</a></li>

                 <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-th-list"></span> Dashboard
                    <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li><a href="Dashboard_Causa.aspx"><span class="glyphicon glyphicon-warning-sign"></span> Problema e Causa</a></li>
                      <li role="separator" class="divider"></li>
                      <li><a href="Dashboard.aspx"><span class="glyphicon glyphicon glyphicon-file"></span> Plano de Ação</a></li>                      
                    </ul>
                  </li>
              <li><a href="cadSWOT.aspx"><span class="glyphicon glyphicon glyphicon-th-large"></span> SWOT</a></li>
              <li><a href="cadProblemaCausa.aspx"><span class="glyphicon glyphicon-warning-sign"></span> Problema e Causa</a></li>
              <li><a href="cadPlanoAcao.aspx"><span class="glyphicon glyphicon glyphicon-file"></span> Plano de Ação</a></li>
              <li class="active fundo2"><a href="cadAta.aspx"><span class="glyphicon glyphicon-list-alt"></span> Ata</a></li>
            </ul>
            <p class="navbar-text navbar-right margem_right_5px TextoCor"><span class="glyphicon glyphicon-user"></span> <asp:LoginName ID="LoginName1" runat="server" /></p>
          </div>
        </nav>


    <form id="form1" runat="server">
            
        <div id="divCabecalho" class="container bg-warning fundo2">         
            
            <div class="row">    
                <div class="col-md-4 "><h2 class="Negrito"><span class="glyphicon glyphicon-list-alt"></span> Ata de Reunião</h2></div>            
                
            </div>

            <div class="row">    
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Filial</div>  
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Data</div>                         
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Buscar Ata</div>  
            </div> <%--Filial--%>
            
            <div class="row">
                
                <div class="col-md-3  ">                    
                    <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial"  />
                </div>

                <div class="col-md-3 ">                    
                    <dx:ASPxDateEdit ID="cboDia" Width="100px" runat="server" Theme="Default"  ></dx:ASPxDateEdit>                    
                </div> 

                <div class="col-md-3 ">                    
                    <dx:ASPxComboBox ID="cboAta" runat="server" DataSourceID="dsAta" Width="100px" AutoPostBack="True" ValueField="ID" >
                        <Columns>
                            <dx:ListBoxColumn FieldName="ID" Width="30px" />
                            <dx:ListBoxColumn Caption="Cadastro" FieldName="DataCadastro" Width="75px" />
                            <dx:ListBoxColumn FieldName="Assuntos" Width="350px" />
                        </Columns>
                    </dx:ASPxComboBox>                
                    <asp:SqlDataSource ID="dsAta" runat="server" ConnectionString="<%$ ConnectionStrings:SQL14_gerProjetosConnectionString %>" SelectCommand="usp_Buscar_Ata" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div> 


                
            </div> <%--Area--%>


        </div> <%--Bloco de Cima--%>

        <div class="container divBordas fundo1">
            <div class="row">
                <div class="col-md-6 ">
                    <dx:ASPxButton ID="btnNovo" runat="server" Text="Novo" CssClass="btn btn-success btn-sm" Native="true" Width="85" ></dx:ASPxButton>
               
                    <dx:ASPxButton ID="btnEdit" runat="server" Text="Editar" CssClass="btn btn-primary btn-sm" Native="true" Width="85" Visible="false"  ></dx:ASPxButton>
                
                    <dx:ASPxButton ID="btnDelete" runat="server" Text="Excluir" CssClass="btn btn-danger btn-sm" Native="true" Width="85" Visible="false" ></dx:ASPxButton>
                </div>
            </div>
        </div> <%--Botoes--%>

        <div class="container divBordas fundo">

            <div class="row">                          
                <div class="col-md-6 ">                    
                    <h4 class="Negrito"><span class="glyphicon glyphicon-user"></span> Participantes</h4>
                </div>
                <div class="col-md-6 ">                    
                    <h4 class="Negrito"><span class="glyphicon glyphicon-comment "></span> Assuntos Discutidos</h4>
                </div>                
            </div> <%--Causa 1--%>

            <div class="row">                          
                <div class="col-md-6 ">                    
                    <asp:TextBox ID="txt_Participantes" TextMode="MultiLine" runat="server" Width="450px" Height="180px" placeholder="Digite o nome dos Participantes .."></asp:TextBox>
                </div>
                <div class="col-md-6 ">                    
                    <asp:TextBox ID="txt_Assuntos" TextMode="MultiLine" runat="server" Width="450px" Height="180px" placeholder="Digite aqui um breve relato dos assuntos discutidos..."></asp:TextBox>
                </div>                
            </div> <%--Causa 1--%>   

            <br />
            

            
            <div class="row">                          
                <div class="col-md-6 ">                    
                    <h4 class="Negrito"><span class="glyphicon glyphicon-thumbs-up"></span> Decisões</h4>
                </div>
                <div class="col-md-6 ">                    
                    <h4 class="Negrito"><span class="glyphicon glyphicon-paperclip"></span> Observações</h4>
                </div>                
            </div> <%--Causa 1--%>

            <div class="row">                          
                <div class="col-md-6 ">                    
                    <asp:TextBox ID="txt_Decisao" TextMode="MultiLine" runat="server" Width="450px" Height="160px" placeholder="Digite aqui as Decisões tomadas..."></asp:TextBox>
                </div>
                <div class="col-md-6 ">                    
                    <asp:TextBox ID="txt_Observacao" TextMode="MultiLine" runat="server" Width="450px" Height="160px" placeholder="Digite aqui as Observações que queira fazer..."></asp:TextBox>
                </div>                
            </div> <%--Causa 1--%>   
            
            
            
                 
                                   

       </div>

        <div class="container divBordas fundo3">
            <div class="row">
                <div class="col-md-6 ">
                    <dx:ASPxButton ID="btnCancel" runat="server" Text="Cancelar" CssClass="btn btn-danger btn-sm" Native="true" Width="85" Enabled="false"  ></dx:ASPxButton>
               
                    <dx:ASPxButton ID="btnSave" runat="server" Text="Salvar" CssClass="btn btn-success btn-sm" Native="true" Width="85" Enabled="false"  ></dx:ASPxButton>
                                    
                </div>
            </div>
        </div> <%--Botoes--%>


    </form>



</body>

    <script>
        $(document).ready(function ()
        {
            $('[data-toggle="popover"]').popover();
        });
</script>

</html>
