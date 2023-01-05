<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaGrupo_Subgrupo_work.ascx.vb" Inherits="Controles_wucListaGrupo_Subgrupo_work" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>




<style type="text/css">
  
#CheckSubgrupo {
	width: 20px;
	float: left;	
    margin-left: 130px;	
}
    
#legendaGrupo {
	width: 50px;
	float: left;
    color: GrayText;	
}

#legendaSubgrupo {
	width: 50px;
	float: left;
    margin-left: 5px;	
    color: GrayText;
}
   
#content1 {
	width: 50px;
	float: left;	
}
#content2 {
    width: 250px;
    float: left;
    margin-left: 20px;		
}

</style>

<dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" ClientInstanceName="cbPanel">
    <PanelCollection>
        <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                
                <div id="legendaGrupo">Grupo</div>
                <div id="content1">
                    <dx:ASPxComboBox ID="cboGrupo" runat="server" DataSourceID="dsDepto" TextField="GrupoDesc" ValueField="idGrupo" DropDownRows="15" >
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {cbPanel.PerformCallback();}" />
                    </dx:ASPxComboBox>
                </div>

                <div id="CheckSubgrupo">
                    <dx:ASPxCheckBox ID="chkSubgrupo" runat="server" Checked="true">
                        <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
                    </dx:ASPxCheckBox>
                </div>
                <div id="legendaSubgrupo">Subgrupo</div>
                <div id="content2">
                    <dx:ASPxComboBox ID="cboSubgrupo" runat="server" DataSourceID="dsSubGrupo" TextField="SubGrupoDesc" ValueField="idSubgrupo" Width="250px" DropDownRows="15" ></dx:ASPxComboBox>
                </div>   
                <br />

                <asp:SqlDataSource ID="dsDepto" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                SelectCommand="SELECT idGrupo, GrupoDesc FROM Cadastros.tblCategoriaLinha WHERE idCat = 7 ORDER BY Ordem">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSubGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SELECT idSubgrupo, SubGrupoDesc FROM Cadastros.tblCategoriaLinhaDet WHERE (idGrupo = @Grupo) ORDER BY Ordem">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="cboGrupo" Name="Grupo" PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>

        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>



    


