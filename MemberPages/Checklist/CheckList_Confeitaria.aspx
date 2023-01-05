<%@ Page Title="Check-List Confeitaria" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CheckList_Confeitaria.aspx.vb" Inherits="MemberPages_CheckList_Confeitaria
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
            
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_7" /> 
                      
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
            
            <dx:ASPxComboBox ID="cboProduto" runat="server" ValueType="System.Int32" Theme="Mulberry" Caption="Selecione um Produto" DataSourceID="dsProdutos" TextField="nomeProduto" ValueField="EAN" Width="400px">

                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	avgImagem.Refresh();
}" />

                <Columns>
                    <dx:ListBoxColumn FieldName="EAN" Width="70px">
                    </dx:ListBoxColumn>
                    <dx:ListBoxColumn Caption="Produto" FieldName="idProduto" Width="80px">
                    </dx:ListBoxColumn>
                    <dx:ListBoxColumn FieldName="nomeProduto" Width="300px">
                    </dx:ListBoxColumn>
                </Columns>

            </dx:ASPxComboBox>         

            <asp:SqlDataSource ID="dsProdutos" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="usp_Lista_Produtos_Checklist_Confeitaria" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

            <link rel="stylesheet" type="text/css" href="../../Styles/style.css" />
        

<asp:Panel ID="panTitle8" runat="server" CssClass="pnl_Azul" Width="890">  
    <div style="float:left;"> 1 - PRODUÇÃO - (1 pergunta) </div>  
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
                                <th align="center" scope="col" width="25px" >PPO</th>                                                                 
                            </tr>
                        </thead>

                        <tbody>

                            <tr>
        	                    <td align="center">8.1</td>
                                <td>O setor possui o receituário padrao no setor (fácil acesso) ?<asp:TextBox
                                        ID="txt8_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd8_1_Sim" runat="server" GroupName="grupo8_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd8_1_Nao" runat="server" GroupName="grupo8_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd8_1_NA" runat="server" GroupName="grupo8_1" /></td> 
                                                              
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDHF-01 (Hortifruti)">PPO</a>
</td>                                                            
                            </tr>  <%--PERGUNTA 8.1.1--%>  
                          

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
    <div style="float:left;"> 2 - DECORAÇÃO / COBERTURA - (2 perguntas, 2 à 3) </div>  
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
                                <th align="center" scope="col" width="25px" >PPO</th>                                                            
                            </tr>
                        </thead>

                        <tbody>

                            <tr>
        	                    <td align="center">9.1</td>
                                <td>2 - O produto foi montado (camadas/cobertura) conforme padronizado no receituário?<asp:TextBox
                                        ID="txt9_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd9_1_Sim" runat="server" GroupName="grupo9_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd9_1_Nao" runat="server" GroupName="grupo9_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd9_1_NA" runat="server" GroupName="grupo9_1" /></td> 
                                                               
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="NR15 - Atividades e Operações Insalubres">PPO</a>
</td>                                                              
                            </tr>  <%--PERGUNTA 9.1.1--%>  

                            <tr>
        	                    <td align="center">9.2</td>
                                <td>3 – Foi utilizado itens para decoração conforme o receituário (quantidade e ingredientes corretos)? Não possui itens de decoração que não foram descritos no receituário?<asp:TextBox
                                        ID="txt9_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd9_2_Sim" runat="server" GroupName="grupo9_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd9_2_Nao" runat="server" GroupName="grupo9_2" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd9_2_NA" runat="server" GroupName="grupo9_2" /></td> 
                                                               
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="ANVISA">PPO</a>
</td>                                                                                               
                            </tr>  <%--PERGUNTA 9.1.2--%> 

                           
                            
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
    <div style="float:left;"> 3 - EXPOSIÇÃO - (7 perguntas, 4 à 10) </div>  
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
        	                    <td align="center">3</td>
                                <td>4 – O peso médio da porção está de acordo com o receituário (variação 10%)?<asp:TextBox
                                        ID="txt10_1" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_1_Sim" runat="server" GroupName="grupo10_1" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_1_Nao" runat="server" GroupName="grupo10_1" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_1_NA" runat="server" GroupName="grupo10_1" /></td> 
                                                               
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                                               
                            </tr>  <%--PERGUNTA 3--%>  

                            <tr>
        	                    <td align="center">4</td>
                                <td>5 - A embalagem utilizada é a mesma padronizada no receituário?<asp:TextBox
                                        ID="txt10_2" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_2_Sim" runat="server" GroupName="grupo10_2" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_2_Nao" runat="server" GroupName="grupo10_2" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_2_NA" runat="server" GroupName="grupo10_2" /></td> 
                                                               
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                                                                             
                            </tr>  <%--PERGUNTA 4--%> 

                            <tr>
        	                    <td align="center">5</td>
                                <td>6 – O produto foi pesado no código correto?<asp:TextBox
                                        ID="txt10_3" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_3_Sim" runat="server" GroupName="grupo10_3" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_3_Nao" runat="server" GroupName="grupo10_3" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_3_NA" runat="server" GroupName="grupo10_3" /></td>
                                                              
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                                 
                            </tr>  <%--PERGUNTA 5--%>

                            <tr>
        	                    <td align="center">6</td>
                                <td>7 - O produto está exposto em temperatura adequada?<asp:TextBox
                                        ID="txt10_4" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_4_Sim" runat="server" GroupName="grupo10_4" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_4_Nao" runat="server" GroupName="grupo10_4" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_4_NA" runat="server" GroupName="grupo10_4" /></td> 
                                                               
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                              
                            </tr>  <%--PERGUNTA 6--%>

                            <tr>
        	                    <td align="center">7</td>
                                <td>8 – Foi descontado corretamente o peso da tara da embalagem?<asp:TextBox
                                        ID="txt10_5" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_5_Sim" runat="server" GroupName="grupo10_5" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_5_Nao" runat="server" GroupName="grupo10_5" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_5_NA" runat="server" GroupName="grupo10_5" /></td>
                                                             
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                               
                            </tr>  <%--PERGUNTA 7--%>

                            <tr>
        	                    <td align="center">8</td>
                                <td>9 – Os produtos expostos estão dentro do prazo de validade?<asp:TextBox
                                        ID="txt10_6" runat="server" Width="500" TextMode="MultiLine" Height="50"   ></asp:TextBox></td>
                                <td align="center"><asp:RadioButton ID="rnd10_6_Sim" runat="server" GroupName="grupo10_6" /></td>
                                <td align="center"><asp:RadioButton ID="rnd10_6_Nao" runat="server" GroupName="grupo10_6" /></td>                                
                                <td align="center"><asp:RadioButton ID="rnd10_6_NA" runat="server" GroupName="grupo10_6" /></td> 
                                                               
