<%@ Page Title="Mandala - Capa" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CapaMandala.aspx.vb" Inherits="MemberPages_Projetos_Mandala_CapaMandala" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



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
            float: left;
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

         #mandala_body_Lado {
            font-family: sans-serif;
            margin: 0;
            background-color:white;
            float: left;
            padding-top: 5px;
            padding-left: 5px;
            padding-bottom: 114px;
            padding-right: 5px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    

    <div id="mandala_body">

        <div class="mandala-grid">

            <div class="plan plan1">

                <h2>1. Lojas</h2>
                <%--<p>Observacao 1</p>--%>
                <ul class="features">
                    <li>Novas Atuais Reformas</li>        
                    <li>&nbsp</li>       
                </ul>

                <p class="price">[6,3 B]</p>

                <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_01.aspx" > <span class="label label-primary">Ação Estratégia 1</span></a> &nbsp&nbsp&nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista.aspx?nivel2=1"> <span class="label label-danger">Plano de Ação</span></a></div>

            </div>  

            <div class="plan plan2">

                <h2>2. Comercial</h2>
                <%--<p>Observacao 2</p>--%>
                <ul class="features">
                    <li>Mix Reestruturacão</li>                
                    <li>Gestão de Categorias</li>
                </ul>

                <p class="price">[140 M]</p>

                <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_02.aspx" > <span class="label label-primary">Ação Estratégia 2</span></a> &nbsp&nbsp&nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista.aspx?nivel2=2"> <span class="label label-danger">Plano de Ação</span></a></div>

            </div>

            <div class="plan plan3">

                <h2>3. Marketing</h2>
               <%-- <p>Observacao 3</p>--%>
                <ul class="features">
                    <li>CRM</li>               
                    <li>Publicidade</li>    
                </ul>

                <p class="price">[300 M]</p>

                <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_03.aspx" > <span class="label label-primary">Ação Estratégia 3</span></a> &nbsp&nbsp&nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista.aspx?nivel2=3"> <span class="label label-danger">Plano de Ação</span></a></div>

            </div>
            
        </div>

        <div class="mandala-grid">

            <div class="plan plan1">

                <h2>8. Com/Log/Mkt</h2>
                <%--<p>Observacao 4</p>--%>
                <ul class="features">
                    <li>Projeto Customer Trade</li>               
                    <li>&nbsp</li>
                </ul>

                <p class="price">[200 M]</p>

                <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_08.aspx" > <span class="label label-primary">Ação Estratégia 8</span></a> &nbsp&nbsp&nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista.aspx?nivel2=8"> <span class="label label-danger">Plano de Ação</span></a></div>

            </div>  

            <div class="plan plan2" style="border: 6px solid #f2980b; background-color: #f7db96" >

                <h2 style="background-color: #f7db96 ">FATURAMENTO EM 2021</h2>
                <h1 style="font-family: 'Arial Black', Gadget, sans-serif; color: #2d6dc6; font-weight: bold ">7,4 b</h1>
                

                <p class="price"><span style="color: #2d6dc6; font-weight: bold">1,5%</span> na U.L.</p>

                <div id="divCentro" runat="server" class=" FundoEnd cta "> <a href="Objtivo_Estrategico_Nivel_3_Lista.aspx?nivel2=0"> <span class="label label-danger">Plano de Ação</span></a></div>

            </div>

            <div class="plan plan3">

                <h2>4. Comerc/G.C</h2>
                <%--<p>Observacao 6</p>--%>
                <ul class="features">
                    <li>Controle deRupturas</li>               
                    <li>&nbsp</li>
                </ul>

                <p class="price">[900 M]</p>

                <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_04.aspx" > <span class="label label-primary">Ação Estratégia 4</span></a> &nbsp&nbsp&nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista.aspx?nivel2=4"> <span class="label label-danger">Plano de Ação</span></a></div>

            </div>
            
        </div>

        <div class="mandala-grid">

            <div class="plan plan1">

                <h2>7. Formatos</h2>
                <%--<p>Observacao 7</p>--%>
                <ul class="features">
                    <li>Novos Formatos </li>   
                    <li>de Negócios</li>    
                           
                </ul>

                <p class="price">[300 M]</p>

                <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_07.aspx" > <span class="label label-primary">Ação Estratégia 7</span></a> &nbsp&nbsp&nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista.aspx?nivel2=7"> <span class="label label-danger">Plano de Ação</span></a></div>

            </div>  

            <div class="plan plan2">

                <h2>6. Produtos</h2>
                <%--<p>Observacao 8</p>--%>
                <ul class="features">
                    <li>Perecíveis Melhores</li> 
                    <li>&nbsp</li>  
                               
                </ul>

                <p class="price">[120 M]</p>

                <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_06.aspx" > <span class="label label-primary">Ação Estratégia 6</span></a> &nbsp&nbsp&nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista.aspx?nivel2=6"> <span class="label label-danger">Plano de Ação</span></a></div>

            </div>

            <div class="plan plan3">

                <h2>5. RH</h2>
                <%--<p>Observacao 9</p>--%>
                <ul class="features">
                    <li>Capacitacão, Eficiencia</li>               
                    <li>Treinamento</li>
                
                </ul>

                <p class="price">[140 M]</p>

                <div  class=" FundoEnd cta "><a href="Objetivo_Estrategico_05.aspx" > <span class="label label-primary">Ação Estratégia 5</span></a> &nbsp&nbsp&nbsp <a href="Objtivo_Estrategico_Nivel_3_Lista.aspx?nivel2=5"> <span class="label label-danger">Plano de Ação</span></a></div>

            </div>
            
        </div>        

    </div>

    <div id="mandala_body_Lado">

        <dx:ASPxGridView ID="gridResumo" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" Width="565px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total de Plano de Ações: {0:n0}" ShowInColumn="Objetivos Estratégicos" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Total" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Total_Vencer" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Total_Vencidos" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Sem_Data_Vencimento" SummaryType="Sum" />
            </TotalSummary>
            <Columns>
                <dx:GridViewDataTextColumn Caption="Plano de Ação por &lt;br&gt; Objetivos Estratégicos" FieldName="Desc1" VisibleIndex="0" Width="180px">
                    <CellStyle Wrap="True">
                    </CellStyle>
                    <FooterCellStyle HorizontalAlign="Right">
                    </FooterCellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="1" Width="80px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total &lt;br&gt; Vencer" FieldName="Total_Vencer" VisibleIndex="2">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total &lt;br&gt; Vencidos" FieldName="Total_Vencidos" VisibleIndex="3">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Sem Data de &lt;br&gt; Vencimento" FieldName="Sem_Data_Vencimento" VisibleIndex="4" Width="80px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" />
            <Styles>
                <Header HorizontalAlign="Center" Font-Size="Medium">
                </Header>
                <AlternatingRow BackColor="#DFDFDF">
                </AlternatingRow>
                <Footer BackColor="#99ff66" HorizontalAlign="Center" Font-Bold="True">
                </Footer>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="Objetivo_Estrategico.usp_Resumo_Nivel1" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    
        <br />

        <dx:ASPxGridView ID="gridResumoNome" runat="server" DataSourceID="dsDadosNome" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" Width="565px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total de Plano de Ações: {0:n0}" ShowInColumn="Objetivos Estratégicos" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Total" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Total_Vencer" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Total_Vencidos" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Sem_Data_Vencimento" SummaryType="Sum" />
            </TotalSummary>
            <Columns>
                <dx:GridViewDataTextColumn Caption="Plano de Ação por &lt;br&gt; Responsável" FieldName="Desc1" VisibleIndex="0" Width="170px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                    <FooterCellStyle HorizontalAlign="Right">
                    </FooterCellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="1" Width="80px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total &lt;br&gt; Vencer" FieldName="Total_Vencer" VisibleIndex="2">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total &lt;br&gt; Vencidos" FieldName="Total_Vencidos" VisibleIndex="3">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Sem Data de&lt;br&gt; Vencimento" FieldName="Sem_Data_Vencimento" VisibleIndex="4" Width="120px">
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" VerticalScrollableHeight="300" VerticalScrollBarMode="Visible" />
            <Styles>
                <Header HorizontalAlign="Center" Font-Size="Medium">
                </Header>
                <AlternatingRow BackColor="#DFDFDF">
                </AlternatingRow>
                <Footer BackColor="#99ff66" HorizontalAlign="Center" Font-Bold="True">
                </Footer>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsDadosNome" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="Objetivo_Estrategico.usp_Resumo_Nive1_porNome" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


    </div>

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>


