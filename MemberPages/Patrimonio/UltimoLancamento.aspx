<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Patrimonio/mPatrimonio.master" AutoEventWireup="false" CodeFile="UltimoLancamento.aspx.vb" Inherits="MemberPages_Patrimonio_UltimoLancamento" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="margin-left: 8px">

    
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Descricao" Width="350px">
        <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
        <Columns>
            <dx:GridViewDataTextColumn Caption="Filial" FieldName="Descricao" VisibleIndex="0" Width="160px">
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="Último Dia &lt;br&gt; Cadastro" FieldName="UltimoDiaCadastro" ReadOnly="True" VisibleIndex="1" Width="80px">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="Dias sem &lt;br&gt; Lançamento" FieldName="DiasSemLancamento" ReadOnly="True" VisibleIndex="2" Width="75px">
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings VerticalScrollableHeight="550" VerticalScrollBarMode="Auto" />
        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <AlternatingRow BackColor="#E8E8E8">
            </AlternatingRow>
            <FocusedRow BackColor="Yellow" Font-Bold="True" ForeColor="Blue">
            </FocusedRow>
        </Styles>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="usp_DiasSemLancamento" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    </div>
</asp:Content>

