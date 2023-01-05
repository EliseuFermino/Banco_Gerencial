<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaSecaoGrupo.ascx.vb" Inherits="wucListaSecaoGrupo" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="wucListaSecao.ascx" tagname="wucListaSecao" tagprefix="uc1" %>

<style type ="text/css">
    #divGrupoCbo {
        float: left;
        margin-left: 5px;
    }
    #divGrupoDesc {
        float: left;
        margin-left: 60px;
    }
</style>

<div>
    <uc1:wucListaSecao ID="cboSecao" runat="server" />
</div>

<div id="divGrupoDesc">
    Grupo:
</div>
                                        
<div id="divGrupoCbo">
    <dx:ASPxComboBox ID="cboGrupo" runat="server" DataSourceID="SqlDataSource2" 
        EnableTheming="True" TextField="ListaReduzida" Theme="DevEx" 
        ValueField="idGrupo" Width="150px" HorizontalAlign="Left" 
        DropDownRows="20" Native="True">
    </dx:ASPxComboBox>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                    SelectCommand="Cadastros.uspCboGrupo" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="idSecao" SessionField="sSECAO" />
                    </SelectParameters>
      </asp:SqlDataSource>
 </div>      