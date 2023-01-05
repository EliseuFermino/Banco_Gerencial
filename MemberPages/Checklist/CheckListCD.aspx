<%@ Page Title="Checklist Condor" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CheckListCD.aspx.vb" Inherits="MemberPages_CheckListCD
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
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_4" /> 
        
            
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_5" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_6" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_7" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_8" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_9" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_10" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_11" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_12" />           
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_13" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_14" />             
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_15" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_16" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_17" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_18" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_19" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_20" /> 
            
            
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_5" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_6" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_7" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_8" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_9" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_10" /> 
        
            
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_5" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_6" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_7" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_8" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_9" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_10" />             
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_11" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_12" />           
     

            
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_5" />             
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_7" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_8" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_9" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_10" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_11" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_12" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_13" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_14" />
            
            <asp:PostBackTrigger ControlID="btnSalvarFoto6_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto6_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto6_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto6_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto6_5" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto6_6" />                                                                    
            <asp:PostBackTrigger ControlID="btnSalvarFoto6_7" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto6_8" /> 
                                        
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_5" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_6" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_7" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_8" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_9" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_10" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_11" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_12" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_13" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_14" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_15" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_16" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_17" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_18" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_19" /> 
            
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_5" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_6" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_7" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_8" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_9" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_10" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_11" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_12" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_13" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_14" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_15" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_16" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_17" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_18" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_19" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_20" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_21" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_22" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto12_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto12_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto12_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto12_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto12_5" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto12_6" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto12_7" /> 

            <asp:PostBackTrigger ControlID="btnSalvarFoto13_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto13_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto13_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto13_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto13_5" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto13_6" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto13_7" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto13_8" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto13_9" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto13_10" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto13_11" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto13_12" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto13_13" /> 

             <asp:PostBackTrigger ControlID="btnSalvarFoto14_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto14_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto14_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto14_4" /> 

             <asp:PostBackTrigger ControlID="btnSalvarFoto15_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto15_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto15_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto15_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto15_5" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto15_6" /> 

             <asp:PostBackTrigger ControlID="btnSalvarFoto16_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto16_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto16_3" /> 

             <asp:PostBackTrigger ControlID="btnSalvarFoto17_1" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_2" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_3" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_4" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_5" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_6" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_7" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_8" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_9" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_10" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_11" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_12" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_13" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_14" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_15" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_16" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_17" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_18" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_19" /> 
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_20" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto17_21" />
            
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

            
<asp:Panel ID="panTitle1" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 1 - PORTARIA - (4 perguntas, 1 à 4) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle1" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel>  
<asp:Panel ID="panDados1" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">      
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
        	                    <td align="center">1.1</td>
                                <td> É realizada distribuição de senha de descarregamento somente para caminhões devidamente agendados e/ou autorizados pelo Recebimento Adm.?
                                     <asp:TextBox
                                        ID="txt1_1" runat="server" Width="500" TextMode="MultiLine" Height="50" ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd1_1_Sim" runat="server" GroupName="grupo1_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd1_1_Nao" runat="server" GroupName="grupo1_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd1_1_NA" runat="server" GroupName="grupo1_1" /></td>                                
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto1_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile1_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto1_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>    

                            </tr> <%--PERGUNTA 1.1.01--%>

                            <tr>
        	                    <td align="center">1.2</td>
                                <td> É realizada conferência do canhoto assinado no momento da saída de caminhão do CD após descarregamento?<asp:TextBox
                                        ID="txt1_2" runat="server" Width="500" TextMode="MultiLine" Height="50" ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd1_2_Sim" runat="server" GroupName="grupo1_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd1_2_Nao" runat="server" GroupName="grupo1_2" /></td>   
                                <td align="center"><asp:RadioButton ID="rnd1_2_NA" runat="server" GroupName="grupo1_2" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto1_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile1_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto1_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                                                                                                                                                           
                            </tr> <%--PERGUNTA 1.1.02--%>

                            <tr>
        	                    <td align="center">1.3</td>
                                <td> É realizada verificação da carga (baú) do caminhão no momento da sua saída? Caso existam cargas de devolução e ou de palets, os mesmos são conparados com a respectiva NF?<asp:TextBox
                                        ID="txt1_3" runat="server" Width="500" TextMode="MultiLine" Height="50" ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd1_3_Sim" runat="server" GroupName="grupo1_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd1_3_Nao" runat="server" GroupName="grupo1_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd1_3_NA" runat="server" GroupName="grupo1_3" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto1_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile1_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto1_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                                                                                                                                                                                                                                                                                             
                            </tr> <%--PERGUNTA 1.1.03--%>

                            <tr>
        	                    <td align="center">1.4</td>
                                <td> é controlado o acesso a terceiros e pedestres através de crachá de visitante?<asp:TextBox
                                        ID="txt1_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd1_4_Sim" runat="server" GroupName="grupo1_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd1_4_Nao" runat="server" GroupName="grupo1_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd1_4_NA" runat="server" GroupName="grupo1_4" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto1_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile1_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto1_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td></td>                            
                            </tr> <%--PERGUNTA 1.1.04--%>
                 
                            <thead>
                                <tr>
                                    <td></td>
                                    <td align="right">
                                        <dx:ASPxButton ID="btnGrupo1" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </thead>
                        </tbody>
                    </table>      
      
    </p>  
</asp:Panel>  <%--1 - PORTARIA --%>

<asp:Panel ID="panTitle2" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 2 - RECEBIMENTO CD SECO - (21 perguntas, 1 à 21) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle2" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel> 
<asp:Panel ID="panDados2" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">        
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
        	                    <td align="center">2.1</td>
                                <td>Foi evidenciada conferência da NF, comparando com as informações do pedido? <asp:TextBox
                                        ID="txt2_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_1_Sim" runat="server" GroupName="grupo2_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_1_Nao" runat="server" GroupName="grupo2_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_1_NA" runat="server" GroupName="grupo2_1" /></td>                                
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>    
                            </tr> <%--PERGUNTA 2.1.1--%>

                            <tr>
        	                    <td align="center">2.2</td>
                                <td>No momento da auditoria, as entregas estavam acompanhadas de NF de palets?<asp:TextBox
                                        ID="txt2_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_2_Sim" runat="server" GroupName="grupo2_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_2_Nao" runat="server" GroupName="grupo2_2" /></td>   
                                <td align="center"><asp:RadioButton ID="rnd2_2_NA" runat="server" GroupName="grupo2_2" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                                                                                                                                                           
                            </tr> <%--PERGUNTA 2.1.2--%>

                            <tr>
        	                    <td align="center">2.3</td>
                                <td>O controle de ocorrências do recebimento (entrada de NFs, devolução, irregularidades de recebimento) está sendo preenchido corretamente? (Verificar relatórios de irregularidades)<asp:TextBox
                                        ID="txt2_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_3_Sim" runat="server" GroupName="grupo2_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_3_Nao" runat="server" GroupName="grupo2_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_3_NA" runat="server" GroupName="grupo2_3" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                                                                                                                                                                                                                                                                                              
                            </tr> <%--PERGUNTA 2.1.3--%>

                            <tr>
        	                    <td align="center">2.4</td>
                                <td>A conferência dos produtos ocorre no momento em que os mesmos são descarregados na doca?<asp:TextBox
                                        ID="txt2_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_4_Sim" runat="server" GroupName="grupo2_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_4_Nao" runat="server" GroupName="grupo2_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_4_NA" runat="server" GroupName="grupo2_4" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                               
                            </tr> <%--PERGUNTA 2.1.4--%>

                            <tr>
        	                    <td align="center">2.5</td>
                                <td>Os produtos recebidos são conferidos na área de conferência, sem a interferência do entregador/fornecedor?<asp:TextBox
                                        ID="txt2_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_5_Sim" runat="server" GroupName="grupo2_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_5_Nao" runat="server" GroupName="grupo2_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_5_NA" runat="server" GroupName="grupo2_5" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                                   
                            </tr> <%--PERGUNTA 2.1.5--%>

                            <tr>
        	                    <td align="center">2.6</td>
                                <td>É verificada a qualidade (embalagem, validade, aparência) dos produtos recebidos dos fornecedores?<asp:TextBox
                                        ID="txt2_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_6_Sim" runat="server" GroupName="grupo2_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_6_Nao" runat="server" GroupName="grupo2_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_6_NA" runat="server" GroupName="grupo2_6" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                                 
                            </tr> <%--PERGUNTA 2.1.6--%> 

                            <tr>
        	                    <td align="center">2.7</td>
                                <td>Cargas faltantes ou avarias estão sendo devolvidas e/ou emitidas NF de devolução?<asp:TextBox
                                        ID="txt2_7" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_7_Sim" runat="server" GroupName="grupo2_7" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_7_Nao" runat="server" GroupName="grupo2_7" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_7_NA" runat="server" GroupName="grupo2_7" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_7" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                                
                            </tr> <%--PERGUNTA 2.1.7--%>

                            <tr>
        	                    <td align="center">2.8</td>
                                <td>Há restrição de entrada de pessoas externas (entregadores, caminhoneiros, crianças) no recebimento?<asp:TextBox
                                        ID="txt2_8" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_8_Sim" runat="server" GroupName="grupo2_8" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_8_Nao" runat="server" GroupName="grupo2_8" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_8_NA" runat="server" GroupName="grupo2_8" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_8" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                               
                            </tr> <%--PERGUNTA 2.1.8--%>

                            <tr>
        	                    <td align="center">2.9</td>
                                <td>Os produtos são encaminhados imediatamente para o seu local de armazenagem após o endereçamento?<asp:TextBox
                                        ID="txt2_9" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_9_Sim" runat="server" GroupName="grupo2_9" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_9_Nao" runat="server" GroupName="grupo2_9" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_9_NA" runat="server" GroupName="grupo2_9" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_9" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Norma CIPA">PPO</a>
                                </td>                                  
                            </tr> <%--PERGUNTA 2.1.9--%>

                            <tr>
        	                    <td align="center">2.10</td>
                                <td>Existe a conferência de 100% dos P.A.R. recebidos?<asp:TextBox
                                        ID="txt2_10" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_10_Sim" runat="server" GroupName="grupo2_10" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_10_Nao" runat="server" GroupName="grupo2_10" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_10_NA" runat="server" GroupName="grupo2_10" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_10" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                                   
                            </tr> <%--PERGUNTA 2.1.10--%>

                            <tr>
        	                    <td align="center">2.11</td>
                                <td>A conferência dos P.A.R. é feita na área destinada?<asp:TextBox
                                        ID="txt2_11" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_11_Sim" runat="server" GroupName="grupo2_11" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_11_Nao" runat="server" GroupName="grupo2_11" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_11_NA" runat="server" GroupName="grupo2_11" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_11" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                               
                            </tr> <%--PERGUNTA 2.1.11--%>

                            <tr>
        	                    <td align="center">2.12</td>
                                <td>Após a conferência dos P.A.R., o responsável da seção encaminha as mercadorias diretamente para a área segregada?<asp:TextBox
                                        ID="txt2_12" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_12_Sim" runat="server" GroupName="grupo2_12" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_12_Nao" runat="server" GroupName="grupo2_12" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_12_NA" runat="server" GroupName="grupo2_12" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_12" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                                 
                            </tr> <%--PERGUNTA 2.1.12--%> 
                                                    
                            <tr>
        	                    <td align="center">2.13</td>
                                <td>Foi evidenciada doca aberta sem caminhão encostado?<asp:TextBox
                                        ID="txt2_13" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_13_Sim" runat="server" GroupName="grupo2_13" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_13_Nao" runat="server" GroupName="grupo2_13" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_13_NA" runat="server" GroupName="grupo2_13" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_13" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                                                                   
                            </tr> <%--PERGUNTA 2.1.13--%> 

                            <tr>
        	                    <td align="center">2.14</td>
                                <td>O Fiscal está presente 100% do tempo no recebimento? <asp:TextBox
                                        ID="txt2_14" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_14_Sim" runat="server" GroupName="grupo2_14" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_14_Nao" runat="server" GroupName="grupo2_14" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_14_NA" runat="server" GroupName="grupo2_14" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_14" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                                                                                                
                            </tr> <%--PERGUNTA 2.1.14--%> 

                            <tr>
        	                    <td align="center">2.15</td>
                                <td>A conferência para colagem de etiqueta de endereçamento é realizada através do coletor?<asp:TextBox
                                        ID="txt2_15" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_15_Sim" runat="server" GroupName="grupo2_15" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_15_Nao" runat="server" GroupName="grupo2_15" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_15_NA" runat="server" GroupName="grupo2_15" /></td>     
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_15" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_15" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                               
                            </tr> <%--PERGUNTA 2.1.15--%>

                            <tr>
        	                    <td align="center">2.16</td>
                                <td>Existem notas fiscais pendentes de "acatamento" (sem pedido, divergência de quantidade ou custo)?<asp:TextBox
                                        ID="txt2_16" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_16_Sim" runat="server" GroupName="grupo2_16" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_16_Nao" runat="server" GroupName="grupo2_16" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_16_NA" runat="server" GroupName="grupo2_16" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_16" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_16" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                               
                            </tr> <%--PERGUNTA 2.1.16--%>

                            <tr>
        	                    <td align="center">2.17</td>
                                <td>No momento da avaliação, foram identificadas caixas abertas depois da conferência?<asp:TextBox
                                        ID="txt2_17" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_17_Sim" runat="server" GroupName="grupo2_17" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_17_Nao" runat="server" GroupName="grupo2_17" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_17_NA" runat="server" GroupName="grupo2_17" /></td>         
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_17" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_17" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                          
                            </tr> <%--PERGUNTA 2.1.17--%>

                            <tr>
        	                    <td align="center">2.18</td>
                                <td>No momento da avaliação, o setor se encontrava limpo e organizado?<asp:TextBox
                                        ID="txt2_18" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_18_Sim" runat="server" GroupName="grupo2_18" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_18_Nao" runat="server" GroupName="grupo2_18" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_18_NA" runat="server" GroupName="grupo2_18" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_18" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_18" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDREC-01 (Recebimento)">PPO</a>
                                </td>                          
                            </tr> <%--PERGUNTA 2.1.18--%>

                            <tr>
        	                    <td align="center">2.19</td>
                                <td>O pátio externo do Recebimento encontra-se limpo e organizado? <asp:TextBox
                                        ID="txt2_19" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_19_Sim" runat="server" GroupName="grupo2_19" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_19_Nao" runat="server" GroupName="grupo2_19" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_19_NA" runat="server" GroupName="grupo2_19" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_19" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_19" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_19" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
                                </td>                                  
                            </tr> <%--PERGUNTA 2.1.19--%>

                            <tr>
        	                    <td align="center">2.20</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados para o recebimento? <asp:TextBox
                                        ID="txt2_20" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd2_20_Sim" runat="server" GroupName="grupo2_20" /></td>
                                <td align="center"><asp:RadioButton ID="rnd2_20_Nao" runat="server" GroupName="grupo2_20" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd2_20_NA" runat="server" GroupName="grupo2_20" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto2_20" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile2_20" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto2_20" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td>
                                     <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
                                </td>                                
                            </tr> <%--PERGUNTA 2.1.20--%>
                            
                                                      
                            <thead>
                                <tr>
                                    <td>
                                    </td>                                                                      
                                    <td align="right">
                                        <dx:ASPxButton ID="btnGrupo2" runat="server" Text="Enviar">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </thead>
                           
                        </tbody>
                    </table>      
              </p>      
