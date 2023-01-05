<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Patrimonio/mPatrimonio.master" AutoEventWireup="false" CodeFile="CadEtiqueta.aspx.vb" Inherits="MemberPages_Patrimonio_CadEtiqueta" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>



<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>



<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

    <style type ="text/css" >

        #divFilial {
            clear: both ;
            float : left;
            padding-top: 5px;
            margin-left: 5px;
        }


        #divDiaLegenda {   
            clear: both;         
            float : left;
            padding-top: 5px;
            margin-left: 2px;
            color : red ;
            font-size: 24px;
        }

        #divDia {            
            float : left;
            padding-top: 10px;
            margin-left: 5px;
            
        }

        #divBorda {
            clear: both ;
            float : left;
            margin-top: 8px;           
            border : 2px solid gray;
            height: 350px;
            width:650px;
            margin-left: 5px;
            background-color: rgba(128, 128, 128, 0.90)
        }

        #divSecao {
            clear: both ;
            float : left;
            padding-top: 5px;
            margin-left: 2px;
        }

        #divRuaLegenda {
            clear: both ;
            float : left;
                padding-top: 9px;
                margin-left: 2px;
        }

        #divRua {           
            float : left;
            margin-left : 5px;
            padding-top: 5px;
        }


        #divDescProduto {
                       float : left;
            margin-left : 5px;
            padding-top: 5px;
            color : blue ;
        }
               

        #divSalvar {
            clear: both ;
            float : left;
            padding-top : 7px;
             padding-left : 70px;

        }

        .Formatar {  
            clear: both;          
            float : left;
            margin-top: 10px;
            margin-bottom: 10px;
            margin-left: 10px;
            
        }

        .h-divider {
            margin-bottom: -5px;
            margin-top: 10px;
            height: 1px;
            width: 100%;
            border-top: 1px solid gray;
        }
    </style>

