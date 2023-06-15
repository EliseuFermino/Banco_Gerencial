<%@ Page Title="" Language="VB" MasterPageFile="~/mobile.master" AutoEventWireup="false" CodeFile="DesignerPage.aspx.vb" Inherits="DesignerPage" %>

<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>

    <uc1:wuciListaMes runat="server" ID="wuciListaMes" AutoPostBack="true" />

    <asp:Label ID="lblText" runat="server" Text="Label"></asp:Label>
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="Dia" HeaderText="Dia" SortExpression="Dia" />
        <asp:BoundField DataField="nomeFilial" HeaderText="nomeFilial" SortExpression="nomeFilial" />
        <asp:BoundField DataField="idProduto" HeaderText="idProduto" SortExpression="idProduto" />
        <asp:BoundField DataField="descProdutoSecaoLista" HeaderText="descProdutoSecaoLista" SortExpression="descProdutoSecaoLista" />
        <asp:BoundField DataField="nomeProduto" HeaderText="nomeProduto" SortExpression="nomeProduto" />
        <asp:BoundField DataField="Volume" HeaderText="Volume" SortExpression="Volume" />
        <asp:BoundField DataField="vlrVenda" HeaderText="vlrVenda" SortExpression="vlrVenda" />
        <asp:BoundField DataField="VLRSELLOUT" HeaderText="VLRSELLOUT" SortExpression="VLRSELLOUT" />
        <asp:BoundField DataField="VLRCSTCOML" HeaderText="VLRCSTCOML" SortExpression="VLRCSTCOML" />
        <asp:BoundField DataField="Hora" HeaderText="Hora" SortExpression="Hora" />
        <asp:BoundField DataField="NUMPDV" HeaderText="NUMPDV" SortExpression="NUMPDV" />
        <asp:BoundField DataField="NUMCUPOM" HeaderText="NUMCUPOM" SortExpression="NUMCUPOM" />
        <asp:BoundField DataField="SEQCUPOM" HeaderText="SEQCUPOM" SortExpression="SEQCUPOM" />
        <asp:BoundField DataField="Campanha" HeaderText="Campanha" SortExpression="Campanha" />
        <asp:BoundField DataField="idFilial" HeaderText="idFilial" SortExpression="idFilial" />
        <asp:BoundField DataField="VALORTOTALVENDA" HeaderText="VALORTOTALVENDA" SortExpression="VALORTOTALVENDA" />
        <asp:BoundField DataField="VENDA_BRUTA" HeaderText="VENDA_BRUTA" SortExpression="VENDA_BRUTA" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString2 %>" SelectCommand="SELECT * FROM [tblVendaAcimaQtde]"></asp:SqlDataSource>
</asp:Content>