</asp:Panel>  <%--2 - RECEBIMENTO CD SECO--%>


<asp:Panel ID="panTitle3" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 3 - OPERAÇÃO / ESTOQUE / LOCAÇÃO - (11 perguntas, 1 à 11) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle3" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel> 
<asp:Panel ID="panDados3" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">        
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
        	                    <td align="center">3.1</td>
                                <td>Há restrição de entrada de pessoas externas no depósito? <asp:TextBox
                                        ID="txt3_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd3_1_Sim" runat="server" GroupName="grupo3_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd3_1_Nao" runat="server" GroupName="grupo3_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd3_1_NA" runat="server" GroupName="grupo3_1" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto3_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile3_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto3_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
                                <td>
                                    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Norma CIPA">PPO</a>
                                </td>                                                              
                            </tr> <%--PERGUNTA 3.1.1--%>

                            <tr>
        	                    <td align="center">3.2</td>
                                <td>O limite máximo de empilhamento é respeitado de modo a não existir risco de desabamento nem de ficar próximo ao teto e/ou fiação elétrica? <asp:TextBox
                                        ID="txt3_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd3_2_Sim" runat="server" GroupName="grupo3_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd3_2_Nao" runat="server" GroupName="grupo3_2" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd3_2_NA" runat="server" GroupName="grupo3_2" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto3_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile3_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto3_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
                                <td>
                                    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR11 - Transporte, Movimentação, Armazenagem e Manuseio de Materiais">PPO</a>
                                </td>                                                                                             
                            </tr> <%--PERGUNTA 3.1.2--%>

                            <tr>
        	                    <td align="center">3.3</td>
                                <td>Os corredores estão limpos e desobstruídos?<asp:TextBox
                                        ID="txt3_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd3_3_Sim" runat="server" GroupName="grupo3_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd3_3_Nao" runat="server" GroupName="grupo3_3" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd3_3_NA" runat="server" GroupName="grupo3_3" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto3_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile3_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto3_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                            
                            </tr> <%--PERGUNTA 3.1.3--%>

                            <tr>
        	                    <td align="center">3.4</td>
                                <td>O depósito está organizado de maneira que não se encontre produtos alimentícios com não-alimentícios?<asp:TextBox
                                        ID="txt3_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd3_4_Sim" runat="server" GroupName="grupo3_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd3_4_Nao" runat="server" GroupName="grupo3_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd3_4_NA" runat="server" GroupName="grupo3_4" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto3_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile3_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto3_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="ANVISA">PPO</a>
</td>                          
                            </tr> <%--PERGUNTA 3.1.4--%>

                            <tr>
        	                    <td align="center">3.5</td>
                                <td>O depósito está organizado em condições de se realizar o PVPS?<asp:TextBox
                                        ID="txt3_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd3_5_Sim" runat="server" GroupName="grupo3_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd3_5_Nao" runat="server" GroupName="grupo3_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd3_5_NA" runat="server" GroupName="grupo3_5" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto3_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile3_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto3_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                            
                            </tr> <%--PERGUNTA 3.1.5--%>

                            <tr>
        	                    <td align="center">3.6</td>
                                <td>Foram localizados produtos vencidos no depósito? <asp:TextBox
                                        ID="txt3_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd3_6_Sim" runat="server" GroupName="grupo3_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd3_6_Nao" runat="server" GroupName="grupo3_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd3_6_NA" runat="server" GroupName="grupo3_6" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto3_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile3_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto3_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
 <td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                             
                            </tr> <%--PERGUNTA 3.1.6--%>

                            <tr>
        	                    <td align="center">3.7</td>
                                <td>Os produtos estão armazenados de maneira que não se encontrem mercadorias soltas no depósito?<asp:TextBox
                                        ID="txt3_7" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd3_7_Sim" runat="server" GroupName="grupo3_7" /></td>
                                <td align="center"><asp:RadioButton ID="rnd3_7_Nao" runat="server" GroupName="grupo3_7" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd3_7_NA" runat="server" GroupName="grupo3_7" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto3_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile3_7" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto3_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                             
                            </tr> <%--PERGUNTA 3.1.7--%>

                            <tr>
        	                    <td align="center">3.8</td>
                                <td>A locação de produtos é realizada com auxílio do coletor?<asp:TextBox
                                        ID="txt3_8" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd3_8_Sim" runat="server" GroupName="grupo3_8" /></td>
                                <td align="center"><asp:RadioButton ID="rnd3_8_Nao" runat="server" GroupName="grupo3_8" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd3_8_NA" runat="server" GroupName="grupo3_8" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto3_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile3_8" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto3_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                           
                            </tr> <%--PERGUNTA 3.1.8--%>

                            <tr>
        	                    <td align="center">3.9</td>
                                <td>Todas as caixas falsas armazenadas no depósito estão identificadas com folha espelho de caixa afixado (EAN, descrição, quantidade, validade)?<asp:TextBox
                                        ID="txt3_9" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd3_9_Sim" runat="server" GroupName="grupo3_9" /></td>
                                <td align="center"><asp:RadioButton ID="rnd3_9_Nao" runat="server" GroupName="grupo3_9" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd3_9_NA" runat="server" GroupName="grupo3_9" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto3_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile3_9" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto3_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                           
                            </tr> <%--PERGUNTA 3.1.9--%>

                            <tr>
        	                    <td align="center">3.10</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados? <asp:TextBox
                                        ID="txt3_10" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd3_10_Sim" runat="server" GroupName="grupo3_10" /></td>
                                <td align="center"><asp:RadioButton ID="rnd3_10_Nao" runat="server" GroupName="grupo3_10" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd3_10_NA" runat="server" GroupName="grupo3_10" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto3_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile3_10" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto3_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                                                              
                            </tr> <%--PERGUNTA 3.1.10--%>
                            
                            <thead>
                                <tr>
                                    <td>
                                    </td>
                                                                     
                                    <td align="right">
                                        <dx:ASPxButton ID="btnGrupo3" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </thead>
                           
                        </tbody>
                    </table>          
    </p>      
</asp:Panel>  <%--3 - OPERAÇÃO / ESTOQUE / LOCAÇÃO--%>

<asp:Panel ID="panTitle4" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 4 - MEZANINO - (13 perguntas, 1 à 13) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle4" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel> 
<asp:Panel ID="panDados4" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">        
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
        	                    <td align="center">4.1</td>
                                <td>Há restrição de entrada de pessoas externas no depósito?<asp:TextBox
                                        ID="txt4_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd4_1_Sim" runat="server" GroupName="grupo4_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd4_1_Nao" runat="server" GroupName="grupo4_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd4_1_NA" runat="server" GroupName="grupo4_1" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto4_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile4_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto4_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Norma CIPA">PPO</a>
</td>                             </tr> <%--PERGUNTA 4.1.1--%> 

                            <tr>
        	                    <td align="center">4.2</td>
                                <td>O limite máximo de empilhamento é respeitado de modo a não existir risco de desabamento nem de ficar próximo ao teto e/ou fiação elétrica?<asp:TextBox
                                        ID="txt4_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd4_2_Sim" runat="server" GroupName="grupo4_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd4_2_Nao" runat="server" GroupName="grupo4_2" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd4_2_NA" runat="server" GroupName="grupo4_2" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto4_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile4_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto4_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR11 - Transporte, Movimentação, Armazenagem e Manuseio de Materiais">PPO</a>
</td>                                                                                                 
                            </tr> <%--PERGUNTA 4.1.2--%> 

                            <tr>
        	                    <td align="center">4.3</td>
                                <td>Os corredores estão limpos e desobstruídos? <asp:TextBox
                                        ID="txt4_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd4_3_Sim" runat="server" GroupName="grupo4_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd4_3_Nao" runat="server" GroupName="grupo4_3" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd4_3_NA" runat="server" GroupName="grupo4_3" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto4_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile4_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto4_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                             
                            </tr> <%--PERGUNTA 4.1.3--%> 

                            <tr>
        	                    <td align="center">4.4</td>
                                <td>O depósito está organizado de maneira que não se encontre produtos alimentícios com não-alimentícios?<asp:TextBox
                                        ID="txt4_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd4_4_Sim" runat="server" GroupName="grupo4_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd4_4_Nao" runat="server" GroupName="grupo4_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd4_4_NA" runat="server" GroupName="grupo4_4" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto4_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile4_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto4_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="ANVISA">PPO</a>
