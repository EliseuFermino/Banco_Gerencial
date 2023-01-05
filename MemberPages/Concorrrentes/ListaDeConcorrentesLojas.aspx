<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ListaDeConcorrentesLojas.aspx.vb" Inherits="MemberPages_Concorrrentes_ListaDeConcorrentesLojas" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >       

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divSize {            
            float: left;           
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divDados">
        
        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="IE" Width="1000px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrNR1" SummaryType="Sum" />
            </TotalSummary>
            <Columns>
                <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" Width="80px" ShowClearFilterButton="True"/>
                <dx:GridViewDataTextColumn FieldName="nomeFantasia" VisibleIndex="1" Width="180px" Caption="Concorrente" FixedStyle="Left">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IE" VisibleIndex="2" Width="120px" Caption="Inscrição Estadual">
                    <Settings AllowAutoFilter="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="tipo" VisibleIndex="3" Width="100px" Caption="Tipo">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CEP" VisibleIndex="4" Width="80px" Caption="CEP">
                    <Settings AllowAutoFilter="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="cidade" VisibleIndex="5" Width="100px" Caption="Cidade">
                    <Settings AllowAutoFilter="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="bairro" VisibleIndex="6" Width="100px" Caption="Bairro">
                    <Settings AllowAutoFilter="True" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Rua" FieldName="rua" VisibleIndex="7" Width="200px">
                    <Settings AllowAutoFilter="True" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="CNPJ Principal" FieldName="CNPJ_Principal" VisibleIndex="8" Width="90px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrOri" VisibleIndex="9" Width="100px">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
            <SettingsPager PageSize="28">
            </SettingsPager>
            <Settings HorizontalScrollBarMode="Auto" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
            <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#F3F3F3">
                </AlternatingRow>
                <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                </FocusedRow>
                <Footer Font-Bold="True">
                </Footer>
            </Styles>
        </dx:ASPxGridView>                    
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerConcorConnectionString %>" SelectCommand="SELECT * FROM [vw_Consultar_Concorrente_por_Loja]">
                    </asp:SqlDataSource>

    </div>


</asp:Content>