</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">


     

    <%--               <div class="col-md-3  ">
                    <dx:ASPxComboBox ID="cboArea" runat="server" Native="True" SelectedIndex="0" AutoPostBack="true" >
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Mercearia" Value="1" />
                            <dx:ListEditItem Text="Pereciveis" Value="2" />
                            <dx:ListEditItem Text="Bazar" Value="3" />
                            <dx:ListEditItem Text="Textil" Value="4" />
                            <dx:ListEditItem Text="Eletro" Value="5" />                   
                            <dx:ListEditItem Text="Gestão" Value="6" />  
                        </Items>
                    </dx:ASPxComboBox>
                </div>

                <div class="col-md-3  ">
                    <dx:ASPxComboBox ID="cboConta" runat="server" Native="True" SelectedIndex="0" AutoPostBack="true"  >
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Vendas" Value="1" />
                            <dx:ListEditItem Text="Margem" Value="2" />
                            <dx:ListEditItem Text="Despesas" Value="3" />
                            <dx:ListEditItem Text="Perdas" Value="4" />
                            <dx:ListEditItem Text="Financeiro" Value="5" />
                            <dx:ListEditItem Text="Estoque" Value="6" />
                            <dx:ListEditItem Text="Resultado Financeiro" Value="7" />
                            <dx:ListEditItem Text="Resultado Final" Value="8" />
                            <dx:ListEditItem Text="Clientes" Value="9" />
                            <dx:ListEditItem Text="Colaborador" Value="10" />
                        </Items>
                    </dx:ASPxComboBox>
                </div>

                <div class="col-md-3 ">                    
                    <dx:ASPxDateEdit ID="cboDia" Width="100px" runat="server" Theme="Default"  ></dx:ASPxDateEdit>                    
                </div> --%>
   
       <asp:UpdatePanel ID="UpdatePanel2" runat="server">
           <Triggers>
               <asp:PostBackTrigger ControlID ="btnSave" />
           </Triggers>
            <ContentTemplate>  
            
        <div id="divCabecalho" class="container bg-warning fundo2">         
            
            <div class="row">    
                <div class="col-md-5 "><h2 class="Negrito"><span class="glyphicon glyphicon-file"></span> Cadastro do Etiquetas</h2></div>            
                
            </div>

            <div class="row">    
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Filial</div>  
<%--                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Área</div>  
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Conta</div> 
                <div class="col-md-3 Negrito"><span class="glyphicon glyphicon-menu-down"></span> Data</div>    --%>                     
            </div> <%--Filial--%>
            
            <div class="row">
                
                <div class="col-md-3  ">                    
                    <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
                </div>

 <%--               <div class="col-md-3  ">
                    <dx:ASPxComboBox ID="cboArea" runat="server" Native="True" SelectedIndex="0" AutoPostBack="true" >
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Mercearia" Value="1" />
                            <dx:ListEditItem Text="Pereciveis" Value="2" />
                            <dx:ListEditItem Text="Bazar" Value="3" />
                            <dx:ListEditItem Text="Textil" Value="4" />
                            <dx:ListEditItem Text="Eletro" Value="5" />                   
                            <dx:ListEditItem Text="Gestão" Value="6" />  
                        </Items>
                    </dx:ASPxComboBox>
                </div>

                <div class="col-md-3  ">
                    <dx:ASPxComboBox ID="cboConta" runat="server" Native="True" SelectedIndex="0" AutoPostBack="true"  >
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Vendas" Value="1" />
                            <dx:ListEditItem Text="Margem" Value="2" />
                            <dx:ListEditItem Text="Despesas" Value="3" />
                            <dx:ListEditItem Text="Perdas" Value="4" />
                            <dx:ListEditItem Text="Financeiro" Value="5" />
                            <dx:ListEditItem Text="Estoque" Value="6" />
                            <dx:ListEditItem Text="Resultado Financeiro" Value="7" />
                            <dx:ListEditItem Text="Resultado Final" Value="8" />
                            <dx:ListEditItem Text="Clientes" Value="9" />
                            <dx:ListEditItem Text="Colaborador" Value="10" />
                        </Items>
                    </dx:ASPxComboBox>
                </div>

                <div class="col-md-3 ">                    
                    <dx:ASPxDateEdit ID="cboDia" Width="100px" runat="server" Theme="Default"  ></dx:ASPxDateEdit>                    
                </div> --%>


                
            </div> <%--Area--%>


        </div> <%--Bloco de Cima--%>

        <div class="container divBordas fundo1">
            <div class="row">
                <div class="col-md-1 ">
                    
                    <dx:ASPxButton ID="btnNovo" runat="server" Text="Novo" CssClass="btn btn-success btn-sm" Native="true" Width="85" TabIndex="97"  ></dx:ASPxButton>
               
                    <dx:ASPxButton ID="btnEdit" runat="server" Text="Editar" CssClass="btn btn-primary btn-sm" Native="true" Width="85" Visible="false"  ></dx:ASPxButton>
                
                    <dx:ASPxButton ID="btnDelete" runat="server" Text="Excluir" CssClass="btn btn-danger btn-sm" Native="true" Width="85" Visible="false" ></dx:ASPxButton>                          
                    
                    
                </div>

                <div class="col-md-3 ">
                    <dx:ASPxCheckBox ID="chkFixarDados" runat="server" Text="Fixar Dados Principais"></dx:ASPxCheckBox>
                </div>

            </div>
        </div> <%--Botoes--%>

        <div class="container divBordas fundo">
           
             <hr class="h-divider"/> 

            
            <div class="row">

                <div class="col-md-6">
                    <h4 class="Negrito"><span class="glyphicon glyphicon-user"></span> Nome Fiscal que Constatou</h4>
                </div>
            </div> 

            <div class="row"> 
                <div class="col-md-6">
                    <asp:TextBox ID="txtNomeFiscalConstatou" runat="server" MaxLength="50" Width="250" AutoPostBack="False" TabIndex="4" ></asp:TextBox>
                </div>
            </div>
             <hr class="h-divider"/> 

            <div class="row">
                <div class="col-md-7">
                    <h4 class="Negrito"><span class="glyphicon glyphicon-pencil"></span> Natureza da Abordagem</h4>
                </div>                 
                                             
            </div> 

            <div class="row">
                <div class="col-md-2">
                    <asp:RadioButton ID="rndGargalo" runat="server" Text="&nbsp;&nbsp;Gargalo" Checked="true" GroupName="myGroup" TabIndex="5" />
                </div>
                <div class="col-md-2">
                    <asp:RadioButton ID="rndLabel" runat="server" Text="&nbsp;&nbsp;Label" Checked="false" GroupName="myGroup" TabIndex="6" />
                </div>
                <div class="col-md-3">
                    <asp:RadioButton ID="rndEtiquetaRigida" runat="server" Text="&nbsp;&nbsp;Etiqueta Rigida" Checked="false" GroupName="myGroup" TabIndex="7" />
                </div>
                <div class="col-md-2">
                     <asp:RadioButton ID="rndCasulo" runat="server" Text="&nbsp;&nbsp;Casulo" Checked="false" GroupName="myGroup" TabIndex="7" />
                </div>
                <div class="col-md-3">
                     <asp:RadioButton ID="rndEtiquetaRigidaChinelo" runat="server" Text="&nbsp;&nbsp;Etiqueta Rigida Chinelo" Checked="false" GroupName="myGroup" TabIndex="7" />
                </div>

            </div>

             <hr class="h-divider"/> 
            
            
            
            
            <div class="row">                          
                <div class="col-md-3 ">                    
                    <h4 class="Negrito"><span class="glyphicon glyphicon-calendar"></span> Dia</h4>
                </div>
                <div class="col-md-3 ">                    
                    <h4 class="Negrito"><span class="glyphicon glyphicon-time"></span> Hora</h4>
                </div> 
                                             
            </div> <%--Causa 1--%>

            <div class="row">                          
                <div class="col-md-3 ">                    
                    <dx:ASPxDateEdit ID="cboDia_Inicio" runat="server" Font-Size="Medium" TabIndex="7" Theme="Metropolis" Width="120px" AutoPostBack="True" UseMaskBehavior="True" AllowUserInput="False"></dx:ASPxDateEdit>      
                </div>
                <div class="col-md-3 ">                    
                    <dx:ASPxTimeEdit ID="txtHora" runat="server" TabIndex="8" Font-Size="Medium" Width="70px" AutoPostBack="True"></dx:ASPxTimeEdit>                   
                </div>   
 
                <div class="col-md-3">
                    
                </div>                  
                
                           
            </div> <%--Causa 1--%>  
             <hr class="h-divider"/> 

            
            <div class="row">                          
                <div class="col-md-8 ">                    
                    <h4 class="Negrito"><span class="glyphicon glyphicon-pencil"></span> Observação</h4>
                </div>                
            </div> <%--Causa 1--%>

            <div class="row">                          
                <div class="col-md-8 ">                    
                    <asp:TextBox ID="txt_Observacao" TextMode="MultiLine" runat="server" Width="700px" Height="50px" placeholder="Se tem algum Observação, descreva aqui..." TabIndex="11"></asp:TextBox>
                </div>           
            </div> <%--Causa 1--%>                        
                                   

       </div>

        <div class="container divBordas fundo3">
            <div class="row">
                <div class="col-md-6 ">
                    <dx:ASPxButton ID="btnCancel" runat="server" Text="Cancelar" CssClass="btn btn-danger btn-sm" Native="true" Width="85" Enabled="false" TabIndex="12" CausesValidation="False"  ></dx:ASPxButton>
               
                    <dx:ASPxButton ID="btnSave" runat="server" Text="Salvar" CssClass="btn btn-success btn-sm" Native="true" Width="85" Enabled="false" TabIndex="13" CausesValidation="False" ></dx:ASPxButton>
                                    
                </div>
            </div>
        </div> <%--Botoes--%>

    <asp:Label ID="lblError" runat="server" Text="" Font-Size="30px" TabIndex="98"></asp:Label>

            </ContentTemplate>
        </asp:UpdatePanel>

    </form>

</div>

</asp:Content>