</td>                              
                            </tr> <%--PERGUNTA 4.1.4--%> 

                            <tr>
        	                    <td align="center">4.5</td>
                                <td>O depósito está organizado em condições de se realizar o PVPS?<asp:TextBox
                                        ID="txt4_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd4_5_Sim" runat="server" GroupName="grupo4_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd4_5_Nao" runat="server" GroupName="grupo4_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd4_5_NA" runat="server" GroupName="grupo4_5" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto4_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile4_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto4_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                            
                            </tr> <%--PERGUNTA 4.1.5--%> 
                                
                            <tr>
        	                    <td align="center">4.6</td>
                                <td>Foram localizados produtos vencidos no depósito?<asp:TextBox
                                        ID="txt4_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd4_6_Sim" runat="server" GroupName="grupo4_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd4_6_Nao" runat="server" GroupName="grupo4_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd4_6_NA" runat="server" GroupName="grupo4_6" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto4_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile4_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto4_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                             
                            </tr> <%--PERGUNTA 4.1.6--%>                                                                              
  
                            <tr>
        	                    <td align="center">4.7</td>
                                <td>Os produtos estão armazenados de maneira que não se encontrem mercadorias soltas no depósito?<asp:TextBox
                                        ID="txt4_7" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd4_7_Sim" runat="server" GroupName="grupo4_7" /></td>
                                <td align="center"><asp:RadioButton ID="rnd4_7_Nao" runat="server" GroupName="grupo4_7" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd4_7_NA" runat="server" GroupName="grupo4_7" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto4_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile4_7" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto4_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                                                               
                            </tr> <%--PERGUNTA 4.1.7--%>  
                              
                            <tr>
        	                    <td align="center">4.8</td>
                                <td>A locação de produtos é realizada com auxílio do coletor?<asp:TextBox
                                        ID="txt4_8" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd4_8_Sim" runat="server" GroupName="grupo4_8" /></td>
                                <td align="center"><asp:RadioButton ID="rnd4_8_Nao" runat="server" GroupName="grupo4_8" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd4_8_NA" runat="server" GroupName="grupo4_8" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto4_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile4_8" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto4_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                                                                                            
                            </tr> <%--PERGUNTA 4.1.8--%>

                            <tr>
        	                    <td align="center">4.9</td>
                                <td>Todas as caixas falsas armazenadas no depósito estão identificadas com folha espelho de caixa afixado (EAN, descrição, quantidade, validade)?<asp:TextBox
                                        ID="txt4_9" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd4_9_Sim" runat="server" GroupName="grupo4_9" /></td>
                                <td align="center"><asp:RadioButton ID="rnd4_9_Nao" runat="server" GroupName="grupo4_9" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd4_9_NA" runat="server" GroupName="grupo4_9" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto4_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile4_9" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto4_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                              
                            </tr> <%--PERGUNTA 4.1.9--%>

                            <tr>
        	                    <td align="center">4.10</td>
                                <td>Existe o controle de acesso das áreas segregadas (chaves com os fiscais ou encarregados da seção)? <asp:TextBox
                                        ID="txt4_10" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd4_10_Sim" runat="server" GroupName="grupo4_10" /></td>
                                <td align="center"><asp:RadioButton ID="rnd4_10_Nao" runat="server" GroupName="grupo4_10" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd4_10_NA" runat="server" GroupName="grupo4_10" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto4_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile4_10" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto4_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                        
                            </tr> <%--PERGUNTA 4.1.10--%>

                            <tr>
        	                    <td align="center">4.11</td>
                                <td>Todas as embalagens estão lacradas de maneira que não encontre mercadorias soltas no depósito? (Ex: Brinquedos, Papelaria, e outros produtos frágeis)<asp:TextBox
                                        ID="txt4_11" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd4_11_Sim" runat="server" GroupName="grupo4_11" /></td>
                                <td align="center"><asp:RadioButton ID="rnd4_11_Nao" runat="server" GroupName="grupo4_11" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd4_11_NA" runat="server" GroupName="grupo4_11" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto4_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile4_11" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto4_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                             
                            </tr>  <%--PERGUNTA 4.1.11--%>

                            <tr>
        	                    <td align="center">4.12</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados?<asp:TextBox
                                        ID="txt4_12" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd4_12_Sim" runat="server" GroupName="grupo4_12" /></td>
                                <td align="center"><asp:RadioButton ID="rnd4_12_Nao" runat="server" GroupName="grupo4_12" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd4_12_NA" runat="server" GroupName="grupo4_12" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto4_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile4_12" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto4_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                               
                            </tr>  <%--PERGUNTA 4.1.12--%>   

                            <thead>
                                <tr>
                                    <td>
                                    </td>
                                                                       
                                    <td align="right">
                                        <dx:ASPxButton ID="btnGrupo4" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </thead>
                           
                        </tbody>
                    </table>             
    </p>      
</asp:Panel>  <%--4 - MEZANINO  (Textil)--%>

<asp:Panel ID="panTitle5" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 5 - ELETRO - (14 perguntas, 1 à 14) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle5" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel> 
<asp:Panel ID="panDados5" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">        
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
        	                    <td align="center">5.1</td>
                                <td>Há restrição de entrada de pessoas externas no depósito?<asp:TextBox
                                        ID="txt5_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd5_1_Sim" runat="server" GroupName="grupo5_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd5_1_Nao" runat="server" GroupName="grupo5_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd5_1_NA" runat="server" GroupName="grupo5_1" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto5_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Norma CIPA">PPO</a>
</td>                                                               
                            </tr>  <%--PERGUNTA 5.1.1--%>   

                            <tr>
        	                    <td align="center">5.2</td>
                                <td>O limite máximo de empilhamento é respeitado de modo a não existir risco de desabamento nem de ficar próximo ao teto e/ou fiação elétrica?<asp:TextBox
                                        ID="txt5_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd5_2_Sim" runat="server" GroupName="grupo5_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd5_2_Nao" runat="server" GroupName="grupo5_2" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd5_2_NA" runat="server" GroupName="grupo5_2" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto5_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR11 - Transporte, Movimentação, Armazenagem e Manuseio de Materiais">PPO</a>
</td>                                                                                              
                            </tr>  <%--PERGUNTA 5.1.2--%>   

                            <tr>
        	                    <td align="center">5.3</td>
                                <td>O setor está organizado em condições de se realizar o PVPS (ex. chip e cartuchos)?<asp:TextBox
                                        ID="txt5_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd5_3_Sim" runat="server" GroupName="grupo5_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd5_3_Nao" runat="server" GroupName="grupo5_3" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd5_3_NA" runat="server" GroupName="grupo5_3" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto5_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                               
                            </tr>  <%--PERGUNTA 5.1.3--%>   

                            <tr>
        	                    <td align="center">5.4</td>
                                <td>Foram localizados produtos vencidos no depósito? <asp:TextBox
                                        ID="txt5_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd5_4_Sim" runat="server" GroupName="grupo5_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd5_4_Nao" runat="server" GroupName="grupo5_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd5_4_NA" runat="server" GroupName="grupo5_4" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto5_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                          
                            </tr>  <%--PERGUNTA 5.1.4--%>   

                            <tr>
        	                    <td align="center">5.5</td>
                                <td>Todas as caixas falsas armazenadas no depósito estão identificadas com folha de espelho de caixa afixado (EAN, descrição, quantidade, validade)?<asp:TextBox
                                        ID="txt5_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd5_5_Sim" runat="server" GroupName="grupo5_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd5_5_Nao" runat="server" GroupName="grupo5_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd5_5_NA" runat="server" GroupName="grupo5_5" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto5_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                             
                            </tr>  <%--PERGUNTA 5.1.5--%>   

                            <tr>
        	                    <td align="center">5.6</td>
                                <td>As áreas segregadas estão adequadas no depósito de modo que os produtos permaneçam confinados (estrutura, cadeados, chaves)?<asp:TextBox
                                        ID="txt5_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd5_6_Sim" runat="server" GroupName="grupo5_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd5_6_Nao" runat="server" GroupName="grupo5_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd5_6_NA" runat="server" GroupName="grupo5_6" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto5_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                              
                            </tr>  <%--PERGUNTA 5.1.6--%> 
                                 
                            <tr>
        	                    <td align="center">5.7</td>
                                <td>Existe o controle de acesso das áreas segregadas (chaves com os fiscais ou encarregados da seção)?<asp:TextBox
                                        ID="txt5_7" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd5_7_Sim" runat="server" GroupName="grupo5_7" /></td>
                                <td align="center"><asp:RadioButton ID="rnd5_7_Nao" runat="server" GroupName="grupo5_7" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd5_7_NA" runat="server" GroupName="grupo5_7" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto5_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_7" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDLOC-01 (Locação)">PPO</a>
</td>                            
                            </tr>  <%--PERGUNTA 5.1.7--%>   

                            <tr>
        	                    <td align="center">5.8</td>
                                <td>Os produtos PARs enviados para as Lojas, são conferidos na área destinada, ou seja, sob a fiscalização de câmeras de vigilância (CFTV)?<asp:TextBox
                                        ID="txt5_8" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd5_8_Sim" runat="server" GroupName="grupo5_8" /></td>
                                <td align="center"><asp:RadioButton ID="rnd5_8_Nao" runat="server" GroupName="grupo5_8" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd5_8_NA" runat="server" GroupName="grupo5_8" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto5_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_8" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDSEP-01 (Separação)">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 5.1.8--%> 
                                
                            <tr>
        	                    <td align="center">5.9</td>
                                <td>Os Controles de Conferência dos Fiscais (NFs, lacre container e demais atividades exercidas na área) estão sendo executados corretamente?<asp:TextBox
                                        ID="txt5_9" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd5_9_Sim" runat="server" GroupName="grupo5_9" /></td>
                                <td align="center"><asp:RadioButton ID="rnd5_9_Nao" runat="server" GroupName="grupo5_9" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd5_9_NA" runat="server" GroupName="grupo5_9" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto5_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_9" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDSEP-01 (Separação)">PPO</a>
</td>                                     
                            </tr>  <%--PERGUNTA 5.1.9--%> 
                              
                            <tr>
        	                    <td align="center">5.10</td>
                                <td>A "gaiola" de PAR está sendo montada na área destinada, ou seja, sob a fiscalização de câmeras de vigilância (CFTV)?<asp:TextBox
                                        ID="txt5_10" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd5_10_Sim" runat="server" GroupName="grupo5_10" /></td>
                                <td align="center"><asp:RadioButton ID="rnd5_10_Nao" runat="server" GroupName="grupo5_10" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd5_10_NA" runat="server" GroupName="grupo5_10" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="IimgFoto5_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_10" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDSEP-01 (Separação)">PPO</a>
</td>                                   
                            </tr>  <%--PERGUNTA 5.1.10--%>  
                                  
        	                <tr>
                                    <td align="center">5.11</td>
                                    <td>
                                        O Fiscal está presente 100% do tempo na área de montagem de carga para as lojas?<asp:TextBox 
                                            ID="txt5_11" runat="server" Height="50" TextMode="MultiLine" Width="500"></asp:TextBox></td>
                                    <td align="center"><asp:RadioButton ID="rnd5_11_Sim" runat="server" GroupName="grupo5_11" /></td>
                                    <td align="center"><asp:RadioButton ID="rnd5_11_Nao" runat="server" GroupName="grupo5_11" /></td>
                                    <td align="center"><asp:RadioButton ID="rnd5_11_NA" runat="server"  GroupName="grupo5_11" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto5_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_11" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDSEP-01 (Separação)">PPO</a>
</td>     
                            </tr>  <%--PERGUNTA 5.1.11--%>  

                            <tr>
        	                    <td align="center">5.12</td>
                                <td>Os corredores estão limpos e desobstruídos?<asp:TextBox
                                        ID="txt5_12" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd5_12_Sim" runat="server" GroupName="grupo5_12" /></td>
                                <td align="center"><asp:RadioButton ID="rnd5_12_Nao" runat="server" GroupName="grupo5_12" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd5_12_NA" runat="server" GroupName="grupo5_12" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto5_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_12" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                              
                            </tr>  <%--PERGUNTA 5.1.12--%>  

                            <tr>
        	                    <td align="center">5.13</td>
                                <td>A entrega das cargas após a montagem está sendo realizada pela rua 20, ou seja, sob a fiscalização de câmeras de vigilância (CFTV)?<asp:TextBox
                                        ID="txt5_13" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd5_13_Sim" runat="server" GroupName="grupo5_13" /></td>
                                <td align="center"><asp:RadioButton ID="rnd5_13_Nao" runat="server" GroupName="grupo5_13" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd5_13_NA" runat="server" GroupName="grupo5_13" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto5_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_13" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDSEP-01 (Separação)">PPO</a>
</td>                                 
                            </tr>  <%--PERGUNTA 5.1.13--%>  

                            <tr>
        	                    <td align="center">5.14</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados?<asp:TextBox
                                        ID="txt5_14" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd5_14_Sim" runat="server" GroupName="grupo5_14" /></td>
                                <td align="center"><asp:RadioButton ID="rnd5_14_Nao" runat="server" GroupName="grupo5_14" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd5_14_NA" runat="server" GroupName="grupo5_14" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto5_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile5_14" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto5_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR6 - Equipamento de Proteção Individual - EPI">PPO</a>
</td>                                 
                            </tr>  <%--PERGUNTA 5.1.14--%>  
                            
            
                            <thead>
                                <tr>
                                    <td>
                                    </td>
                                    
                                    <td align="right">
                                        <dx:ASPxButton ID="btnGrupo5" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>                                    </td>
                                </tr>
                            </thead>
                            
                        </tbody>
                    </table>             
    </p>      
