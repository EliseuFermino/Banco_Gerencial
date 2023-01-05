<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaDeptoSecao.ascx.vb" Inherits="Controles_wucLista_DeptoSecao" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>


<style type="text/css">
    .auto-style1 {
        height: 26px;
    }
    .auto-style2 {
        height: 24px;
    }
</style>

    <script type="text/javascript">
        function OnDeptoChanged(cboDepto) {
            cmbSecao.PerformCallback(cmbSecao.GetSelectedItem().value.toString());
        }
    </script>

         <table>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lblDepto" runat="server" Text="Depto:"></asp:Label>
                </td>
                <td class="auto-style1">
                    <dxe:ASPxComboBox runat="server" ID="cboDepto" DropDownStyle="DropDownList"  DataSourceID="dsDepto"
                         TextField="listaDepto" ValueField="idDepto" ValueType="System.Byte" ClientInstanceName="cboDepto" Native="True"> 
                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnDeptoChanged(s); }" />                       
                    </dxe:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="lblSecao" runat="server" Text="Seção:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <dxe:ASPxComboBox runat="server" ID="cboSecao" ClientInstanceName="cmbSecao" OnCallback="cboSecao_CallBack" 
                        DropDownStyle="DropDownList" DataSourceID="dsSecao" TextField="ListaReduzida" ValueField="idSecao" ValueType="System.Int32" Native="True">                        
                    </dxe:ASPxComboBox>
                </td>
            </tr>
        </table>

   <asp:SqlDataSource ID="dsDepto" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>"    
    
        SelectCommand="SELECT [idDepto], [listaDepto] FROM [Cadastros].[tblCadDepto] WHERE idDepto<6 ORDER BY [idDepto]">
    </asp:SqlDataSource>

   <asp:SqlDataSource ID="dsSecao" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        
        
    
    
    SelectCommand="SELECT [idSecao], [ListaReduzida] FROM [Cadastros].[tblCadSecao] AS c WHERE ([idDepto] = @idDepto) AND idSecao<600 ORDER BY [idSecao]">
        <SelectParameters>
            <asp:ControlParameter ControlID="cboDepto" Name="idDepto" PropertyName="Value" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>


 






    



