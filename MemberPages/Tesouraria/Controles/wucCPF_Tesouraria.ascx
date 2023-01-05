<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucCPF_Tesouraria.ascx.vb" Inherits="MemberPages_Tesouraria_Controles_wucCPF_Tesouraria" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<style type="text/css" >

    #divTitulo {
        float: left ;
        margin-left: 2px;
    }

    #divDados {
        float: left ;
        margin-left: 2px;
    }

</style>

<div id="divTitulo">
       CPF:
</div>

<div id="divDados">
    <dx:ASPxComboBox ID="cboCPF" runat="server" DataSourceID="SqlDataSource1" AutoPostBack="True" DropDownRows="15" HorizontalAlign="Left" IncrementalFilteringMode="Contains" ValueField="CPF" Width="200px">
        <Columns>
            <dx:ListBoxColumn FieldName="CPF" Width="90px" />
            <dx:ListBoxColumn FieldName="NomeCompleto" Width="300px" />
        </Columns>
    </dx:ASPxComboBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerTesourariaConnectionString %>" SelectCommand="usp_BuscarCPF_Nome" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