</asp:Panel>  <%--5 - ELETRO--%>

<asp:Panel ID="panTitle6" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 6 - SEPARAÇÃO - (8 perguntas, 1 à 8) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle6" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel> 
<asp:Panel ID="panDados6" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">        
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
        	                    <td align="center">6.1</td>
                                <td>É verificada a data de validade dos produtos no momento da seperação?<asp:TextBox
                                        ID="txt6_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd6_1_Sim" runat="server" GroupName="grupo6_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd6_1_Nao" runat="server" GroupName="grupo6_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd6_1_NA" runat="server" GroupName="grupo6_1" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto6_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile6_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto6_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDSEP-01 (Separação)">PPO</a>
</td>                                                              
                            </tr>  <%--PERGUNTA 6.1.1--%> 

                            <tr>
        	                    <td align="center">6.2</td>
                                <td>Na separação, é respeitada a fragilidade de produtos na colocação dos mesmos no palet (ex. caixas pesadas sobre massas e biscoitos)?<asp:TextBox
                                        ID="txt6_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd6_2_Sim" runat="server" GroupName="grupo6_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd6_2_Nao" runat="server" GroupName="grupo6_2" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd6_2_NA" runat="server" GroupName="grupo6_2" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto6_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile6_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto6_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDSEP-01 (Separação)">PPO</a>
</td>                                                                                              
                            </tr>  <%--PERGUNTA 6.1.2--%> 

                            <tr>
        	                    <td align="center">6.3</td>
                                <td>No momeno da separação, foram encontrados produtos não cadastrados?<asp:TextBox
                                        ID="txt6_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd6_3_Sim" runat="server" GroupName="grupo6_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd6_3_Nao" runat="server" GroupName="grupo6_3" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd6_3_NA" runat="server" GroupName="grupo6_3" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto6_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile6_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto6_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDSEP-01 (Separação)">PPO</a>
</td>                            
                            </tr>  <%--PERGUNTA 6.1.3--%>

                            <tr>
        	                    <td align="center">6.4</td>
                                <td>No momeno da separação, foram encontrados produtos no endereçamento errado? <asp:TextBox
                                        ID="txt6_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd6_4_Sim" runat="server" GroupName="grupo6_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd6_4_Nao" runat="server" GroupName="grupo6_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd6_4_NA" runat="server" GroupName="grupo6_4" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto6_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile6_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto6_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDSEP-01 (Separação)">PPO</a>
</td>                            
                            </tr>  <%--PERGUNTA 6.1.4--%>

                            <tr>
        	                    <td align="center">6.5</td>
                                <td>No momento da avaliação, foram identificadas caixas abertas?<asp:TextBox
                                        ID="txt6_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd6_5_Sim" runat="server" GroupName="grupo6_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd6_5_Nao" runat="server" GroupName="grupo6_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd6_5_NA" runat="server" GroupName="grupo6_5" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto6_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile6_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto6_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDSEP-01 (Separação)">PPO</a>
</td>                             
                            </tr>  <%--PERGUNTA 6.1.5--%>

                            <tr>
        	                    <td align="center">6.6</td>
                                <td>As exclusões de itens faltantes é realizada exclusivamente pelo Encarregado e o Lider do setor? Observar no relatório.<asp:TextBox
                                        ID="txt6_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd6_6_Sim" runat="server" GroupName="grupo6_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd6_6_Nao" runat="server" GroupName="grupo6_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd6_6_NA" runat="server" GroupName="grupo6_6" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto6_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile6_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto6_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDSEP-01 (Separação)">PPO</a>
</td>                            
                            </tr>  <%--PERGUNTA 6.1.6--%>   

                            <tr>
        	                    <td align="center">6.7</td>
                                <td>O Controle de Conferência de Pneus está sendo utilizado corretamente? (Processo realizado paralelamente com a Expedição)<asp:TextBox
                                        ID="txt6_7" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd6_7_Sim" runat="server" GroupName="grupo6_7" /></td>
                                <td align="center"><asp:RadioButton ID="rnd6_7_Nao" runat="server" GroupName="grupo6_7" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd6_7_NA" runat="server" GroupName="grupo6_7" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto6_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile6_7" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto6_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
                               <td></td>                                
                            </tr>  <%--PERGUNTA 6.1.7--%>   

                            <tr>
        	                    <td align="center">6.8</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados (sapato e luva)?<asp:TextBox
                                        ID="txt6_8" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd6_8_Sim" runat="server" GroupName="grupo6_8" /></td>
                                <td align="center"><asp:RadioButton ID="rnd6_8_Nao" runat="server" GroupName="grupo6_8" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd6_8_NA" runat="server" GroupName="grupo6_8" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto6_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile6_8" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto6_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR6 - Equipamento de Proteção Individual - EPI">PPO</a>
</td>                             
                            </tr>  <%--PERGUNTA 6.1.8--%>                      
  

                            <thead> 
        	                      <tr>
                                      <td>
                                      </td>
                                      
                                      <td align="right">
                                        <dx:ASPxButton ID="btnGrupo6" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>                          
                                      </td>
                                  </tr>
                              </thead>                                  
                          
                        </tbody>
                    </table>            
    </p>      
</asp:Panel> <%-- 6 - SEPARAÇÃO--%>

<asp:Panel ID="panTitle7" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 7 - EXPEDIÇÃO - (20 perguntas, 1 à 20) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle7" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel> 
<asp:Panel ID="panDados7" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">        
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
        	                    <td align="center">7.1</td>
                                <td>Na montagem das cargas, é realizada conferência de 20% dos protudos, conforme regra ABNT de conferência?<asp:TextBox
                                        ID="txt7_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_1_Sim" runat="server" GroupName="grupo7_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_1_Nao" runat="server" GroupName="grupo7_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_1_NA" runat="server" GroupName="grupo7_1" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                                                
                            </tr>  <%--PERGUNTA 7.1.1--%>  

                            <tr>
        	                    <td align="center">7.2</td>
                                <td>As cargas estão sendo montagas corretamente (strach) de forma a garantir o não tombamento dentro do caminhão?<asp:TextBox
                                        ID="txt7_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_2_Sim" runat="server" GroupName="grupo7_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_2_Nao" runat="server" GroupName="grupo7_2" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_2_NA" runat="server" GroupName="grupo7_2" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                                                                              
                            </tr>  <%--PERGUNTA 7.1.2--%> 

                            <tr>
        	                    <td align="center">7.3</td>
                                <td>Na montagem dos palets, está sendo respeitada a fragilidade de produtos?<asp:TextBox
                                        ID="txt7_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_3_Sim" runat="server" GroupName="grupo7_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_3_Nao" runat="server" GroupName="grupo7_3" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_3_NA" runat="server" GroupName="grupo7_3" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                  
                            </tr>  <%--PERGUNTA 7.1.3--%>

                            <tr>
        	                    <td align="center">7.4</td>
                                <td>O controle de lacres (numeração, asinatura do fiscal e data) estão sendo realizados corretamente?<asp:TextBox
                                        ID="txt7_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_4_Sim" runat="server" GroupName="grupo7_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_4_Nao" runat="server" GroupName="grupo7_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_4_NA" runat="server" GroupName="grupo7_4" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                 
                            </tr>  <%--PERGUNTA 7.1.4--%>

                            <tr>
        	                    <td align="center">7.5</td>
                                <td>Foi evidenciada doca aberta sem caminhão encostado?<asp:TextBox
                                        ID="txt7_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_5_Sim" runat="server" GroupName="grupo7_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_5_Nao" runat="server" GroupName="grupo7_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_5_NA" runat="server" GroupName="grupo7_5" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                 
                            </tr>  <%--PERGUNTA 7.1.5--%>

                            <tr>
        	                    <td align="center">7.6</td>
                                <td>Foi identificado palet sem a respectiva bandeira da loja de destino?<asp:TextBox
                                        ID="txt7_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_6_Sim" runat="server" GroupName="grupo7_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_6_Nao" runat="server" GroupName="grupo7_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_6_NA" runat="server" GroupName="grupo7_6" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                   
                            </tr>  <%--PERGUNTA 7.1.6--%>   
                             
                            <tr>
        	                    <td align="center">7.7</td>
                                <td>Foi evidenciado carregamento de determinada loja em doca destinada para outra loja?<asp:TextBox
                                        ID="txt7_7" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_7_Sim" runat="server" GroupName="grupo7_7" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_7_Nao" runat="server" GroupName="grupo7_7" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_7_NA" runat="server" GroupName="grupo7_7" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_7" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                              
                            </tr>  <%--PERGUNTA 7.1.7--%> 
                             
                            <tr>
        	                    <td align="center">7.8</td>
                                <td>O Fiscal está presente 100% do tempo na área de carregamento para as lojas?<asp:TextBox
                                        ID="txt7_8" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_8_Sim" runat="server" GroupName="grupo7_8" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_8_Nao" runat="server" GroupName="grupo7_8" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_8_NA" runat="server" GroupName="grupo7_8" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_8" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 7.1.8--%>  

                            <tr>
        	                    <td align="center">7.9</td>
                                <td>No momento da avaliação, foram identificadas produtos avariados sem a devida identificação?<asp:TextBox
                                        ID="txt7_9" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_9_Sim" runat="server" GroupName="grupo7_9" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_9_Nao" runat="server" GroupName="grupo7_9" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_9_NA" runat="server" GroupName="grupo7_9" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_9" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 7.1.9--%> 

                            <tr>
        	                    <td align="center">7.10</td>
                                <td>No momento da avaliação, foram identificadas caixas abertas?<asp:TextBox
                                        ID="txt7_10" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_10_Sim" runat="server" GroupName="grupo7_10" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_10_Nao" runat="server" GroupName="grupo7_10" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_10_NA" runat="server" GroupName="grupo7_10" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_10" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                              
                            </tr>  <%--PERGUNTA 7.1.10--%> 

                            <tr>
        	                    <td align="center">7.11</td>
                                <td>No momento da avaliação, foram identificadas "lojas misturadas"?<asp:TextBox
                                        ID="txt7_11" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_11_Sim" runat="server" GroupName="grupo7_11" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_11_Nao" runat="server" GroupName="grupo7_11" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_11_NA" runat="server" GroupName="grupo7_11" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_11" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 7.1.11--%> 

                            <tr>
        	                    <td align="center">7.12</td>
                                <td>Os controles de conferência de docas estão adequados? (verificar se há informações divergentes de horários, loja e se estão com as 2 etiquetas de conferência)<asp:TextBox
                                        ID="txt7_12" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_12_Sim" runat="server" GroupName="grupo7_12" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_12_Nao" runat="server" GroupName="grupo7_12" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_12_NA" runat="server" GroupName="grupo7_12" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_12" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                 
                            </tr>  <%--PERGUNTA 7.1.12--%> 

                            <tr>
        	                    <td align="center">7.13</td>
                                <td>Os controles de lacres estão sendo realizados adequadamente? (preenchimento das planilhas de loja, placa e motorista).
                                    <asp:TextBox ID="txt7_13" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_13_Sim" runat="server" GroupName="grupo7_13" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_13_Nao" runat="server" GroupName="grupo7_13" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_13_NA" runat="server" GroupName="grupo7_13" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_13" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                               
                            </tr>  <%--PERGUNTA 7.1.13--%>

                            <tr>
        	                    <td align="center">7.14</td>
                                <td>Os controles de conferência de docas estão adequados? (verificar se há informações divergentes de horários, loja e se estão com as 2 etiquetas de conferência)<asp:TextBox
                                        ID="txt7_14" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_14_Sim" runat="server" GroupName="grupo7_14" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_14_Nao" runat="server" GroupName="grupo7_14" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_14_NA" runat="server" GroupName="grupo7_14" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_14" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 7.1.14--%>   
                             
                            <tr>
        	                    <td align="center">7.15</td>
                                <td>O Controle de Conferência de Pneus está sendo utilizado corretamente? (Processo realizado paralelamente com a Expedição)<asp:TextBox
                                        ID="txt7_15" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_15_Sim" runat="server" GroupName="grupo7_15" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_15_Nao" runat="server" GroupName="grupo7_15" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_15_NA" runat="server" GroupName="grupo7_15" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_15" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_15" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                           
                            </tr>  <%--PERGUNTA 7.1.15--%> 
                             
                            <tr>
        	                    <td align="center">7.16</td>
                                <td>O ambiente encontra-se limpo e organizado?<asp:TextBox
                                        ID="txt7_16" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_16_Sim" runat="server" GroupName="grupo7_16" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_16_Nao" runat="server" GroupName="grupo7_16" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_16_NA" runat="server" GroupName="grupo7_16" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_16" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_16" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
                                <td></td>                                
                            </tr>  <%--PERGUNTA 7.1.16--%>  

                            <tr>
        	                    <td align="center">7.17</td>
                                <td>Os caminhões cencontram-se em perfeitas condições de estética, limpeza e organização?<asp:TextBox
                                        ID="txt7_17" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_17_Sim" runat="server" GroupName="grupo7_17" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_17_Nao" runat="server" GroupName="grupo7_17" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_17_NA" runat="server" GroupName="grupo7_17" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_17" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_17" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                

