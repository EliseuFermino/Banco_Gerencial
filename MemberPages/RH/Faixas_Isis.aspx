<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Faixas_Isis.aspx.vb" Inherits="MemberPages_RH_Faixas_Isis" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divFilial {
            clear:both ;
            float: left
        }

        #divExcel {            
            float: left;
            margin-left: 20px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divFilial" style="padding: 4px 4px 4px 4px">
        <dx:ASPxComboBox ID="cboRegiao" runat="server" DataSourceID="dsListaRegiao" AutoPostBack="True" TextField="Regiao" Theme="SoftOrange" ValueField="Codigo"></dx:ASPxComboBox>
        <asp:SqlDataSource ID="dsListaRegiao" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="SELECT [Codigo], [Regiao] FROM RH.[vw_Lista_Regiao] ORDER BY Regiao"></asp:SqlDataSource>
    </div>

    <div id="divExcel">
        <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="grid" GuiaNome="Faixa Salarial" />
    </div>

    <div id="divDados" style="padding: 4px 4px 4px 4px">
    
    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsIsis" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" Width="100%" KeyFieldName="COD">
        <Columns>
            <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
            <dx:GridViewDataTextColumn FieldName="REGIAO" VisibleIndex="1" Width="100px" Visible="true" FixedStyle="Left">
                <Settings AllowAutoFilter="False" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ANO" VisibleIndex="2" FixedStyle="Left" Width="50px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="COD" VisibleIndex="3" FixedStyle="Left" Width="50px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NIVEL" VisibleIndex="4" FixedStyle="Left" Width="60px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="CARGO" VisibleIndex="5" FixedStyle="Left" Width="250px">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="QUEM_AUTORIZA" VisibleIndex="6" FixedStyle="Left" Width="150px">
                <Settings AutoFilterCondition="Contains" />
                <HeaderStyle BackColor="#009900" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="VALOR_MINIMO" VisibleIndex="7" FixedStyle="Left" Width="120px">
                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
                <HeaderStyle BackColor="Red" />
                <CellStyle>
                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Faixa_01" VisibleIndex="8">
                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Faixa_02" VisibleIndex="9">
                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Faixa_03" VisibleIndex="10">
                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Faixa_04" VisibleIndex="11">
                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Faixa_05" VisibleIndex="12">
                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
           
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings HorizontalScrollBarMode="Visible" VerticalScrollableHeight="450" VerticalScrollBarMode="Auto" ShowFilterRow="True" ShowGroupPanel="True" ShowFilterBar="Auto" />
        <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
        <Styles>
            <AlternatingRow BackColor="#EAEAEA">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="dsIsis" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="RH.uspBuscar_Faixas_Isis" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Regiao" SessionField="sREGIAO" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

        </div>
</asp:Content>

