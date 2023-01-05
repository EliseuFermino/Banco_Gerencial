<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Objetivo_Estrategico_01.aspx.vb" Inherits="MemberPages_Projetos_Mandala_Objetivo_Estrategico_01" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wuc_Controle.ascx" TagPrefix="uc1" TagName="wuc_Controle" %>





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
                    <uc1:wuc_Controle runat="server" ID="wuc_Controle" />  
                    
                    <div class="container-fluid">
                        <div class="row">
                                <div class="col-md-12 text-center">
                            <dx:ASPxGridView ID="grid_Equipe" runat="server" DataSourceID="dsLista" AutoGenerateColumns="False"></dx:ASPxGridView>
                            <asp:SqlDataSource ID="dsLista" runat="server" ConnectionString="<%$ ConnectionStrings:SQL14_gerProjetosConnectionString %>" SelectCommand="SELECT [Obj_Estr_N1_ID], [nomeParticipante] FROM Objetivo_Estrategico.tblEquipeWorkshop_N1"></asp:SqlDataSource>
                                </div>
                        </div>
                    </div>
                                      
                </div>

                <div class="col-md-8">

                    <div class="mandala-grid">

                        <div class="plan plan1">

                            <h4>1.1 Fabio/Everton</h4>
                            <%--<p>Observacao 1</p>--%>
                            <p>
                                5 Lojas <br /> Acertadas 
                                Planejadas      
                                       
                            </p>                            

                            
                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=11" > <span class="label label-primary">Ação Estratégia 1.1</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=11"> <span class="label label-danger">Plano de Ação</span></a></div>
                        </div>  

                        <div class="plan plan2">

                            <h4>1.2 Aliceu</h4>
                            <%--<p>Observacao 2</p>--%>
                            <p>5 Lojas <br />  Pesquisa <br />               
                                Planejamento em Andamento                                
                            </p>
                            
                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=12" > <span class="label label-primary">Ação Estratégia 1.2</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=12"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>

                        <div class="plan plan3">

                            <h4>1.3 Aliceu</h4>
                           <%-- <p>Observacao 3</p>--%>
                            <p>
                                10 Lojas <br /> em Estudos <br /> (Terrenos/UF)   
                            </p>
                            
                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=13" > <span class="label label-primary">Ação Estratégia 1.3</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=13"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>
            
                    </div>

                    <div class="mandala-grid">

                        <div class="plan plan1">

                            <h4>1.8. Everton</h4>
                            <%--<p>Observacao 4</p>--%>
                            <p>
                                Reformas <br /> Loja 11/13 <br /> Algumas melhorias
                            </p>

                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=18"> <span class="label label-primary">Ação Estratégia 1.8</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=18"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>  

                        <div class="plan plan2" style="border: 6px solid #f2980b; background-color: #f7db96" >

                            <h2 style=" font-family: 'Arial Black', Gadget, sans-serif; background-color: #f7db96; color: #2d6dc6"><span class="step">1</span>&nbsp ALICEU</h2>
                            <p style=" font-family: 'Arial Black', Gadget, sans-serif; font-weight:bolder" class="price">Lojas Novas e Reformas</p>
                            <h1 style="font-family: 'Arial Black', Gadget, sans-serif; color: #2d6dc6; font-weight: bold ">R$ 6,3 B</h1>
                

                

                        </div>

                        <div class="plan plan3">

                            <h4>1.4 Fabio/Everton</h4>
                            <%--<p>Observacao 6</p>--%>
                            <p>
                                Ampliação +- 1000m <br /> Loja 03/37 com <br /> melhoria <br /> infraestrutura
                            </p>
                            
                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=14" > <span class="label label-primary">Ação Estratégia 1.4</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=14"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>
            
                    </div>

                    <div class="mandala-grid">

                        <div class="plan plan1">

                            <h4>1.7 Aliceu</h4>
                            <%--<p>Observacao 7</p>--%>
                            <p>
                                Em estudo para <br /> reforma das Lojas <br /> 7/17/18/21
                                                        
                            </p>
                            
                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=17" > <span class="label label-primary">Ação Estratégia 1.7</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=17"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>  

                        <div class="plan plan2">

                            <h4>1.6 Vladimir</h4>
                            <%--<p>Observacao 8</p>--%>
                            <p>
                               Melhorias em <br /> Andamento <br /> Loja 14 <br /> Estacionamento
                               
                            </p>
                            
                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=16" > <span class="label label-primary">Ação Estratégia 1.6</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=16"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>

                        <div class="plan plan3">

                            <h4>1.5 Aliceu</h4>
                            <%--<p>Observacao 9</p>--%>
                            <p>
                               Oportunidades <br /> Estudo para novas <br /> Aquisições
                
                            </p>


                            <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_Nivel_3.aspx?nivel2=15" > <span class="label label-primary">Ação Estratégia 1.5</span></a> &nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista_peloNivel2.aspx?nivel2=15"> <span class="label label-danger">Plano de Ação</span></a></div>

                        </div>
            
                    </div>

                </div>

            </div>

        </div>




    </div>

</asp:Content>