<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 7.1.17--%> 

                            <tr>
        	                    <td align="center">7.18</td>
                                <td>O pátio externo da Expedição encontra-se limpo e organizado?<asp:TextBox
                                        ID="txt7_18" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_18_Sim" runat="server" GroupName="grupo7_18" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_18_Nao" runat="server" GroupName="grupo7_18" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_18_NA" runat="server" GroupName="grupo7_18" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_18" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_18" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>  

<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>   


                          </tr>  <%--PERGUNTA 7.1.18--%>                    

                            <tr>
        	                    <td align="center">7.19</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados (sapato e luva)?<asp:TextBox
                                        ID="txt7_19" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd7_19_Sim" runat="server" GroupName="grupo7_19" /></td>
                                <td align="center"><asp:RadioButton ID="rnd7_19_Nao" runat="server" GroupName="grupo7_19" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd7_19_NA" runat="server" GroupName="grupo7_19" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto7_19" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile7_19" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto7_19" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                

<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 7.1.19--%> 


                            <thead>   
        	                      <tr>
                                      <td>
                                      </td>
                                      
                                      <td align="right">
                                        <dx:ASPxButton ID="btnGrupo7" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>

                                      </td>
                                  </tr>
                              </thead>  <%--SALVAR 7  --%>                              
                         
                        </tbody>
                    </table>          
    </p>      
</asp:Panel> <%--3 - CÂMARA FIAMBRERIA/ LATICÍNIOS --%>


<asp:Panel ID="panTitle11" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 11 - PERECÍVEIS - (22 perguntas, 1 à 22) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle11" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel>  
<asp:Panel ID="panDados11" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">      
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
        	                    <td align="center">11.1</td>
                                <td>O controle de ocorrências do recebimento (entrada de NFs, devolução, temperatura, caminhões, irregularidades de recebimento) está sendo preenchido corretamente? (Verificar relatórios de irregularidades) <asp:TextBox
                                        ID="txt11_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_1_Sim" runat="server" GroupName="grupo11_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_1_Nao" runat="server" GroupName="grupo11_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_1_NA" runat="server" GroupName="grupo11_1" /></td>                                
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDPER-01 (Perecíveis)">PPO</a>
</td> 
                            </tr> <%--PERGUNTA 11.1.1--%>

                            <tr>
        	                    <td align="center">11.2</td>
                                <td>As balanças e termômetros estão limpos, aferidos e de fácil acesso aos conferentes?<asp:TextBox
                                        ID="txt11_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_2_Sim" runat="server" GroupName="grupo11_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_2_Nao" runat="server" GroupName="grupo11_2" /></td>   
                                <td align="center"><asp:RadioButton ID="rnd11_2_NA" runat="server" GroupName="grupo11_2" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDPER-01 (Perecíveis)">PPO</a>
</td>                                                                                                                                                     
                            </tr> <%--PERGUNTA 11.1.2--%>

                            <tr>
        	                    <td align="center">11.3</td>
                                <td>A câmara está em perfeitas condições para o uso (iluminação, portas, manutenção em geral)?<asp:TextBox
                                        ID="txt11_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_3_Sim" runat="server" GroupName="grupo11_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_3_Nao" runat="server" GroupName="grupo11_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_3_NA" runat="server" GroupName="grupo11_3" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDPER-01 (Perecíveis)">PPO</a>
</td>                                                                                                                                                                                                                                                                                         
                            </tr> <%--PERGUNTA 11.1.3--%>

                            <tr>
        	                    <td align="center">11.4</td>
                                <td>As câmaras estão na temperatura adequada conforme o tipo de produto que armazena?<asp:TextBox
                                        ID="txt11_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_4_Sim" runat="server" GroupName="grupo11_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_4_Nao" runat="server" GroupName="grupo11_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_4_NA" runat="server" GroupName="grupo11_4" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDPER-01 (Perecíveis)">PPO</a>
</td>                          
                            </tr> <%--PERGUNTA 11.1.4--%>

                            <tr>
        	                    <td align="center">11.5</td>
                                <td>Foi evidenciado a medição diária da temperatura das câmaras frias, o que deve ocorrer 2 vezes ao dia?  (verificar evidências)<asp:TextBox
                                        ID="txt11_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_5_Sim" runat="server" GroupName="grupo11_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_5_Nao" runat="server" GroupName="grupo11_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_5_NA" runat="server" GroupName="grupo11_5" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDPER-01 (Perecíveis)">PPO</a>
</td>                              
                            </tr> <%--PERGUNTA 11.1.5--%>

                            <tr>
        	                    <td align="center">11.6</td>
                                <td>As câmaras estão limpas e organizadas?<asp:TextBox
                                        ID="txt11_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_6_Sim" runat="server" GroupName="grupo11_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_6_Nao" runat="server" GroupName="grupo11_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_6_NA" runat="server" GroupName="grupo11_6" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDPER-01 (Perecíveis)">PPO</a>
</td>                            
                            </tr> <%--PERGUNTA 11.1.6--%> 

                            <tr>
        	                    <td align="center">11.7</td>
                                <td>O acesso de pessoas às câmaras é feito com o uso dos EPI´s obrigatórios?<asp:TextBox
                                        ID="txt11_7" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_7_Sim" runat="server" GroupName="grupo11_7" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_7_Nao" runat="server" GroupName="grupo11_7" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_7_NA" runat="server" GroupName="grupo11_7" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_7" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR6 - Equipamento de Proteção Individual - EPI">PPO</a>
</td>                           
                            </tr> <%--PERGUNTA 11.1.7--%>

                            <tr>
        	                    <td align="center">11.8</td>
                                <td>O empilhamento de caixas está guardando distância mínima de 10 cm em relação às paredes?<asp:TextBox
                                        ID="txt11_8" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_8_Sim" runat="server" GroupName="grupo11_8" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_8_Nao" runat="server" GroupName="grupo11_8" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_8_NA" runat="server" GroupName="grupo11_8" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_8" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDPER-01 (Perecíveis)">PPO</a>
</td>                        
                            </tr> <%--PERGUNTA 11.1.8--%>

                            <tr>
        	                    <td align="center">11.9</td>
                                <td>O armazenamento de produtos está separado entre carne bovina, suina e de aves, evitando a contaminação cruzada?<asp:TextBox
                                        ID="txt11_9" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_9_Sim" runat="server" GroupName="grupo11_9" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_9_Nao" runat="server" GroupName="grupo11_9" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_9_NA" runat="server" GroupName="grupo11_9" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_9" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDPER-01 (Perecíveis)">PPO</a>
</td>                          
                            </tr> <%--PERGUNTA 11.1.9--%>

                            <tr>
        	                    <td align="center">11.10</td>
                                <td>O PVPS é cumprido corretamente?<asp:TextBox
                                        ID="txt11_10" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_10_Sim" runat="server" GroupName="grupo11_10" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_10_Nao" runat="server" GroupName="grupo11_10" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_10_NA" runat="server" GroupName="grupo11_10" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_10" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDPER-01 (Perecíveis)">PPO</a>
</td>                              
                            </tr> <%--PERGUNTA 11.1.10--%>

                            <tr>
        	                    <td align="center">11.11</td>
                                <td>Os produtos vindos do Recebimento são armazenados imediatamente dentro da câmara?<asp:TextBox
                                        ID="txt11_11" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_11_Sim" runat="server" GroupName="grupo11_11" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_11_Nao" runat="server" GroupName="grupo11_11" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_11_NA" runat="server" GroupName="grupo11_11" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_11" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDPER-01 (Perecíveis)">PPO</a>
</td>                           
                            </tr> <%--PERGUNTA 11.1.11--%>

                            <tr>
        	                    <td align="center">11.12</td>
                                <td>Não foram localizados produtos vencidos na câmara?<asp:TextBox
                                        ID="txt11_12" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_12_Sim" runat="server" GroupName="grupo11_12" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_12_Nao" runat="server" GroupName="grupo11_12" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_12_NA" runat="server" GroupName="grupo11_12" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_12" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Visual">PPO</a>
</td>                                
                            </tr> <%--PERGUNTA 11.1.12--%> 
                                                    
                            <tr>
        	                    <td align="center">11.13</td>
                                <td>O ambiente encontra-se limpo e organizado?<asp:TextBox
                                        ID="txt11_13" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_13_Sim" runat="server" GroupName="grupo11_13" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_13_Nao" runat="server" GroupName="grupo11_13" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_13_NA" runat="server" GroupName="grupo11_13" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_13" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                                                                
                            </tr> <%--PERGUNTA 11.1.13--%> 

                            <tr>
        	                    <td align="center">11.14</td>
                                <td>Foi evidenciado algum produto há muito tempo na área de separação, sob condições de resfriamento abaixo do indicado? <asp:TextBox
                                        ID="txt11_14" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_14_Sim" runat="server" GroupName="grupo11_14" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_14_Nao" runat="server" GroupName="grupo11_14" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_14_NA" runat="server" GroupName="grupo11_14" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_14" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                                                                              
                            </tr> <%--PERGUNTA 11.1.14--%> 

                            <tr>
        	                    <td align="center">11.15</td>
                                <td>Toda produção armazenada nas câmaras possui etiqueta de identificação e validade?<asp:TextBox
                                        ID="txt11_15" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_15_Sim" runat="server" GroupName="grupo11_15" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_15_Nao" runat="server" GroupName="grupo11_15" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_15_NA" runat="server" GroupName="grupo11_15" /></td>     
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_15" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_15" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                         
                            </tr> <%--PERGUNTA 11.1.15--%>

                            <tr>
        	                    <td align="center">11.16</td>
                                <td>Os produtos a serem enviados para as lojas estão cobertos com strachs de modo que não fique nenhum pedaço de carne para fora?<asp:TextBox
                                        ID="txt11_16" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_16_Sim" runat="server" GroupName="grupo11_16" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_16_Nao" runat="server" GroupName="grupo11_16" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_16_NA" runat="server" GroupName="grupo11_16" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_16" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_16" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                            
                            </tr> <%--PERGUNTA 11.1.16--%>

                            <tr>
        	                    <td align="center">11.17</td>
                                <td>O processo de descongelamento técnico é realizado corretamente conforme orientação da HSA (Higiene e Segurança Alimentar)?<asp:TextBox
                                        ID="txt11_17" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_17_Sim" runat="server" GroupName="grupo11_17" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_17_Nao" runat="server" GroupName="grupo11_17" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_17_NA" runat="server" GroupName="grupo11_17" /></td>         
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_17" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_17" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                       
                            </tr> <%--PERGUNTA 11.1.17--%>

                            <tr>
        	                    <td align="center">11.18</td>
                                <td>Existem notas fiscais pendentes de "acatamento" (sem pedido, divergência de quantidade ou custo)?<asp:TextBox
                                        ID="txt11_18" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_18_Sim" runat="server" GroupName="grupo11_18" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_18_Nao" runat="server" GroupName="grupo11_18" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_18_NA" runat="server" GroupName="grupo11_18" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_18" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_18" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                           
                            </tr> <%--PERGUNTA 11.1.18--%>

                            <tr>
        	                    <td align="center">11.19</td>
                                <td>O pátio externo do Perecíveis (carga e descarga) encontra-se limpo e organizado? <asp:TextBox
                                        ID="txt11_19" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_19_Sim" runat="server" GroupName="grupo11_19" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_19_Nao" runat="server" GroupName="grupo11_19" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_19_NA" runat="server" GroupName="grupo11_19" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_19" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_19" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_19" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                            
                            </tr> <%--PERGUNTA 11.1.19--%>

                            <tr>
        	                    <td align="center">11.20</td>
                                <td>Os caminhões mantém o motor de resfriamento do baú ligado durante o carregamento? <asp:TextBox
                                        ID="txt11_20" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_20_Sim" runat="server" GroupName="grupo11_20" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_20_Nao" runat="server" GroupName="grupo11_20" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_20_NA" runat="server" GroupName="grupo11_20" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_20" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_20" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_20" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDPER-01 (Perecíveis)">PPO</a>
