<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaComprador.ascx.vb" Inherits="wucListaComprador" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>




                <dxe:ASPxComboBox ID="cboComprador" runat="server" DataSourceID="dsComprador" 
                    TextField="DescCompradorAbrev" Theme="Mulberry" ValueField="idComprador" Caption="Comprador" ImageUrlField="Foto" ShowImageInEditBox="True" Width="230px" DropDownRows="10" >
                        <ItemImage Height="48px" Width="48px"></ItemImage>
                </dxe:ASPxComboBox>
                <asp:SqlDataSource ID="dsComprador" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                            
                    SelectCommand="SELECT [idComprador], [DescCompradorAbrev], Foto FROM [Cadastros].[tblCadComprador] WHERE ([Categoria] = @Categoria AND Ativos = 1) ORDER BY [DescCompradorAbrev]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Comercial" Name="Categoria" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
       