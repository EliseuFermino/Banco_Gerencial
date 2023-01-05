<%@ Page Title="Checklist Condor" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CheckListCeasa.aspx.vb" Inherits="MemberPages_CheckListCeasa
    " %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<%@ Register src="../../Controles/wucAguarde.ascx" tagname="wucAguarde" tagprefix="uc3" %>
<%@ Register Src="~/Controles/wuciListaDia.ascx" TagPrefix="uc2" TagName="wuciListaDia" %>
<%@ Register Src="~/Controles/wuciListaLojasComApoio.ascx" TagPrefix="uc2" TagName="wuciListaLojasComApoio" %>


<%@ Register src="../../Controles/wucAguardeRoda.ascx" tagname="wucAguardeRoda" tagprefix="uc1" %>








<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  
    
          <style type="text/css">
    .fileEscondido {
	    overflow: hidden;
        position: relative;
    }

    .fileEscondido input[type=file]{
	    opacity: 0;
	    font-size: 45px; 
	    position: absolute; 
	    right: 0px; 
	    top: 0px; 
	    opacity: 0;
	    filter: alpha(opacity=0); 
	    -ms-filter: "alpha(opacity=0)"; 
	    -khtml-opacity: 0; 
	    -moz-opacity: 0;	
	    cursor: pointer;
    }
    .botaoBlock {
	    width: 32px;
	    height: 32px;
	    position: absolute;
	    top: 0px;	
	    line-height: 42px;
        background:url(http://blog.paulomontoya.com.br/wp-content/uploads/2012/01/1326736657_Add-button.png) top no-repeat;
	    padding: 0;
	    border: 0;
	    outline: none;
    }

 
        </style>

  
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>   
    <script src="../../js/bootstrap.min.js"></script>

  



    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
        <Triggers>
      
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_5" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_6" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_7" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_8" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_9" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_10" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_11" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_12" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_13" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_14" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_15" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_16" /> 

             <asp:PostBackTrigger ControlID="btnSalvarFoto9_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_5" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_6" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_7" />
            
             <asp:PostBackTrigger ControlID="btnSalvarFoto10_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_5" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_6" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_7" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_8" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_9" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_10" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_11" />  

            
            <asp:PostBackTrigger ControlID="btnPDF" />                   
             
            
        </Triggers> 

        <ContentTemplate>

            <table cellspacing="1" >
                <tr>
                    <td align="left">
                        <uc2:wuciListaDia runat="server" id="cboDia" />
                    </td>
                    <td align="left">
                        <uc4:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                    </td>
                    <td >
                        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="True">
                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Buscando informações...');}" />                                             
                        </dx:ASPxButton>
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    </td>
                    <td>
                        <dx:ASPxButton ID="btnPDF" runat="server" Text="Relatório"></dx:ASPxButton>
                        <asp:Label ID="lblError" runat="server" Text="Label" Visible="false"></asp:Label>
                    </td>
                    <td>
                        
                        <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="Callback">
                             <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Hide(); }" />
                        </dx:ASPxCallback>

                        <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="LoadingPanel" 
                             Modal="True"  Text ="Salvando. Agurade...">
                        </dx:ASPxLoadingPanel>
                        
                    </td>
                </tr>
            </table>            

            <link rel="stylesheet" type="text/css" href="../../Styles/style.css" />
        

