<%@ Page Title="Crescimento Loja" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="viewCrescimentoLojas.aspx.vb" Inherits="MemberPages_Gerencial_viewCrescimentoLojas" %>

<%@ Register src="../../Controles/graficoCrescimento.ascx" tagname="graficoCrescimento" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
               
        html {            
                overflow-x:hidden;            
            }

        #moldura {
                width:1024px; 
                margin: 0 auto ; 
                padding-top: 3px;                     
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="moldura">
        <uc1:graficoCrescimento ID="graficoCrescimento1" runat="server" />
    </div>                   

</asp:Content>

