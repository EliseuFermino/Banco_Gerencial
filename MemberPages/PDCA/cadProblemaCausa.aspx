<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cadProblemaCausa.aspx.vb" Inherits="MemberPages_cadProblemaCausa" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register Src="~/Controles/wuciListaLojasComApoio.ascx" TagPrefix="uc1" TagName="wuciListaLojasComApoio" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Problema e Causa</title>

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
              <li class="active fundo2"><a href="cadProblemaCausa.aspx"><span class="glyphicon glyphicon-warning-sign"></span> Problema e Causa</a></li>
              <li><a href="cadPlanoAcao.aspx"><span class="glyphicon glyphicon glyphicon-file"></span> Plano de Ação</a></li>
              <li><a href="cadAta.aspx"><span class="glyphicon glyphicon-list-alt"></span> Ata</a></li>
            </ul>
            <p class="navbar-text navbar-right margem_right_5px TextoCor"><span class="glyphicon glyphicon-user"></span> <asp:LoginName ID="LoginName1" runat="server" /></p>
          </div>
        </nav>


<form id="form1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
   
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
           <Triggers>
               <asp:PostBackTrigger ControlID ="btnSave" />
           </Triggers>
            <ContentTemplate>    
             
        <div id="divCabecalho" class="container bg-warning fundo2">         
            
            <div class="row">    
                <div class="col-md-6"><h2 class="Negrito"><span class="glyphicon glyphicon-alert"></span> Problema e Causa</h2></div>            
                
            </div>

            <div class="row">    
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Filial</div>  
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Área</div>  
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Conta</div> 
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Data</div>                         
            </div> <%--Filial--%>
            
            <div class="row">
                
                <div class="col-md-3  ">                    
                    <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" Visible_cboCorporacao="false"  />
                </div>

                <div class="col-md-3  ">
                    <dx:ASPxComboBox ID="cboArea" runat="server" Native="True" SelectedIndex="0" AutoPostBack="True" >
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Mercearia" Value="1" />
                            <dx:ListEditItem Text="Pereciveis" Value="2" />
                            <dx:ListEditItem Text="Bazar" Value="3" />
                            <dx:ListEditItem Text="Textil" Value="4" />
                            <dx:ListEditItem Text="Eletro" Value="5" />                   
                            <dx:ListEditItem Text="Gestão" Value="6" />  
                        </Items>
                    </dx:ASPxComboBox>
                </div>

                <div class="col-md-3  ">
                    <dx:ASPxComboBox ID="cboConta" runat="server" Native="True" SelectedIndex="0" >
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Vendas" Value="1" />
                            <dx:ListEditItem Text="Margem" Value="2" />
                            <dx:ListEditItem Text="Despesas" Value="3" />
                            <dx:ListEditItem Text="Perdas" Value="4" />
                            <dx:ListEditItem Text="Financeiro" Value="5" />
                            <dx:ListEditItem Text="Estoque" Value="6" />
                            <dx:ListEditItem Text="Resultado Financeiro" Value="7" />
                            <dx:ListEditItem Text="Resultado Final" Value="8" />
                            <dx:ListEditItem Text="Clientes" Value="9" />
                            <dx:ListEditItem Text="Colaborador" Value="10" />
                        </Items>
                    </dx:ASPxComboBox>
                </div>

                <div class="col-md-3 ">                    
                    <dx:ASPxDateEdit ID="cboDia" Width="100px" runat="server" Theme="Default"  HorizontalAlign="Center" ></dx:ASPxDateEdit>                    
                </div> 


                
            </div> <%--Area--%>


        </div> <%--Bloco de Cima--%>

        <div class="container divBordas fundo1">
            <div class="row">
                <div class="col-md-6 ">
                    <dx:ASPxButton ID="btnNovo" runat="server" Text="Novo" CssClass="btn btn-success btn-sm" Native="true" Width="85" ToolTip="Digitar novo Plano de Ação" ></dx:ASPxButton>
               
                    <dx:ASPxButton ID="btnEdit" runat="server" Text="Editar" CssClass="btn btn-primary btn-sm" Native="true" Width="85" Enabled="False"  ></dx:ASPxButton>
                
                    <dx:ASPxButton ID="btnDelete" runat="server" Text="Excluir" CssClass="btn btn-danger btn-sm" Native="true" Width="85" Visible="false"  ></dx:ASPxButton>
                </div>
            </div>
        </div> <%--Botoes--%>

 

                <div class="container divBordas fundo">

                    <div class="row" style="border-bottom:1px solid gray">

                        <div class="col-md-3">
                            <asp:Label ID="lblCaptionSWOT" runat="server" Text="SWOT" AssociatedControlID="cboSWOT"></asp:Label>
                            <dx:ASPxComboBox ID="cboSWOT" runat="server" Width="220px" Native="True" DataSourceID="SqlDataSource1" TextField="descSWOT" ValueField="idSWOT" AutoPostBack="True" >                          
                            </dx:ASPxComboBox>  
                                         
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQL14_gerProjetosConnectionString %>" SelectCommand="PDCA.usp_Buscar_SWOT_porID" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="idSWOT" SessionField="sSWOT" Type="Byte" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div class="col-md-1">                    
                            <dx:ASPxRadioButton ID="rndSemSWOT" Text=" Padrão" Font-Bold="true"  Checked="true" runat="server" Theme="DevEx" Font-Size="13px" ForeColor="Black" GroupName="grpSWOT" OnCheckedChanged="rndSWOT_CheckedChanged" AutoPostBack="true" ></dx:ASPxRadioButton>
                        </div>
                        <div class="col-md-1">                    
                            <dx:ASPxRadioButton ID="rndForcas" Text=" Forças" Checked="false" runat="server" Theme="DevEx" Font-Size="13px" ForeColor="#337ab7" GroupName="grpSWOT" OnCheckedChanged="rndSWOT_CheckedChanged" AutoPostBack="true" ></dx:ASPxRadioButton>
                        </div>
                        <div class="col-md-1">                   
                            <dx:ASPxRadioButton ID="rndFraquezas" Text=" Fraquezas" Checked="false" runat="server" Theme="DevEx" Font-Size="13px" ForeColor="#ff9900" GroupName="grpSWOT" OnCheckedChanged="rndSWOT_CheckedChanged" AutoPostBack="true"></dx:ASPxRadioButton>
                        </div>                        
                        <div class="col-md-2">
                            <dx:ASPxRadioButton ID="rndAmeacas" Text=" Ameaças" Checked="false" runat="server" Theme="DevEx" Font-Size="13px" ForeColor="red" GroupName="grpSWOT" OnCheckedChanged="rndSWOT_CheckedChanged" AutoPostBack="true"></dx:ASPxRadioButton>
                        </div>
                        <div class="col-md-2">
                            <dx:ASPxRadioButton ID="rndOportunidade" Text=" Oportunidades" Checked="false" runat="server" Theme="DevEx" Font-Size="13px" ForeColor="#009900" GroupName="grpSWOT" OnCheckedChanged="rndSWOT_CheckedChanged" AutoPostBack="true"></dx:ASPxRadioButton>
                        </div>
                    </div>

                    <div class="row">                          
                        <div class="col-md-8 ">                    
                            <h4 class="Negrito"><span class="glyphicon glyphicon-pencil"></span> Descrição do Problema</h4>
                        </div>                
                    </div> <%--Causa 1--%>

                    <div class="row">                          
                        <div class="col-md-8 ">                    
                            <asp:TextBox ID="txtProblema" TextMode="MultiLine" runat="server" Width="900px" Height="90px" placeholder="Informe o problema que você diagnosticou e gostaria de trabalhar..."></asp:TextBox>
                        </div>           
                    </div> <%--Causa 1--%>


                    <div class="row">                          
                        <div class="col-md-4 ">                    
                            <h4 class="Negrito"><span class="glyphicon glyphicon-pencil"></span> Causa 1</h4>
                        </div>
                        <div class="col-md-4 ">                    
                            <h4 class="Negrito"><span class="glyphicon glyphicon-pencil"></span> Causa 2</h4>
                        </div>
                        <div class="col-md-4 ">                    
                            <h4 class="Negrito"><span class="glyphicon glyphicon-pencil"></span> Causa 3</h4>
                        </div>
                    </div> <%--Causa 1--%>

                    <div class="row">                          
                        <div class="col-md-4 ">                    
                            <asp:TextBox ID="txt_Causa1" TextMode="MultiLine" runat="server" Width="295px" Height="90px" placeholder="Digite aqui a provável Causa do problema..."></asp:TextBox>                    
                        </div>
                        <div class="col-md-4 ">                    
                            <asp:TextBox ID="txt_Causa2" TextMode="MultiLine" runat="server" Width="295px" Height="90px" placeholder="Digite aqui a provável Causa do problema..."></asp:TextBox>
                        </div>                                   
                        <div class="col-md-4 ">                    
                            <asp:TextBox ID="txt_Causa3" TextMode="MultiLine" runat="server" Width="295px" Height="90px" placeholder="Digite aqui a provável Causa do problema..."></asp:TextBox>
                        </div>
                
                    </div> <%--Causa 1--%>   
            
            
                    <div class="row">                          
                        <div class="col-md-4 ">                    
                            <h4 class="Negrito"><span class="glyphicon glyphicon-pencil"></span> Causa 4</h4>
                        </div>
                        <div class="col-md-4 ">                    
                            <h4 class="Negrito"><span class="glyphicon glyphicon-pencil"></span> Causa 5</h4>
                        </div>
                        <div class="col-md-4 ">                    
                            <h4 class="Negrito"><span class="glyphicon glyphicon-pencil"></span> Causa 6</h4>
                        </div>
                    </div> <%--Causa 1--%>

                    <div class="row">                          
                        <div class="col-md-4 ">                    
                            <asp:TextBox ID="txt_Causa4" TextMode="MultiLine" runat="server" Width="295px" Height="90px" placeholder="Digite aqui a provável Causa do problema..."></asp:TextBox>
                        </div>
                        <div class="col-md-4 ">                    
                            <asp:TextBox ID="txt_Causa5" TextMode="MultiLine" runat="server" Width="295px" Height="90px" placeholder="Digite aqui a provável Causa do problema..."></asp:TextBox>
                        </div>                                   
                        <div class="col-md-4 ">                    
                            <asp:TextBox ID="txt_Causa6" TextMode="MultiLine" runat="server" Width="295px" Height="90px" placeholder="Digite aqui a provável Causa do problema..."></asp:TextBox>
                        </div>
                
                    </div> <%--Causa 1--%>                                    

               </div>

        <div class="container divBordas fundo3">
            <div class="row">
                <div class="col-md-6 ">
                    <dx:ASPxButton ID="btnCancel" runat="server" Text="Cancelar" CssClass="btn btn-danger btn-sm" Native="true" Width="85" ></dx:ASPxButton>
               
                    <dx:ASPxButton ID="btnSave" runat="server" Text="Salvar" CssClass="btn btn-success btn-sm" Native="true" Width="85"  ></dx:ASPxButton>
                                    
                </div>
            </div>
        </div> <%--Botoes--%>

    <asp:Label ID="lblError" runat="server" Text="Label" Font-Size="30px" ForeColor="Yellow"></asp:Label>

            </ContentTemplate>
        </asp:UpdatePanel>


   

    </form>



</body>

    <script>
        $(document).ready(function ()
        {
            $('[data-toggle="popover"]').popover();
        });
</script>

</html>