</td>                             
                            </tr> <%--PERGUNTA 11.1.20--%>

                            <tr>
        	                    <td align="center">11.21</td>
                                <td>Os colaboradores do setor fazem uso de toucas, uniformes e não utilizam adornos (brincos, esmalte, maquiagem, perfume, etc.)? <asp:TextBox
                                        ID="txt11_21" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_21_Sim" runat="server" GroupName="grupo11_21" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_21_Nao" runat="server" GroupName="grupo11_21" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_21_NA" runat="server" GroupName="grupo11_21" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_21" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_21" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_21" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR6 - Equipamento de Proteção Individual - EPI">PPO</a>
</td>                             
                            </tr> <%--PERGUNTA 11.1.21--%>
							
							<tr>
        	                    <td align="center">11.22</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPIs adequados? <asp:TextBox
                                        ID="txt11_22" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd11_22_Sim" runat="server" GroupName="grupo11_21" /></td>
                                <td align="center"><asp:RadioButton ID="rnd11_22_Nao" runat="server" GroupName="grupo11_21" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd11_22_NA" runat="server" GroupName="grupo11_21" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto11_22" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile11_22" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto11_22" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR6 - Equipamento de Proteção Individual - EPI">PPO</a>
</td>                               
                            </tr> <%--PERGUNTA 11.1.22--%>
                                                                                                                                            
                            <thead> 
        	                      <tr>
                                      <td>
                                      </td>
                                      
                                      <td align="right">
                                        <dx:ASPxButton ID="btnGrupo11" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>                                      </td>
                                  </tr>
                              </thead>                                
                          
                        </tbody>
                    </table>   
    </p>  
</asp:Panel> 

<asp:Panel ID="panTitle12" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 12 - TROCAS MERCEARIA - (7 perguntas, 1 à 7) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle12" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel>  
<asp:Panel ID="panDados12" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">      
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
        	                    <td align="center">12.1</td>
                                <td>A conferência de produtos devolvidos para troca (lojas/estoque CD) são realizados com o auxílio do coletor?<asp:TextBox
                                        ID="txt12_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd12_1_Sim" runat="server" GroupName="grupo12_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd12_1_Nao" runat="server" GroupName="grupo12_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd12_1_NA" runat="server" GroupName="grupo12_1" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto12_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile12_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto12_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCMERC-01 (Trocas Mercearia)">PPO</a>
</td>                                                                
                            </tr>  <%--PERGUNTA 12.1.1--%>  

                            <tr>
        	                    <td align="center">12.2</td>
                                <td>A área de avairas de protudos vindos do estoque CD está limpa e organizada, uma vez que se manipulam produtos alimentícios para reaproveitamento?<asp:TextBox
                                        ID="txt12_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd12_2_Sim" runat="server" GroupName="grupo12_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd12_2_Nao" runat="server" GroupName="grupo12_2" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd12_2_NA" runat="server" GroupName="grupo12_2" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto12_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile12_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto12_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCMERC-01 (Trocas Mercearia)">PPO</a>
</td>                                                                                               
                            </tr>  <%--PERGUNTA 12.1.2--%> 

                            <tr>
        	                    <td align="center">12.3</td>
                                <td>Está sendo verificada a validade dos produtos de repasse (produtos recuperados)?<asp:TextBox
                                        ID="txt12_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd12_3_Sim" runat="server" GroupName="grupo12_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd12_3_Nao" runat="server" GroupName="grupo12_3" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd12_3_NA" runat="server" GroupName="grupo12_3" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto12_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile12_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto12_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCMERC-01 (Trocas Mercearia)">PPO</a>
</td>                                
                            </tr>  <%--PERGUNTA 12.1.3--%>

                            <tr>
        	                    <td align="center">12.4</td>
                                <td>Existem produtos no chão e fora dos sacos durante a manipulação das lojas?<asp:TextBox
                                        ID="txt12_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd12_4_Sim" runat="server" GroupName="grupo12_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd12_4_Nao" runat="server" GroupName="grupo12_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd12_4_NA" runat="server" GroupName="grupo12_4" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto12_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile12_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto12_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCMERC-01 (Trocas Mercearia)">PPO</a>
</td>                          
                            </tr>  <%--PERGUNTA 12.1.4--%>

                            <tr>
        	                    <td align="center">12.5</td>
                                <td>o descarte de produtor da agenda 23 está sendo realizado de forma correta, ou seja, estão sendo descartados conforme o que determina a legislação ambiental?<asp:TextBox
                                        ID="txt12_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd12_5_Sim" runat="server" GroupName="grupo12_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd12_5_Nao" runat="server" GroupName="grupo12_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd12_5_NA" runat="server" GroupName="grupo12_5" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto12_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile12_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto12_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCMERC-01 (Trocas Mercearia)">PPO</a>
</td>                             
                            </tr>  <%--PERGUNTA 12.1.5--%>

                            <tr>
        	                    <td align="center">12.6</td>
                                <td>O ambiente encontra-se limpo e organizado?<asp:TextBox
                                        ID="txt12_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd12_6_Sim" runat="server" GroupName="grupo12_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd12_6_Nao" runat="server" GroupName="grupo12_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd12_6_NA" runat="server" GroupName="grupo12_6" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto12_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile12_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto12_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                               
                            </tr>  <%--PERGUNTA 12.1.6--%>   
                             
                            <tr>
        	                    <td align="center">12.7</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPIs adequados (máscara, luva e sapato)?<asp:TextBox
                                        ID="txt12_7" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd12_7_Sim" runat="server" GroupName="grupo12_7" /></td>
                                <td align="center"><asp:RadioButton ID="rnd12_7_Nao" runat="server" GroupName="grupo12_7" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd12_7_NA" runat="server" GroupName="grupo12_7" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto12_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile12_7" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto12_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR6 - Equipamento de Proteção Individual - EPI">PPO</a>
</td>                               
                            </tr>  <%--PERGUNTA 12.1.7--%>                          
                            
                            <thead>  
        	                      <tr>
                                      <td>
                                      </td>
                                      
                                      <td align="right">
                                        <dx:ASPxButton ID="btnGrupo12" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>   
                                      </td>
                                  </tr>
                             </thead>                                   
                          
                        </tbody>
                    </table>    
    </p>  
</asp:Panel>

<asp:Panel ID="panTitle13" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 13 - TROCAS ELETRO - (13 perguntas, 1 à 13) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle13" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel>  
<asp:Panel ID="panDados13" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">      
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
        	                    <td align="center">13.1</td>
                                <td>A área encontra-se limpa, organizada e sinalizada?<asp:TextBox
                                        ID="txt13_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd13_1_Sim" runat="server" GroupName="grupo13_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_1_Nao" runat="server" GroupName="grupo13_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd13_1_NA" runat="server" GroupName="grupo13_1" /></td>                                
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto13_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile13_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto13_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCELE-01 (Trocas Eletro)">PPO</a>
</td>  
                            </tr> <%--PERGUNTA 13.1.1--%>

                            <tr>
        	                    <td align="center">13.2</td>
                                <td>A conferência de produtos devolvidos para troca (lojas/estoque CD) são realizados com o auxílio do coletor?<asp:TextBox
                                        ID="txt13_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd13_2_Sim" runat="server" GroupName="grupo13_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_2_Nao" runat="server" GroupName="grupo13_2" /></td>   
                                <td align="center"><asp:RadioButton ID="rnd13_2_NA" runat="server" GroupName="grupo13_2" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto13_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile13_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto13_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCELE-01 (Trocas Eletro)">PPO</a>
</td>                                                                                                                                                       
                            </tr> <%--PERGUNTA 13.1.2--%>

                            <tr>
        	                    <td align="center">13.3</td>
                                <td>Existem produtos de alto valor agregado, e que poderão ser reaproveitados, parados há mais de 30 dias?<asp:TextBox
                                        ID="txt13_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd13_3_Sim" runat="server" GroupName="grupo13_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_3_Nao" runat="server" GroupName="grupo13_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_3_NA" runat="server" GroupName="grupo13_3" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto13_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile13_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto13_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCELE-01 (Trocas Eletro)">PPO</a>
</td>  v                                                                                                                                                                                                                                                                                         
                            </tr> <%--PERGUNTA 13.1.3--%>

                            <tr>
        	                    <td align="center">13.4</td>
                                <td>Existe sucata há mais de 6 meses etocados?<asp:TextBox
                                        ID="txt13_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd13_4_Sim" runat="server" GroupName="grupo13_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_4_Nao" runat="server" GroupName="grupo13_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd13_4_NA" runat="server" GroupName="grupo13_4" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto13_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile13_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto13_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCELE-01 (Trocas Eletro)">PPO</a>
</td>                            
                            </tr> <%--PERGUNTA 13.1.4--%>

                            <tr>
        	                    <td align="center">13.5</td>
                                <td>Os produtos enviados à assistência técnica são retirados mediante Nota Fiscal?<asp:TextBox
                                        ID="txt13_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd13_5_Sim" runat="server" GroupName="grupo13_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_5_Nao" runat="server" GroupName="grupo13_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd13_5_NA" runat="server" GroupName="grupo13_5" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto13_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile13_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto13_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCELE-01 (Trocas Eletro)">PPO</a>
</td>                                
                            </tr> <%--PERGUNTA 13.1.5--%>

                            <tr>
        	                    <td align="center">13.6</td>
                                <td>Os corredores estão limpos e desobstruídos?<asp:TextBox
                                        ID="txt13_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd13_6_Sim" runat="server" GroupName="grupo13_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_6_Nao" runat="server" GroupName="grupo13_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd13_6_NA" runat="server" GroupName="grupo13_6" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto13_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile13_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto13_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCELE-01 (Trocas Eletro)">PPO</a>
</td>                               
                            </tr> <%--PERGUNTA 13.1.6--%> 

                            <tr>
        	                    <td align="center">13.7</td>
                                <td>Na área existe o controle de acesso (chaves com os fiscais ou encarregados da seção)?<asp:TextBox
                                        ID="txt13_7" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd13_7_Sim" runat="server" GroupName="grupo13_7" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_7_Nao" runat="server" GroupName="grupo13_7" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd13_7_NA" runat="server" GroupName="grupo13_7" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto13_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile13_7" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto13_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCELE-01 (Trocas Eletro)">PPO</a>
</td>                              
                            </tr> <%--PERGUNTA 13.1.7--%>

                            <tr>
        	                    <td align="center">13.8</td>
                                <td>A gaiola de PAR de trocas está sendo conferida na área destinada, ou seja, sob a fiscalização das câmeras de vigilância (CFTV)?<asp:TextBox
                                        ID="txt13_8" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd13_8_Sim" runat="server" GroupName="grupo13_8" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_8_Nao" runat="server" GroupName="grupo13_8" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd13_8_NA" runat="server" GroupName="grupo13_8" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto13_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile13_8" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto13_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCELE-01 (Trocas Eletro)">PPO</a>
</td>                             
                            </tr> <%--PERGUNTA 13.1.8--%>

                            <tr>
        	                    <td align="center">13.9</td>
                                <td>Há restrição de entrada de pessoas externas no depósito?<asp:TextBox
                                        ID="txt13_9" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd13_9_Sim" runat="server" GroupName="grupo13_9" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_9_Nao" runat="server" GroupName="grupo13_9" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd13_9_NA" runat="server" GroupName="grupo13_9" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto13_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile13_9" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto13_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCELE-01 (Trocas Eletro)">PPO</a>
</td>                               
                            </tr> <%--PERGUNTA 13.1.9--%>

                            <tr>
        	                    <td align="center">13.10</td>
                                <td>A área destinada para Assistência Técnica está limpa, organizada e sinalizada?<asp:TextBox
                                        ID="txt13_10" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd13_10_Sim" runat="server" GroupName="grupo13_10" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_10_Nao" runat="server" GroupName="grupo13_10" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd13_10_NA" runat="server" GroupName="grupo13_10" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto13_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile13_10" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto13_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCELE-01 (Trocas Eletro)">PPO</a>
