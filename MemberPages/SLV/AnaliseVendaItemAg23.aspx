<%@ Page Title="Análise de Vendas e Agenda 23 por Seção" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseVendaItemAg23.aspx.vb" Inherits="MemberPages_SLV_AnaliseVendaItemAg23" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>




<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>


<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucListaSecao.ascx" tagname="wucListaSecao" tagprefix="uc5" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc6" %>
<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 180px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno" style="float:left">
        <uc7:wucAno ID="cboAno" runat="server" />
    </div>

    <div id="divMesInicial" style="float:left">
        <uc6:wuciListaMes ID="cboMesInicial" runat="server" />
    </div>

    <div id="divMesFinal" style="float:left">
        <uc6:wuciListaMes ID="cboMesFinal" runat="server" />
    </div>

    <div id="divSecao" style="float:left">
        <uc5:wucListaSecao ID="cboSecao" runat="server" />
    </div>

    <div id="divBotaoAtualizar" style="float:left; padding-left: 45px; margin-left: 45px">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme ="Metropolis">
            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxButton>       
    </div>

    <div id="divCabecalho" style="float:left; padding-left: 7px">
        <dx:ASPxCheckBox ID="chkCabecalho" runat="server" 
            Checked="True" CheckState="Checked" Text="Fixar cabeçalho" Theme="DevEx">
            <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divBotaoExcel" style="float:left; margin-left: 5px">
        <uc4:wucBotaoExcel ID="btnExcel" runat="server" />
    </div>

    <div id="divDados" style="clear:both; float:left; padding-left: 3px">
        <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Theme="Metropolis" ClientInstanceName="cbPanel">
            <PanelCollection>
                <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
                    <dx:ASPxGridView ID="grid" runat="server" 
                        DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                        EnableTheming="True" Theme="SoftOrange" Width="1000px" 
                        KeyFieldName="idProduto" Visible="False">
                        <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="Total: {0:n0}" FieldName="QtdeAT" SummaryType="Sum" />
                        </GroupSummary>
                        <Columns>                                           
                            <dx:GridViewDataTextColumn FieldName="descProduto" VisibleIndex="1" 
                                Caption="Descrição do Produto" Width="180px" 
                                ToolTip="Descrição do produto">
                                <CellStyle Wrap="False">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="QtdeAg23" VisibleIndex="7" Caption="Qtd Ag 23" 
                                ToolTip="Quantidade de itens na agemda 23" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                <HeaderStyle BackColor="#CC9900" />
                                <CellStyle ForeColor="#990000">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrAg23" VisibleIndex="8" 
                                Caption="vlr Ag 23" ToolTip="Valor da agenda 23" 
                                Width="60px" >
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                <HeaderStyle BackColor="#CC9900" />
                                <CellStyle ForeColor="#990000">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="QtdeAT" VisibleIndex="2" 
                                Caption="Qtde AT" ToolTip="Quantidade do Ano Atual" 
                                Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                <HeaderStyle BackColor="#3399FF" />
                                <CellStyle ForeColor="Blue">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrVendaAT" VisibleIndex="3" 
                                Caption="Venda AT" 
                                ToolTip="Valor da venda do ano atual " Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                <HeaderStyle BackColor="#3399FF" />
                                <CellStyle ForeColor="Blue">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="percMargemAT" VisibleIndex="6" 
                                Caption="% Marg" 
                                ToolTip="Percentual de margem do ano atual " 
                                Width="50px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                <HeaderStyle BackColor="#3399FF" />
                                <CellStyle ForeColor="Blue">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                                           
                            <dx:GridViewDataTextColumn FieldName="percCresc" VisibleIndex="11" 
                                Caption="% Perda" SortIndex="0" SortOrder="Descending"                                               
                                                
                                ToolTip="Percentual de perda (valor da Agenda 23 sobre o valor da Venda)" 
                                Width="50px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle BackColor="Red" />
                                <CellStyle Wrap="False">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                                                                                      
                            <dx:GridViewDataTextColumn FieldName="descGrupo" 
                                VisibleIndex="13" Caption="Grupo" Width="100px" 
                                ToolTip="Descrição do grupo">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                                           
                            <dx:GridViewDataTextColumn FieldName="descSubgrupo" VisibleIndex="15" 
                                Width="100px" Caption="Sub-Grupo" ToolTip="Descrição do Sub-grupo">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                                           
                            <dx:GridViewDataTextColumn FieldName="idProduto" VisibleIndex="0" 
                                Caption="Código" ToolTip="Código do produto" Width="50px">
                                <PropertiesTextEdit EncodeHtml="False"></PropertiesTextEdit>
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                                           
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles>
	                        <FocusedRow BackColor="#CCFFFF" ForeColor="#333333"> </FocusedRow>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                        </Styles>                                       
                        <SettingsPager PageSize="20">
                        </SettingsPager>
                        <Settings ShowGroupPanel="True" UseFixedTableLayout="True" 
                            ShowVerticalScrollBar="True" VerticalScrollableHeight="450" />
                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e fornecedor" 
                            GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar"                                             />
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:tempdbConnectionString %>" 
                        SelectCommand="dbo.uspBuscarAnaliseVendaItemAgenda23" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Int16" />
                            <asp:SessionParameter Name="ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="mesInicial" SessionField="sMES_INICIAL" Type="Byte" />
                            <asp:SessionParameter Name="mesFinal" SessionField="sMES_FINAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

</asp:Content>

