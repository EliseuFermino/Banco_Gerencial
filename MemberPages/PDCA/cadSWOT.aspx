<%@ Page Language="VB" AutoEventWireup="false" CodeFile="cadSWOT.aspx.vb" Inherits="MemberPages_PDCA_cadSWOT" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wuciListaLojasComApoio.ascx" TagPrefix="uc1" TagName="wuciListaLojasComApoio" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <title>SWOT</title>

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

        .margem_left_5px {
            margin-left: 1px;
            margin-right: 1px;
        }

        .TextoCor {
            color: #23527c;
        }

        .fixed-panel {
          min-height: 10px;
          max-height: 160px;
          overflow-y: scroll;
        }

   .Nomenclatura{
    background:#444;
    color:#4ee255;
    padding:5px;
    margin:5px 0px;
    border:2px solid #fa4b2a;
    text-align: center ;
    border-radius:10px;
    box-shadow:4px 4px 4px #ccc;
    
   
}

    </style>    


</head>
<body>
    
    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="gridSystemModalLabel"><span><img src="/image/logocondor_vermelho_25.jpg" height="25" width="130 " alt="Condor" /></span>&nbsp&nbsp&nbsp Ambiente Interno</h4>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-12">              

              <div class="panel-group " id="accordion" role="tablist" aria-multiselectable="true">

                  <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="headingOne">
                      <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" >
                          <span class="glyphicon glyphicon-list-alt">&nbsp</span> Processos
                        </a>
                        <span class="navbar-right margem_right_5px badge">20</span>
                      </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                      <div class="panel-body">
                          <div class="row">
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Pedido de Compra</div>   
                              </div>
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Recebimento</div>   
                              </div>
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Armazenamento</div>   
                              </div>
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Manipulação</div>   
                              </div>
                          </div>

                          <div class="row">
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Exposição</div>   
                              </div>
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Atendimento</div>   
                              </div>
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Frente de Caixa</div>   
                              </div>
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Entrega a Domicílio</div>   
                              </div>
                          </div>

                          <div class="row">
                              <div class="col-md-3 ">
                              
                                  <div class="Nomenclatura">Assistência Técnica</div>   
                              </div>
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Trocas</div>   
                              </div>
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Serviços Financeiros</div>   
                              </div>
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Tesouraria</div>   
                              </div>
                          </div>

                          <div class="row">
                              <div class="col-md-3">
                                  <div class="Nomenclatura">Segurança Patrimonial</div>                              
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Auditoria</div>
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Prevenção de Perdas</div>
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Limpeza</div>
                              </div>
                          </div>

                          <div class="row">
                              <div class="col-md-3">
                                  <div class="Nomenclatura">Produção Própria</div>                              
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Informática Loja</div>
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Manutenção Loja</div>
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Marketing Loja</div>
                              </div>
                          </div>

                      </div>
                    </div>
                  </div>

                  <div class="panel panel-success">
                    <div class="panel-heading" role="tab" id="headingTwo">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                          <span class="glyphicon glyphicon-user">&nbsp</span>Pessoal
                        </a>
                        <span class="navbar-right margem_right_5px badge">05</span>
                      </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                      <div class="panel-body">

                          <div class="row">
                              <div class="col-md-3">
                                  <div class="Nomenclatura">Rotatividade</div>                              
                              </div>
                              <div class="col-md-3">                              
                                 <div class="Nomenclatura">Recrutamento</div> 
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Treinamento</div>
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Absenteísmo</div>
                              </div>
                          </div>

                          <div class="row">
                              <div class="col-md-3">                              
                                   <div class="Nomenclatura">Relacionamento Interpessoal</div>                             
                              </div>
                          
                          </div>


                      </div>
                    </div>
                  </div>

                  <div class="panel panel-warning">
                    <div class="panel-heading" role="tab" id="headingThree">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                          <span class="glyphicon glyphicon-barcode">&nbsp</span>Produtos
                        </a>
                          <span class="navbar-right margem_right_5px badge">03</span>
                      </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                      <div class="panel-body">
                    
                          <div class="row">
                              <div class="col-md-3">
                                  <div class="Nomenclatura">Mix</div>                              
                              </div>
                              <div class="col-md-3">                              
                                 <div class="Nomenclatura">Ofertas</div> 
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Promoções</div>
                              </div>

                          </div>

                      </div>
                    </div>
                  </div>

                  <div class="panel panel-info">
                    <div class="panel-heading" role="tab" id="headingFour">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                          <span class="glyphicon glyphicon-road">&nbsp</span>Infra Estrutura
                        </a>
                          <span class="navbar-right margem_right_5px badge">08</span>
                      </h4>
                    </div>
                    <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                      <div class="panel-body">
                    
                          <div class="row">
                              <div class="col-md-3">
                                  <div class="Nomenclatura">Instalações</div>                              
                              </div>
                              <div class="col-md-3">                              
                                 <div class="Nomenclatura">Equipamentos</div> 
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Veículo da loja</div>
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Rádios HT</div>
                              </div>

                          </div>

                          <div class="row">
                              <div class="col-md-3">
                                  <div class="Nomenclatura">CFTV</div>                              
                              </div>
                              <div class="col-md-3">                              
                                 <div class="Nomenclatura">Layout de Loja</div> 
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Organização de Loja</div>
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Estacionamento</div>
                              </div>

                          </div>



                      </div>
                    </div>
                  </div>

                  <div class="panel panel-danger">
                    <div class="panel-heading" role="tab" id="headingFive">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                          <span class="glyphicon glyphicon-retweet">&nbsp</span>Controles
                        </a>
                          <span class="navbar-right margem_right_5px badge">01</span>
                      </h4>
                    </div>
                    <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                      <div class="panel-body">
                    
                          <div class="row">
                              <div class="col-md-3">
                                  <div class="Nomenclatura">Sistemas informatizados</div>                              
                              </div>                          

                          </div>

                      </div>
                    </div>
                  </div>               

            </div>

             
              </div>
         
            </div>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>        
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

    <div class="modal fade bs-example-modal-lg" id="myAE_Loja" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="AEL_SystemModalLabel"><span><img src="/image/logocondor_vermelho_25.jpg" height="25" width="130 " alt="Condor" /></span>&nbsp&nbsp&nbsp Ambiente Externo à Loja</h4>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-12">              

              <div class="panel-group " id="AEL_accordion" role="tablist" aria-multiselectable="true">

                  <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="AEL_headingOne">
                      <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#AEL_accordion" href="#AEL_collapseOne" aria-expanded="true" aria-controls="AEL_collapseOne">
                          <span class="glyphicon glyphicon-shopping-cart">&nbsp</span>Centro de Distribuição
                        </a>
                          <span class="navbar-right margem_right_5px badge">02</span>
                      </h4>
                    </div>
                    <div id="AEL_collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="AEL_headingOne">
                      <div class="panel-body">
                          <div class="row">
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Entregas</div>   
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Divergências</div>   
                              </div>
                              
                          </div>
                          
                      </div>
                    </div>
                  </div>

                  <div class="panel panel-success">
                    <div class="panel-heading" role="tab" id="AEL_headingTwo">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#AEL_accordion" href="#AEL_collapseTwo" aria-expanded="false" aria-controls="AEL_collapseTwo">
                          <span class="glyphicon glyphicon-briefcase">&nbsp</span>Matriz relacionamento com
                        </a>
                          <span class="navbar-right margem_right_5px badge">11</span>
                      </h4>
                    </div>
                    <div id="AEL_collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="AEL_headingTwo">
                      <div class="panel-body">

                          <div class="row">
                              <div class="col-md-3">
                                  <div class="Nomenclatura">Tesouraria</div>                              
                              </div>
                              <div class="col-md-3">                              
                                 <div class="Nomenclatura">RH</div> 
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Informática</div>
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">SAC</div>
                              </div>
                          </div>

                          <div class="row">
                              <div class="col-md-3">
                                  <div class="Nomenclatura">Jurídico</div>                              
                              </div>
                              <div class="col-md-3">                              
                                 <div class="Nomenclatura">Controladoria</div> 
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Contabilidade</div>
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Patrimônio</div>
                              </div>
                          </div>

                          <div class="row">
                              <div class="col-md-3">
                                  <div class="Nomenclatura">Marketing</div>                              
                              </div>
                              <div class="col-md-3">                              
                                 <div class="Nomenclatura">Manutenção Central</div> 
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Comercial</div>
                              </div>
                              
                          </div>


                      </div>
                    </div>
                  </div>                         

            </div>

             
              </div>
         
            </div>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>        
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

    <div class="modal fade bs-example-modal-lg" id="myAE_Condor" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="H1"><span><img src="/image/logocondor_vermelho_25.jpg" height="25" width="130 " alt="Condor" /></span>&nbsp&nbsp&nbsp Ambiente Externo ao Condor</h4>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-md-12">              

              <div class="panel-group " id="AEC_accordion" role="tablist" aria-multiselectable="true">

                  <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="AEC_headingOne">
                      <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#AEC_accordion" href="#AEC_collapseOne" aria-expanded="true" aria-controls="AEC_collapseOne">
                          <span class="glyphicon glyphicon-fullscreen">&nbsp</span>Concorrentes
                        </a>
                          <span class="navbar-right margem_right_5px badge">06</span>
                      </h4>
                    </div>
                    <div id="AEC_collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="AEC_headingOne">
                      <div class="panel-body">
                          <div class="row">
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Exposição de produtos</div>   
                              </div>
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Mix de Produtos</div>   
                              </div>
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Preços</div>   
                              </div>
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">promoções</div>   
                              </div>
                          </div>

                          <div class="row">
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Instalações Físicas</div>   
                              </div>
                              <div class="col-md-3">
                              
                                  <div class="Nomenclatura">Equipamentos</div>   
                              </div>
                             
                          </div>

                      </div>
                    </div>
                  </div>

                  <div class="panel panel-success">
                    <div class="panel-heading" role="tab" id="AEC_headingTwo">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#AEC_accordion" href="#AEC_collapseTwo" aria-expanded="false" aria-controls="AEC_collapseTwo">
                          <span class="glyphicon glyphicon-eye-open">&nbsp</span>Órgãos de Fiscalização 
                        </a>
                          <span class="navbar-right margem_right_5px badge">03</span>
                      </h4>
                    </div>
                    <div id="AEC_collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="AEC_headingTwo">
                      <div class="panel-body">

                          <div class="row">
                              <div class="col-md-3">
                                  <div class="Nomenclatura">IPEM</div>                              
                              </div>
                              <div class="col-md-3">                              
                                 <div class="Nomenclatura">Vigilância Sanitária</div> 
                              </div>
                              <div class="col-md-3">                              
                                  <div class="Nomenclatura">Bombeiro</div>
                              </div>
                             
                          </div>

                      </div>
                    </div>
                  </div>

                  <div class="panel panel-warning">
                    <div class="panel-heading" role="tab" id="AEC_headingThree">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#AEC_accordion" href="#AEC_collapseThree" aria-expanded="false" aria-controls="AEC_collapseThree">
                          <span class="glyphicon glyphicon-globe">&nbsp</span>Demografia
                        </a>
                          <span class="navbar-right margem_right_5px badge">02</span>
                      </h4>
                    </div>
                    <div id="AEC_collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="AEC_headingThree">
                      <div class="panel-body">
                    
                          <div class="row">
                              <div class="col-md-6">
                                  <div class="Nomenclatura">Novos empreendimentos imobiliários próximos à loja</div>                              
                              </div>
                              <div class="col-md-6">                              
                                 <div class="Nomenclatura">Perfil do consumidor e poder aquisitivo</div> 
                              </div>                             

                          </div>

                      </div>
                    </div>
                  </div>

                  <div class="panel panel-info">
                    <div class="panel-heading" role="tab" id="AEC_headingFour">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#AEC_accordion" href="#AEC_collapseFour" aria-expanded="false" aria-controls="AEC_collapseFour">
                          <span class="glyphicon glyphicon-credit-card">&nbsp</span>Fornecedores
                        </a>
                          <span class="navbar-right margem_right_5px badge">03</span>
                      </h4>
                    </div>
                    <div id="AEC_collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="AEC_headingFour">
                      <div class="panel-body">
                    
                          <div class="row">
                              <div class="col-md-3">
                                  <div class="Nomenclatura">Entregas</div>                              
                              </div>
                              <div class="col-md-3">                              
                                 <div class="Nomenclatura">Promotores</div> 
                              </div>
                              <div class="col-md-4">                              
                                  <div class="Nomenclatura">Frequência de visitas na loja</div>
                              </div>
                             
                          </div>

                      </div>
                    </div>
                  </div>

                  <div class="panel panel-danger">
                    <div class="panel-heading" role="tab" id="AEC_headingFive">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#AEC_accordion" href="#AEC_collapseFive" aria-expanded="false" aria-controls="AEC_collapseFive">
                          <span class="glyphicon glyphicon-phone-alt">&nbsp</span>Prestadores de Serviços
                        </a>
                          <span class="navbar-right margem_right_5px badge">02</span>
                      </h4>
                    </div>
                    <div id="AEC_collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="AEC_headingFive">
                      <div class="panel-body">
                    
                          <div class="row">
                              <div class="col-md-3">
                                  <div class="Nomenclatura">Manutenção</div>                              
                              </div>
                              
                              <div class="col-md-3">
                                  <div class="Nomenclatura">Limpeza de piso</div>                              
                              </div>                                                         

                          </div>

                      </div>
                    </div>
                  </div>   
                  
                  <div class="panel panel-warning">
                    <div class="panel-heading" role="tab" id="AEC_headingSix">
                      <h4 class="panel-title">
                        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#AEC_accordion" href="#AEC_collapseSix" aria-expanded="false" aria-controls="AEC_collapseSix">
                          <span class="glyphicon glyphicon-user">&nbsp</span>Clientes
                        </a>
                          <span class="navbar-right margem_right_5px badge">03</span>
                      </h4>
                    </div>
                    <div id="AEC_collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="AEC_headingSix">
                      <div class="panel-body">
                    
                          <div class="row">
                              <div class="col-md-4">
                                  <div class="Nomenclatura">Satisfação de clientes</div>                              
                              </div>

                              <div class="col-md-4">
                                  <div class="Nomenclatura">Reclamação</div>                              
                              </div>

                              <div class="col-md-4">                              
                                 <div class="Nomenclatura">Clientes pessoa jurídica</div> 
                              </div>                             

                          </div>

                      </div>
                    </div>
                  </div>
                              

            </div>

             
              </div>
         
            </div>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>        
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




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
              <li class="active fundo2"><a href="cadSWOT.aspx"><span class="glyphicon glyphicon glyphicon-th-large"></span> SWOT</a></li>
              <li><a href="cadProblemaCausa.aspx"><span class="glyphicon glyphicon-warning-sign"></span> Problema e Causa</a></li>
              <li><a href="cadPlanoAcao.aspx"><span class="glyphicon glyphicon glyphicon-file"></span> Plano de Ação</a></li>
              <li><a href="cadAta.aspx"><span class="glyphicon glyphicon-list-alt"></span> Ata</a></li>
            </ul>
            <p class="navbar-text navbar-right margem_right_5px TextoCor"><span class="glyphicon glyphicon-user"></span> <asp:LoginName ID="LoginName1" runat="server" /></p>
          </div>
        </nav>
    
