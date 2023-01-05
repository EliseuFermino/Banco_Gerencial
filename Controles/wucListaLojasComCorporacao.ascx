    <%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaLojasComCorporacao.ascx.vb" Inherits="wucListaLojasComCorporacao" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<style type="text/css" >
    
    #divFilial {
        float: left;
    }

    #divUnidade {
        float: left;
    }

</style>

<%--<asp:UpdatePanel ID="upFilial" runat="server">

    

    <ContentTemplate>--%>

        <div id="divFilial" >
            <dx:ASPxComboBox ID="cboFilial" runat="server" ValueType="System.Int32"  AutoPostBack="False" Caption="Filial" Theme="Mulberry" Width="230px" ImageUrlField="icone" ShowImageInEditBox="true" DropDownRows="25" >
                <ItemImage Height="24px" Width="24px"></ItemImage>
            </dx:ASPxComboBox>
        </div>

        <div id="divUnidade" >
            <dx:ASPxComboBox ID="cboCorporacao" runat="server" ValueType="System.Int32" AutoPostBack="True" TextField="descUnidade" ValueField="idUnidade" Caption="Tipo" Theme="Mulberry" DropDownRows="15" Width="115px"></dx:ASPxComboBox>
        </div>

        <asp:Label ID="lblError" runat="server" ForeColor="Red" Text="" Visible="True"  Font-Size="XX-Large" ></asp:Label>
<%--    </ContentTemplate>
</asp:UpdatePanel>--%>


 <%--       <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

                    <div id="divFilial" >
                        <dx:ASPxComboBox ID="cboFilial" runat="server" ValueType="System.Int32"  AutoPostBack="False" Caption="Filial" Theme="Mulberry" Width="230px" ImageUrlField="icone" ShowImageInEditBox="true" DropDownRows="25" >
                            <ItemImage Height="24px" Width="24px"></ItemImage>
                        </dx:ASPxComboBox>
                    </div>

                    <div id="divUnidade" >
                        <dx:ASPxComboBox ID="cboCorporacao" runat="server" ValueType="System.Int32" AutoPostBack="False" TextField="descUnidade" ValueField="idUnidade" Caption="Tipo" Theme="Mulberry" DropDownRows="15" Width="115px"></dx:ASPxComboBox>
                    </div>

                    <asp:Label ID="lblError" runat="server" ForeColor="Red" Text="" Visible="False"  Font-Size="XX-Large" ></asp:Label>


                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>--%>


