<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="AnaliseHoraComparativa.aspx.vb" Inherits="MemberPages_Vendas_AnaliseHoraComparativa" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wuciListaDia.ascx" TagPrefix="uc1" TagName="wuciListaDia" %>
<%@ Register Src="~/Controles/wucListaDia.ascx" TagPrefix="uc1" TagName="wucListaDia" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

        <style type="text/css" >

    #divBloco1{
        margin-left: 5px;  
        width: 640px;     
    }

    #divBloco2{
        clear:both;
        float: left;
        margin-left: 10px;  
        width: 640px;       
    }

</style>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divBloco1">
        <asp:UpdatePanel ID="panel_Bloco1" runat="server">
            <ContentTemplate>

            <h4><asp:Label ID="lblTitulo1" runat="server" Text="Comparativo de Venda com o Dia "></asp:Label></h4>
            <br />
            <uc1:wucListaDia runat="server" ID="cboDia1" />
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" Theme="SoftOrange" Width="630px" KeyFieldName="Descricao">
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Dif" SummaryType="Sum" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="Descricao" VisibleIndex="0" Width="160px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Hora" FieldName="descHI" VisibleIndex="1" Width="60px">
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Venda &lt;br&gt; 06/09/2016" FieldName="vlrVendaAA" ReadOnly="True" VisibleIndex="2" Width="85px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Venda &lt;br&gt; Hoje" FieldName="vlrVendaAT" ReadOnly="True" VisibleIndex="3" Width="85px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle ForeColor="Blue">
                        </CellStyle>
                        <FooterCellStyle ForeColor="Blue">
                        </FooterCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="Dif" VisibleIndex="4" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% de &lt;br&gt; Cresc." FieldName="percCresc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowFooter="True" VerticalScrollableHeight="550" VerticalScrollBarMode="Visible" />
                <Styles>
                    <Header HorizontalAlign="Center">
                    </Header>
                    <AlternatingRow BackColor="#E4E4E4">
                    </AlternatingRow>
                    <FocusedRow BackColor="Yellow" ForeColor="Blue">
                    </FocusedRow>
                    <Footer Font-Bold="True">
                    </Footer>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" SelectCommand="uspVendaHoraria_Comparativa" SelectCommandType="StoredProcedure">
                <SelectParameters >
                    <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA1" />
                </SelectParameters>
            </asp:SqlDataSource>
              
        </ContentTemplate>
        </asp:UpdatePanel>      
    </div>



    <div id="divBloco2">
        <asp:UpdatePanel ID="panel_Bloco2" runat="server">
            <ContentTemplate>
            
                <h4><asp:Label ID="lblTitulo2" runat="server" Text="Comparativo de Venda com o Dia "></asp:Label></h4>
            <br />
            <uc1:wucListaDia runat="server" ID="cboDia2" />
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EnableTheming="True" Theme="SoftOrange" Width="630px" KeyFieldName="Descricao">
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Dif" SummaryType="Sum" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="Descricao" VisibleIndex="0" Width="160px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Hora" FieldName="descHI" VisibleIndex="1" Width="60px">
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Venda &lt;br&gt; 06/09/2016" FieldName="vlrVendaAA" ReadOnly="True" VisibleIndex="2" Width="85px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Venda &lt;br&gt; Hoje" FieldName="vlrVendaAT" ReadOnly="True" VisibleIndex="3" Width="85px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle ForeColor="Blue">
                        </CellStyle>
                        <FooterCellStyle ForeColor="Blue">
                        </FooterCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="Dif" VisibleIndex="4" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% de &lt;br&gt; Cresc." FieldName="percCresc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowFooter="True" VerticalScrollableHeight="550" VerticalScrollBarMode="Visible" />
                <Styles>
                    <Header HorizontalAlign="Center">
                    </Header>
                    <AlternatingRow BackColor="#E4E4E4">
                    </AlternatingRow>
                    <FocusedRow BackColor="Yellow" ForeColor="Blue">
                    </FocusedRow>
                    <Footer Font-Bold="True">
                    </Footer>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" SelectCommand="uspVendaHoraria_Comparativa" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA2" />
                </SelectParameters>
            </asp:SqlDataSource>

        </ContentTemplate>
        </asp:UpdatePanel>        
    </div>

</asp:Content>

