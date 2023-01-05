<%@ Page Title="Acessos de Hoje" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AcessosHoje.aspx.vb" Inherits="MemberPages_Manutencao_AcessosHoje" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >
        #divBotaoAtualizar {
            float: left;
            padding-left: 4px;
        }

        #divAcessoHoje {
            clear:both ;
            float: left;
            padding-left: 4px;
            padding-top: 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack ="False" Theme ="Metropolis">
            <ClientSideEvents Click="function(s, e) {
	cbPanelAcessoHoje.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divAcessoHoje">
        <dx:ASPxCallbackPanel ID="cbPanelAcessoHoje" runat="server" Width="1220px" ClientInstanceName="cbPanelAcessoHoje" Theme="Metropolis" SettingsLoadingPanel-Text="Atualizando">
            <PanelCollection>
                <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
                    <dx:ASPxGridView ID="gridAcessoHoje" runat="server" AutoGenerateColumns="False" DataSourceID="dsAcessoHoje" KeyFieldName="idPrograma" Width="1220px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="Total: {0:n0}" FieldName="idPrograma" ShowInColumn="DescPrograma" SummaryType="Count" />
                        </TotalSummary>
                        <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="Acessos: {0:n0}" FieldName="idPrograma" SummaryType="Count" />
                        </GroupSummary>
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn FieldName="idPrograma" ShowInCustomizationForm="True" VisibleIndex="1" Caption="ID" Width="50px">
                                <Settings AutoFilterCondition="Contains" ShowFilterRowMenu="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="DescPrograma" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Nome do Programa" Width="450px">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Usuario" ShowInCustomizationForm="True" VisibleIndex="3" Width="310px">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Hora" ShowInCustomizationForm="True" VisibleIndex="4" Width="80px">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Setor" ShowInCustomizationForm="True" VisibleIndex="5" Width="190px">
                                <Settings AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" Caption="rnk" Width="40px">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager PageSize="20">
                        </SettingsPager>
                        <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupPanel="True" VerticalScrollableHeight="440" VerticalScrollBarMode="Auto" />
                        <SettingsText EmptyDataRow="Não há informações disponíveis ainda para esse período e loja" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF99" Font-Bold="True" ForeColor="Blue">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="dsAcessoHoje" runat="server" ConnectionString="<%$ ConnectionStrings:gerContSQL1ConnectionString %>" SelectCommand="Estatistica.uspBuscarAcessosHoje" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

</asp:Content>