</td>                             
                            </tr> <%--PERGUNTA 13.1.10--%>

                            <tr>
        	                    <td align="center">13.11</td>
                                <td>Os produtos da área de Assistência Técnica estão relacionados em planilha específica?<asp:TextBox
                                        ID="txt13_11" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd13_11_Sim" runat="server" GroupName="grupo13_11" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_11_Nao" runat="server" GroupName="grupo13_11" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd13_11_NA" runat="server" GroupName="grupo13_11" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto13_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile13_11" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto13_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDTRCELE-01 (Trocas Eletro)">PPO</a>
</td>                           
                            </tr> <%--PERGUNTA 13.1.11--%>

                            <tr>
        	                    <td align="center">13.12</td>
                                <td>O ambiente encontra-se limpo e organizado?<asp:TextBox
                                        ID="txt13_12" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd13_12_Sim" runat="server" GroupName="grupo13_12" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_12_Nao" runat="server" GroupName="grupo13_12" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd13_12_NA" runat="server" GroupName="grupo13_12" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto13_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile13_12" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto13_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                             
                            </tr> <%--PERGUNTA 13.1.12--%> 
                                                    
                            <tr>
        	                    <td align="center">13.13</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPIs adequados?<asp:TextBox
                                        ID="txt13_13" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd13_13_Sim" runat="server" GroupName="grupo13_13" /></td>
                                <td align="center"><asp:RadioButton ID="rnd13_13_Nao" runat="server" GroupName="grupo13_13" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd13_13_NA" runat="server" GroupName="grupo13_13" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto13_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile13_13" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto13_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR6 - Equipamento de Proteção Individual - EPI">PPO</a>
</td>                                                             
                            </tr> <%--PERGUNTA 13.1.13--%>     
                            
                            
                            <thead> 
        	                      <tr>
                                      <td>
                                      </td>
                                      
                                      <td align="right">
                                        <dx:ASPxButton ID="btnGrupo13" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>
                                      </td>
                                  </tr>
                              </thead>                                   
                          
                        </tbody>
                    </table>    
    </p>  
</asp:Panel>

<asp:Panel ID="panTitle14" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 14 - ADMINISTRATIVO - (4 perguntas, 1 à 4) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle14" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel>  
<asp:Panel ID="panDados14" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">      
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
        	                    <td align="center">14.1</td>
                                <td>Os lançamentos da Agenda 23 (quebra conhecida) são realizados diariamente? <asp:TextBox
                                        ID="txt14_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd14_1_Sim" runat="server" GroupName="grupo14_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd14_1_Nao" runat="server" GroupName="grupo14_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd14_1_NA" runat="server" GroupName="grupo14_1" /></td>                                
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto14_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile14_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto14_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
                                <td></td>
                            </tr> <%--PERGUNTA 14.1.1--%>

                            <tr>
        	                    <td align="center">14.2</td>
                                <td>Os lançamentos da Agenda 23 são analisados diariamente pelos Encarregados e Gerentes de Setor? (Verificar assinaturas no relatório)<asp:TextBox
                                        ID="txt14_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd14_2_Sim" runat="server" GroupName="grupo14_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd14_2_Nao" runat="server" GroupName="grupo14_2" /></td>   
                                <td align="center"><asp:RadioButton ID="rnd14_2_NA" runat="server" GroupName="grupo14_2" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto14_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile14_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto14_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>                                                                                                                                                     
                            </tr> <%--PERGUNTA 14.1.2--%>

                            <tr>
        	                    <td align="center">14.3</td>
                                <td>As guias ou NFs de movimentação interna (Ag 23, 245, 705) são utilizadas corretamente, e os dados são lançados no sistema diariamente? (Verificar se possuem todas as assinaturas)<asp:TextBox
                                        ID="txt14_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd14_3_Sim" runat="server" GroupName="grupo14_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd14_3_Nao" runat="server" GroupName="grupo14_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd14_3_NA" runat="server" GroupName="grupo14_3" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto14_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile14_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto14_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>                                                                                                                                                                                                                                                                                           
                            </tr> <%--PERGUNTA 14.1.3--%>

                            <tr>
        	                    <td align="center">14.4</td>
                                <td>O quadro mensal da gestão está atualizado? <asp:TextBox
                                        ID="txt14_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd14_4_Sim" runat="server" GroupName="grupo14_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd14_4_Nao" runat="server" GroupName="grupo14_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd14_4_NA" runat="server" GroupName="grupo14_4" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto14_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile14_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto14_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>                           
                            </tr> <%--PERGUNTA 14.1.4--%>

                                                                                                                                               
                            <thead> 
        	                      <tr>
                                      <td>
                                      </td>
                                      
                                      <td align="right">
                                        <dx:ASPxButton ID="btnGrupo14" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>
                                      </td>
                                  </tr>
                              </thead>                                  
                          
                        </tbody>
                    </table>   
    </p>  
</asp:Panel>

<asp:Panel ID="panTitle15" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 15 - COZINHA / REFEITÓRIO - (5 perguntas, 1 à 5) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle15" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel>  
<asp:Panel ID="panDados15" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">      
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
        	                    <td align="center">15.1</td>
                                <td>Todos os exaustores do Refeitório encontram-se ligados? <asp:TextBox
                                        ID="txt15_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd15_1_Sim" runat="server" GroupName="grupo15_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd15_1_Nao" runat="server" GroupName="grupo15_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd15_1_NA" runat="server" GroupName="grupo15_1" /></td>                                
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto15_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile15_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto15_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
                                <td></td>
                            </tr> <%--PERGUNTA 15.1.1--%>

                            <tr>
        	                    <td align="center">15.2</td>
                                <td>Todos os exaustores da cozinha encontram-se ligados?<asp:TextBox
                                        ID="txt15_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd15_2_Sim" runat="server" GroupName="grupo15_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd15_2_Nao" runat="server" GroupName="grupo15_2" /></td>   
                                <td align="center"><asp:RadioButton ID="rnd15_2_NA" runat="server" GroupName="grupo15_2" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto15_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile15_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto15_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>                                                                                                                                                      
                            </tr> <%--PERGUNTA 15.1.2--%>

                            <tr>
        	                    <td align="center">15.3</td>
                                <td>As amostras do dia foram recolhidas e armazenadas?<asp:TextBox
                                        ID="txt15_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd15_3_Sim" runat="server" GroupName="grupo15_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd15_3_Nao" runat="server" GroupName="grupo15_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd15_3_NA" runat="server" GroupName="grupo15_3" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto15_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile15_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto15_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR32 - Consumo de Alimentos">PPO</a>
</td>                             </tr> <%--PERGUNTA 15.1.3--%>

                            <tr>
        	                    <td align="center">15.4</td>
                                <td>O abastecimento de produtos de higiene e limpesa está adequado?<asp:TextBox
                                        ID="txt15_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd15_4_Sim" runat="server" GroupName="grupo15_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd15_4_Nao" runat="server" GroupName="grupo15_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd15_4_NA" runat="server" GroupName="grupo15_4" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto15_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile15_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto15_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR32 - Consumo de Alimentos">PPO</a>
</td>                             </tr> <%--PERGUNTA 15.1.4--%>

                            <tr>
        	                    <td align="center">15.5</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPIs adequados?<asp:TextBox
                                        ID="txt15_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd15_5_Sim" runat="server" GroupName="grupo15_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd15_5_Nao" runat="server" GroupName="grupo15_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd15_5_NA" runat="server" GroupName="grupo15_5" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto15_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile15_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto15_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 

<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR6 - Equipamento de Proteção Individual - EPI">PPO</a>
</td>                              </tr> <%--PERGUNTA 15.1.5--%>


                            <tr>
        	                    <td align="center">15.6</td>
                                <td>Foram encontrados produtos vencidos<asp:TextBox
                                        ID="txt15_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd15_6_Sim" runat="server" GroupName="grupo15_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd15_6_Nao" runat="server" GroupName="grupo15_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd15_6_NA" runat="server" GroupName="grupo15_6" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto15_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile15_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto15_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 

<td>
    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR6 - Equipamento de Proteção Individual - EPI">PPO</a>
</td>                              </tr> <%--PERGUNTA 15.1.6--%>                        
  
                            <thead>
                                <tr>
                                    <td>
                                    </td>
                                    
                                    <td align="right">
                                        <dx:ASPxButton ID="btnGrupo15" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </thead>                                                                                                                                                                                             

                        </tbody>
                    </table>    
    </p>  
</asp:Panel>

<asp:Panel ID="panTitle16" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 16 - ENTREGA CENTRALIZADA - (3 perguntas, 1 à 3) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle16" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel>  

<asp:Panel ID="panDados16" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">      
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
        	                    <td align="center">16.1</td>
                                <td>Estão sendo utilizados os carrinhos próprios para o carregamentos dos produtos eletro? <asp:TextBox
                                        ID="txt16_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd16_1_Sim" runat="server" GroupName="grupo16_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd16_1_Nao" runat="server" GroupName="grupo16_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd16_1_NA" runat="server" GroupName="grupo16_1" /></td>                                
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto16_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile16_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto16_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
                                <td></td>
                            </tr> <%--PERGUNTA 16.1.1--%>

                            <tr>
        	                    <td align="center">16.2</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam uniforme?<asp:TextBox
                                        ID="txt16_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd16_2_Sim" runat="server" GroupName="grupo16_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd16_2_Nao" runat="server" GroupName="grupo16_2" /></td>   
                                <td align="center"><asp:RadioButton ID="rnd16_2_NA" runat="server" GroupName="grupo16_2" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto16_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile16_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto16_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>
                            </tr> <%--PERGUNTA 16.1.2--%>

                            <tr>
        	                    <td align="center">16.3</td>
                                <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPIs adequados?<asp:TextBox
                                        ID="txt16_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd16_3_Sim" runat="server" GroupName="grupo16_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd16_3_Nao" runat="server" GroupName="grupo16_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd16_3_NA" runat="server" GroupName="grupo16_3" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto16_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile16_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto16_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>
                            </tr> <%--PERGUNTA 16.1.3--%>

                            
           
                            <thead>
                                <tr>
                                    <td>
                                    </td>                                  
                                    <td align="right">
                                        <dx:ASPxButton ID="btnGrupo16" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </thead>
                          
                        </tbody>
                    </table>   
    </p>  
</asp:Panel>    

<asp:Panel ID="panTitle17" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 17 - SEGURANÇA PATRIMONIAL - (23 perguntas, 1 à 23) </div>  
    <div style="float:right;">  
        <asp:Label ID="lblTitle17" runat="server" Text="Label"></asp:Label>  
    </div>  
    <div style="clear:both"></div>  
