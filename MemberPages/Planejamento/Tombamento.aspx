<%@ Page Title="Tombamento do Orçamento" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Tombamento.aspx.vb" Inherits="MemberPages_Planejamento_Tombamento" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="~/Controles/wucListaGrupo_Subgrupo.ascx" TagPrefix="uc1" TagName="wucListaGrupo_Subgrupo" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaCategoriaLinha.ascx" TagPrefix="uc1" TagName="wucListaCategoriaLinha" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divPrimeiroPasso {
            clear: both;
            float: left;
            width: 510px;
            height: 300px;
            border:1px solid gray;
            margin: 5px;   
            border-radius: 3px;              
        }

        #divSegundoPasso {
            float: left;
            width: 630px;
            height: 340px;
            border:1px solid gray;
            margin: 5px;   
            border-radius: 3px;        
        }

        #divTerceiroPasso {
            float: left;
            width: 400px;
            height: 300px;
            border:1px solid gray;
            margin: 5px;   
            border-radius: 3px;        
        }



  

        .auto-style3 {
            font-size: medium;
        }



  

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div style="float:left; padding-left: 3px; margin-left:3px; margin-top: 2px">
        Ano
    </div>

    <div style="float:left; padding-left: 3px">
        <dx:ASPxComboBox ID="cboAno" runat="server" ValueType="System.Int32" Native="True" Width="60px">
            <Items>
                <dx:ListEditItem Text="2020" Value="2020" />
                <dx:ListEditItem Text="2021" Value="2021" />
                 <dx:ListEditItem Text="2022" Value="2022" />
                 <dx:ListEditItem Text="2023" Value="2023" />
            </Items>
        </dx:ASPxComboBox>
    </div>

    <div id="divPrimeiroPasso">

        <div style="border:1px solid gray; margin: 3px; text-align :center ; font-size: 20px; border-radius: 3px; background-color:green; color:white ">
            BASE LOJA
        <span class="auto-style3"><em>(não atualiza venda) </em></span>
        </div>        

        <div style="text-align :center ; border: 1px solid gray; height: 55px; margin: 3px; border-radius: 3px; background-color:#fcc4c4 ">

            <div style="float :left; text-align :left ; width:580px ; font-size: 16px; font-weight:bold; margin-left: 3px">
                 Tombar Loja no Definitivo - Todas as filiais - Todas as contas - P1
            </div>
           

            <div style="clear:both; float: left; padding-top: 12px;">
                <dx:ASPxCheckBox ID="chkHabilitarPrimeiroPasso" runat="server" Checked="false" Text="Habilitar botão Tombar" Theme="DevEx" ToolTip="Clique aqui para habilitar o botão tombar" AutoPostBack="True"></dx:ASPxCheckBox>
            </div>

            <div style="float :left ; margin-left : 10px; padding-top: 8px">
                <asp:Button ID="btnTombar_PrimeiroPasso" runat="server" Text="Tombar" Enabled="false" />
            </div>

            
        </div>

        <div style="text-align :center ; border: 1px solid gray; height: 75px; margin: 3px; border-radius: 3px ">

            <div style="float :left; text-align :left ; width: 580px ; font-size: 16px; font-weight:bold; margin-left: 3px">
                 Tombar Loja no Definitivo - Todas as filiais - Grupo unico - P2
            </div>

            <div>
                <uc1:wucListaCategoriaLinha runat="server" ID="cboGrupoP2" />   
            </div>
           

            <div style="clear:both; float: left; ">
                <dx:ASPxCheckBox ID="chkP2" runat="server" Checked="false" Text="Habilitar botão Tombar" Theme="DevEx" ToolTip="Clique aqui para habilitar o botão tombar" AutoPostBack="True"></dx:ASPxCheckBox>
            </div>

            <div style="float :left ; margin-left : 10px; margin-top :-3px">
                <asp:Button ID="btnP2" runat="server" Text="Tombar" Enabled="false" />
            </div>

            
        </div>

        <div style="text-align :center ; border: 1px solid gray; height: 105px; margin: 3px; border-radius: 3px ">

            <div style="float :left; text-align :left ; width: 580px ; font-size: 16px; font-weight:bold; margin-left: 3px">
                 Tombar Loja no Definitivo - Filial única - Grupo único - P3
            </div>

            <div style="float :left; padding-top:5px; margin-left : 3px;">
                <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilialP3" Visible_cboCorporacao="false" AutoPostBack="false" />
            </div>

            <div style="float :left;">
                <uc1:wucListaGrupo_Subgrupo runat="server" ID="cboGrupoP3" Visible_LabelSubGrupo="false" Visible_cboSubgrupo="false"  />
            </div>
           

            <div style="clear:both; float: left; ">
                <dx:ASPxCheckBox ID="chkP3" runat="server" Checked="false" Text="Habilitar botão Tombar" Theme="DevEx" ToolTip="Clique aqui para habilitar o botão tombar" AutoPostBack="True"></dx:ASPxCheckBox>
            </div>

            <div style="float :left ; margin-left : 10px; margin-top :-3px">
                <asp:Button ID="btnP3" runat="server" Text="Tombar" Enabled="false" />
            </div>

            
        </div>

    </div>

    <div id="divSegundoPasso">

        <div style="border:1px solid gray; margin: 3px; text-align :center ; font-size: 20px; border-radius: 3px; background-color:cornflowerblue ; color:white ">
            BASE ADMINISTRAÇÃO
        </div>        

        <div style="text-align :center ; border: 1px solid gray; height: 75px; margin: 3px; border-radius: 3px ">

            <div style="float :left; text-align :left ; width: 580px ; font-size: 16px; font-weight:bold; margin-left: 3px">
                 Tombar Adm no Definitivo - Todas as filiais - Grupo unico - P5
            </div>

            <div>
                <uc1:wucListaCategoriaLinha runat="server" ID="cboGrupoP5" />               
            </div>
           

            <div style="clear:both; float: left; ">
                <dx:ASPxCheckBox ID="chkP5" runat="server" Checked="false" Text="Habilitar botão Tombar" Theme="DevEx" ToolTip="Clique aqui para habilitar o botão tombar" AutoPostBack="True"></dx:ASPxCheckBox>
            </div>

            <div style="float :left ; margin-left : 10px; margin-top :-3px">
                <asp:Button ID="btnP5" runat="server" Text="Tombar" Enabled="false" />
            </div>
            
        </div>

        <div style="text-align :center ; border: 1px solid gray; height: 105px; margin: 3px; border-radius: 3px ">

            <div style="float :left; text-align :left ; width: 580px ; font-size: 16px; font-weight:bold; margin-left: 3px">
                 Tombar Adm no Definitivo - Filial única - Grupo único - P6
            </div>

            <div style="float :left; padding-top:5px; margin-left : 3px;">
                <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilialP6" Visible_cboCorporacao="false" AutoPostBack="false" />
            </div>

            <div style="float :left;">                
                <uc1:wucListaCategoriaLinha runat="server" ID="cboGrupoP6" />
            </div>
           

            <div style="clear:both; float: left; ">
                <dx:ASPxCheckBox ID="chkP6" runat="server" Checked="false" Text="Habilitar botão Tombar" Theme="DevEx" ToolTip="Clique aqui para habilitar o botão tombar" AutoPostBack="True"></dx:ASPxCheckBox>
            </div>

            <div style="float :left ; margin-left : 10px; margin-top :-3px">
                <asp:Button ID="btnP6" runat="server" Text="Tombar" Enabled="false" />
            </div>
            
        </div>



        <div style="text-align :center ; border: 1px solid gray; height: 105px; margin: 3px; border-radius: 3px; background-color:#dae7ff">

            <div style="float :left; text-align :left ; width: 580px ; font-size: 16px; font-weight:bold; margin-left: 3px">
                 Tombar Adm no Definitivo - Todas Filial - Subgrupo único - P9
            </div>

            <div style="float :left;">                
                <uc1:wucListaGrupo_Subgrupo runat="server" ID="cboGrupoP9" Visible_LabelSubGrupo="true" Visible_cboSubgrupo="true"  /> 
            </div>
           

            <div style="clear:both; float: left; ">
                <dx:ASPxCheckBox ID="chkP9" runat="server" Checked="false" Text="Habilitar botão Tombar" Theme="DevEx" ToolTip="Clique aqui para habilitar o botão tombar" AutoPostBack="True"></dx:ASPxCheckBox>
            </div>

            <div style="float :left ; margin-left : 10px; margin-top :-3px">
                <asp:Button ID="btnP9" runat="server" Text="Tombar" Enabled="false" />
            </div>
            
        </div>

    </div>    

    <div id="divTerceiroPasso">

        <div style="border:1px solid gray; margin: 3px; text-align :center ; font-size: 20px; border-radius: 3px; background-color:orange ; color:white ">
            BASE APOIO
        </div>        

        <div style="text-align :center ; border: 1px solid gray; height: 75px; margin: 3px; border-radius: 3px ">

            <div style="float :left; text-align :left ; width: 580px ; font-size: 16px; font-weight:bold; margin-left: 3px">
                 Tombar Apoio no Definitivo - Grupo unico - P7
            </div>

            <div>                
                <uc1:wucListaCategoriaLinha runat="server" ID="cboGrupoP7" />
            </div>
           

            <div style="clear:both; float: left; ">
                <dx:ASPxCheckBox ID="chkP7" runat="server" Checked="false" Text="Habilitar botão Tombar" Theme="DevEx" ToolTip="Clique aqui para habilitar o botão tombar" AutoPostBack="True"></dx:ASPxCheckBox>
            </div>

            <div style="float :left ; margin-left : 10px; margin-top :-3px">
                <asp:Button ID="btnP7" runat="server" Text="Tombar" Enabled="false" />
            </div>
            
        </div>

        <div style="text-align :center ; border: 1px solid gray; height: 43px; margin: 3px; border-radius: 3px ">

            <div style="float :left; text-align :left ; width: 580px ; font-size: 16px; font-weight:bold; margin-left: 3px">
                 Tombar Apoio no Definitivo - Todas contas - P8
            </div>           

            <div style="clear:both; float: left; ">
                <dx:ASPxCheckBox ID="chkP8" runat="server" Checked="false" Text="Habilitar botão Tombar" Theme="DevEx" ToolTip="Clique aqui para habilitar o botão tombar" AutoPostBack="True"></dx:ASPxCheckBox>
            </div>

            <div style="float :left ; margin-left : 10px; margin-top :-3px">
                <asp:Button ID="btnP8" runat="server" Text="Tombar" Enabled="false" />
            </div>
            
        </div>




    

    </div>    

</asp:Content>

