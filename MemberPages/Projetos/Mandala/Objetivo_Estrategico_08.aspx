<%@ Page Title="Ação Estratégia 8: Comercial / Logística e Marketing" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Objetivo_Estrategico_08.aspx.vb" Inherits="MemberPages_Projetos_Mandala_Objetivo_Estrategico_08" %>

<%@ Register Src="~/Controles/wuc_Mandala_8.ascx" TagPrefix="uc1" TagName="wuc_Mandala_8" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  
    
    <link href="../../../css/bootstrap.min.css" rel="stylesheet" />

    <style type ="text/css" >

        *, *:before, *:after {
            box-sizing: inherit;
        }

        #myBody {
            font-family: sans-serif;
            margin: 0;
            background-image:linear-gradient(260deg,  #2376ae 0%, #c16ecf 100%); 
        }

        a { 
            color:#000;                  
        }
        
        h2 {
            font-size:x-large;
            color:#000;
        }

        .plan p {
            font-size: large;
            padding: 10px;           
        }

        .plan ul {
            margin: 0;
            padding: 0;
            list-style: none;
        }

        .plan ul li {
            border-bottom: 1px solid rgba(0,0,0,0.1);
            padding: 10px;
            font-size: large;
        }

        .plan ul li:last-child {
            border-bottom: 0;
        }

        .plan a {
            text-decoration: none;
            background:#ffd800;
            padding: 5px;
            color: rgba(0,0,0,0.1);            
        }

        .plan h2 {
            /*text-transform : uppercase;*/
            color:#000;
            letter-spacing: 1px;  
            background-color:lightgray; 
            padding: 7px;   
            font-weight: bold;
            font-family:Tahoma;
            margin-top: 0px;
        }

        .plan h4 {
            /*text-transform : uppercase;*/
            color:#000;
            letter-spacing: 1px;  
            background-color:lightgray; 
            padding: 7px;   
            font-weight: bold;
            font-family:Tahoma;
            margin-top: 0px;
            align-self:flex-start;
        }

        .price {
            font-size: 25px;
            font-family: serif;
            margin: 10px 0;
        }

        
        .plan {
            
            background: rgba(255,255,255,0.2);
            margin: 5px;
            padding: 0px;
            /*border-radius: 3px;*/
            text-align: center;

            flex: 1;
            display: flex;
            flex-wrap: wrap;

            border: 3px solid gray;

        }

        .plan > * {
            flex:1 1 100%;
            
        }

        .FundoEnd {
            background:#ffd800;
            padding: 5px;
        }

        .plan .cta {
            align-self:flex-end;
        }



        /*--------------------------------------------------------------------------*/

        #mandala_body {
            font-family: sans-serif;
            margin: 0;
            background-color:white;
        }

         .mandala-grid {
            max-width : 750px;
            /*margin: 0 auto;*/

            display: flex;
            align-items:stretch;
        }

        .mandala-border {
            border: 3px solid gray;
            height: 135px;
            margin: 7px;
        }

        .background_color {
            background-color: cornflowerblue;
        }

span.step {
  background: white;
  border-radius: 0.8em;
  -moz-border-radius: 0.8em;
  -webkit-border-radius: 0.8em;
  color: #e08a05;
  display: inline-block;
  font-weight: bold;
  line-height: 1.6em;
  margin-right: 5px;
  /*text-align: center;*/
  width: 1.6em; 
  font-size:xx-large;
    
}

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">



    <div id="mandala_body">

        <div class="container-fluid ">

            <div class="row">

                <div class="col-md-3 text-center">
                    <uc1:wuc_Mandala_8 runat="server" ID="wuc_Mandala_8" />               
                </div>

                <div class="col-md-8">

                    <div class="mandala-grid">

                        <div class="plan plan1">

                            <h4>8.1 Luis</h4>
                            <%--<p>Observacao 1</p>--%>
                            <p>
                                Elaborar Plano para aumento de arrecadação do % logístico     
                                       
                            </p>                            

                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=81" > <span class="label label-primary">Ação Estratégia 8.1</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=81"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>  

                        <div class="plan plan2">

                            <h4>8.2 Luis</h4>
                            <%--<p>Observacao 2</p>--%>
                            <p>
                                Aproveitar estrutura logística para venda de serviços a terceiros                              
                            </p>
                            
                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=82" > <span class="label label-primary">Ação Estratégia 8.2</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=82"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>

                        <div class="plan plan3">

                            <h4>8.3 Renato</h4>
                           <%-- <p>Observacao 3</p>--%>
                            <p>
                                Explorar mídia na logística    
                            </p>
                            
                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=83" > <span class="label label-primary">Ação Estratégia 8.3</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=83"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>
            
                    </div>

                    <div class="mandala-grid">

                        <div class="plan plan1">

                            <h4>8.8. Renato</h4>
                            <%--<p>Observacao 4</p>--%>
                            <p>
                                Explorar Novas parcerias de Trade   
                            </p>

                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=88"> <span class="label label-primary">Ação Estratégia 8.8</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=88"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>  

                        <div class="plan plan2" style="border: 6px solid #f2980b; background-color: #f7db96" >

                            <h2 style=" font-family: 'Arial Black', Gadget, sans-serif; background-color: #f7db96; color: #2d6dc6"><span class="step">8</span>&nbsp Adailton</h2>
                            <p style=" font-family: 'Arial Black', Gadget, sans-serif; font-weight:bolder" class="price">Capacitação <br /> Comercial/Logística e Marketing</p>
                            <h1 style="font-family: 'Arial Black', Gadget, sans-serif; color: #2d6dc6; font-weight: bold ">R$ 200M</h1>
                

                

                        </div>

                        <div class="plan plan3">

                            <h4>8.4 Vladimir</h4>
                            <%--<p>Observacao 6</p>--%>
                            <p>
                                Reestruturação do Sistema WMS   
                            </p>
                            
                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=84" > <span class="label label-primary">Ação Estratégia 8.4</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=84"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>
            
                    </div>

                    <div class="mandala-grid">

                        <div class="plan plan1">

                            <h4>8.7 Renato</h4>
                            <%--<p>Observacao 7</p>--%>
                            <p>
                                Consolidar novo sistema de trabalho com negociação centralizada no Trade   
                                                        
                            </p>
                            
                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=87" > <span class="label label-primary">Ação Estratégia 8.7</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=87"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>  

                        <div class="plan plan2">

                            <h4>8.6 Adailton</h4>
                            <%--<p>Observacao 8</p>--%>
                            <p>
                               Entre-posto em outras regiões para ganhos fiscais   
                               
                            </p>
                            
                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=86" > <span class="label label-primary">Ação Estratégia 8.6</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=86"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>

                        <div class="plan plan3">

                            <h4>8.5 Renato</h4>
                            <%--<p>Observacao 9</p>--%>
                            <p>
                               Explorar Novas Mídias indoor  
                
                            </p>


                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=85" > <span class="label label-primary">Ação Estratégia 8.5</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=85"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>
            
                    </div>

                </div>

            </div>

        </div>




    </div>

</asp:Content>