<asp:Panel ID="panTitle8" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 8 - HORTIFRUTI - RECEBIMENTO - (16 perguntas, 1 à 16) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle8" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel> 
<asp:Panel ID="panDados8" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">        
    <p>  
            <table id="gradient-style" summary="Meeting Results">
                        <thead>
    	                    <tr>
        	                    <th  align="center" scope="col">Nº</th>
                                <th scope="col">Pergunta</th>
                                <th align="center" scope="col" width="25px" >Sim</th>
                                <th align="center" scope="col" width="25px" >Não</th>
                                <th align="center" scope="col" width="25px" >N.A.</th> 
                                <th align="center" scope="col" width="25px" colspan="2" >Foto</th> 
                                <th align="center" scope="col" width="25px" >PPO</th>                                                                 
                            </tr>
                        </thead>

                        <tbody>

                            <tr>
        	                    <td align="center">8.1</td>
                                <td>É realizada conferência da NF, comparando com as informações do pedido?<asp:TextBox
                                        ID="txt8_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_1_Sim" runat="server" GroupName="grupo8_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_1_Nao" runat="server" GroupName="grupo8_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_1_NA" runat="server" GroupName="grupo8_1" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                                                            
                            </tr>  <%--PERGUNTA 8.1.1--%>  

                            <tr>
        	                    <td align="center">8.2</td>
                                <td>As balanças estão limpas, aferidas e de fácil acesso aos conferentes?<asp:TextBox
                                        ID="txt8_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_2_Sim" runat="server" GroupName="grupo8_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_2_Nao" runat="server" GroupName="grupo8_2" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_2_NA" runat="server" GroupName="grupo8_2" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                                                                                            
                            </tr>  <%--PERGUNTA 8.1.2--%> 

                            <tr>
        	                    <td align="center">8.3</td>
                                <td>Todas as entregas vem acompanhadas de NF de palets?<asp:TextBox
                                        ID="txt8_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_3_Sim" runat="server" GroupName="grupo8_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_3_Nao" runat="server" GroupName="grupo8_3" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_3_NA" runat="server" GroupName="grupo8_3" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                                 
                            </tr>  <%--PERGUNTA 8.1.3--%>

                            <tr>
        	                    <td align="center">8.4</td>
                                <td>A conferência 100% dos produtos ocorre no momento em que os mesmos são descarregados na doca, e sem a interferência do entregador/fornecedor?<asp:TextBox
                                        ID="txt8_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_4_Sim" runat="server" GroupName="grupo8_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_4_Nao" runat="server" GroupName="grupo8_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_4_NA" runat="server" GroupName="grupo8_4" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                             
                            </tr>  <%--PERGUNTA 8.1.4--%>

                            <tr>
        	                    <td align="center">8.5</td>
                                <td>É verificada a qualidade (aparência, embalagem, validade) dos produtos recebidos, conforme o que determina o "Book de Hortifruti"?<asp:TextBox
                                        ID="txt8_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_5_Sim" runat="server" GroupName="grupo8_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_5_Nao" runat="server" GroupName="grupo8_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_5_NA" runat="server" GroupName="grupo8_5" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Book de Hortifruti + Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 8.1.5--%>

                            <tr>
        	                    <td align="center">8.6</td>
                                <td>Cargas faltantes ou avarias estão sendo devolvidas e/ou emitidas NF de devolução?<asp:TextBox
                                        ID="txt8_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_6_Sim" runat="server" GroupName="grupo8_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_6_Nao" runat="server" GroupName="grupo8_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_6_NA" runat="server" GroupName="grupo8_6" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                                 
                            </tr>  <%--PERGUNTA 8.1.6--%>   
                             
                            <tr>
        	                    <td align="center">8.7</td>
                                <td>É verificado o estado dos veículos (limpeza, organização e conservação) dos fornecedores?<asp:TextBox
                                        ID="txt8_7" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_7_Sim" runat="server" GroupName="grupo8_7" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_7_Nao" runat="server" GroupName="grupo8_7" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_7_NA" runat="server" GroupName="grupo8_7" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_7" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                             
                            </tr>  <%--PERGUNTA 8.1.7--%> 
                             
                            <tr>
        	                    <td align="center">8.8</td>
                                <td>Os produtos perecívies, que devem ser refrigerados, são encaminhados imediatamente para o seu local de armazenagem após a conferência?<asp:TextBox
                                        ID="txt8_8" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_8_Sim" runat="server" GroupName="grupo8_8" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_8_Nao" runat="server" GroupName="grupo8_8" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_8_NA" runat="server" GroupName="grupo8_8" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_8" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 8.1.8--%>  

                            <tr>
        	                    <td align="center">8.9</td>
                                <td>Existem notas fiscais pendentes de "acatamento" (sem pedido, divergência de quantidade ou custo)?<asp:TextBox
                                        ID="txt8_9" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_9_Sim" runat="server" GroupName="grupo8_9" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_9_Nao" runat="server" GroupName="grupo8_9" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_9_NA" runat="server" GroupName="grupo8_9" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_9" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 8.1.9--%> 

                            <tr>
        	                    <td align="center">8.10</td>
                                <td>Foi evidenciada doca aberta sem caminhão encostado?<asp:TextBox
                                        ID="txt8_10" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_10_Sim" runat="server" GroupName="grupo8_10" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_10_Nao" runat="server" GroupName="grupo8_10" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_10_NA" runat="server" GroupName="grupo8_10" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_10" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                                 
                            </tr>  <%--PERGUNTA 8.1.10--%> 

                            <tr>
        	                    <td align="center">8.11</td>
                                <td>O Fiscal está presente 100% do tempo no recebimento?<asp:TextBox
                                        ID="txt8_11" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_11_Sim" runat="server" GroupName="grupo8_11" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_11_Nao" runat="server" GroupName="grupo8_11" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_11_NA" runat="server" GroupName="grupo8_11" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_11" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                              
                            </tr>  <%--PERGUNTA 8.1.11--%> 

                            <tr>
        	                    <td align="center">8.12</td>
                                <td>O controle de ocorrências do recebimento (entrada de NFs, devolução, irregularidades de recebimento) está sendo preenchido corretamente? (Verificar relatórios de irregularidades)<asp:TextBox
                                        ID="txt8_12" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_12_Sim" runat="server" GroupName="grupo8_12" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_12_Nao" runat="server" GroupName="grupo8_12" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_12_NA" runat="server" GroupName="grupo8_12" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_12" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 8.1.12--%> 

                            <tr>
        	                    <td align="center">8.13</td>
                                <td>No momento da avaliação, o setor se encontrava limpo e organizado?<asp:TextBox
                                        ID="txt8_13" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_13_Sim" runat="server" GroupName="grupo8_13" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_13_Nao" runat="server" GroupName="grupo8_13" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_13_NA" runat="server" GroupName="grupo8_13" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_13" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                           
                            </tr>  <%--PERGUNTA 8.1.13--%>

                            <tr>
        	                    <td align="center">8.14</td>
                                <td>O pátio externo do Hortifruti encontra-se limpo e organizado?<asp:TextBox
                                        ID="txt8_14" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_14_Sim" runat="server" GroupName="grupo8_14" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_14_Nao" runat="server" GroupName="grupo8_14" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_14_NA" runat="server" GroupName="grupo8_14" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_14" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                              
                            </tr>  <%--PERGUNTA 8.1.14--%>   
                             
                            <tr>
        	                    <td align="center">8.15</td>
                                <td>As "caixas de rancho" estão limpas e em bom estado de conservação?<asp:TextBox
                                        ID="txt8_15" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_15_Sim" runat="server" GroupName="grupo8_15" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_15_Nao" runat="server" GroupName="grupo8_15" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_15_NA" runat="server" GroupName="grupo8_15" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_15" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_15" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                              
                            </tr>  <%--PERGUNTA 8.1.15--%> 
                             
                            <tr>
        	                    <td align="center">8.16</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados para o recebimento?<asp:TextBox
                                        ID="txt8_16" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_16_Sim" runat="server" GroupName="grupo8_16" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_16_Nao" runat="server" GroupName="grupo8_16" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_16_NA" runat="server" GroupName="grupo8_16" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto8_16" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile8_16" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto8_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR6 - Equipamento de Proteção Individual - EPI">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 8.1.16--%>  

    

                            <thead> 
        	                      <tr>
                                      <td>
                                      </td>
                                      
                                      <td align="right">
                                        <dx:ASPxButton ID="btnGrupo8" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>          

                                      </td>
                                  </tr>
                              </thead>                       

                        </tbody>
                    </table>           
    </p>      
