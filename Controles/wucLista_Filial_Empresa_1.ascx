<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucLista_Filial_Empresa_1.ascx.vb" Inherits="Controles_wucLista_Filial_Empresa_1" %>
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


<dx:ASPxCallbackPanel ID="panelFilial_1" runat="server" Width="350px" ClientInstanceName="cbPanelFilial_1">
    <PanelCollection>
        <dx:PanelContent>

            <div id="divFilialNew">
                <dx:ASPxComboBox ID="cboFilial" runat="server" Theme="Mulberry" ValueType="System.Int32" DataSourceID="dsFilial" TextField="Descricao" ValueField="idFilial" AutoPostBack="true" AllowMouseWheel="False" Width="200px" DropDownHeight="300px" DropDownStyle="DropDown" ClientInstanceName="cboFilial_1" >
                    <%--<ClientSideEvents SelectedIndexChanged="function(s, e) {
	cbPanelFilial.PerformCallback();
}" />--%>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="dsFilial" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SELECT idFilial , RTRIM(Descricao) AS Descricao FROM gerKnowledge.Filial.ufn_ListaFilial_ComEmpresa() ORDER BY [idFilial]"></asp:SqlDataSource>
            </div>

            <div id="divOptEmpresa">
                <dx:ASPxCheckBox ID="optEmpresa" runat="server" Text="Empresa" Theme="Mulberry" Layout="Flow" AutoPostBack="False" ClientInstanceName="optEmpresa_1" EnableTheming="True">
                    <%--<ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelFilial.PerformCallback();
}" />--%>
                    <ClientSideEvents CheckedChanged="function(s, e) {
	if (optEmpresa_1.GetChecked()) 
{
cboFilial_1.SetText(&quot;99 - Empresa&quot;);
cboFilial_1.SetEnabled(false);
}
else 
{
cboFilial_1.SetText(&quot;03 - S. Felicidade&quot;);
cboFilial_1.SetEnabled(true);
}
}" />
                </dx:ASPxCheckBox>
            </div>       

        </dx:PanelContent> 
          
    </PanelCollection>
</dx:ASPxCallbackPanel>




