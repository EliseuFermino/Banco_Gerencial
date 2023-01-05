<%@ Page Title="Produtos Vencidos" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="DashVencidos.aspx.vb" Inherits="MemberPages_Quebras_Validade_DashVencidos" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divVencidosHoje {
            clear:both;
            float: left;
            
        }

        #divVencidosOntem {
            margin-left: 5px;
            float: left;
            
        }

        #divVencidosDia {
            margin-left: 5px;
            float: left;            
        }

        #divLegendaDia {
            margin-left: 2px;
            float: left;            
        }

        #divDia {
            margin-left: 2px;
            float: left;            
        }
        

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<div id="divVencidosHoje">

    <dx:ASPxGridView ID="gridVencidosHojes" runat="server" DataSourceID="dsVencidosHoje" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" Width="230px">
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numProdutos" SummaryType="Sum" />
        </TotalSummary>
        <Columns>
            <dx:GridViewDataTextColumn Caption="Filial" FieldName="descFilial" VisibleIndex="1" Width="90px">
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Produtos" FieldName="numProdutos" ToolTip="Nº de lançamentos de itens vencidos." VisibleIndex="2" Width="50px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
        <Styles>
            <AlternatingRow BackColor="#E9E9E9" Font-Bold="False">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="dsVencidosHoje" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vencidos.vw_TotalDeLancamento_Hoje" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

</div>

<div id="divVencidosOntem">

    <dx:ASPxGridView ID="gridVencidosOntem" runat="server" DataSourceID="dsVencidosOntem" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" Width="230px">
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numProdutos" SummaryType="Sum" />
        </TotalSummary>
        <Columns>
            <dx:GridViewDataTextColumn Caption="Filial" FieldName="descFilial" VisibleIndex="1" Width="90px">
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Produtos" FieldName="numProdutos" ToolTip="Nº de lançamentos de itens vencidos." VisibleIndex="2" Width="50px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
        <Styles>
            <AlternatingRow BackColor="#E9E9E9" Font-Bold="False">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="dsVencidosOntem" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vencidos.vw_TotalDeLancamento_Ontem" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

</div>

<div id="divVencidosDia">
    <div id="divLegendaDia">Dia:</div>
     
    <div id="divDia">
        <dx:ASPxDateEdit ID="cboDia" runat="server" Width="100px">
            <ClientSideEvents DateChanged="function(s, e) {
	    cbPanel.PerformCallback();
    }" />
        </dx:ASPxDateEdit>
    </div>

    <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="300px" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                    
                 <dx:ASPxGridView ID="gridVencidosDia" runat="server" DataSourceID="dsVencidosDia" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange" Width="230px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numProdutos" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Filial" FieldName="descFilial" VisibleIndex="1" Width="90px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Produtos" FieldName="numProdutos" ToolTip="Nº de lançamentos de itens vencidos." VisibleIndex="2" Width="50px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowDragDrop="False" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
                        <Styles>
                            <AlternatingRow BackColor="#E9E9E9" Font-Bold="False">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>

                <asp:SqlDataSource ID="dsVencidosDia" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vencidos.vw_TotalDeLancamento_PorDia" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                    </SelectParameters>
                    </asp:SqlDataSource>


                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>


</div>


</asp:Content>