</asp:Panel> <%--3 - CÂMARA CONGELADOS --%>

<asp:Panel ID="panTitle9" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 9 - HORTIFRUTI - ESTOQUE - (7 perguntas, 1 à 7) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle9" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel> 
<asp:Panel ID="panDados9" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">        
    <p>  
                   <table id="gradient-style" summary="Meeting Results">
                        <thead>
    	                    <tr>
        	                    <th  align="center" scope="col">Nº</th>
                                <th scope="col">Pergunta</th>
                                <th align="center" scope="col" width="25px" >Sim</th>
                                <th align="center" scope="col" width="25px" >Não</th>
                                <th align="center" scope="col" width="25px" >N.A.</th> 
                                <th align="center" scope="col" width="25px" colspan="2" >Foto</th> 
                                <th align="center" scope="col" width="25px" >PPO</th>                                                            
                            </tr>
                        </thead>

                        <tbody>

                            <tr>
        	                    <td align="center">9.1</td>
                                <td>O estoque está limpo, organizado e em condições higiênicas?<asp:TextBox
                                        ID="txt9_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd9_1_Sim" runat="server" GroupName="grupo9_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd9_1_Nao" runat="server" GroupName="grupo9_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd9_1_NA" runat="server" GroupName="grupo9_1" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto9_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile9_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto9_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                                                              
                            </tr>  <%--PERGUNTA 9.1.1--%>  

                            <tr>
        	                    <td align="center">9.2</td>
                                <td>Os produtos que exalam gas etileno estão separados de acordo com cada categoria?<asp:TextBox
                                        ID="txt9_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd9_2_Sim" runat="server" GroupName="grupo9_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd9_2_Nao" runat="server" GroupName="grupo9_2" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd9_2_NA" runat="server" GroupName="grupo9_2" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto9_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile9_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto9_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="ANVISA">PPO</a>
