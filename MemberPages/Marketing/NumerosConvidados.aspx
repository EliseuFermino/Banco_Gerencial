<%@ Page Title="Números Convidados" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="NumerosConvidados.aspx.vb" Inherits="MemberPages_Marketing_NumerosConvidados" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            float: left;           
            margin-left : 2px;
            margin-top : 2px;
        }

        #divTotalPorResponsavel {
            clear : both; 
            float: left;
            margin-left : 2px;
            margin-top : 2px;
        }

        #divTotalGeral {
            float: left;
            margin-left : 8px;
            margin-top : 2px;          
            text-align: center;
            border :1px solid gray;
            padding : 5px;
            font-weight: bold ;
            font-size :x-large;
            width: 213px;
        }

        #divTotalPorAcompanhante {            
            float: left;
            margin-left : 5px;
            margin-top : 2px;
            margin-left : -225px;
            margin-top : 130px;
        }

        #divTotalPorTipo {
            float: left;
            margin-left : -225px;
            margin-top : 262px;            
        }

        #divTotalPorFornecedor {
            float: left;
            margin-left : 7px;
            margin-top : 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divTotalPorResponsavel">
        <dx:ASPxGridView ID="grid_TotalPorResponsavel" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="nomeDistribuidor" Width="340px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalDeConvidados" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="percPart" SummaryType="Sum" />
            </TotalSummary>
            <Columns>
                <dx:GridViewDataTextColumn Caption="Responsável" FieldName="nomeDistribuidor" ReadOnly="True" VisibleIndex="1" Width="200px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total" FieldName="TotalDeConvidados" ReadOnly="True" ToolTip="Total de Convidados" VisibleIndex="2" Width="55px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ReadOnly="True" ToolTip="Percentual de Participação" VisibleIndex="3" Width="75px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" ShowTitlePanel="True" ShowFilterRow="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
            <SettingsText Title="Total de Convites por Responsável" />
            <Styles>
                <AlternatingRow BackColor="#F3F3F3">
                </AlternatingRow>
                <FocusedRow BackColor="Yellow" Font-Bold="True" ForeColor="Blue">
                </FocusedRow>
                <Footer Font-Bold="True">
                </Footer>
            </Styles>
        </dx:ASPxGridView>
        <uc1:wucBotaoExcel runat="server" ID="btnExcel_TotalPorResponsavel" CallGridViewID="grid_TotalPorResponsavel" GuiaNome="Total por Responsável" />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerMarketingConnectionString %>" SelectCommand="usp_TotalDeConvidadosPorDistribuidor" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>


    <div id="divTotalGeral">
        Total Geral de <br /> Convidados <br />
        <asp:Label ID="lblTotalConvidadosGeral" runat="server" Text="Aqui" ForeColor ="Blue" Font-Bold ="true" Font-Size ="XX-Large"></asp:Label>
    </div>

<div id="divTotalPorAcompanhante">
        <dx:ASPxGridView ID="grid_TotalPorAcompanhante" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="nomeDistribuidor" Width="225px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalAcompanhante" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="percPart" SummaryType="Sum" />
            </TotalSummary>
            <Columns>
                <dx:GridViewDataTextColumn Caption="Acompanhante" FieldName="Acompanhante" ReadOnly="True" VisibleIndex="0" Width="95px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total" FieldName="TotalAcompanhante" ReadOnly="True" ToolTip="Total Acompanhante" VisibleIndex="1" Width="60px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ReadOnly="True" ToolTip="Percentual de Participação" VisibleIndex="2" Width="70px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ColumnResizeMode="Control" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" ShowTitlePanel="True" />
            <SettingsText Title="Convidado com Acompanhante" />
            <Styles>
                <AlternatingRow BackColor="#F3F3F3">
                </AlternatingRow>
                <FocusedRow BackColor="Yellow" Font-Bold="True" ForeColor="Blue">
                </FocusedRow>
                <Footer Font-Bold="True">
                </Footer>
            </Styles>
        </dx:ASPxGridView>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:gerMarketingConnectionString %>" SelectCommand="usp_TotalDeConvidadosPorAcompanhante" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div id="divTotalPorTipo">
        <dx:ASPxGridView ID="grid_TotalPorTipo" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" KeyFieldName="nomeDistribuidor" Width="223px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalDeConvidados" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="percPart" SummaryType="Sum" />
            </TotalSummary>
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Categoria" FieldName="nomeDistribuidor" ReadOnly="True" VisibleIndex="1" Width="95px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total" FieldName="TotalDeConvidados" ReadOnly="True" ToolTip="Total de Convidados" VisibleIndex="2" Width="60px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ReadOnly="True" ToolTip="Percentual de Participação" VisibleIndex="3" Width="70px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ColumnResizeMode="Control" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="150" VerticalScrollBarMode="Auto" />
            <SettingsText Title="Total por Categoria" />
            <Styles>
                <AlternatingRow BackColor="#F3F3F3">
                </AlternatingRow>
                <FocusedRow BackColor="Yellow" Font-Bold="True" ForeColor="Blue">
                </FocusedRow>
                <Footer Font-Bold="True">
                </Footer>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:gerMarketingConnectionString %>" SelectCommand="usp_TotalDeConvidadosPorTipo" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>



    <div id="divTotalPorFornecedor">
        <dx:ASPxGridView ID="grid_TotaldeConvidadosPorFornecedor" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" KeyFieldName="nomeDistribuidor" Width="340px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalDeConvidados" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="percPart" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total de Fornecedores: {0:n0}" FieldName="nomeDistribuidor" SummaryType="Count" />
            </TotalSummary>
            <Columns>
                <dx:GridViewDataTextColumn Caption="Fornecedor" FieldName="nomeDistribuidor" ReadOnly="True" VisibleIndex="1" Width="200px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total" FieldName="TotalDeConvidados" ReadOnly="True" ToolTip="Total de Convidados" VisibleIndex="2" Width="55px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ReadOnly="True" ToolTip="Percentual de Participação" VisibleIndex="3" Width="75px">
                    <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" ShowTitlePanel="True" ShowFilterRow="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
            <SettingsText Title="Total de Convites por Fornecedor" />
            <Styles>
                <AlternatingRow BackColor="#F3F3F3">
                </AlternatingRow>
                <FocusedRow BackColor="Yellow" Font-Bold="True" ForeColor="Blue">
                </FocusedRow>
                <Footer Font-Bold="True">
                </Footer>
            </Styles>
        </dx:ASPxGridView>
        <uc1:wucBotaoExcel runat="server" ID="WucBotaoExcel1" CallGridViewID="grid_TotaldeConvidadosPorFornecedor" GuiaNome="Total por Fornecedor" />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:gerMarketingConnectionString %>" SelectCommand="usp_TotalDeConvidadosPorFornecedor" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>


</asp:Content>

