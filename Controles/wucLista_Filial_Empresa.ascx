<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucLista_Filial_Empresa.ascx.vb" Inherits="Controles_wucLista_Filial_Empresa" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<style type="text/css">

    #divFilialNew {
        clear:both;
        float: left;
        margin-left: 2px
    }

    #divOptEmpresa {
        float: left ;
        margin-left: 10px;
        margin-top: -2px;
    }

</style>


<dx:ASPxCallbackPanel ID="panelFilial" runat="server" Width="350px" ClientInstanceName="cbPanelFilial">
    <PanelCollection>
        <dx:PanelContent>

            <div id="divFilialNew">
                <dx:ASPxComboBox ID="cboFilial" runat="server" Theme="Mulberry" ValueType="System.Int32" DataSourceID="dsFilial" TextField="Descricao" ValueField="idFilial" AutoPostBack="true" AllowMouseWheel="False"  DropDownStyle="DropDown" ClientInstanceName="cboFilial" DropDownRows="20" >
                    <%--<ClientSideEvents SelectedIndexChanged="function(s, e) {
	cbPanelFilial.PerformCallback();
}" />--%>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="dsFilial" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SELECT idFilial , RTRIM(Descricao) AS Descricao FROM gerKnowledge.Filial.ufn_ListaFilial_ComEmpresa() ORDER BY [idFilial]"></asp:SqlDataSource>
            </div>

            <div id="divOptEmpresa">
                <dx:ASPxCheckBox ID="optEmpresa" runat="server" Text="Empresa" Theme="Mulberry" Layout="Flow" AutoPostBack="False" ClientInstanceName="optEmpresa" EnableTheming="True">
                    <%--<ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelFilial.PerformCallback();
}" />--%>
                    <ClientSideEvents CheckedChanged="function(s, e) {
	if (optEmpresa.GetChecked()) 
{
cboFilial.SetText(&quot;99 - Empresa&quot;);
cboFilial.SetEnabled(false);
}
else 
{
cboFilial.SetText(&quot;03 - S. Felicidade&quot;);
cboFilial.SetEnabled(true);
}
}" />
                </dx:ASPxCheckBox>
            </div>       

        </dx:PanelContent> 
          
    </PanelCollection>
</dx:ASPxCallbackPanel>