<td>
   <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="Procedimento PRO-CDEXP-01 (Expedição)">PPO</a>
</td>                               
                            </tr>  <%--PERGUNTA 8--%>   
                             
                            <tr>
        	                    <td align="center">9</td>
                                <td>Pergunta 10 <asp:TextBox
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
                            </tr>  <%--PERGUNTA 9--%> 
                             
                        
                                                                  
                            
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

<br />
<br />


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

                  

            <dx:ASPxVerticalGrid ID="avgImagem" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1" KeyFieldName="idProduto" Width="100%" ClientInstanceName="avgImagem">
                <Rows>
                    <dx:VerticalGridTextRow FieldName="idProduto" ReadOnly="True" VisibleIndex="1">
                        <RecordStyle HorizontalAlign="Left">
                        </RecordStyle>
                    </dx:VerticalGridTextRow>
                    <dx:VerticalGridTextRow FieldName="nomeProduto" VisibleIndex="2">
                        <RecordStyle HorizontalAlign="Left">
                        </RecordStyle>
                    </dx:VerticalGridTextRow>
                    <dx:VerticalGridTextRow FieldName="Custo" VisibleIndex="3">
                        <PropertiesTextEdit DisplayFormatString="{0:c2}">
                        </PropertiesTextEdit>
                        <RecordStyle HorizontalAlign="Left">
                        </RecordStyle>
                    </dx:VerticalGridTextRow>
                    <dx:VerticalGridTextRow FieldName="EAN" VisibleIndex="4">
                        <RecordStyle HorizontalAlign="Left">
                        </RecordStyle>
                    </dx:VerticalGridTextRow>
                    <dx:VerticalGridBinaryImageRow FieldName="imageProduto" VisibleIndex="0">
                        <PropertiesBinaryImage EnableServerResize="True" ImageHeight="540px" ImageWidth="740px">
                            <EditingSettings Enabled="True">
                            </EditingSettings>
                        </PropertiesBinaryImage>
                    </dx:VerticalGridBinaryImageRow>
                </Rows>
                <SettingsPager Mode="ShowPager">
                </SettingsPager>
            </dx:ASPxVerticalGrid>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="usp_Produtos_Checklist_Confeitaria" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="cboProduto" Name="EAN" Type="Int64" />
                    <%--<asp:SessionParameter Name="EAN" SessionField="sEAN" Type="Int32" />--%>
                </SelectParameters>
            </asp:SqlDataSource>                  

            <br />
            <dx:ASPxBinaryImage ID="bi" runat="server" EnableServerResize="True" EnableTheming="True" Height="480px" ImageSizeMode="FitProportional" ShowLoadingImage="True" Theme="Mulberry" Width="640px" OnInit="bi_Init">
                <EditingSettings Enabled="True">
                </EditingSettings>
            </dx:ASPxBinaryImage>

            <dx:ASPxButton ID="btn" runat="server" Text="Save" OnClick="btn_Click"></dx:ASPxButton>

           <asp:SqlDataSource ID="sds" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>"
			SelectCommand="SELECT [ID], [Picture] FROM [BinaryImagesTable] WHERE ([ID] = @ID)"
			UpdateCommand="UPDATE [BinaryImagesTable] SET [Picture] = @Picture WHERE [ID] = @ID" OnUpdating="sds_Updating">
			<SelectParameters>
				<asp:Parameter DefaultValue="1" Name="ID"   Type="Int32" />
			</SelectParameters>
			<UpdateParameters>
				<asp:Parameter DefaultValue="1" Name="ID" Type="Int32" />
				<asp:Parameter Name="Picture" Type="Object" />
			</UpdateParameters>
                
		</asp:SqlDataSource>


            <br />
            <dx:ASPxImageGallery ID="ASPxImageGallery1" runat="server">
                <SettingsFolder ImageCacheFolder="~/Thumb/" />
            </dx:ASPxImageGallery>
            <br />
            <br />


        <br />


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


