<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" Inherits="MemberPages_PDCA_Dashboard" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wuciListaLojasComApoio.ascx" TagPrefix="uc1" TagName="wuciListaLojasComApoio" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Dashboard</title>

    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
  
   
 <script lang="javascript" type ="text/javascript">
     function OnGridFocusedRowChanged() {
         gridPlanoAcao.GetRowValues(gridPlanoAcao.GetFocusedRowIndex(), 'Area;ID', OnGetRowValues);
     }    

     function OnGetRowValues(values) {
         txtID.SetText(values[1]);        
     }  

    </script>


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
            padding-left: 4px;
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
            padding-left: 15px;
            padding-right: 15px;
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
                    <a class="dropdown-toggle active fundo2" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-th-list"></span> Dashboard
                    <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                      <li><a href="Dashboard_Causa.aspx"><span class="glyphicon glyphicon-warning-sign"></span> Problema e Causa</a></li>
                      <li role="separator" class="divider"></li>
                      <li class="active fundo2"><a href="Dashboard.aspx"><span class="glyphicon glyphicon glyphicon-file"></span> Plano de Ação</a></li>                      
                    </ul>
                  </li>
              <li><a href="cadSWOT.aspx"><span class="glyphicon glyphicon glyphicon-th-large"></span> SWOT</a></li>
              <li><a href="cadProblemaCausa.aspx"><span class="glyphicon glyphicon-warning-sign"></span> Problema e Causa</a></li>
              <li><a href="cadPlanoAcao.aspx"><span class="glyphicon glyphicon glyphicon-file"></span> Plano de Ação</a></li>
              <li><a href="cadAta.aspx"><span class="glyphicon glyphicon-list-alt"></span> Ata</a></li>
            </ul>
            <p class="navbar-text navbar-right margem_right_5px TextoCor"><span class="glyphicon glyphicon-user"></span> <asp:LoginName ID="LoginName1" runat="server" /></p>
          </div>
        </nav>



<form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div id="divCabecalho" class="container-fluid bg-warning fundo2">         
            
            <div class="row">    
                <div class="col-md-6 "><h2 class="Negrito"><span class="glyphicon glyphicon-th-list"></span> Dashboard <small> Plano de Ação</small></h2></div>            
                
            </div>

            <div class="row">    
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Filial</div>                                  
            </div> <%--Filial--%>
            
            <div class="row">
                
                <div class="col-md-3  ">                    
                    <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" Visible_cboCorporacao="false"  />
                </div>

                <div  class="col-md-2  ">
                    <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" CssClass="btn btn-success btn-sm" Native="true" Width="85" ></dx:ASPxButton>
                </div>
                
            </div> <%--Area--%>


        </div> <%--Bloco de Cima--%>

        <div class="container-fluid divBordas fundo1">
            <div class="row">
                <div class="col-md-6 ">             
               
                    <dx:ASPxButton ID="btnEdit" runat="server" Text="Editar" CssClass="btn btn-primary btn-sm" Native="true" Width="85" ></dx:ASPxButton>
                
                    <dx:ASPxButton ID="btnExcluir" runat="server" Text="Excluir" CssClass="btn btn-danger btn-sm" Native="true" Width="85" ></dx:ASPxButton>

                    

                </div>
            </div>
        </div> <%--Botoes--%>

        <div class="container-fluid divBordas fundo ">

            <div class="row">           

            <dx:ASPxGridView ID="grid_PlanoAcao" runat="server" DataSourceID="dsPlanoAcao" ClientInstanceName="gridPlanoAcao" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="ID" Theme="SoftOrange" Width="100%">

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0" Width="40px">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="DataCadastro" VisibleIndex="1" Width="80px" Caption="Cadastro">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Area" VisibleIndex="11" Visible="False">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Área" FieldName="descArea" VisibleIndex="2" Width="70px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Conta" VisibleIndex="12" Visible="False">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Conta" FieldName="descConta" VisibleIndex="3" Width="70px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Causa" VisibleIndex="4" >
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Acao" VisibleIndex="5" >
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="Dia_Inicial" VisibleIndex="6" Caption="Inicio" Width="80px">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="Dia_Final" VisibleIndex="7" Caption="Fim" Width="80px">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Responsavel" VisibleIndex="8" Caption="Responsável" Width="90px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Observacao" VisibleIndex="9" Caption="Observação" Width="200px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="idFilial" VisibleIndex="10" Visible="False">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" ColumnResizeMode="Control" />

                <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged()
}" />

                <SettingsPager>
                    <Summary AllPagesText="Pages: {0} - {1} ({2} Planos de Ação)" Text="Page {0} of {1} ({2} Planos de Ação)" />
                </SettingsPager>
                <Settings VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />

                <SettingsText EmptyDataRow="Não há nenhum Plano de Ação para essa loja." />

            </dx:ASPxGridView>                 

            <dx:ASPxTextBox ID="txtID" runat="server" ClientInstanceName="txtID" Width="1px" Visible="True" Font-Size="Smaller">
                    <Border BorderStyle="None" />
                </dx:ASPxTextBox>
                
            <asp:SqlDataSource ID="dsPlanoAcao" runat="server" ConnectionString="<%$ ConnectionStrings:SQL14_gerProjetosConnectionString %>" SelectCommand="PDCA.usp_Dashboard_PlanoAcao" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource>

           </div>

       </div>

    </form>

</body>


    <script>
        $(document).ready(function () {
            $('[data-toggle="popover"]').popover();
        });
</script>

</html>
