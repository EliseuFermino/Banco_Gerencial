<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Postos_Resumo_Estoque.aspx.vb" Inherits="MemberPages_Posto_Postos_Resumo_Estoque" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css">

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divMes {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }



        #divDados {
            clear:both ;
            margin: 2px;
            width: 100%;
        }

        .Espacamento {
            padding-top: 10px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>


    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>


    <div id="divDados">

        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

    <section class="Espacamento">

        <dx:ASPxGridView ID="grid205" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid205" DataSourceID="dsResumo205" Width="600px">
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFooter="True" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="idTanque" VisibleIndex="0" Caption="Tanque" Width="50px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="idProduto" VisibleIndex="1" Caption="ID" Width="90px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nomeProduto" VisibleIndex="2" Caption="Descrição do Combustivel" Width="200px">
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Acumulado" ShowInCustomizationForm="True" VisibleIndex="3">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Vendas" FieldName="acum_vlrVendas" ShowInCustomizationForm="True" VisibleIndex="0" Width="85px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Dif. Volume" FieldName="acum_Diferenca_Volume" ShowInCustomizationForm="True" VisibleIndex="1" Width="85px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Diferenças" FieldName="acum_perc_Diferenca" ShowInCustomizationForm="True" VisibleIndex="2" Width="85px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}%">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
        </Columns>

        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="acum_vlrVendas" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="acum_Diferenca_Volume" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:P2}" FieldName="acum_perc_Diferenca" SummaryType="Custom" />
        </TotalSummary>

            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#F2F2F2">
                </AlternatingRow>
            </Styles>

    </dx:ASPxGridView>
        
        <asp:SqlDataSource ID="dsResumo205" runat="server" ConnectionString="<%$ ConnectionStrings:gerPostoConnectionString %>" SelectCommand="usp_Resumo_Estoque_Posto" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="" Name="Ano" SessionField="sANO" Type="Int16" />
        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
        <asp:SessionParameter DefaultValue="205" Name="idFilial" SessionField="sFILIAL" Type="Int16" />
    </SelectParameters>
</asp:SqlDataSource>

    </section>

    <section class="Espacamento">

       <dx:ASPxGridView ID="grid206" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid206" DataSourceID="dsResumo206" Width="600px">
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFooter="True" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="idTanque" VisibleIndex="0" Caption="Tanque" Width="50px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="idProduto" VisibleIndex="1" Caption="ID" Width="90px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nomeProduto" VisibleIndex="2" Caption="Descrição do Combustivel" Width="200px">
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Acumulado" ShowInCustomizationForm="True" VisibleIndex="3">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Vendas" FieldName="acum_vlrVendas" ShowInCustomizationForm="True" VisibleIndex="0" Width="85px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Dif. Volume" FieldName="acum_Diferenca_Volume" ShowInCustomizationForm="True" VisibleIndex="1" Width="85px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Diferenças" FieldName="acum_perc_Diferenca" ShowInCustomizationForm="True" VisibleIndex="2" Width="85px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}%">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
        </Columns>

        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="acum_vlrVendas" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="acum_Diferenca_Volume" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:P2}" FieldName="acum_perc_Diferenca" SummaryType="Custom" />
        </TotalSummary>

            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#F2F2F2">
                </AlternatingRow>
            </Styles>

    </dx:ASPxGridView>

        <asp:SqlDataSource ID="dsResumo206" runat="server" ConnectionString="<%$ ConnectionStrings:gerPostoConnectionString %>" SelectCommand="usp_Resumo_Estoque_Posto" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="" Name="Ano" SessionField="sANO" Type="Int16" />
        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
        <asp:SessionParameter DefaultValue="206" Name="idFilial" SessionField="sFILIAL" Type="Int16" />
    </SelectParameters>
</asp:SqlDataSource>

    </section>


    <section class="Espacamento">

       <dx:ASPxGridView ID="grid211" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid211" DataSourceID="dsResumo211" Width="600px">
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFooter="True" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="idTanque" VisibleIndex="0" Caption="Tanque" Width="50px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="idProduto" VisibleIndex="1" Caption="ID" Width="90px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nomeProduto" VisibleIndex="2" Caption="Descrição do Combustivel" Width="200px">
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Acumulado" ShowInCustomizationForm="True" VisibleIndex="3">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Vendas" FieldName="acum_vlrVendas" ShowInCustomizationForm="True" VisibleIndex="0" Width="85px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Dif. Volume" FieldName="acum_Diferenca_Volume" ShowInCustomizationForm="True" VisibleIndex="1" Width="85px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Diferenças" FieldName="acum_perc_Diferenca" ShowInCustomizationForm="True" VisibleIndex="2" Width="85px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}%">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
        </Columns>

        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="acum_vlrVendas" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="acum_Diferenca_Volume" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:P2}" FieldName="acum_perc_Diferenca" SummaryType="Custom" />
        </TotalSummary>

            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#F2F2F2">
                </AlternatingRow>
            </Styles>

    </dx:ASPxGridView>

        <asp:SqlDataSource ID="dsResumo211" runat="server" ConnectionString="<%$ ConnectionStrings:gerPostoConnectionString %>" SelectCommand="usp_Resumo_Estoque_Posto" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="" Name="Ano" SessionField="sANO" Type="Int16" />
        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
        <asp:SessionParameter DefaultValue="211" Name="idFilial" SessionField="sFILIAL" Type="Int16" />
    </SelectParameters>
</asp:SqlDataSource>

    </section>


         </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>


    </div>
</asp:Content>



