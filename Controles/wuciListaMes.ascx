<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuciListaMes.ascx.vb" Inherits="wucMes" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<link href="../css/myCSS.css" rel="stylesheet" />

<style type="text/css">    

    #divMesInicial {
        clear: both;
        float:left;
        padding-left: 3px;    
        padding-top: 4px;      
    }

    #divMesFinal {       
        float:left;
        padding-left: 3px;
        margin-left: 5px;     
        padding-top: 4px;
        
    }

    #divAno {       
        float:left;
        padding-left: 5px;
        margin-left: 5px;     
        padding-top: 4px;
        
    }

    #divContainer{
        float:left;
        width: auto;
    }


</style>
<%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>



        <div id="divContainer" class="BGC_myBorder" aria-sort="none">        

            <div id="divMesInicial" >
                <dx:ASPxComboBox ID="cboMes" runat="server" EnableTheming="True" ClientInstanceName="cboMes"
                    Theme="Mulberry" Width="110px" DropDownRows="13"  
                    AutoPostBack="false" Caption="Mês" ValueType="System.Byte" CallbackPageSize="0">                 
                    <Items>
                        <dx:ListEditItem Text="Janeiro" Value="1" />
                        <dx:ListEditItem Text="Fevereiro" Value="2" />
                        <dx:ListEditItem Text="Março" Value="3" />
                        <dx:ListEditItem Text="Abril" Value="4" />
                        <dx:ListEditItem Text="Maio" Value="5" />
                        <dx:ListEditItem Text="Junho" Value="6" />
                        <dx:ListEditItem Text="Julho" Value="7" />
                        <dx:ListEditItem Text="Agosto" Value="8" />
                        <dx:ListEditItem Text="Setembro" Value="9" />
                        <dx:ListEditItem Text="Outubro" Value="10" />
                        <dx:ListEditItem Text="Novembro" Value="11" />
                        <dx:ListEditItem Text="Dezembro" Value="12" />
                        <dx:ListEditItem Text="Ano" Value="99" />
                    </Items>
                </dx:ASPxComboBox>    

            </div>

            <div id="divMesFinal"  >
                <dx:ASPxComboBox ID="cboMesFinal" runat="server" EnableTheming="True" 
                    Theme="Mulberry" Width="110px" DropDownRows="12" Visible="false" 
                    AutoPostBack="True" Caption="Mês Final" DataSourceID="SqlDataSource1" TextField="descMes" ValueField="mes" ValueType="System.Byte">
                    <CaptionSettings VerticalAlign="Middle" />
                </dx:ASPxComboBox>

            </div>

            <div id="divAno">
                <dx:ASPxCheckBox ID="chkAno" Text="Ano" ClientInstanceName="chkAno" Visible="true"  runat="server" CheckState="Unchecked" EnableTheming="True" Theme="DevEx">
                    <ClientSideEvents CheckedChanged="function(s, e) {
           if (chkAno.GetChecked(true)) {
         cboMes.SetEnabled(true);
}
else {
cboMes.SetEnabled(false);
}

}" />
                </dx:ASPxCheckBox>
            </div>

        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="SELECT [mes], [descMes] FROM [tblCadMes] WHERE ([mes] &lt; @mes) ORDER BY [mes]">
            <SelectParameters>
                <asp:Parameter DefaultValue="13" Name="mes" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>



 




 
