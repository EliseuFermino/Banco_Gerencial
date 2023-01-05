<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Objetivo_Estrategico_Nivel_3.aspx.vb" Inherits="MemberPages_Projetos_Mandala_Objetivo_Estrategico_Nivel_3" %>

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

        <div style="margin-left: 20px; margin-top: 10px; padding-top: 4px"><span><asp:Button ID="btnVoltar" runat="server" Text="Voltar" CssClass="btn btn-success" /></span></div>
                
        <div class="container-fluid ">

            <div class="row">                

                <div class="col-md-8">

                    <div class="mandala-grid">

                        <div class="plan plan1">

                            <h4><span><asp:Label ID="lbl_Title_Q1" runat="server"></asp:Label></span></h4>
                            <%--<p>Observacao 1</p>--%>
                            <p>
                                <asp:Label ID="lbl_Meta_x1" runat="server" Font-Size="X-Large" ></asp:Label>
                                                                 
                            </p>                            

                            <div  class=" FundoEnd cta "><span><asp:Label ID="lblEstimativa_Q1" runat="server" Font-Size="Medium" Font-Bold="true" ></asp:Label></span></div>

                        </div>  

                        <div class="plan plan2">

                            <h4><span><asp:Label ID="lbl_Title_Q2" runat="server"></asp:Label></span></h4>
                            <%--<p>Observacao 2</p>--%>
                            <p>
                                <asp:Label ID="lbl_Meta_x2" runat="server" Font-Size="X-Large" ></asp:Label>                              
                            </p>
                            
                            <div  class=" FundoEnd cta "><span><asp:Label ID="lblEstimativa_Q2" runat="server" Font-Size="Medium" Font-Bold="true" ></asp:Label></span></div>

                        </div>

                        <div class="plan plan3">

                            <h4><span><asp:Label ID="lbl_Title_Q3" runat="server"></asp:Label></span></h4>
                           <%-- <p>Observacao 3</p>--%>
                            <p>
                                <asp:Label ID="lbl_Meta_x3" runat="server" Font-Size="X-Large" ></asp:Label>                              
                            </p>
                            
                            <div  class=" FundoEnd cta "><span><asp:Label ID="lblEstimativa_Q3" runat="server" Font-Size="Medium" Font-Bold="true" ></asp:Label></span></div>

                        </div>
            
                    </div>

                    <div class="mandala-grid">

                        <div class="plan plan1">

                            <h4><span><asp:Label ID="lbl_Title_Q8" runat="server"></asp:Label></span></h4>
                            <%--<p>Observacao 4</p>--%>
                            <p>
                                <asp:Label ID="lbl_Meta_x8" runat="server" Font-Size="X-Large" ></asp:Label>                              
                            </p>

                            <div  class=" FundoEnd cta "><span><asp:Label ID="lblEstimativa_Q8" runat="server" Font-Size="Medium" Font-Bold="true" ></asp:Label></span></div>

                        </div>  

                        <div class="plan plan2" style="border: 6px solid #f2980b; background-color: #f7db96" >

                            <h1 style=" font-family: 'Arial Black', Gadget, sans-serif; background-color: #f7db96; color: #2d6dc6"><asp:Label ID="lbl_Nivel2_ID" runat="server" ></asp:Label></h1>
                            <p style=" font-family: 'Arial Black', Gadget, sans-serif; font-weight:bolder" class="price"><asp:Label ID="lbl_Meta_xCentro" runat="server" ></asp:Label></p>
                            <h1 style="font-family: 'Arial Black', Gadget, sans-serif; color: #2d6dc6; font-weight: bold "><asp:Label ID="lblResponsavel_Centro" runat="server" ></asp:Label></h1>
                             

                        </div>

                        <div class="plan plan3">

                            <h4><span><asp:Label ID="lbl_Title_Q4" runat="server"></asp:Label></span></h4>
                            <%--<p>Observacao 6</p>--%>
                            <p>
                                <asp:Label ID="lbl_Meta_x4" runat="server" Font-Size="X-Large" ></asp:Label>                              
                            </p>
                            
                            <div  class=" FundoEnd cta "><span><asp:Label ID="lblEstimativa_Q4" runat="server" Font-Size="Medium" Font-Bold="true" ></asp:Label></span></div>

                        </div>
            
                    </div>

                    <div class="mandala-grid">

                        <div class="plan plan1">

                            <h4><span><asp:Label ID="lbl_Title_Q7" runat="server"></asp:Label></span></h4>
                            <%--<p>Observacao 7</p>--%>
                            <p>
                                <asp:Label ID="lbl_Meta_x7" runat="server" Font-Size="X-Large" ></asp:Label>                              
                            </p>
                            
                            <div  class=" FundoEnd cta "><span><asp:Label ID="lblEstimativa_Q7" runat="server" Font-Size="Medium" Font-Bold="true" ></asp:Label></span></div>

                        </div>  

                        <div class="plan plan2">

                            <h4><span><asp:Label ID="lbl_Title_Q6" runat="server"></asp:Label></span></h4>
                            <%--<p>Observacao 8</p>--%>
                            <p>
                                <asp:Label ID="lbl_Meta_x6" runat="server" Font-Size="X-Large" ></asp:Label>                              
                            </p>
                            
                            <div  class=" FundoEnd cta "><span><asp:Label ID="lblEstimativa_Q6" runat="server" Font-Size="Medium" Font-Bold="true" ></asp:Label></span></div>

                        </div>

                        <div class="plan plan3">

                            <h4><span><asp:Label ID="lbl_Title_Q5" runat="server"></asp:Label></span></h4>
                            <%--<p>Observacao 9</p>--%>
                            <p>
                                <asp:Label ID="lbl_Meta_x5" runat="server" Font-Size="X-Large" ></asp:Label>                              
                            </p>

                            <div  class=" FundoEnd cta "><span><asp:Label ID="lblEstimativa_Q5" runat="server" Font-Size="Medium" Font-Bold="true" ></asp:Label></span></div>

                        </div>
            
                    </div>

                </div>

            </div>

        </div>




    </div>

</asp:Content>

