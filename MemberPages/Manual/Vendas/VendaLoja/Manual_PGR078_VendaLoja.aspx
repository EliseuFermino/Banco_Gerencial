<%@ Page Title="Manual PGR078 - Análise de Vendas por Filial" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Manual_PGR078_VendaLoja.aspx.vb" Inherits="MemberPages_Manual_Vendas_VendaLoja_Manual_PGR078_VendaLoja" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divManual {
            float: left;
            margin-left: 6px;
            margin-top:6px;
            background-color : white;
            padding: 8px;
        }

        p {
            font-size: 16px;
        }

        ul {
            font-size: 16px;
        }

        li {
            font-size: 16px;
        }        
        .ColorRed {
            color: red;
            font-weight:bold;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divManual">

        <h1>Manual da Consulta - Análise de Venda por Filial</h1>

        <h2>Programa - PGR78</h2>

        <p>Para acessar a consulta vá no menu Vendas -> Análise de Vendas... </p>

        <img src="menu1.png" />

        <p>No menu a direita clique em Pefil -> por Loja </p>

        <img src="menu2.png" />   <img src="menu3.png" />

        <br />

        <p><b>Observação:</b> Sempre que mudar o Ano ou Mês, clique em "Atualizar"</p>

        <img src="cabecalho.png" />

        <br />

        <p>
            Na tela abaixo é exibido as seguintes informações diárias do período selecionado        
        </p>

        <ul>
            <li>01 - Sugestão de Venda</li>
            <li>02 - Meta de Venda</li>
            <li>03 - Venda Realizada</li>
            <li>04 - % Percentual sobre o Atingimento de Venda</li>
            <li>05 - Meta de Margem</li>
            <li>06 - Margem Realizada</li>
            <li>07 - Diferença entre a Meta e o Realizado</li>
            <li>08 - Número de Clientes</li>
            <li>09 - Venda Média por Funcionário</li>
            <li>10 - Ticket Médio por Cliente</li>
            <li>11 - Venda por Check-Out</li>
            <li>12 - Venda por Metro Quadrado</li>
        </ul>

        <img src="fig1.png" />

        <p>Quando você desmarca a opção <b>Fixar Cabeçalho</b>...</p>

        <img src="fig2.png" />

        <p>É exibida a informação de todos os dias na tela sem precisar ficar rolando a Barra de Rolagem.</p>

        <img src="fig3.png" />

        <br />

        <p>Se você clicar na opção <b>Projetar Até o Final do Mês</b>...</p>

        <img src="fig10.png" />

        <p>A sua venda será projetada até o final do Mês!!!</p>

        <br />

        <p>Se você clicar na opção <b>Até Hoje</b>...</p>

        <img src="fig11.png" />

        <p>Você tem o Total das suas Vendas até o dia hoje. A medida que sua venda vai acontecendo já vai sendo atualizado essa consulta</p>

        <br />

        <p>Se você clicar na opção <b>Até Ontem</b>...</p>

        <img src="fig12.png" />

        <p>Você tem o Total das suas Vendas até ontem.</p>

        <br />


        <p>Quando você seleciona a opção <b>Ver por Dia da Semana</b>...</p>

        <img src="fig4.png" />

        <p>A informação agora é exibida por dias da semana (segunda-feira, terça-feira, quarta-feira e etc.)...</p>

        <img src="fig5.png" />

        <p>Se por exemplo, eu quero ver o comportamento das minhas vendas de terça-feira, o que eu faço? Clico em cima da <b>Desc.: 2-Ter</b>... </p>

        <img src="fig6.png" />

        <p>E será aberto somente as vendas de terça-feira...</p>

        <img src="fig7.png" />

        <p>Podemos fazer algumas considerações sobre as vendas de terça-feira - que até agora foram 4 dias de vendas, ainda falta uma terça-feira devido a esse mês ter 5 terças-feira da loja em questão...</p>

        <ul>
            <li>As duas primeiras terças-feira (03/03 e 10/03) foi aonde se concentrou as maiores vendas. A terceira terça-feira (17/03) já teve uma queda 
                expressiva, vendeu somente R$ 113.606, neste caso <span class="ColorRed">-22,28%</span>  em relação a terça-feira do dia 10/03 que foi R$ 146.174.
            </li>
            <li>Com exceção da primeira terça-feira que o número de clientes foi 2.208, as três terças restantes o número de clientes ficou na média de 
                2.040 clientes. Observo que no dia 10/03, 2.078 clientes entregaram para a loja R$ 146.174 de venda e no dia 17/03, 2.028 clientes entregaram
                R$ 113.606 de venda, ou seja, praticamente o mesmo número de clientes entregaram valores de venda diferentes, por que? A margem do dia 10/03 foi de 
                19,19% contra 20,34% do dia 17/03, ou seja, a loja estava mais barata nesse dia. Outro fator, que produto o meu cliente levou a mais no dia 10/03? Essa 
                resposta poderia ser respondida facilmente analisando a venda por mercadológico de cada Depto/Seção/Grupo/Familia. 
                Em uma análise rápida, o Departamento de Mercearia do dia 17/03 perdeu R$ 22.210, sendo que deste valor R$ 6.000 é da Seção Seca Pesada e na Categoria Cafés tem uma perda de Venda R$ 2.000.                 
            </li>
            <li>O número de clientes esta dentro de uma média que não oscila muito</li>
            <li>O Ticket Médio por cliente nas terças-feiras é de R$ 62,64.</li>
        </ul>

        <br />

        <p>Abaixo temos a Análise do Percentual do Crescimento de Venda em relação ao ano anterior com o IPCA dos ultimos 3 anos (36 meses). Essa informação é importante para medir
            se o crescimento da loja esta acima da inflação, ou seja, se eu estou tendo ganho real.
        </p>

        <img src="fig31%20(7).png" />

        <p>Alguns comentários...</p>
        <ul>
            <li>Quando algum ponto da linha do gráfico passa abaixo da linha vermelha significa que a loja esta com Crescimento Negativo em relação ao ano anterior e abaixo da inflação naquele mês.</li>
            <li>Quando algum ponto da linha do gráfico ficar dentro da área do IPCA significa que a loja teve Crescimento Positivo em relação ao ano anterior, porém o crescimento não foi real naquele mês, é um crescimento mascarado. </li>
            <li>Quando algum ponto da linha do gráfico ficar acima da linha vermelha e acima da linha da inflação significa que a loja esta tendo cresciment real naquele mês.</li>
        </ul>

        <p>Se você quiser ver qual é a inflação (IPCA) de qualquer mês, é só passar o mouse na área do IPCA...</p>

        <img src="fig8.png" />

        <br />

        <p>Abaixo temos as últimos 3 anos (36 meses) de <b>Vendas</b> ... </p>

        <img src="fig31%20(1).png" />

        <br />

        <p>Abaixo temos a Análise do Número de Clientes por Dia dos últimos 5 anos, ou seja, o Batimento Cardiaco, o que faz as nossa loja pulsar é o Cliente, sem eles nós morremos...</p>

        <img src="fig31%20(2).png" />

        <p>Temos uma "área" central em cinza escuro no meio, quanto mais estiver subindo mellhor, isso que dizer que na média o meu número de clientes esta subindo. E 
            quantos mais picos para cima tivermos, melhor!
        </p>

        <br />

        <p>Abaixo temos o <b>Crescimento de Clientes sobre o Ano Anterior</b> dos ultimos 3 anos (36 meses). Essa informação é importante para medir
            se estou ganhando ou perdendo cliente.
        </p>

        <img src="fig31%20(3).png" />

        <p>Quando algum ponto da linha do gráfico passa abaixo da linha vermelha significa que a loja esta com Crescimento Negativo de Clientes em relação ao mesmo mês do ano anterior.</p>

        <br />

        <p>Abaixo temos as últimos 3 anos (36 meses) de <b>Número de Clientes</b>...</p>

        <img src="fig31%20(4).png" />

        <p>O ideal é que a linha do gráfico dos Números de Clientes sempre esteja em ascensão...</p>

        <br />

        <p>Abaixo temos <b>Top 20 - Itens Mais Vendidos na Loja no Mês</b>...</p>

        <img src="fig9.png" />

        <p>Algumas observações</p>

        <ul>
            <li>Essa tela exibe o Ranking com os 20 itens mais vendidos nesse mês</li>
            <li>No caso dessa loja, esses 20 itens representam 12,20% da venda. Parece pouco? Nesse mesmo período essa loja comercializou 14.048 itens diferentes!!!</li>
            <li>Essa loja tem 3 produtos da Seção 23 - Hortifruti. Quando você tem um produto da seção 23 que esta no TOP 20 tome o devido cuidado para ele não faltar na área 
                de venda, verifique sua qualidade, tire os produtos impróprios (podres, murchos e etc) e verifique se esta bem exposto. Quando vejo que 6.156 clientes 
                comprando quase 13 toneladas Batata, ou seja, cada cliente levou em média 6,156 Kilos em com uma margem de 24,90%!!! significa dizer que este é um produto que o meu cliente tem intenção de comprar.
                Para ele continuar comprando, vai depender muito do preço, qualidade, atendimento rápido na Balança dentro do possivel. Verifique que dia você vende mais batata,
                verifique em que horário você vende mais batata (o programa PGR253 lhe dá essas informações! para acessar vá em Vendas -> Mercadológico -> Análises -> Seção e Hora Semanal) e tome alguma ação
                como não faltar produtos nesse horário, ter sempre colaboradores na balança para suprir o fluxo de clientes e etc...
            </li>

        </ul>

       <br />

        <p>Abaixo temos <b>Top 20 - Volume Mais Vendido na Loja no Mês</b>...</p>

        <img src="fig31%20(5).png" />

        <p>Nos trás a informação dos 20 itens mais vendidos em volume.</p>

        <br />

        <p>Abaixo temos <b>Top 20 - Lucro dos Itens Mais Vendidos na Loja no Mês</b>...</p>

        <img src="fig31%20(6).png" />

        <p>Nos trás a informação do Lucro dos 20 itens mais vendidos.</p>

        <br />

        <p>Quaisquer dúvidas, sugestões ou erros, por favor, deixe-me saber. Meu ramal é 2038.</p>

        <h2>Eliseu Fermino - Controladoria</h2>

    </div>

</asp:Content>

