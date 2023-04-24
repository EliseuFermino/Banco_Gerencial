<%@ Page Title="Analise Vendas por Hora Sem Pascoa" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="AnaliseHora_SemPascoa.aspx.vb" Inherits="MemberPages_Gerencial_AnaliseHora_SemPascoa" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc1" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc2" %>

<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<%@ Register src="../../Controles/wuciListaSemana.ascx" tagname="wuciListaSemana" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc5" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>


<%@ Register src="../../Controles/DescricaoAtualizaro.ascx" tagname="DescricaoAtualizaro" tagprefix="uc6" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <table class="auto-style1">
            <tr>
                <td colspan="3">
                    <table>
                        <tr>
                            <td style="width: 100px">
                                <uc2:wucAno ID="cboAno" runat="server" />
                            </td> <%--Ano--%>
                            <td>
                                <uc1:wuciListaMes ID="cboMes" runat="server" />
                            </td> <%--Mês--%>
                            <td>
                                <dx:ASPxRadioButton ID="rndEmpresa" runat="server" AutoPostBack="True" 
                                    Checked="True" GroupName="grpCorpLojas" Text="Empresa" Theme="DevEx">
                                </dx:ASPxRadioButton>
                            </td> <%--Opção Empresa--%>
                            <td>
                                <dx:ASPxRadioButton ID="rndFilial" runat="server" AutoPostBack="True" 
                                    GroupName="grpCorpLojas" Text="Filial" Theme="DevEx" Visible="False">
                                </dx:ASPxRadioButton>
                            </td> <%--Opção Filial--%>
                            <td style="width: 193px">
                                <uc3:wuciListaLojasComApoio ID="cboFilial" runat="server" Visible="False" />
                            </td> <%--Lista de Filiais--%>
                            <td style="width: 166px">
                                &nbsp;</td> <%--Seleção da Semana--%>
                            <td>
                                <uc5:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
                            </td> <%--Botão Atualizar--%>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top" style="width: 90px">
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="dsVendaDia" 
                        AutoGenerateColumns="False" EnableTheming="True" Theme="DevEx" 
                        KeyFieldName="Dia" Width="350px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAnoAnterior" 
                                SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAnoAtual" 
                                SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDiferenca" 
                                SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="clrCresc" 
                                SummaryType="Custom" />
                        </TotalSummary>
                        <Columns>
                            
                            <dx:GridViewDataTextColumn Caption="Desc" FieldName="Descricao" 
                                VisibleIndex="1" Width="90px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="2011" FieldName="vlrAnoAnterior" 
                                VisibleIndex="2" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="2012" FieldName="vlrAnoAtual" 
                                VisibleIndex="3" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="vlr. Dif." FieldName="vlrDiferenca" 
                                VisibleIndex="4" Width="80px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="%" FieldName="clrCresc" VisibleIndex="5" 
                                Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="400" ShowFilterBar="Auto" 
                            ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <SettingsText Title="Análise Vendas Mesmos Dias" />
                        <Styles>
	                        <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                        <Header Font-Bold="True" HorizontalAlign="Center">
                            </Header>
	                        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                            <Footer Font-Bold="True">
                            </Footer>
                            <TitlePanel Font-Size="Medium">
                            </TitlePanel>
                        </Styles>

                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="dsVendaDia" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="Vendas.uspAtualizarAnaliseHora_SemPascoa" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="LojaCorp" SessionField="sLOJA_CORP" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="gerManager" Anotacao2="Vendas.uspBuscarVendasAnaliseHora_SemPascoa" />
                    <br />
                </td>
                <td style="vertical-align: top">
                    <dx:ASPxGridView ID="gridLojaLoja" runat="server" AutoGenerateColumns="False" DataSourceID="dsLojaLoja" EnableTheming="True" KeyFieldName="Descricao" Theme="DevEx" Width="350px" Visible="False">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr3" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlr4" SummaryType="Custom" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Filial" FieldName="Descricao" VisibleIndex="1" Width="150px">
                                <Settings AllowAutoFilter="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="2011" FieldName="vlr1" VisibleIndex="2" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>

                                <Settings AutoFilterCondition="NotEqual" />

                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="2012" FieldName="vlr2" VisibleIndex="3" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="vlr. Dif." FieldName="vlr3" VisibleIndex="4" Width="80px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="%" FieldName="vlr4" VisibleIndex="5" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFilterBar="Auto" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" ShowTitlePanel="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="400" />
                        <SettingsText Title="Análise Vendas Mesmos Dias - Por Loja" />
                        <Styles>
                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                            </FocusedRow>
                            <Header Font-Bold="True" HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <Footer Font-Bold="True">
                            </Footer>
                            <TitlePanel Font-Size="Medium">
                            </TitlePanel>
                        </Styles>
                    </dx:ASPxGridView>

                 <asp:SqlDataSource ID="dsLojaLoja" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                        SelectCommand="DW_Buscar.uspVendaSemPascoa_TodasLojas" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="mes" SessionField="sMES" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </td>
                <td align="left" valign="top">
                    &nbsp;</td>
            </tr> <%--Grids--%>
                 <tr>
                     <td align="left" style="width: 90px" valign="top">&nbsp;</td>
                     <td style="vertical-align: top">&nbsp;</td>
                     <td align="left" valign="top">&nbsp;</td>
                 </tr>
                 <tr>
                     <td align="left" colspan="2" valign="top">

                         <dx:ASPxGridView ID="gridSecao" runat="server" AutoGenerateColumns="False" DataSourceID="dsSecao" EnableTheming="True" KeyFieldName="Descricao" Theme="Default" Width="550px" Visible="False">
                             <TotalSummary>
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr1" SummaryType="Sum" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2" SummaryType="Sum" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr3" SummaryType="Sum" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlr4" SummaryType="Custom" />
                             </TotalSummary>
                             <Columns>
                                 <dx:GridViewDataTextColumn Caption="Seção" FieldName="Descricao" VisibleIndex="1" Width="220px">
                                     <Settings AllowAutoFilter="False" />
                                     <CellStyle Wrap="False">
                                     </CellStyle>
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="2011" FieldName="vlr1" VisibleIndex="2" Width="115px">
                                     <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                     </PropertiesTextEdit>
                                     <Settings AutoFilterCondition="NotEqual" />
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="2012" FieldName="vlr2" VisibleIndex="3" Width="115px">
                                     <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                     </PropertiesTextEdit>
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="vlr. Dif." FieldName="vlr3" VisibleIndex="4" Width="90px">
                                     <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                     </PropertiesTextEdit>
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="%" FieldName="vlr4" VisibleIndex="5" Width="60px">
                                     <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                     </PropertiesTextEdit>
                                 </dx:GridViewDataTextColumn>
                             </Columns>
                             <SettingsBehavior AllowFocusedRow="True" />
                             <SettingsPager Mode="ShowAllRecords">
                             </SettingsPager>
                             <Settings  ShowFooter="False" ShowTitlePanel="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="500" />
                             <SettingsText Title="Análise Vendas Mesmos Dias - Por Seção" />
                             <Styles>
                                 <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                                 </FocusedRow>
                                 <Header Font-Bold="True" HorizontalAlign="Center">
                                 </Header>
                                 <AlternatingRow BackColor="#EEEEEE">
                                 </AlternatingRow>
                                 <Footer Font-Bold="True">
                                 </Footer>
                                 <TitlePanel Font-Size="Medium" Font-Bold="True" ForeColor="Black">
                                 </TitlePanel>
                             </Styles>
                         </dx:ASPxGridView>
                     </td>
                     <td align="left" valign="top">&nbsp;</td>
                 </tr>
                 <tr>
                     <td align="left" style="width: 90px" valign="top">
                         <asp:SqlDataSource ID="dsSecao" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="DW_Buscar.VendaSemPascoaPorSecao" SelectCommandType="StoredProcedure">
                             <SelectParameters>
                                 <asp:SessionParameter Name="ano" SessionField="sANO" Type="Int16" />
                                 <asp:SessionParameter Name="mes" SessionField="sMES" Type="Byte" />
                                
                             </SelectParameters>
                         </asp:SqlDataSource>
                     </td>
                     <td style="vertical-align: top">&nbsp;</td>
                     <td align="left" valign="top">&nbsp;</td>
                 </tr>
        </table>
    <uc1:wucObsPrograma style="clear :both " runat="server" ID="idOBS" Anotacao1="Produtos que compõem a cesta de Páscoa e foram excluidos"      />
            <br />
            <asp:Image ID="Image1" runat="server" ImageUrl="~/image/Lista_Pascoa.png" />

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