</td>                                                                                               
                            </tr>  <%--PERGUNTA 9.1.2--%> 

                            <tr>
        	                    <td align="center">9.3</td>
                                <td>Existem produtos de má qualidade e/ou impróprios para consumo armazenados com produtos bons?<asp:TextBox
                                        ID="txt9_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd9_3_Sim" runat="server" GroupName="grupo9_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd9_3_Nao" runat="server" GroupName="grupo9_3" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd9_3_NA" runat="server" GroupName="grupo9_3" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto9_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile9_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto9_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="ANÁLISE VISUAL">PPO</a>
</td>                                 
                            </tr>  <%--PERGUNTA 9.1.3--%>

                            <tr>
        	                    <td align="center">9.4</td>
                                <td>A temperatura da câmara fria está conforme estabelecido?<asp:TextBox
                                        ID="txt9_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd9_4_Sim" runat="server" GroupName="grupo9_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd9_4_Nao" runat="server" GroupName="grupo9_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd9_4_NA" runat="server" GroupName="grupo9_4" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto9_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile9_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto9_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                              
                            </tr>  <%--PERGUNTA 9.1.4--%>

                            <tr>
        	                    <td align="center">9.5</td>
                                <td>A câmara fria está em perfeitas condições de uso conforme orientações do fabricante? (verificar limpeza, organização, higiene, manutenção geral)<asp:TextBox
                                        ID="txt9_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd9_5_Sim" runat="server" GroupName="grupo9_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd9_5_Nao" runat="server" GroupName="grupo9_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd9_5_NA" runat="server" GroupName="grupo9_5" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto9_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile9_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto9_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                             
                            </tr>  <%--PERGUNTA 9.1.5--%>

                            <tr>
        	                    <td align="center">9.6</td>
                                <td>Foram encontrados produtos vencidos?<asp:TextBox
                                        ID="txt9_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd9_6_Sim" runat="server" GroupName="grupo9_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd9_6_Nao" runat="server" GroupName="grupo9_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd9_6_NA" runat="server" GroupName="grupo9_6" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto9_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile9_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto9_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="ANÁLISE VISUAL">PPO</a>
</td>                              
                            </tr>  <%--PERGUNTA 9.1.6--%>   
                             
                            <tr>
        	                    <td align="center">9.7</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados para o recebimento?<asp:TextBox
                                        ID="txt9_7" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd9_7_Sim" runat="server" GroupName="grupo9_7" /></td>
                                <td align="center"><asp:RadioButton ID="rnd9_7_Nao" runat="server" GroupName="grupo9_7" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd9_7_NA" runat="server" GroupName="grupo9_7" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto9_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile9_7" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto9_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR6 - Equipamento de Proteção Individual - EPI">PPO</a>
