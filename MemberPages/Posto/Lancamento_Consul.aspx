<%@ Page Title="Posto - Lançamento" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Lancamento_Consul.aspx.vb" Inherits="MemberPages_Posto_Lancamento_Consul" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register Src="~/Controles/wucListaDia.ascx" TagPrefix="uc1" TagName="wucListaDia" %>






<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="../../css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        
        .auto-style5 {
            width: 126px;
        }

        .table {          
          border-collapse: collapse;
           width: 700px;
        }

        .td, .th {
          border: 1px solid #999;
          padding: 0.5rem;
          text-align: left;
        }

        .auto-style6 {
            width: 357px;
        }

        .navDate {
            margin: 10px;            
        }        

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSalvar" />
        </Triggers>
        <ContentTemplate>
            

        
    <div class="container">

       <nav class="navDate" >
           <dx:ASPxCalendar ID="cboDia" runat="server" Theme="SoftOrange" AutoPostBack="True" ClearButtonText="Limpar" FirstDayOfWeek="Monday" HighlightToday="False" TodayButtonText="Hoje"></dx:ASPxCalendar>
       </nav>

       <article>

           <div class="row">

           <div class="col-md-1">

                  <table class="table table-hover">
                    <thead>
                        <tr>
                          <th class="auto-style6">DESCRIÇÃO DA CONTA</th>
                          <th>QUANTIDADE</th>
                          <th>VLR. VENDA</th>
                        </tr>
                      </thead>
               <tr>
                   <td class="auto-style6">
                       <asp:Label ID="lbl_1" runat="server" Font-Size="Larger" Text="ALCOOL ETILICO HD CB SHELL"></asp:Label>
                   &nbsp;</td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txt_Qtde_11" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>
                       <dx:ASPxTextBox ID="txt_Venda_11" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>&nbsp;</td>
               </tr>

               <tr>
                   <td class="auto-style6">
                       <asp:Label ID="Label1" runat="server" Font-Size="Larger" Text="ALCOOL ADITIVADO SHELL"></asp:Label>
                   &nbsp;</td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txt_Qtde_14" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>
                       <dx:ASPxTextBox ID="txt_Venda_14" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>&nbsp;</td>
               </tr>

               <tr>
                   <td class="auto-style6">
                       <asp:Label ID="lbl_2" runat="server" Font-Size="Larger" Text="DIESEL B S10 SHELL EVOLUX ADITIVA"></asp:Label>
                   </td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txt_Qtde_641" runat="server" Font-Size="Large" Width="120px" DisplayFormatString="{0:n2}" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>
                       <dx:ASPxTextBox ID="txt_Venda_641" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>&nbsp;</td>
               </tr>
               <tr>
                   <td class="auto-style6">
                       <asp:Label ID="lbl_3" runat="server" Font-Size="Larger" Text="DIESEL B S500 SHELL"></asp:Label>
                   </td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txt_Qtde_12" runat="server" Font-Size="Large" Width="120px" DisplayFormatString="{0:n2}" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>
                       <dx:ASPxTextBox ID="txt_Venda_12" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>&nbsp;</td>
               </tr>
               <tr>
                   <td class="auto-style6">
                       <asp:Label ID="lbl_4" runat="server" Font-Size="Larger" Text="DIESEL B S500 SHELL EVOLUX ADITIV"></asp:Label>
                   </td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txt_Qtde_13" runat="server" Font-Size="Large" Width="120px" DisplayFormatString="{0:n2}" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>
                       <dx:ASPxTextBox ID="txt_Venda_13" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>&nbsp;</td>
               </tr>
               <tr>
                   <td class="auto-style6">
                       <asp:Label ID="lbl_5" runat="server" Font-Size="Larger" Text="GAS TIPO C SHELL"></asp:Label>
                   </td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txt_Qtde_9" runat="server" Font-Size="Large" Width="120px" DisplayFormatString="{0:n2}" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>
                       <dx:ASPxTextBox ID="txt_Venda_9" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>&nbsp;</td>
               </tr>
               <tr>
                   <td class="auto-style6">
                       <asp:Label ID="lbl_6" runat="server" Font-Size="Larger" Text="GAS VPOWER ADITIVADA"></asp:Label>
                   </td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txt_Qtde_10" runat="server" Font-Size="Large" Width="120px" DisplayFormatString="{0:n2}" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>
                       <dx:ASPxTextBox ID="txt_Venda_10" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>&nbsp;</td>
               </tr>
               <tr>
                   <td class="auto-style6">
                       <asp:Label ID="lbl_7" runat="server" Font-Size="Larger" Text="BEBIDAS"></asp:Label>
                   </td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txt_Qtde_26" runat="server" Font-Size="Large" Width="120px" DisplayFormatString="{0:n2}" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>
                       <dx:ASPxTextBox ID="txt_Venda_26" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>&nbsp;</td>
               </tr>
               <tr>
                   <td class="auto-style6">
                       <asp:Label ID="lbl_8" runat="server" Font-Size="Larger" Text="CIGARROS"></asp:Label>
                   </td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txt_Qtde_33" runat="server" Font-Size="Large" Width="120px" DisplayFormatString="{0:n2}" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>
                       <dx:ASPxTextBox ID="txt_Venda_33" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>&nbsp;</td>
               </tr>
               <tr>
                   <td class="auto-style6">
                       <asp:Label ID="lbl_10" runat="server" Font-Size="Larger" Text="FILTROS"></asp:Label>
                   </td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txt_Qtde_32" runat="server" Font-Size="Large" Width="120px" DisplayFormatString="{0:n2}" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>
                       <dx:ASPxTextBox ID="txt_Venda_32" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>&nbsp;</td>
               </tr>
               <tr>
                   <td class="auto-style6">
                       <asp:Label ID="lbl_11" runat="server" Font-Size="Larger" Text="LUBRIFICANTES"></asp:Label>
                   </td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txt_Qtde_3" runat="server" Font-Size="Large" Width="120px" DisplayFormatString="{0:n2}" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>
                       <dx:ASPxTextBox ID="txt_Venda_3" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>&nbsp;</td>
               </tr>
               <tr>
                   <td class="auto-style6">
                       <asp:Label ID="lbl_12" runat="server" Font-Size="Larger" Text="MINIMERCADO"></asp:Label>
                   </td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txt_Qtde_25" runat="server" Font-Size="Large" Width="120px" DisplayFormatString="{0:n2}" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>
                       <dx:ASPxTextBox ID="txt_Venda_25" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>&nbsp;</td>
               </tr>
               <tr>
                   <td class="auto-style6">
                       <asp:Label ID="lbl_13" runat="server" Font-Size="Larger" Text="SORVETES"></asp:Label>
                   </td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txt_Qtde_30" runat="server" Font-Size="Large" Width="120px" DisplayFormatString="{0:n2}" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>
                       <dx:ASPxTextBox ID="txt_Venda_30" runat="server" DisplayFormatString="{0:n2}" Font-Size="Large" Width="120px" HorizontalAlign="Right">
                       </dx:ASPxTextBox>
                   </td>
                   <td>&nbsp;</td>
               </tr>
               <tr>

                   <td class="auto-style6">
                       <asp:Label ID="Label2" runat="server" Font-Size="Larger" Text="NÚMERO DE CLIENTES" ToolTip="Número de Clientes do Dia"></asp:Label>
                   </td>
                   <td class="auto-style5">
                       <dx:ASPxTextBox ID="txtNumClientes" runat="server" Font-Size="Large" Width="120px" DisplayFormatString="{0:n2}" HorizontalAlign="Right" ToolTip="Número de Clientes que passaram na loja hoje.">
                       </dx:ASPxTextBox>
                   </td>

                   <td>&nbsp;</td>
               </tr>

               <%--<tr>
                   <td class="auto-style6">&nbsp;</td>
                   <td class="auto-style5">&nbsp;</td>
                   <td>&nbsp;</td>
                   <td>&nbsp;</td>
               </tr>--%>
           </table>
                  
           </div>
               </div>

           <div class="row">

                <div class="col-md-4">
                    <dx:ASPxButton ID="btnLimpar" runat="server" Text="Limpar Campos" Native="true"  CssClass="btn btn-primary btn-sm" Width="130px" AllowFocus="False" CausesValidation="False" UseSubmitBehavior="False"></dx:ASPxButton>
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                </div>

                <div class="col-md-4">
                    <dx:ASPxButton ID="btnExcluir" runat="server" Text="Excluir" Native="true"  CssClass="btn btn-danger btn-sm" Width="130px" AllowFocus="False" CausesValidation="False" UseSubmitBehavior="False"></dx:ASPxButton>
                </div>

                <div class="col-md-4">
                    <dx:ASPxButton ID="btnSalvar" runat="server" Text="Salvar" Native="true" CssClass="btn btn-success btn-sm" Width="130px" AllowFocus="False" CausesValidation="False" UseSubmitBehavior="False"></dx:ASPxButton>
                </div>

            </div>

       </article>        

   </div>
        </ContentTemplate>
    </asp:UpdatePanel>



</asp:Content>

