<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Patrimonio/mPatrimonio.master" AutoEventWireup="false" CodeFile="AltExcPatr.aspx.vb" Inherits="MemberPages_Patrimonio_AltExcPatr" %>

<%@ Register assembly="DevExpress.Xpo.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Xpo" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h2>Atualiza Dados de Furtos</h2>

    <table border="1" style="background-color:white ">

        <tr>
            <td><strong>ID</strong></td>
            <td><strong>EAN</strong></td>
            <td><strong>Qtde</strong></td>
            <td><strong>Preço</strong></td>
            <td><strong>Total</strong></td>
            <td><strong>NomeFiscalAbprdagem</strong></td>
            <td><strong>Observação</strong></td>
            <td><strong>Dia</strong></td>
            <td><strong>NomeFiscalConstatou</strong></td>
            <td><strong>Hora</strong></td>
            <td><strong>NumeroCamara</strong></td>
            <td><strong>DVR</strong></td>
            <td><strong>Filial</strong></td>
            <td><strong>idReativaPreventiva</strong></td>
            <td><strong>DiaCadastro</strong></td>
            <td><strong>idFurtante</strong></td>
            <td><strong>idadeFurtante</strong></td>
            <td><strong>Atualização</strong></td>
        </tr>
        <asp:Repeater ID="rptClientes" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%# DataBinder.Eval(Container.DataItem, "ID")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "EAN")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Qtde")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Preco")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Total")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "NomeFiscalAbordagem")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Observacao")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Dia")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "NomeFiscalConstatou")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "Hora")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "NumCamera")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "DVR")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "idFilial")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "idReativaPreventiva")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "DiaCadastro")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "idFurtante")%></td>
                    <td><%# DataBinder.Eval(Container.DataItem, "idadeFurtante")%></td>
                    <td>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#DataBinder.Eval(Container, "DataItem.ID", "Atualiza.aspx?id={0}")%>'>Atualizar</asp:HyperLink>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        

    </table>

    <br />
    <br />

    <br />
    <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar" />

    <br />
    <br />

    <br />
    
</asp:Content>

