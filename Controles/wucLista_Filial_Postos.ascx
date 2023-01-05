<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucLista_Filial_Postos.ascx.vb" Inherits="Controles_wucLista_Filial_Postos" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<style type="text/css">

    #divFilialNew {
        clear:both;
        float: left;
        margin-left: 2px
    }

    #divOptEmpresa {
        float: left;
        margin-left: 10px;
        margin-top: -2px;
        height: 14px;
    }

</style>


<dx:ASPxCallbackPanel ID="panelFilial" runat="server" Width="350px" ClientInstanceName="cbPanelFilial">
    <PanelCollection>
        <dx:PanelContent>

            <div id="divFilialNew">
                <dx:ASPxComboBox ID="cboFilial" runat="server" Theme="Mulberry" ValueType="System.Int32" DataSourceID="dsFilial" TextField="Descricao" ValueField="idFilial" AutoPostBack="true" AllowMouseWheel="False" Width="200px" DropDownStyle="DropDown" ClientInstanceName="cboFilial" ImageUrlField="icone" ShowImageInEditBox="true" DropDownRows="25"  >
                    <ItemImage Height="24px" Width="24px"></ItemImage>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="dsFilial" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SELECT idFilial , RTRIM(Descricao) AS Descricao, icone FROM gerKnowledge.Filial.ufn_ListaFilial_Postos() ORDER BY [idFilial]"></asp:SqlDataSource>
            </div>

        </dx:PanelContent> 
          
    </PanelCollection>
</dx:ASPxCallbackPanel>




