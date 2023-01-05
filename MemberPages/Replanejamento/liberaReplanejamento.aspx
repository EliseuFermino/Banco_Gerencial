<%@ Page Title="Libera Replanejamento" Language="VB" MasterPageFile="~/MemberPages/SiteMetas.master" AutoEventWireup="false" CodeFile="liberaReplanejamento.aspx.vb" Inherits="MemberPages_Replanejamento_liberaReplanejamento" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css" >
        
        .Borda_Superior {
            padding-top: 5px;
            padding-bottom: 5px
        }

        .LinhaInferior {
            border-bottom: 1px dashed gray;
        }

       
    </style>

    <link href="../../css/bootstrap.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
        <div class="container-fluid">

            <div class="row Borda_Superior">
                <div class="col-md-2">
                    <uc1:wucAno runat="server" ID="cboAno" />
                </div>

                <div class="col-md-2">
                    <uc1:wuciListaMes runat="server" ID="cboMes" />
                </div>
            </div>

            <div class="row bg-primary Borda_Superior" style="color:white; font-weight:bold ">
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Replanejamento" runat="server" Text=" Replanejamento" />
                </div>

                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Participacao" runat="server" Text="Participação" />
                </div>

                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Margem" runat="server" Text="Margem" />
                </div>

                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Agenda23" runat="server" Text="Agenda 23" />
                </div>

            </div>

            <div class="row bg-warning Borda_Superior">

                <div class="col-md-12" style="font-weight:bold">
                    Lojas Condor
                </div>                

            </div>

            <div class="row Borda_Superior LinhaInferior">
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja03" runat="server" Text=" 03 - Santa Felicidade" />
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja04" runat="server" Text="04 - Lapa" />                    
                </div>
                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja05" runat="server" Text="05 - Wenceslau" />                     
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja06" runat="server" Text="06 - Pinheirinho" />                     
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja07" runat="server" Text="07 - Marechal" />                    
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja08" runat="server" Text="08 - Paranaguá" />
                </div>
               
            </div>

            <div class="row Borda_Superior LinhaInferior">
                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja09" runat="server" Text="09 - Londrina" />                    
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja10" runat="server" Text="10 - Campo Comprido" />
                     
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja11" runat="server" Text="11 - São Bráz" />                
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja13" runat="server" Text="13 - Sitio Cercado" />                     
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja14" runat="server" Text="14 - São José dos Pinhais" />
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja15" runat="server" Text="15 - Apucarana" />                    
                </div>
               
            </div>

            <div class="row Borda_Superior LinhaInferior">
                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja17" runat="server" Text="17 - Ahú" />                     
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja18" runat="server" Text="18 - Ponta Grossa Centro" />
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja19" runat="server" Text="19 - Ponta Grossa Nova" /> 
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja20" runat="server" Text="20 - Maringá" />                     
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja21" runat="server" Text="21 - Nilo Peçanha" />                     
                </div>
                <div class="col-md-2">
                      <asp:CheckBox ID="chk_Loja22" runat="server" Text="22 - Champagnat" />
                </div>
                
            </div>

            <div class="row Borda_Superior LinhaInferior">
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja23" runat="server" Text="23 - Araucária Nova" />
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja24" runat="server" Text="24 - Santa Candida" />
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja25" runat="server" Text="25 - Paranaguá Nova" />                     
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja26" runat="server" Text="26 - Torres" />
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja27" runat="server" Text="27 - Novo Mundo" />
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja28" runat="server" Text="28 - Cristo Rei" />
                </div>
                
            </div>

            <div class="row Borda_Superior LinhaInferior">
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja29" runat="server" Text="29 - Água Verde" />                    
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja30" runat="server" Text="30 - Fazenda Rio Grande" />
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja31" runat="server" Text="31 - Campo LArgo" />
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja32" runat="server" Text="32 - P. G. Uvaranas" />
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja33" runat="server" Text="33 - 33 - S.J. Av. Joinville" />                     
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja34" runat="server" Text="34 - Brasilia" />
                </div>
                
            </div>

            <div class="row Borda_Superior LinhaInferior">
                <div class="col-md-2">
                      <asp:CheckBox ID="chk_Loja36" runat="server" Text="36 - Castro" />
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja37" runat="server" Text="37 - Cajuru" />                     
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja38" runat="server" Text="38 - Colombo" />
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja39" runat="server" Text="39 - Pinhais" />
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja40" runat="server" Text="40 - Maringa" />
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja41" runat="server" Text="41 - Campo Mourão" />
                </div>
                
                
            </div>

            <div class="row Borda_Superior LinhaInferior">
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja42" runat="server" Text="42 - P.G. Jardim Carvalho" />
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja43" runat="server" Text="43 - Almirante Tamandaré" />
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja44" runat="server" Text="44 - Ponta Grossa Nova" />
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja45" runat="server" Text="45 - Araucária Costeira" />
                     
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja46" runat="server" Text="46 - Campo Largo" />
                     
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja47" runat="server" Text="47 - Pinhais" />
                </div>
                
               
            </div>

             <div class="row Borda_Superior LinhaInferior">
                 <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja48" runat="server" Text="48 - Joinville" />
                </div>
                  <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja49" runat="server" Text="49 - Boa Vista" />
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja50" runat="server" Text="50 - Santa Quitéria" />
                </div>
                  <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja51" runat="server" Text="51 - Joinvile America" />
                </div>

                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja52" runat="server" Text="52 - Mafra" />
                </div>

                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja53" runat="server" Text="53 - João Bettega" />
                </div>

                                       
            </div>



            <div class="row Borda_Superior LinhaInferior">
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja54" runat="server" Text="54 - Derosso" />
                </div>   

                <div class="col-md-2">                    
                    <asp:CheckBox ID="chk_Loja55" runat="server" Text="55 - Jaragua" />
                    
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja56" runat="server" Text="56 - Piraquara" />
                </div>
                  <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja57" runat="server" Text="57 - Joinville Boa Vista" />
                </div>

                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja58" runat="server" Text="58 - Pilarzinho" />
                </div>

                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja59" runat="server" Text="59 - Express" />
                </div>

                
                            
            </div>

             <div class="row Borda_Superior LinhaInferior">
                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja60" runat="server" Text="60 - Maringá - Av. Teixeira Mendes" />
                </div>

                 <div class="col-md-2">                    
                    
                    
                </div>

                                            
            </div>


            <div class="row bg-warning Borda_Superior">

                <div class="col-md-12" style="font-weight:bold">
                    Gigante
                </div>                

            </div>

            <div class="row Borda_Superior LinhaInferior">
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja603" runat="server" Text="603 - JK" />
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja604" runat="server" Text="604 - Colombo" />                    
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja605" runat="server" Text="605 - Maringá" />                    
                </div>
               <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja606" runat="server" Text="606 - Pinhais" />                    
                </div>
            </div>


            <div class="row bg-warning Borda_Superior">

                <div class="col-md-12" style="font-weight:bold">
                    Postos de Combustiveis
                </div>                

            </div>

            <div class="row Borda_Superior LinhaInferior">
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja203" runat="server" Text="203 - Posto Marechal" />
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja204" runat="server" Text="204 - Posto Sitio Cercado" />                    
                </div>
                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja205" runat="server" Text="205 - Posto Pinheirinho" />                     
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja206" runat="server" Text="206 - Posto Campo Mourão" />                     
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja211" runat="server" Text="211 - Posto São José" />                    
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja212" runat="server" Text="212 - Posto Tarumã" />
                </div>
               
            </div>

            <div class="row Borda_Superior LinhaInferior">
                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja213" runat="server" Text="213 - Posto Doha" />                    
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja214" runat="server" Text="214 - Posto Atuba" />
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja215" runat="server" Text="215 - Posto TS - Gas GNV" />                    
                </div>
                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja216" runat="server" Text="216 - Posto Hauer" />                     
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja217" runat="server" Text="217 - Posto Laguna" />                     
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja218" runat="server" Text="218 - Posto Pedrazzoli" />                    
                </div>
               
            </div>

             <div class="row Borda_Superior LinhaInferior">
                  <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja219" runat="server" Text="219 - Posto Via Sual Brasil" />
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja220" runat="server" Text="220 - Posto SAFF" />                    
                </div>
                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja221" runat="server" Text="221 - Posto PG" />
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja222" runat="server" Text="222 - Posto Sachi" />                    
                </div>
                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja223" runat="server" Text="223 - Posto Campeiro" />                     
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja224" runat="server" Text="224 - Posto Pérola" />                     
                </div>
                
                
            </div>

             <div class="row Borda_Superior LinhaInferior">
                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja225" runat="server" Text="225 - Posto Arthur Bernardes" />                    
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja226" runat="server" Text="226 - Posto Anita Garibaldi" />
                </div>
                 <div class="col-md-2">
                    <asp:CheckBox ID="chk_Loja227" runat="server" Text="227 - Posto das Araucárias" />                    
                </div>

                <div class="col-md-2">
                     <asp:CheckBox ID="chk_Loja228" runat="server" Text="228 - Posto Pilarzinho" />
                </div>
               
            </div>


            <div class="row bg-success Borda_Superior">
                <div class="col-md-3">
                     <asp:Button ID="btnSelecionarTodasLojas" runat="server" Text="Selecionar Todas Lojas" />
                </div>

                <div class="col-md-3">
                      <asp:Button ID="btnSelecionarCondor" runat="server" Text="Selecionar Condor" />
                </div>

                <div class="col-md-3">
                     <asp:Button ID="btnSelecionarPosto" runat="server" Text="Selecionar Postos" />  
                </div>

                <div class="col-md-3">
                     <asp:Button ID="btnSelecionarGigante" runat="server" Text="Selecionar Gigante" />
                </div>

            </div>

            <div class="row bg-danger Borda_Superior">                

                <div class="col-md-3">
                      <asp:Button ID="btnDesmarcarTodasLojas" runat="server" Text="Desmarcar Todas Lojas" />
                </div>

                <div class="col-md-3">
                     <asp:Button ID="btnSalvar" runat="server" Text="Salvar" />  
                </div>

                <div class="col-md-3">
                     <asp:Button ID="btnLimparTudo" runat="server" Text="Limpar Tudo" />
                </div>

            </div>
            
        </div>
                   
</asp:Content>

