<%@ Page Title="Usuários Desconhecidos" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="UsuariosDesconhecidos.aspx.vb" Inherits="MemberPages_Manutencao_UsuariosDesconhecidos" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="ApplicationId">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="ApplicationId" ReadOnly="True" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserId" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UserName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LoweredUserName" ReadOnly="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MobileAlias" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="IsAnonymous" VisibleIndex="5">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataDateColumn FieldName="LastActivityDate" VisibleIndex="6">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Depto" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SomenteLeitura" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idPessoaAdmin" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Local" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idFilial" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="IsLoja" VisibleIndex="12">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="idSchema" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Matricula" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsText EmptyDataRow="Nenhum Usuário Desconhecido" />
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" SelectCommand="uspFindUserUnknow" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


</asp:Content>