</asp:Panel>  
<asp:Panel ID="panDados17" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;" Width="890">      
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
        	                    <td align="center">17.1</td>
                                <td>Há reuniões internas (comitê) com foco em Prevenção de Perdas?(Verificar atas e/ou listas de presença) <asp:TextBox
                                        ID="txt17_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_1_Sim" runat="server" GroupName="grupo17_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_1_Nao" runat="server" GroupName="grupo17_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_1_NA" runat="server" GroupName="grupo17_1" /></td>                                
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_1" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
                                <td></td>
                            </tr> <%--PERGUNTA 17.1.1--%>

                            <tr>
        	                    <td align="center">17.2</td>
                                <td>Os equipamentos de segurança do CD (CFTV, rádio, etc.) são testados diariamente e estão em perfeitas condições de uso?<asp:TextBox
                                        ID="txt17_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_2_Sim" runat="server" GroupName="grupo17_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_2_Nao" runat="server" GroupName="grupo17_2" /></td>   
                                <td align="center"><asp:RadioButton ID="rnd17_2_NA" runat="server" GroupName="grupo17_2" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_2" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>
                            </tr> <%--PERGUNTA 17.1.2--%>

                            <tr>
        	                    <td align="center">17.3</td>
                                <td>As portas de emergência estão desobstruídas?<asp:TextBox
                                        ID="txt17_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_3_Sim" runat="server" GroupName="grupo17_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_3_Nao" runat="server" GroupName="grupo17_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_3_NA" runat="server" GroupName="grupo17_3" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_3" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>
                            </tr> <%--PERGUNTA 17.1.3--%>

                            <tr>
        	                    <td align="center">17.4</td>
                                <td>O Operador de CFTV se encontra no setor 100% do tempo?<asp:TextBox
                                        ID="txt17_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_4_Sim" runat="server" GroupName="grupo17_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_4_Nao" runat="server" GroupName="grupo17_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_4_NA" runat="server" GroupName="grupo17_4" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_4" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>
                            </tr> <%--PERGUNTA 17.1.4--%>

                            <tr>
        	                    <td align="center">17.5</td>
                                <td>O Checklist de Fechamento e Abertura de Segurança e Plantão estão sendo realizados? (conferir atas)<asp:TextBox
                                        ID="txt17_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_5_Sim" runat="server" GroupName="grupo17_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_5_Nao" runat="server" GroupName="grupo17_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_5_NA" runat="server" GroupName="grupo17_5" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_5" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>
                            </tr> <%--PERGUNTA 17.1.5--%>

                            <tr>
        	                    <td align="center">17.6</td>
                                <td>Os extintores estão desobstruídos, em locais identificados e de fácil acesso e dentro da validade?<asp:TextBox
                                        ID="txt17_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_6_Sim" runat="server" GroupName="grupo17_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_6_Nao" runat="server" GroupName="grupo17_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_6_NA" runat="server" GroupName="grupo17_6" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_6" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>
                            </tr> <%--PERGUNTA 17.1.6--%> 

                            <tr>
        	                    <td align="center">17.7</td>
                                <td>Os banheiros estão limpos, higienizados e organizados e abastecidos com produtos de higiene (sabonete líquido e papel)?<asp:TextBox
                                        ID="txt17_7" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_7_Sim" runat="server" GroupName="grupo17_7" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_7_Nao" runat="server" GroupName="grupo17_7" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_7_NA" runat="server" GroupName="grupo17_7" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_7" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>
                            </tr> <%--PERGUNTA 17.1.7--%>

                            <tr>
        	                    <td align="center">17.8</td>
                                <td>Os porta-papéis, saboneteiras estáo abastecidos e em condições de uso?<asp:TextBox
                                        ID="txt17_8" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_8_Sim" runat="server" GroupName="grupo17_8" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_8_Nao" runat="server" GroupName="grupo17_8" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_8_NA" runat="server" GroupName="grupo17_8" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_8" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>
                            </tr> <%--PERGUNTA 17.1.8--%>

                            <tr>
        	                    <td align="center">17.9</td>
                                <td>A sinalização das pistas de trânsito de empilhadeiras e paleteiras está adequada?<asp:TextBox
                                        ID="txt17_9" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_9_Sim" runat="server" GroupName="grupo17_9" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_9_Nao" runat="server" GroupName="grupo17_9" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_9_NA" runat="server" GroupName="grupo17_9" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_9" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>
                            </tr> <%--PERGUNTA 17.1.9--%>

                            <tr>
        	                    <td align="center">17.10</td>
                                <td>O checklist diário de verificação de equipamento de movimentação de carga (empilhadeira/transpaleteira) está sendo realizado?<asp:TextBox
                                        ID="txt17_10" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_10_Sim" runat="server" GroupName="grupo17_10" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_10_Nao" runat="server" GroupName="grupo17_10" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_10_NA" runat="server" GroupName="grupo17_10" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_10" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>
                            </tr> <%--PERGUNTA 17.1.10--%>

                            <tr>
        	                    <td align="center">17.11</td>
                                <td>Existem cabos elétricos e/ou lógicos soltos ou fora de canaletas, ou ainda que comprometam a segurança?<asp:TextBox
                                        ID="txt17_11" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_11_Sim" runat="server" GroupName="grupo17_11" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_11_Nao" runat="server" GroupName="grupo17_11" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_11_NA" runat="server" GroupName="grupo17_11" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_11" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                 
                                <td></td>
                            </tr> <%--PERGUNTA 17.1.11--%>

                            <tr>
        	                    <td align="center">17.12</td>
                                <td>O controle para manutenção de rádio comunicador está atualizado?<asp:TextBox
                                        ID="txt17_12" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_12_Sim" runat="server" GroupName="grupo17_12" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_12_Nao" runat="server" GroupName="grupo17_12" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_12_NA" runat="server" GroupName="grupo17_12" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_12" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>                                
                                <td></td>                               
                            </tr> <%--PERGUNTA 17.1.12--%> 
                               

                            <tr>
        	                    <td align="center">17.13</td>
                                <td>A iluminação está adequada? Existem lâmpadas queimadas?<asp:TextBox
                                        ID="txt17_13" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_13_Sim" runat="server" GroupName="grupo17_13" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_13_Nao" runat="server" GroupName="grupo17_13" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_13_NA" runat="server" GroupName="grupo17_13" /></td>
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_13" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td></td>                                                                
                            </tr> <%--PERGUNTA 17.1.13--%> 

                            <tr>
        	                    <td align="center">17.14</td>
                                <td>Existem paredes sujas ou danificadas? <asp:TextBox
                                        ID="txt17_14" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_14_Sim" runat="server" GroupName="grupo17_14" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_14_Nao" runat="server" GroupName="grupo17_14" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_14_NA" runat="server" GroupName="grupo17_14" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_14" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td></td>                                                                                            
                            </tr> <%--PERGUNTA 17.1.14--%> 

                            <tr>
        	                    <td align="center">17.15</td>
                                <td>O ambiente geral do CD encontra-se limpo e organizado?<asp:TextBox
                                        ID="txt17_15" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_15_Sim" runat="server" GroupName="grupo17_15" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_15_Nao" runat="server" GroupName="grupo17_15" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_15_NA" runat="server" GroupName="grupo17_15" /></td>     
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_15" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_15" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td></td>                          
                            </tr> <%--PERGUNTA 17.1.15--%>

                            <tr>
        	                    <td align="center">17.16</td>
                                <td>Na conferência de produtos para trocas (Eletro) é conferido o lacre?<asp:TextBox
                                        ID="txt17_16" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_16_Sim" runat="server" GroupName="grupo17_16" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_16_Nao" runat="server" GroupName="grupo17_16" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_16_NA" runat="server" GroupName="grupo17_16" /></td>   
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_16" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_16" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                               <td></td>                             
                            </tr> <%--PERGUNTA 17.1.16--%>

                            <tr>
        	                    <td align="center">17.17</td>
                                <td>O controle de coletores e suas baterias (planilha) está sendo realizado adequadamente conforme POP?<asp:TextBox
                                        ID="txt17_17" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_17_Sim" runat="server" GroupName="grupo17_17" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_17_Nao" runat="server" GroupName="grupo17_17" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_17_NA" runat="server" GroupName="grupo17_17" /></td>         
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_17" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_17" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td></td>                      
                            </tr> <%--PERGUNTA 17.1.17--%>
                                                 
 

                            <tr>
        	                    <td align="center">17.18</td>
                                <td>As cancelas estão abaixadas em todas as portarias?<asp:TextBox
                                        ID="txt17_18" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_18_Sim" runat="server" GroupName="grupo17_18" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_18_Nao" runat="server" GroupName="grupo17_18" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_18_NA" runat="server" GroupName="grupo17_18" /></td>    
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_18" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_18" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td></td>                             
                            </tr> <%--PERGUNTA 17.1.18--%>

                            <tr>
        	                    <td align="center">17.19</td>
                                <td>O processo de verificação dos geradores está sendo seguido conforme POP? <asp:TextBox
                                        ID="txt17_19" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_19_Sim" runat="server" GroupName="grupo17_19" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_19_Nao" runat="server" GroupName="grupo17_19" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_19_NA" runat="server" GroupName="grupo17_19" /></td>  
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_19" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_19" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_19" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td></td>                             
                            </tr> <%--PERGUNTA 17.1.19--%>

                            <tr>
        	                    <td align="center">17.20</td>
                                <td>O processo de carregamento e controle das baterias HTs está sendo seguido conforme POP? <asp:TextBox
                                        ID="txt17_20" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_20_Sim" runat="server" GroupName="grupo17_20" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_20_Nao" runat="server" GroupName="grupo17_20" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_20_NA" runat="server" GroupName="grupo17_20" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_20" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_20" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_20" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td></td>                               
                            </tr> <%--PERGUNTA 17.1.20--%>

                            <tr>
        	                    <td align="center">17.21</td>
                                <td>O checklist de caminhão está sendo realizado conforme POP FRCLC-4.1?<asp:TextBox
                                        ID="txt17_21" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd17_21_Sim" runat="server" GroupName="grupo17_21" /></td>
                                <td align="center"><asp:RadioButton ID="rnd17_21_Nao" runat="server" GroupName="grupo17_21" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd17_21_NA" runat="server" GroupName="grupo17_21" /></td> 
                                <td align="center">
                                     <div class="fileEscondido">
                                        <asp:ImageButton ID="imgFoto17_21" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                        <asp:FileUpload ID="upFile17_21" runat="server"/>                                         
                                     </div>    
                                </td>
                                <td align="center">
                                    <div class="fileEscondido">
                                        <asp:ImageButton ID="btnSalvarFoto17_21" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />                                        
                                    </div>                                    
                                </td>
                                <td></td>                              
                            </tr> <%--PERGUNTA 17.1.21--%>
                                                                                                                                                                                                                                                                               
                            <thead>   
        	                      <tr>
                                      <td>
                                      </td>                                     
                                      <td align="right">
                                        <dx:ASPxButton ID="btnGrupo17" runat="server" Text="Enviar" AutoPostBack="True">
                                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />                                             
                                        </dx:ASPxButton>  
                                      </td>
                                  </tr>
                             </thead>                              
                           
                        </tbody>
                    </table>    
    </p>  
</asp:Panel>


<asp:CollapsiblePanelExtender     
    ID="CollapsiblePanelExtender1"   
    runat="server"  
    CollapseControlID="panTitle1"   
    Collapsed="true"   
    ExpandControlID="panTitle1"   
    TextLabelID="lblTitle1"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados1"   
    ScrollContents="false">  
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender2" 
    runat="server"
    CollapseControlID="panTitle2"   
    Collapsed="true"   
    ExpandControlID="panTitle2"   
    TextLabelID="lblTitle2"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados2"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender3" 
    runat="server"
    CollapseControlID="panTitle3"   
    Collapsed="true"   
    ExpandControlID="panTitle3"   
    TextLabelID="lblTitle3"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados3"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender4" 
    runat="server"
    CollapseControlID="panTitle4"   
    Collapsed="true"   
    ExpandControlID="panTitle4"   
    TextLabelID="lblTitle4"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados4"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender5" 
    runat="server"
    CollapseControlID="panTitle5"   
    Collapsed="true"   
    ExpandControlID="panTitle5"   
    TextLabelID="lblTitle5"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados5"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender6" 
    runat="server"
    CollapseControlID="panTitle6"   
    Collapsed="true"   
    ExpandControlID="panTitle6"   
    TextLabelID="lblTitle6"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados6"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender7" 
    runat="server"
    CollapseControlID="panTitle7"   
    Collapsed="true"   
    ExpandControlID="panTitle7"   
    TextLabelID="lblTitle7"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados7"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender11" 
    runat="server"
    CollapseControlID="panTitle11"   
    Collapsed="true"   
    ExpandControlID="panTitle11"   
    TextLabelID="lblTitle11"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados11"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender12" 
    runat="server"
    CollapseControlID="panTitle12"   
    Collapsed="true"   
    ExpandControlID="panTitle12"   
    TextLabelID="lblTitle12"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados12"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender13" 
    runat="server"
    CollapseControlID="panTitle13"   
    Collapsed="true"   
    ExpandControlID="panTitle13"   
    TextLabelID="lblTitle13"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados13"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender14" 
    runat="server"
    CollapseControlID="panTitle14"   
    Collapsed="true"   
    ExpandControlID="panTitle14"   
    TextLabelID="lblTitle14"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados14"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender15" 
    runat="server"
    CollapseControlID="panTitle15"   
    Collapsed="true"   
    ExpandControlID="panTitle15"   
    TextLabelID="lblTitle15"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados15"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender16" 
    runat="server"
    CollapseControlID="panTitle16"   
    Collapsed="true"   
    ExpandControlID="panTitle16"   
    TextLabelID="lblTitle16"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados16"   
    ScrollContents="false">
</asp:CollapsiblePanelExtender>
<asp:CollapsiblePanelExtender 
    ID="CollapsiblePanelExtender17" 
    runat="server"
    CollapseControlID="panTitle17"   
    Collapsed="true"   
    ExpandControlID="panTitle17"   
    TextLabelID="lblTitle17"   
    CollapsedText="Mostrar"   
    ExpandedText="Ocultar"   
    ExpandDirection="Vertical"   
    TargetControlID="panDados17"   
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