</td>                              
                            </tr>  <%--PERGUNTA 9.1.7--%>                       
  
                            
                            <thead> 
        	                      <tr>
                                      <td>
                                      </td>
                                      
                                      <td align="right">
                                        <dx:ASPxButton ID="btnGrupo9" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>

                                      </td>
                                  </tr>
                              </thead>                                   
                          
                        </tbody>
                    </table>           
    </p>      
</asp:Panel> <%--3 - CÂMARA F.L.V --%>

<asp:Panel ID="panTitle10" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 10 - HORTIFRUTI - EXPEDIÇÃO - (11 perguntas, 1 à 11) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle10" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel> 
<asp:Panel ID="panDados10" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">        
    <p>  
                    <table id="gradient-style" summary="Meeting Results">

                        <thead>
    	                    <tr>
        	                    <th  align="center" scope="col">Nº</th>
                                <th scope="col">Pergunta</th>
                                <th align="center" scope="col" width="25px" >Sim</th>
                                <th align="center" scope="col" width="25px" >Não</th>
                                <th align="center" scope="col" width="25px" >N.A.</th> 
                                <th align="center" scope="col" width="25px" colspan="2" >Foto</th> 
                                <th align="center" scope="col" width="25px" >PPO</th>                                                             
                            </tr>
                        </thead>

                        <tbody>

                            <tr>
        	                    <td align="center">10.1</td>
                                <td>Na montagem das cargas, é realizada conferência de 20% dos protudos, conforme regra ABNT de conferência?<asp:TextBox
                                        ID="txt10_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_1_Sim" runat="server" GroupName="grupo10_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_1_Nao" runat="server" GroupName="grupo10_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_1_NA" runat="server" GroupName="grupo10_1" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto10_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile10_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto10_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                                               
                            </tr>  <%--PERGUNTA 10.1.1--%>  

                            <tr>
        	                    <td align="center">10.2</td>
                                <td>As cargas estão sendo montagas corretamente (strach) de forma a garantir o não tombamento dentro do caminhão?<asp:TextBox
                                        ID="txt10_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_2_Sim" runat="server" GroupName="grupo10_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_2_Nao" runat="server" GroupName="grupo10_2" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_2_NA" runat="server" GroupName="grupo10_2" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto10_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile10_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto10_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                                                                             
                            </tr>  <%--PERGUNTA 10.1.2--%> 

                            <tr>
        	                    <td align="center">10.3</td>
                                <td>Na montagem dos palets, está sendo respeitada a fragilidade de produtos?<asp:TextBox
                                        ID="txt10_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_3_Sim" runat="server" GroupName="grupo10_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_3_Nao" runat="server" GroupName="grupo10_3" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_3_NA" runat="server" GroupName="grupo10_3" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto10_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile10_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto10_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                 
                            </tr>  <%--PERGUNTA 10.1.3--%>

                            <tr>
        	                    <td align="center">10.4</td>
                                <td>O controle de lacres (numeração, asinatura do fiscal e data) estão sendo realizados corretamente?<asp:TextBox
                                        ID="txt10_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_4_Sim" runat="server" GroupName="grupo10_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_4_Nao" runat="server" GroupName="grupo10_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_4_NA" runat="server" GroupName="grupo10_4" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto10_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile10_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto10_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                              
                            </tr>  <%--PERGUNTA 10.1.4--%>

                            <tr>
        	                    <td align="center">10.5</td>
                                <td>Foi evidenciada doca aberta sem caminhão encostado?<asp:TextBox
                                        ID="txt10_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_5_Sim" runat="server" GroupName="grupo10_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_5_Nao" runat="server" GroupName="grupo10_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_5_NA" runat="server" GroupName="grupo10_5" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto10_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile10_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto10_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                               
                            </tr>  <%--PERGUNTA 10.1.5--%>

                            <tr>
        	                    <td align="center">10.6</td>
                                <td>Foi identificado palet sem a respectiva bandeira da loja de destino?<asp:TextBox
                                        ID="txt10_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_6_Sim" runat="server" GroupName="grupo10_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_6_Nao" runat="server" GroupName="grupo10_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_6_NA" runat="server" GroupName="grupo10_6" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto10_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile10_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto10_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                               
                            </tr>  <%--PERGUNTA 10.1.6--%>   
                             
                            <tr>
        	                    <td align="center">10.7</td>
                                <td>Foi evidenciado carregamento de determinada loja em doca destinada para outra loja?<asp:TextBox
                                        ID="txt10_7" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_7_Sim" runat="server" GroupName="grupo10_7" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_7_Nao" runat="server" GroupName="grupo10_7" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_7_NA" runat="server" GroupName="grupo10_7" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto10_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile10_7" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto10_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                            
                            </tr>  <%--PERGUNTA 10.1.7--%> 
                             
                            <tr>
        	                    <td align="center">10.8</td>
                                <td>O monitoramento dos veículos das entregas para as lojas está sendo realizado 100% do tempo?<asp:TextBox
                                        ID="txt10_8" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_8_Sim" runat="server" GroupName="grupo10_8" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_8_Nao" runat="server" GroupName="grupo10_8" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_8_NA" runat="server" GroupName="grupo10_8" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto10_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile10_8" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto10_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                              
                            </tr>  <%--PERGUNTA 10.1.8--%>  

                            <tr>
        	                    <td align="center">10.9</td>
                                <td>O ambiente encontra-se limpo e organizado?<asp:TextBox
                                        ID="txt10_9" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_9_Sim" runat="server" GroupName="grupo10_9" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_9_Nao" runat="server" GroupName="grupo10_9" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_9_NA" runat="server" GroupName="grupo10_9" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto10_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile10_9" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto10_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                             
                            </tr>  <%--PERGUNTA 10.1.9--%> 

                            <tr>
        	                    <td align="center">10.10</td>
                                <td>O pátio externo de Hortifruti encontra-se limpo e organizado?<asp:TextBox
                                        ID="txt10_10" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_10_Sim" runat="server" GroupName="grupo10_10" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_10_Nao" runat="server" GroupName="grupo10_10" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_10_NA" runat="server" GroupName="grupo10_10" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto10_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile10_10" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto10_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                               
                            </tr>  <%--PERGUNTA 10.1.10--%> 

                            <tr>
        	                    <td align="center">10.11</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados (sapato e luva)?<asp:TextBox
                                        ID="txt10_11" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_11_Sim" runat="server" GroupName="grupo10_11" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_11_Nao" runat="server" GroupName="grupo10_11" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_11_NA" runat="server" GroupName="grupo10_11" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto10_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile10_11" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto10_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR6 - Equipamento de Proteção Individual - EPI">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 10.1.11--%> 
                                                                           
                            
                            <thead> 
        	                      <tr>
                                      <td>
                                      </td>
                                      
                                      <td align="right">
                                        <dx:ASPxButton ID="btnGrupo10" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>                                      </td>
                                  </tr>
                              </thead>                                 
                          
                        </tbody>
                    </table>             
    </p>      
</asp:Panel> <%--3 - CÂMARA PADARIA - CONFEITARIA - ROTISSERIA--%>


<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender8" 
    runat="server"
    CollapseControlID="panTitle8"   
    Collapsed="true"   
    ExpandControlID="panTitle8"   
    TextLabelID="lblTitle8"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados8"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender9" 
    runat="server"
    CollapseControlID="panTitle9"   
    Collapsed="true"   
    ExpandControlID="panTitle9"   
    TextLabelID="lblTitle9"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados9"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender10" 
    runat="server"
    CollapseControlID="panTitle10"   
    Collapsed="true"   
    ExpandControlID="panTitle10"   
    TextLabelID="lblTitle10"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados10"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>

                  

        </ContentTemplate>
    </asp:UpdatePanel>

    <script>
        function pageLoad(sender, args) {
            $(document).ready(function () {
                $('[data-toggle="popover"]').popover();
            });
        }

    </script>

 
  

    </asp:Content>


