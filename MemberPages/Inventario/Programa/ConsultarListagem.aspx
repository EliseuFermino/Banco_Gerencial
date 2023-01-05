<%@ Page Title="Consultar Listagem" Language="VB" MasterPageFile="~/MemberPages/Inventario/Programa/SiteInventario.master" AutoEventWireup="false" CodeFile="ConsultarListagem.aspx.vb" Inherits="MemberPages_Inventario_Programa_ConsultarListagem" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" Width="950px" Theme="DevEx" 
    KeyFieldName="Lote">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="AREA" VisibleIndex="0" Width="30px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="RUA" VisibleIndex="1" Width="30px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="NRO" VisibleIndex="2" Width="30px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="APT" VisibleIndex="3" Width="30px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="PRODUTO" VisibleIndex="4" Width="50px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="DESCRICAO" VisibleIndex="5" Width="400px">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="EMBALAG" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="CODEAN" VisibleIndex="7">
        </dx:GridViewDataTextColumn>        
        <dx:GridViewDataTextColumn FieldName="DV" VisibleIndex="9">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="10">
        </dx:GridViewDataTextColumn>
    </Columns>
        <Styles>
	        <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
        </Styles>

    <SettingsPager PageSize="18">
    </SettingsPager>
    <Settings ShowFilterRow="True" ShowTitlePanel="True" 
        VerticalScrollableHeight="450" />
    <SettingsText Title="Consulta da listagem por Lote ou Produto" />
</dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerInvConnectionString %>" 
        SelectCommand="SELECT [AREA], [RUA], [NRO], [APT], [PRODUTO], [DESCRICAO], [EMBALAG], [CODEAN], [QUANTIDADE], [DV], [Lote] FROM [Programa].[ListaLuiza]">
    </asp:SqlDataSource>

    <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="ASPxGridView1" />

</asp:Content>

