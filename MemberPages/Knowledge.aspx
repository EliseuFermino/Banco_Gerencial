<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Knowledge.aspx.vb" Inherits="MemberPages_Knowledge" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="98%">
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="Total de Informações: {0:n0}" FieldName="Informacao" SummaryType="Count" />
        </TotalSummary>
        <GroupSummary>
            <dx:ASPxSummaryItem DisplayFormat="Total: {0:n0}" FieldName="Informacao" SummaryType="Count" />
        </GroupSummary>
        <Columns>
            <dx:GridViewDataBinaryImageColumn Caption="Exemplo" FieldName="ImageExemplo" VisibleIndex="9" Width="450px">
            </dx:GridViewDataBinaryImageColumn>
            <dx:GridViewDataTextColumn FieldName="CategoriaDesc" VisibleIndex="0" Caption="Categoria" Width="65px" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle VerticalAlign="Top">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Banco" VisibleIndex="1" Width="70px">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle VerticalAlign="Top">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="TipoDados" VisibleIndex="2" Width="70px">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle VerticalAlign="Top">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Informacao" VisibleIndex="3" GroupIndex="4" SortIndex="4" SortOrder="Ascending">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle VerticalAlign="Top">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="descSchema" VisibleIndex="4" Width="70px">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle VerticalAlign="Top">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Nome" VisibleIndex="5" Width="150px">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle VerticalAlign="Top">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="descFilialCorp" VisibleIndex="6" GroupIndex="3" SortIndex="3" SortOrder="Ascending" Caption="Estabelecimento">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle VerticalAlign="Top">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SQL" VisibleIndex="7" Width="400px">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle VerticalAlign="Top">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Periodo" VisibleIndex="8" Width="50px" GroupIndex="1" SortIndex="1" SortOrder="Ascending">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle VerticalAlign="Top">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SP_Nome" VisibleIndex="10" Width="100px">
                <CellStyle VerticalAlign="Top">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SP_Filtro" VisibleIndex="11" Width="60px">
                <CellStyle VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Classe" VisibleIndex="12" Width="60px">
                <CellStyle VerticalAlign="Top" Wrap="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="14" Width="30px">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior ColumnResizeMode="Control" />
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFilterRowMenu="True" VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" ShowFooter="True" />
        <Styles>
            <GroupRow Font-Bold="True">
            </GroupRow>
            <GroupPanel Font-Bold="False">
            </GroupPanel>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerKnowledgeConnectionString %>" SelectCommand="SELECT [CategoriaDesc], [Banco], [TipoDados], [Informacao], [descSchema], [Nome], [ImageExemplo], [descFilialCorp], [SQL], [Periodo], [SP_Nome], [SP_Filtro], [Classe], [ID] FROM [tblKnowDados]"></asp:SqlDataSource>
</asp:Content>

