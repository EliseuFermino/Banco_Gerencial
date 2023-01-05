<%@ Page Title="Análise de Vendas por Seção" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="AnaliseVenda_porCampanha.aspx.vb" Inherits="MemberPages_SLV_AnaliseVenda_PorCampanha" %>

<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc2" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>


<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc4" %>




<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc6" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <table style="border-collapse: collapse; width: 100%; float: left">
        <tr style="width:100px">
            <td>
                <table align="left" cellpadding="0" 
                    style="border-collapse: collapse; width: 100%; float: left">
                    <tr>
                        <td align="center">
                            
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Panel ID="Panel1" runat="server" BackColor="#999999" BorderColor="Gray" 
                                BorderStyle="Solid" BorderWidth="1px" Visible="False">
                                <span style="color: #FFFFFF">Opções</span></asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkAA" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Mostrar Ano Anterior" ToolTip="Oculta ou Mostra as colunas de Quantidade, Venda, Lucro e % de Margem do Ano Anterior." 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="#CC9900">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkMA" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Mostrar Mês Anterior" ToolTip="Oculta ou Mostra as colunas de Quantidade, Venda, Lucro e % de Margem do Mês Anterior." 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="#FF6600">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkMeta" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Mostrar Meta" ToolTip="Oculta ou Mostra as colunas de Meta de Venda e Meta de Margem (%)" 
                                Visible="False" Theme="DevEx" ForeColor="#009900">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>

                    <tr>
                        <td align="center">
                            <asp:Panel ID="Panel2" runat="server" BackColor="Silver" BorderColor="Gray" 
                                BorderStyle="Solid" BorderWidth="1px" Visible="False">
                                <span style="color: #FFFFFF">Crescimento</span>
                            </asp:Panel>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkCrescVenda" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Mostrar Cresc. Venda" ToolTip="Oculta ou Mostra as colunas de percentual de crescimento de venda." 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkCrescQtde" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Mostrar Cresc. Qtde." ToolTip="Oculta ou Mostra as colunas de percentual de crescimento de quantidade" 
                                Visible="False" Theme="DevEx" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkCrescLucro" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Mostrar Cresc. Lucro" ToolTip="Oculta ou Mostra as colunas de percentual de crescimento de lucro" 
                                Visible="False" Theme="DevEx" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Panel ID="Panel3" runat="server" BackColor="Silver" BorderColor="Gray" 
                                BorderStyle="Solid" BorderWidth="1px" Visible="False">
                                <span style="color: #FFFFFF">Participação</span>
                            </asp:Panel>
                        </td>    
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkPartAT" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Mostrar Part. AT" ToolTip="Oculta ou Mostra as colunas de percentual de participação de venda do ano atual." 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkPartMA" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Mostrar Part. MA" ToolTip="Oculta ou Mostra as colunas de percentual de participação de venda do mês anterior." 
                                Visible="False" Theme="DevEx" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkPartAA" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Mostrar Part. AA" ToolTip="Oculta ou Mostra as colunas de percentual de participação de venda do ano anterior." 
                                Visible="False" Theme="DevEx" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <asp:Panel ID="Panel4" runat="server" BackColor="Silver" BorderColor="Gray" 
                                BorderStyle="Solid" BorderWidth="1px" Visible="False">
                                <span style="color: #FFFFFF">Lucratividade</span>
                            </asp:Panel>
                        </td>    
                    </tr>
                     <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkLucroAT" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Mostrar Lucro AT" ToolTip="Oculta ou Mostra a coluna de lucro do ano atual." 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkLucroMA" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Mostrar Lucro MA" ToolTip="Oculta ou Mostra a coluna de lucro do mês anterior." 
                                Visible="False" Theme="DevEx" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkLucroAA" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Mostrar Lucro AA" ToolTip="Oculta ou Mostra a coluna de lucro do ano anterior." 
                                Visible="False" Theme="DevEx" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>                    
                </table>
            </td>
        </tr>
    </table>
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
                        <table cellspacing="1" style="width: 818px">
                            <tr>
                                <td>
                                    <uc6:wucAno ID="cboAno" runat="server" />
                                </td>
                                <td>Campanha: </td>
                                <td>
                                    <dx:ASPxComboBox ID="cboCampanha" runat="server" DataSourceID="dsCampanha" 
                                        Native="True" TextField="descCampanha" Theme="DevEx" ValueField="idCampanha" 
                                        Width="150px">
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="dsCampanha" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" 
                                        SelectCommand="SELECT [idCampanha], [descCampanha] FROM [tblCadCampanha]">
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    <uc2:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
                                </td>
                                <td>
                                    <uc4:wucBotaoExcel ID="btnExcel" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5">
                                    <asp:Label ID="lblInfo" runat="server" Font-Italic="True" ForeColor="Red" 
                                        Text="O período do campanha esta exibido abaixo, no final do relatório." 
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <table cellspacing="1" >
                            <tr>
                                <td>
                                    <dx:ASPxGridView ID="grid" runat="server" 
                                        DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                                        EnableTheming="True" Theme="SoftOrange" Width="400px" 
                                        KeyFieldName="idFilial" Visible="False">
                                        <Columns>                                           
                                            <dx:GridViewDataTextColumn FieldName="descFilial" VisibleIndex="0" 
                                                Caption="Filial" Width="150px">
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>

                         <%--Dados Ano Anterior--%>
                                            <dx:GridViewDataTextColumn FieldName="QtdeAA" VisibleIndex="1" 
                                                Caption="Qtde AA" ToolTip="Quantidade do Ano Anterior (mesmo período)" 
                                                Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="vlrVendaAA" VisibleIndex="2" 
                                                Caption="Venda AA" 
                                                ToolTip="Valor da venda do ano anterior (mesmo período)" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center"/>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="percPartAA" VisibleIndex="3" 
                                                Caption="% Part AA" ToolTip="Percentual de participação da venda da seção sobre a venda total" 
                                                Width="50px" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />                                     
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="vlrMargemAA" VisibleIndex="4" Visible="False" 
                                                Caption="Lucro AA" Width="80px" 
                                                ToolTip="Valor do lucro do ano anterior (mesmo período)">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="percMargemAA" VisibleIndex="5" 
                                                Caption="% Marg AA" ToolTip="Percentual de margem do ano anterior (mesmo período)" Width="50px">
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit> 
                                                <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>

                         <%--Dados Mês Anterior--%>
                                            <dx:GridViewDataTextColumn FieldName="QtdeMA" VisibleIndex="6" 
                                                Caption="Qtde MA" ToolTip="Quantidade do mês anterior (mesmo dias)" 
                                                Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>

                                          <dx:GridViewDataTextColumn FieldName="vlrVendaMA" VisibleIndex="7" 
                                                Caption="Venda MA" ToolTip="Valor de venda do mês anterior (mesmo dias)" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="percPartMA" VisibleIndex="8" 
                                                Caption="% Part MA" ToolTip="Percentual de participação da venda da seção sobre a venda total" 
                                                Width="50px" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />                                               
                                            </dx:GridViewDataTextColumn>
                                           
                                            <dx:GridViewDataTextColumn FieldName="vlrMargemMA" VisibleIndex="9" Visible="False" 
                                                Caption="Lucro MA" Width="80px" 
                                                ToolTip="Valor do lucro do mês anterior (mesmo dias)">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="percMargemMA" VisibleIndex="10" 
                                                Caption="% Marg MA" ToolTip="Percentual de margem do mês anterior (mesmo dias)" Width="50px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                 
                               <%--% Dados Ano Atual--%>
                                           <dx:GridViewDataTextColumn FieldName="QtdeAT" VisibleIndex="11" Caption="Qtde" 
                                                ToolTip="Quantidade vendida do período selecionado" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue"></CellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="vlrVendaAT" VisibleIndex="12" 
                                                Caption="Venda" ToolTip="Valor de venda do período selecionado" 
                                                Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue"></CellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="percPartAT" VisibleIndex="13" 
                                                Caption="% Part" ToolTip="Percentual de participação da venda da seção sobre a venda total" Width="50px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue"></CellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="vlrMargemAT" VisibleIndex="14" 
                                                Caption="Lucro" 
                                                Width="80px" ToolTip="Valor do lucro do período selecionado">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue"></CellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="percMargemAT" VisibleIndex="15" 
                                                Caption="% Marg" ToolTip="Percentual de margem do período selecionado" Width="50px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>

                                <%--% Crescimento--%>
                                            <dx:GridViewDataTextColumn FieldName="percCresc" VisibleIndex="16" Caption="% Cresc V"                                         
                                                ToolTip="Percentual de crescimento de Venda entre periodo atual e periodo do ano anterior" Width="50px">
                                                <CellStyle><BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" /></CellStyle>
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            
                                            <dx:GridViewDataTextColumn FieldName="percCrescQtde" VisibleIndex="17" Caption="% Cresc Q"                                         
                                                ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" Width="50px" Visible="False">
                                                <CellStyle><BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" /></CellStyle>
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn> 
                                            
                                            <dx:GridViewDataTextColumn FieldName="percCrescLucro" VisibleIndex="18" Caption="% Cresc L"                                         
                                                ToolTip="Percentual de crescimento de Lucro entre periodo atual e periodo do ano anterior" Width="50px" Visible="False">
                                                <CellStyle><BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" /></CellStyle>
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>                                                                                          
                                                                                     
                                <%--Meta--%>
                                            <dx:GridViewDataTextColumn FieldName="vlrMeta" VisibleIndex="19" Caption="Meta" 
                                                ToolTip="Valor de meta de venda do período selecionado" Width="80px" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="percMargemMeta" VisibleIndex="20" 
                                                Caption="% Marg" 
                                                ToolTip="Percentual de meta de margem do período selecionado" Width="50px" 
                                                Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>                                     
                                                <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="#009900">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                           
                                            <dx:GridViewDataTextColumn FieldName="Tipo" SortIndex="0" SortOrder="Ascending" 
                                                VisibleIndex="21" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                           
                                            <dx:GridViewDataTextColumn FieldName="idFilial" SortIndex="1" 
                                                SortOrder="Ascending" VisibleIndex="22" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                           
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Styles>
	                                        <FocusedRow BackColor="#CCFFFF" ForeColor="#333333"> </FocusedRow>
	                                        	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                        </Styles>                                        
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                            />
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                        SelectCommand="SELECT [descFilial], [QtdeAT], [vlrVendaAT], [percMargemAT], [QtdeAA], [vlrVendaAA], [percMargemAA], [vlrVendaMA], [QtdeMA], [percMargemMA], [percCresc], [vlrMeta], [percMargemMeta],[Tipo],[idFilial], [vlrMargemAA], [vlrMargemAT], [vlrMargemMA], [percCrescQtde], [percCrescLucro], [percPartAT], [percPartAA], [percPartMA] FROM [SLV].[AnaliseAnoAnterior] WHERE ([Usuario] = @Usuario) ORDER BY [Tipo]">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
<br />
                        <table align="left" cellpadding="0" 
                            style="border-collapse: collapse; width: 100%; float: left">
                            <tr>
                                <td>
                                    <asp:Panel ID="Panel_Info" runat="server" BorderColor="Silver" 
                                        BorderStyle="Solid" BorderWidth="2px" Height="300px" Width="500px" 
                                        Visible="False">
                                        <table cellpadding="0" 
                                            style="border-collapse: collapse; width: 100%; float: left">
                                            <tr>
                                                <td>
                                                    <table align="left" cellpadding="0" 
                                                        style="border-collapse: collapse; width: 100%; float: left">
                                                        <tr>
                                                            <td style="width: 175px">&nbsp;</td>
                                                            <td align="center">Ano 2012</td>
                                                            <td align="center">Ano 2011</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 175px">Período :</td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_PeriodoAT" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_PeriodoAA" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 175px">Total de Dias :</td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_TotalDiasAT" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_TotalDiasAA" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 175px">&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 175px; height: 17px">&nbsp;Total de Segundas :</td>
                                                            <td style="height: 17px">
                                                                <asp:Label ID="lblInfo_TotalDeSegundas_AT" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                            <td style="height: 17px">
                                                                <asp:Label ID="lblInfo_TotalDeSegundas_AA" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 175px">Total de Terças :</td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_TotalDeTercas_AT" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_TotalDeTercas_AA" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 175px">Total de Quartas :</td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_TotalDeQuartas_AT" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_TotalDeQuartas_AA" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 175px">Total de Quintas :</td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_TotalDeQuintas_AT" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_TotalDeQuintas_AA" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 175px; height: 17px;">Total de Sextas :</td>
                                                            <td style="height: 17px">
                                                                <asp:Label ID="lblInfo_TotalDeSextas_AT" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                            <td style="height: 17px">
                                                                <asp:Label ID="lblInfo_TotalDeSextas_AA" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 175px">Total de Sábados :</td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_TotalDeSabados_AT" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_TotalDeSabados_AA" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 175px">Total de Domingos :</td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_TotalDeDomingos_AT" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblInfo_TotalDeDomingos_AA" runat="server" Text="Label"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 175px">&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 175px">&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                            <td>&nbsp;</td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
            </td>
        </tr>
    </table>

</asp:Content>