<form id="form1" runat="server">
            
        <div id="divCabecalho" class="container bg-warning fundo2">         
            
            <div class="row">    
                <div class="col-md-4 "><h2 class="Negrito"><span class="glyphicon glyphicon glyphicon-th-large"></span> SWOT</h2></div>            
                
            </div>

            <div class="row">    
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Filial</div>  
                            
            </div> <%--Filial--%>
            
            <div class="row">
                
                <div class="col-md-3  ">                    
                    <uc1:wuciListaLojasComApoio runat="server" ID="cboFilial" />
                </div>


                
            </div> <%--Area--%>


        </div> <%--Bloco de Cima--%>

        <div class="container divBordas fundo1">
            <div class="row">
                <div class="col-md-3">
                    <dx:ASPxButton ID="btnNovo" runat="server" Text="Novo" CssClass="btn btn-success btn-sm" Native="true" Width="85" ></dx:ASPxButton>
               
                    <dx:ASPxButton ID="btnAlterar" runat="server" Text="Alterar" CssClass="btn btn-success btn-sm" Native="true" Width="85" Visible="false"  ></dx:ASPxButton>
                
                    <dx:ASPxButton ID="btnDelete" runat="server" Text="Excluir" CssClass="btn btn-danger btn-sm" Native="true" Width="85" Visible="False" ></dx:ASPxButton>                    

                </div>

                <div class="col-md-3">

                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-download"></span>  Ambiente Interno</button>
   
                </div>


                <div class="col-md-6">

                    <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myAE_Loja"><span class="glyphicon glyphicon-upload"></span>  Ambiente Externo à Loja</button>
   
                    <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myAE_Condor"><span class="glyphicon glyphicon-upload"></span>  Ambiente Externo ao Condor</button>

                </div>

            </div>
        </div> <%--Botoes--%>

        <div class="container divBordas fundo">

            <div class="row">                          
                <div class="col-md-6 ">                   
                    <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title"><span class="glyphicon glyphicon-thumbs-up"></span>  Forças <b>(S)</b></h3>
                      </div>
                      <div class="panel-body fixed-panel">
                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_1" runat="server" placeholder=" 01 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>
                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_2" runat="server" placeholder=" 02 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>
                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_3" runat="server" placeholder=" 03 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>
                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_4" runat="server" placeholder=" 04 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>
                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_5" runat="server" placeholder=" 05 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>

                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_6" runat="server" placeholder=" 06 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>
                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_7" runat="server" placeholder=" 07 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>
                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_8" runat="server" placeholder=" 08 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>
                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_9" runat="server" placeholder=" 09 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>
                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_10" runat="server" placeholder=" 10 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>

                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_11" runat="server" placeholder=" 11 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>
                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_12" runat="server" placeholder=" 12 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>
                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_13" runat="server" placeholder=" 13 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>
                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_14" runat="server" placeholder=" 14 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>
                        <div class="row margem_left_5px ">
                            <asp:TextBox ID="txtForca_15" runat="server" placeholder=" 15 - Digite uma Força..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                        </div>

                      </div>
                    </div>
                </div>

                <div class="col-md-6 ">                    
                    <div class="panel panel-warning">
                      <div class="panel-heading">
                        <h3 class="panel-title"><span class="glyphicon glyphicon-thumbs-down"></span> Fraquezas <b>(W)</b></h3>
                      </div>                      
                      <div class="panel-body fixed-panel">
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_1" runat="server" placeholder=" 01 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_2" runat="server" placeholder=" 02 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_3" runat="server" placeholder=" 03 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_4" runat="server" placeholder=" 04 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_5" runat="server" placeholder=" 05 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>     
                          
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_6" runat="server" placeholder=" 06 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_7" runat="server" placeholder=" 07 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_8" runat="server" placeholder=" 08 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_9" runat="server" placeholder=" 09 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_10" runat="server" placeholder=" 10 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>  
                          
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_11" runat="server" placeholder=" 11 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_12" runat="server" placeholder=" 12 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_13" runat="server" placeholder=" 13 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_14" runat="server" placeholder=" 14 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtFraqueza_15" runat="server" placeholder=" 15 - Digite uma Fraqueza..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>                                                      
                                             
                      </div>
                    </div>                    
                </div>                
            </div> <%--Causa 1--%>   

            <br />            

            <div class="row">                          
                <div class="col-md-6 ">                    
                    <div class="panel panel-success">
                      <div class="panel-heading">
                        <h3 class="panel-title"><span class="glyphicon glyphicon-road"></span> Oportunidade <b>(O)</b></h3>
                      </div>
                      <div class="panel-body fixed-panel">
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_1" runat="server" placeholder=" 01 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_2" runat="server" placeholder=" 02 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_3" runat="server" placeholder=" 03 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_4" runat="server" placeholder=" 04 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_5" runat="server" placeholder=" 05 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div> 
                          
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_6" runat="server" placeholder=" 06 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_7" runat="server" placeholder=" 07 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_8" runat="server" placeholder=" 08 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_9" runat="server" placeholder=" 09 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_10" runat="server" placeholder=" 10 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div> 
                          
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_11" runat="server" placeholder=" 11 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_12" runat="server" placeholder=" 12 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_13" runat="server" placeholder=" 13 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_14" runat="server" placeholder=" 14 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtOportunidade_15" runat="server" placeholder=" 15 - Digite uma Oportunidade..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>                                                      
                                                  
                      </div>
                    </div> 
                </div>
                <div class="col-md-6 ">                    
                    <div class="panel panel-danger">
                      <div class="panel-heading">
                        <h3 class="panel-title"><span class="glyphicon glyphicon-exclamation-sign"></span> Ameaças <b>(T)</b></h3>
                      </div>
                      <div class="panel-body fixed-panel">
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_1" runat="server" placeholder=" 01 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_2" runat="server" placeholder=" 02 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_3" runat="server" placeholder=" 03 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_4" runat="server" placeholder=" 04 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_5" runat="server" placeholder=" 05 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div> 

                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_6" runat="server" placeholder=" 06 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_7" runat="server" placeholder=" 07 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_8" runat="server" placeholder=" 08 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_9" runat="server" placeholder=" 09 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_10" runat="server" placeholder=" 10 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div> 

                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_11" runat="server" placeholder=" 11 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_12" runat="server" placeholder=" 12 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_13" runat="server" placeholder=" 13 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_14" runat="server" placeholder=" 14 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div>
                            <div class="row margem_left_5px ">
                                <asp:TextBox ID="txtAmeaca_15" runat="server" placeholder=" 15 - Digite uma Ameaça..." BorderStyle="None" Width="100%" AutoComplete="off" ></asp:TextBox>
                            </div> 
                                                  
                      </div>
                    </div> 
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

    <asp:Label ID="lblError" runat="server" Text="Label" Font-Size="30px"></asp:Label>

    </form>



</body>

    <script>
        $(document).ready(function () {
            $('[data-toggle="popover"]').popover();
        });
</script>

</html>

