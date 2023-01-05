<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteOrcamento.master" AutoEventWireup="false" CodeFile="OrcamentoInicio.aspx.vb" Inherits="MemberPages_Planejamento_OrcamentoInicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="../../css/carousel.css" rel="stylesheet" />--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

     
<!-- Carousel
          ================================================== -->
          <section id="carousel">
            <div class="page-header">
              <h1>Carousel <small>bootstrap-carousel.js</small></h1>
            </div>

            <h2>Exemplo do carousel</h2>
            <p>O slideshow abaixo mostra um plugin genérico e componente de deslizar elementos em ciclo como um carrossel</p>
            <div class="bs-docs-example">
              <div id="myCarousel" class="carousel slide">
                <div class="carousel-inner">
                  <div class="item active">
                    <img src="assets/img/bootstrap-mdo-sfmoma-01.jpg" alt="">
                    <div class="carousel-caption">
                      <h4>Primeiro rótulo de miniatura</h4>
                      <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    </div>
                  </div>
                  <div class="item">
                    <img src="assets/img/bootstrap-mdo-sfmoma-02.jpg" alt="">
                    <div class="carousel-caption">
                      <h4>Segundo rótulo de miniatura</h4>
                      <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    </div>
                  </div>
                  <div class="item">
                    <img src="assets/img/bootstrap-mdo-sfmoma-03.jpg" alt="">
                    <div class="carousel-caption">
                      <h4>Terceiro rótulo de miniatura</h4>
                      <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                    </div>
                  </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
              </div>
            </div>
<pre class="prettyprint linenums">
&lt;div id="myCarousel" class="carousel slide"&gt;
  &lt;!-- Itens de carousel --&gt;
  &lt;div class="carousel-inner"&gt;
    &lt;div class="active item"&gt;…&lt;/div&gt;
    &lt;div class="item"&gt;…&lt;/div&gt;
    &lt;div class="item"&gt;…&lt;/div&gt;
  &lt;/div&gt;
  &lt;!-- Navegador do carousel --&gt;
  &lt;a class="carousel-control left" href="#myCarousel" data-slide="prev"&gt;&amp;lsaquo;&lt;/a&gt;
  &lt;a class="carousel-control right" href="#myCarousel" data-slide="next"&gt;&amp;rsaquo;&lt;/a&gt;
&lt;/div&gt;
</pre>

            <div class="alert alert-warning">
              <strong>Atenção!</strong>
              Quando implementar este carousel, remova as imagens que nós disponibilizamos e coloque a sua
            </div>


            <hr class="bs-docs-separator">


            <h2>Uso</h2>

            <h3>Via atributos data</h3>
            <p>...</p>

            <h3>Via Javascript</h3>
            <p>Chame o carousel manualmente com:</p>
            <pre class="prettyprint linenums">$('.carousel').carousel()</pre>

            <h3>Opções</h3>
            <p>Opções podem ser passadas via atributos data ou por JavaScript. Para atributos data, insira a opção ao <code>data-</code>, assim como <code>data-interval=""</code>.</p>
            <table class="table table-bordered table-striped">
              <thead>
               <tr>
                 <th style="width: 100px;">Nome</th>
                 <th style="width: 50px;">Tipo</th>
                 <th style="width: 50px;">Padrão</th>
                 <th>Descrição</th>
               </tr>
              </thead>
              <tbody>
               <tr>
                 <td>intervalo</td>
                 <td>número</td>
                 <td>5000</td>
                 <td>A quantidade de tempo para um intervalo que automaticamente coloca um item em ciclos. Se falso, o carousel irá automaticamente em ciclo</td>
               </tr>
               <tr>
                 <td>pause</td>
                 <td>string</td>
                 <td>"hover"</td>
                 <td>Pausa o carousel no mouseenter e resume no mouseleave</td>
               </tr>
              </tbody>
            </table>

            <h3>Métodos</h3>
            <h4>.carousel(opções)</h4>
            <p>Inicializa o carousel com umas opções e começa a fazer um ciclo entre eles</p>
<pre class="prettyprint linenums">
$('.carousel').carousel({
  interval: 2000
})
</pre>
            <h4>.carousel('cycle')</h4>
            <p>Ciclos através do itens do carousel da esquerda para direita</p>
            <h4>.carousel('pause')</h4>
            <p>Pare o carousel de realizar ciclos através de itens</p>
            <h4>.carousel(number)</h4>
            <p>Os ciclos do carousel de um frame particular(baseado em 0, similar a um array)</p>
            <h4>.carousel('prev')</h4>
            <p>Ciclo para o item anterior</p>
            <h4>.carousel('next')</h4>
            <p>Ciclo para o próximo item</p>

            <h3>Eventos</h3>
            <p>A classe do Boostrap carousel expõe dois eentos para estender sua funcionalidade </p>
            <table class="table table-bordered table-striped">
              <thead>
               <tr>
                 <th style="width: 150px;">Evento</th>
                 <th>Descrição</th>
               </tr>
              </thead>
              <tbody>
               <tr>
                 <td>slide</td>
                 <td>este evento é disparado imediatamente quando a o método da instância <code>slide</code> é chamado.</td>
               </tr>
               <tr>
                 <td>slid</td>
                 <td>Este evento é chamado quando o carousel completou a sua transição de slide</td>
               </tr>
              </tbody>
            </table>
          </section>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script src="../../js/bootstrap.min.js"></script>



</asp:Content>

