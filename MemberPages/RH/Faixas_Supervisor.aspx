<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Faixas_Supervisor.aspx.vb" Inherits="MemberPages_RH_Faixas_Supervisor" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">

         #descRegional {
            margin-left: 5px;
            margin-top: 5px;
            clear: both;
            float: left;
            font-weight: bold
        }

        #divRegional {
            margin-left: 5px;
            margin-top: 5px;           
            float: left;
        }

         #divSindicato {
            margin-left: 15px;
            margin-top: 5px;         
            float: left;
            font-weight: bold
        }

        #divFilial {
            float: left;
            margin-left: 5px;
        }

        #divDados {
            clear: both;
            float: left;
            width: 99%;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="descRegional">
        Regional:
    </div>
    <div id="divRegional">
        <dx:ASPxComboBox ID="cboRegional" runat="server" DataSourceID="dsListRegional" EnableTheming="True" Theme="SoftOrange" TextField="Descricao" ValueField="CodRegional" AutoPostBack="True"></dx:ASPxComboBox>
        <asp:SqlDataSource ID="dsListRegional" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SELECT [CodRegional], [Descricao] FROM Cadastros.[tblCadFiliais_Regional] ORDER BY [Descricao]"></asp:SqlDataSource>
    </div>

    <div id="divSindicato">
        Sindicato:
    </div>

    <div id="divFilial" style="padding: 4px 4px 4px 4px">
        <dx:ASPxComboBox ID="cboRegiao" runat="server" DataSourceID="dsListaRegiao" AutoPostBack="True" TextField="Regiao" Theme="SoftOrange" ValueField="Codigo"></dx:ASPxComboBox>
        <asp:SqlDataSource ID="dsListaRegiao" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="RH.usp_BuscarRegiao_do_Regional" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="cboRegional" Name="idRegional" PropertyName="Value" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div id="divDados" style="padding: 4px 4px 4px 4px">
    
    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsIsis" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" Width="100%" KeyFieldName="COD">
        <Columns>
            <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
            <dx:GridViewDataTextColumn FieldName="REGIÃO" VisibleIndex="6" Width="120px" Visible="true" FixedStyle="Left">
                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                <HeaderStyle BackColor="#009900" />
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
            <dx:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="1" FixedStyle="Left" Width="150px">
                <Settings AutoFilterCondition="Contains" AllowAutoFilter="False" />
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
    <asp:SqlDataSource ID="dsIsis" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="RH.uspBuscar_Faixas_Regional" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="idRegional" SessionField="sREGIONAL" Type="Int16" />
            <asp:SessionParameter Name="idRegiao" SessionField="sREGIAO" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

        <br />
        <br />


        </div>
</asp:Content>

