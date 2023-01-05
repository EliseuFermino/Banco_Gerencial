﻿<%@ Page Title="Análise de Vendas por Seção" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="Copy of AnaliseVenda_porEmpresaDia.aspx.vb" Inherits="MemberPages_SLV_AnaliseVenda_PorSecaoEmpresaDia" %>

<%@ Register src="../../Controles/wucListaDiaIniFin.ascx" tagname="wucListaDiaIniFin" tagprefix="uc1" %>
<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc2" %>

<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>


<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucListaSecao.ascx" tagname="wucListaSecao" tagprefix="uc5" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc6" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc7" %>

<%@ Register src="../../Controles/wucOpcoesSLV.ascx" tagname="wucOpcoesSLV" tagprefix="uc8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <uc8:wucOpcoesSLV ID="optSLV" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <table cellspacing="1" style="width: 845px">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <Triggers >
                         <asp:PostBackTrigger ControlID="btnExcel" /> 
                    </Triggers>
                    <ContentTemplate>
                        <table cellspacing="1" style="width: 918px">
                            <tr>
                                <td>
                                    <dx:ASPxRadioButton ID="rndEmpresa" runat="server" AutoPostBack="True" 
                                        Checked="True" GroupName="EmpresaFilial" Text="Empresa" 
                                        Theme="DevEx">
                                    </dx:ASPxRadioButton>
                                </td>
                                <td>
                                    <dx:ASPxRadioButton ID="rndMesmas" runat="server" AutoPostBack="True" 
                                        GroupName="EmpresaFilial" Text="Mesmas Lojas" Theme="DevEx" ForeColor="#3399FF">
                                    </dx:ASPxRadioButton>
                                </td>
                                <td>
                                    <dx:ASPxRadioButton ID="rndFilial" runat="server" AutoPostBack="True" 
                                        GroupName="EmpresaFilial" Text="Filial" Theme="DevEx">
                                    </dx:ASPxRadioButton>
                                </td>
                                <td>
                                    <uc3:wuciListaLojasComApoio ID="cboFilial" runat="server" />
                                </td>
                                <td>
                                    <uc1:wucListaDiaIniFin ID="cboDia" runat="server" />
                                </td>
                                <td>
                                    <uc2:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
                                </td>
                                <td>

                                    <dx:ASPxCheckBox ID="chkCabecalho" runat="server" AutoPostBack="True" 
                                        Checked="True" CheckState="Checked" Text="Fixar cabeçalho" Theme="DevEx">
                                    </dx:ASPxCheckBox>

                                </td>
                                <td>
                                    <uc4:wucBotaoExcel ID="btnExcel" runat="server" />
                                </td>
                            </tr>
                        </table>
                        <table cellspacing="1" >
                            <tr>
                                <td>
                                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
                                        EnableTheming="True" Theme="SoftOrange" Width="1100px" 
                                        KeyFieldName="idFilial" Visible="False" DataSourceID="SqlDataSource1">
                                        <Columns>                                           

                         <%--Dados Ano Anterior--%>

                         <%--Dados Mês Anterior--%>
                                 
                               <%--% Dados Ano Atual--%>

                                <%--% Crescimento--%>
                                                                                     
                                <%--Meta--%>
                                            <dx:GridViewBandColumn Caption="Mês Anterior" Name="bandMesAnterior" 
                                                ToolTip="Exibe informações do ano anterior" VisibleIndex="2" 
                                                Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Qtde " FieldName="QtdeMA" 
                                                        ToolTip="Quantidade do mês anterior (mesmo dias)" VisibleIndex="0" 
                                                        Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Venda " FieldName="vlrVendaMA" 
                                                        ToolTip="Valor de venda do mês anterior (mesmo dias)" VisibleIndex="1" 
                                                        Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part " FieldName="percPartMA" 
                                                        ToolTip="Percentual de participação da venda da seção sobre a venda total" 
                                                        VisibleIndex="2" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrMargemMA" 
                                                        ToolTip="Valor do lucro do mês anterior (mesmo dias)" VisibleIndex="3" 
                                                        Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg " FieldName="percMargemMA" 
                                                        ToolTip="Percentual de margem do mês anterior (mesmo dias)" VisibleIndex="4" 
                                                        Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Ano Anterior" Name="bandAnoAnterior" 
                                                ToolTip="Exibe informações do Ano Anterior" VisibleIndex="1">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Qtde " FieldName="QtdeAA" 
                                                        ToolTip="Quantidade do Ano Anterior (mesmo período)" VisibleIndex="0" 
                                                        Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Venda " FieldName="vlrVendaAA" 
                                                        ToolTip="Valor da venda do ano anterior (mesmo período)" VisibleIndex="1" 
                                                        Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAA" 
                                                        ToolTip="Percentual de participação da venda da seção sobre a venda total" 
                                                        VisibleIndex="2" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrMargemAA" 
                                                        ToolTip="Valor do lucro do ano anterior (mesmo período)" VisibleIndex="3" 
                                                        Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg " FieldName="percMargemAA" 
                                                        ToolTip="Percentual de margem do ano anterior (mesmo período)" VisibleIndex="4" 
                                                        Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Metas" Name="bandMetas" 
                                                ToolTip="Exibe as informações de metas de Venda, Margem e Quebra Conhecida (Agenda 23)" 
                                                VisibleIndex="6" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrMeta" 
                                                        ToolTip="Valor de meta de venda do período selecionado" VisibleIndex="0" 
                                                        Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemMeta" 
                                                        ToolTip="Percentual de meta de margem do período selecionado" VisibleIndex="2" 
                                                        Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Ag. 23" FieldName="vlrAg23Meta" 
                                                        VisibleIndex="4" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating." FieldName="percAtingMetaVlr" 
                                                        UnboundType="Decimal" VisibleIndex="1" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difPercMargem" 
                                                        ToolTip="Diferença do Realizado x Meta da Margem " UnboundType="Decimal" 
                                                        VisibleIndex="3" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif Ag23" FieldName="percAtingAg23" 
                                                        ToolTip="% Percentual de Atingimento da 23. Realizado x Meta da Agenda 23" 
                                                        UnboundType="Decimal" VisibleIndex="5" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                        <CellStyle HorizontalAlign="Right">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Crescimento" Name="bandCrescimento" 
                                                ToolTip="Exibe as informações de crescimento de Quantidade, Venda e Lucratividade" 
                                                VisibleIndex="5">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="% C.V" FieldName="percCresc" 
                                                        ToolTip="Percentual de crescimento de Venda entre periodo atual e periodo do ano anterior" 
                                                        VisibleIndex="0" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% C.Q" FieldName="percCrescQtde" 
                                                        ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" 
                                                        VisibleIndex="1" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% C.L" FieldName="percCrescLucro" 
                                                        ToolTip="Percentual de crescimento de Lucro entre periodo atual e periodo do ano anterior" 
                                                        VisibleIndex="2" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Ano Atual" Name="bandAnoAtual" 
                                                ToolTip="Exibe as informações do ano atual" VisibleIndex="3">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeAT" 
                                                        ToolTip="Quantidade vendida do período selecionado" VisibleIndex="0" 
                                                        Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaAT" ToolTip="Valor de venda do período selecionado" 
                                                        VisibleIndex="1" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAT" 
                                                        ToolTip="Percentual de participação da venda da seção sobre a venda total" 
                                                        VisibleIndex="2" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrMargemAT" ToolTip="Valor do lucro do período selecionado" 
                                                        VisibleIndex="3" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAT" 
                                                        ToolTip="Percentual de margem do período selecionado" VisibleIndex="4" 
                                                        Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Agenda 23" Name="bandAgenda23" 
                                                ToolTip="Quantidada e Valor da quebra conhecida (Agenda 23)" VisibleIndex="4">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrAg23" VisibleIndex="1" 
                                                        Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" ForeColor="White" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Qtde" FieldName="QtdeAg23" VisibleIndex="0" 
                                                        Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" ForeColor="White" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCrescAg23" 
                                                        ToolTip="Percentual da Agenda 23 em relação a venda" UnboundType="Decimal" 
                                                        VisibleIndex="2" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" ForeColor="White" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn FieldName="descSecao" VisibleIndex="0" 
                                                Caption="Seção" Width="150px">
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="Tipo" SortIndex="0" SortOrder="Ascending" 
                                                VisibleIndex="23" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                           
                                            <dx:GridViewDataTextColumn FieldName="idFilial" SortIndex="1" 
                                                SortOrder="Ascending" VisibleIndex="24" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                           
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Styles>
	                                        <FocusedRow BackColor="#CCFFFF" ForeColor="#333333"> </FocusedRow>
	                                        	<Header HorizontalAlign="Center">
                                            </Header>
	                                        	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                        </Styles>                                        
                                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="500" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                            />
                                    </dx:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            SelectCommand="SELECT [descSecao], [QtdeAT], [vlrVendaAT], [percMargemAT], [QtdeAA], [vlrVendaAA], [percMargemAA], [vlrVendaMA], [QtdeMA], [percMargemMA], [percCresc], [vlrMeta], [percMargemMeta],[Tipo],[idFilial], [vlrMargemAA], [vlrMargemAT], [vlrMargemMA], [percCrescQtde], [percCrescLucro], [percPartAT], [percPartAA], [percPartMA], [vlrAg23Meta], [QtdeAg23], [vlrAg23] FROM [SLV].[AnaliseAnoAnterior] WHERE ([Usuario] = @Usuario) ORDER BY [idDepto],[idSecao]">
                            <SelectParameters>
                                <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
<br />
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
            </td>
        </tr>
    </table>

</asp:Content>

