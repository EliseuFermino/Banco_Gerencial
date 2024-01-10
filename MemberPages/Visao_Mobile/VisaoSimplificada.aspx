<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VisaoSimplificada.aspx.vb" Inherits="MemberPages_Visao_Mobile_VisaoSimplificada" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges.State" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>

<%@ Register Src="../../Controles/wucListaDia.ascx" TagName="wucListaDia" TagPrefix="uc5" %>
<%@ Register Src="../../Controles/wucBotaoAtualizar.ascx" TagName="wucBotaoAtualizar" TagPrefix="uc2" %>
<%@ Register Src="../../Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>
<%@ Register Src="../../Controles/wucLista_Filial_Empresa_1.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa_1" %>
<%@ Register Src="../../Controles/wucLista_Filial_Empresa_2.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa_2" %>
<%@ Register Src="../../Controles/wucLista_Filial_Postos.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Postos" %>
<%@ Register Src="../../Controles/wuciListaMes.ascx" TagName="wuciListaMes" TagPrefix="uc1" %>
<%@ Register Src="../../Controles/wucAno.ascx" TagName="wucAno" TagPrefix="uc2" %>
<%@ Register Src="../../Controles/wuc_KPI_Secao_Depto.ascx" TagPrefix="uc1" TagName="wuc_KPI_Secao_Depto" %>
<%@ Register Src="../../Controles/wuciListaLojasComApoio.ascx" TagName="wuciListaLojasComApoio" TagPrefix="uc3" %>
<%@ Register Src="../../Controles/wuciListaSemana.ascx" TagName="wuciListaSemana" TagPrefix="uc4" %>
<%@ Register Src="../../Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>

<%@ Register Src="../../Controles/wuciListaMes.ascx" TagName="wuciListaMes" TagPrefix="uc4" %>
<%@ Register Src="../../Controles/wucSize.ascx" TagName="wucSize" TagPrefix="uc3" %>
<%@ Register Src="../../Controles/wucAno_2_Anos.ascx" TagPrefix="uc1" TagName="wucAno_2_Anos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container justify-content-center">
        <div class="row col-md-12 justify-content-center text-center">
            <div class="row col-md-10 justify-content-center text-center" style="padding-bottom: 25px">
                <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 15px 5px 15px 1px; min-width: 60px" runat="server" id="divMenu_1">
                    <asp:Button ID="btnMenu_1" Height="30px" CssClass="btn btn-sm" Text="Análise Hora" ForeColor="White" Font-Size="X-Small" AutoPostBack="False" runat="server" OnClick="btnMenu_1_Click" Style="background-repeat: round" />
                    <%--#78A795 cor verde--%>
                </div>
                <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 15px 5px 15px 1px" runat="server" id="divMenu_2">
                    <asp:Button ID="btnMenu_2" Height="30px" CssClass="btn btn-sm" Text="Acompanhamento" ForeColor="White" Font-Size="X-Small" AutoPostBack="False" runat="server" OnClick="btnMenu_2_Click" Style="background-repeat: round" />
                </div>
                <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 15px 5px 15px 1px" runat="server" id="divMenu_3">
                    <asp:Button ID="btnMenu_3" Height="30px" CssClass="btn btn-sm" Text="Acumulado Mês" ForeColor="White" Font-Size="X-Small" AutoPostBack="False" runat="server" OnClick="btnMenu_3_Click" Style="background-repeat: round" />
                </div>
                <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 15px 5px 15px 1px" runat="server" id="divMenu_4">
                    <asp:Button ID="btnMenu_6" Height="30px" CssClass="btn btn-sm" Text="Acumulado Ano" ForeColor="White" Font-Size="X-Small" AutoPostBack="False" runat="server" OnClick="btnMenu_6_Click" Style="background-repeat: round" />
                </div>
                <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 15px 5px 15px 1px" runat="server" id="div1">
                    <asp:Button ID="btnMenu_4" Height="30px" CssClass="btn btn-sm" Text="Lucro Negativo" ForeColor="White" Font-Size="X-Small" AutoPostBack="False" runat="server" OnClick="btnMenu_4_Click" Style="background-repeat: round" />
                </div>
                <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 15px 5px 15px 1px" runat="server" id="divMenu_5" visible="false">
                    <asp:Button ID="btnMenu_5" Height="30px" CssClass="btn btn-sm" Text="50 Itens mais vendidos" ForeColor="White" Font-Size="X-Small" AutoPostBack="False" runat="server" OnClick="btnMenu_5_Click" Style="background-repeat: round" />
                </div>
                <div class="col-auto justify-content-center" style="justify-content: space-between; padding: 15px 5px 15px 15px" runat="server" visible="false" id="divSair">
                    <asp:Button runat="server" ID="btnSair" Height="30px" OnClick="btnSair_Click" autopostback="false" Font-Size="X-Small" CssClass="btn btn-danger btn-sm" Text="Sair (Visão PC)" />
                </div>
            </div>
        </div>
    </div>

    <%--Menu Analise Hora--%>
    <div class="justify-content-center" runat="server" id="divAnalise" style="padding: 0 10px 0 10px;">

        <dx:ASPxTimer ID="ASPxTimer2" runat="server" Interval="60000">
            <ClientSideEvents Tick="function(s, e) {   cbPanel2.PerformCallback()  ;  }" />
        </dx:ASPxTimer>

        <section id="sec_Header">
            <div class="row justify-content-sm-center" style="padding-bottom: 4px">
                <div class="col col-auto sm" style="width: 130px; padding-right: 2px">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <div class="input-group-text sm-2">Ano</div>
                        </div>
                        <asp:DropDownList class="form-control" ID="selAnoMenu1" runat="server" DataTextField="Desc"></asp:DropDownList>
                    </div>
                </div>
                <div class="col col-auto sm" style="width: 140px; padding-right: 2px; padding-bottom: 25px">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <div class="input-group-text sm-2">Mês</div>
                        </div>
                        <asp:DropDownList class="form-control" ID="selMesMenu1" runat="server" DataTextField="Desc">
                            <asp:ListItem Text="Janeiro" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Fevereiro" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Março" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Abril" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Maio" Value="5"></asp:ListItem>
                            <asp:ListItem Text="Junho" Value="6"></asp:ListItem>
                            <asp:ListItem Text="Julho" Value="7"></asp:ListItem>
                            <asp:ListItem Text="Agosto" Value="8"></asp:ListItem>
                            <asp:ListItem Text="Setembro" Value="9"></asp:ListItem>
                            <asp:ListItem Text="Outubro" Value="10"></asp:ListItem>
                            <asp:ListItem Text="Novembro" Value="11"></asp:ListItem>
                            <asp:ListItem Text="Dezembro" Value="12"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div id="div_optEmpresa" class="col-auto justify-content-center" style="justify-content: space-between">
                    <dx:ASPxRadioButton ID="rndEmpresa" runat="server" AutoPostBack="True" Checked="True" GroupName="grpCorpLojas" Text="Empresa" Theme="DevEx"></dx:ASPxRadioButton>
                </div>

                <div id="div_optFilial" class="col-auto justify-content-center" style="justify-content: space-between">
                    <dx:ASPxRadioButton ID="rndFilial" runat="server" AutoPostBack="True" GroupName="grpCorpLojas" Text="Filial" Theme="DevEx"></dx:ASPxRadioButton>
                </div>

                <div id="divFilial" class="col-auto justify-content-center" style="justify-content: space-between">
                    <uc3:wuciListaLojasComApoio ID="cboFilial" runat="server" Visible="False" />
                </div>

                <div class="col col-auto sm" style="width: 155px; padding-right: 2px">
                    <div class="input-group input-group-sm">
                        <div class="input-group-prepend">
                            <div class="input-group-text sm-2">Semana</div>
                        </div>
                        <asp:DropDownList class="form-control" ID="selSemanaMenu1" runat="server" DataTextField="Desc">
                            <asp:ListItem Text="Domingo" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Segunda" Value="2"></asp:ListItem>
                            <asp:ListItem Text="Terça" Value="3"></asp:ListItem>
                            <asp:ListItem Text="Quarta" Value="4"></asp:ListItem>
                            <asp:ListItem Text="Quinta" Value="5"></asp:ListItem>
                            <asp:ListItem Text="Sexta" Value="6"></asp:ListItem>
                            <asp:ListItem Text="Sábado" Value="7"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="col-auto justify-content-center" style="padding-left: 15px;">
                    <dx:ASPxButton ID="ASPxButton1" Text="Atualizar" runat="server" AutoPostBack="False">
                        <ClientSideEvents Click="function(s, e) {cbPanel2.PerformCallback();}" />
                    </dx:ASPxButton>
                </div>
            </div>
        </section>

        <section id="sec_Dados">
            <dx:ASPxCallbackPanel ID="cbPanel2" runat="server" Width="100%" ClientInstanceName="cbPanel2" Theme="Metropolis" Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
                <Images>
                    <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
                </Images>

                <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
                <PanelCollection>
                    <dx:PanelContent>

                        <div id="divDados_1">

                            <dx:ASPxPivotGrid ID="grid" runat="server" ClientIDMode="AutoID"
                                DataSourceID="dsDados" EnableTheming="True" Theme="DevEx" Width="100%" Font-Size="X-Small">
                                <Fields>
                                    <dx:PivotGridField ID="fieldDayofWeek" Area="ColumnArea" AreaIndex="0"
                                        Caption="Dia da Semana" FieldName="Day_of_Week"
                                        Options-AllowExpand="False" AllowedAreas="ColumnArea" Options-AllowDrag="False"
                                        Options-AllowFilter="False" Options-AllowSort="False">
                                        <ValueStyle BackColor="#999999" Font-Bold="True" ForeColor="White">
                                        </ValueStyle>
                                    </dx:PivotGridField>
                                    <dx:PivotGridField ID="fielddescHI" Area="RowArea" AreaIndex="0"
                                        Caption="Horas" FieldName="descHI" Options-AllowFilter="False"
                                        Options-AllowSort="True">
                                    </dx:PivotGridField>
                                    <dx:PivotGridField ID="fieldData" AllowedAreas="ColumnArea" Area="ColumnArea"
                                        AreaIndex="2" Caption="Dia" FieldName="Data" Options-AllowExpand="False"
                                        Options-AllowFilter="False" Options-AllowSort="False"
                                        Options-AllowSortBySummary="True" SortMode="Value" SortOrder="Descending">
                                    </dx:PivotGridField>
                                    <dx:PivotGridField ID="fieldAnoReduzido" AllowedAreas="ColumnArea"
                                        Area="ColumnArea" AreaIndex="3" Caption="Ano" FieldName="AnoReduzido"
                                        Options-AllowExpand="False" Options-AllowSort="True" SortMode="Value">
                                        <ValueStyle Font-Bold="True">
                                        </ValueStyle>
                                    </dx:PivotGridField>
                                    <dx:PivotGridField ID="fieldperc" Area="DataArea" AreaIndex="0"
                                        CellFormat-FormatString="{0:n2}" CellFormat-FormatType="Numeric"
                                        FieldName="perc" Options-ShowCustomTotals="False"
                                        Options-ShowGrandTotal="False" Options-ShowTotals="False"
                                        TotalsVisibility="None" AllowedAreas="DataArea" Options-AllowDrag="False"
                                        Options-AllowExpand="False" Options-AllowFilter="False"
                                        Options-AllowSort="False">
                                    </dx:PivotGridField>
                                    <dx:PivotGridField ID="fieldSemana" Area="ColumnArea" AreaIndex="1"
                                        FieldName="Semana" Options-AllowExpand="False" Options-AllowFilter="False"
                                        Options-AllowSort="False" AllowedAreas="ColumnArea"
                                        Options-AllowDrag="False">
                                        <ValueStyle BackColor="#AEAEAE" ForeColor="White">
                                        </ValueStyle>
                                    </dx:PivotGridField>
                                </Fields>
                                <OptionsView ShowFilterHeaders="False" />
                                <OptionsPager RowsPerPage="20">
                                </OptionsPager>
                                <OptionsLoadingPanel Text="Aguarde. Atualizando...&amp;hellip;">
                                </OptionsLoadingPanel>
                            </dx:ASPxPivotGrid>

                            <asp:SqlDataSource ID="dsDados" runat="server"
                                ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>"
                                SelectCommand="Vendas.uspViewVendaHoras_Celular" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="diaSemana" SessionField="sDIASEMANA" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>

                        <br />
                        <br />

                        <div id="divDados_2">
                            <dx:ASPxGridView ID="ASPxGridView2" runat="server" DataSourceID="dsVendaDia"
                                AutoGenerateColumns="False" Width="100%" EnableTheming="True" Theme="DevEx"
                                KeyFieldName="DiaReduzido" Font-Size="X-Small">
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr1"
                                        SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2"
                                        SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr3"
                                        SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlr4"
                                        SummaryType="Custom" />
                                </TotalSummary>
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Dia" FieldName="numDia"
                                        VisibleIndex="0" MinWidth="60" SortIndex="0" SortOrder="Ascending">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Desc" FieldName="DescDia"
                                        VisibleIndex="1" MinWidth="60">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2011" FieldName="vlr1"
                                        VisibleIndex="2" MinWidth="90">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2012" FieldName="vlr2"
                                        VisibleIndex="3" MinWidth="90">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="vlr. Dif." FieldName="vlr3"
                                        VisibleIndex="4" MinWidth="80">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="vlr4" VisibleIndex="5"
                                        MinWidth="60">
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
                                    <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"></FocusedRow>
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
                                SelectCommand="[Vendas].uspAtualizarAnaliseHora" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </section>

    </div>

    <%--Menu Acompanhamento--%>
    <div class="justify-content-center" runat="server" id="divAcomp" visible="false" style="padding: 0 10px 0 10px">
        <div class="row col-md-12 justify-content-center text-center">
            <div class="row col-md-10 justify-content-center text-center" style="padding-bottom: 15px">
                <div id="divBotaoAtualizar" class="col-auto justify-content-center" style="justify-content: space-between; padding: 15px 15px 15px 15px">
                    <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="MetropolisBlue" AutoPostBack="false" Width="80px">
                        <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
                    </dx:ASPxButton>
                </div>

                <div id="divSelecaoDia" class="col-auto justify-content-center" style="justify-content: space-between; padding: 15px 15px 15px 15px">
                    <uc5:wucListaDia ID="cboDia" runat="server" />
                </div>

            </div>
        </div>

        <dx:ASPxTimer ID="ASPxTimer1" runat="server" Interval="60000">
            <ClientSideEvents Tick="function(s, e) {   cbPanel.PerformCallback()  ;  }" />
        </dx:ASPxTimer>

        <dx:ASPxCallbackPanel ID="cbPanel" runat="server" ClientInstanceName="cbPanel" Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
            <Images>
                <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
            </Images>
            <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

                    <div id="divRankingMes" runat="server">

                        <div id="divRanking_Loja_Total" class="col-12">

                            <dx:ASPxGridView ID="gridRankingTotal" runat="server"
                                AutoGenerateColumns="False" Font-Size="X-Small" KeyFieldName="Descricao"
                                Theme="SoftOrange" EnableTheming="True" Width="100%" DataSourceID="dsVendaLojaTotal">
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifCresc" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestaoVenda" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientes" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargem" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOut" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="NumClientes" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaMargem" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargem" SummaryType="Custom" />

                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVendaClube" SummaryType="Custom" />

                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaFunc" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="vlrTicketMedio" SummaryType="Custom" />

                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemClube" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOutClube" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientesClube" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="vlrTicketMedioClube" SummaryType="Custom" />

                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaCheckout"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMetragem"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargemSellOutKit" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOutKit" SummaryType="Custom" />
                                </TotalSummary>
                                <GroupSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestao"
                                        ShowInGroupFooterColumn="vlrSugestao" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda"
                                        ShowInGroupFooterColumn="vlrMetaVenda" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda"
                                        ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaLucro"
                                        ShowInGroupFooterColumn="vlrMetaLucro" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem"
                                        ShowInGroupFooterColumn="vlrMargem" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro"
                                        ShowInGroupFooterColumn="difLucro" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="NumClientes"
                                        ShowInGroupFooterColumn="NumClientes" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting"
                                        ShowInGroupFooterColumn="percAting" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro"
                                        ShowInGroupFooterColumn="percAtingLucro" SummaryType="Custom" />
                                </GroupSummary>
                                <EditFormLayoutProperties ColCount="1">
                                </EditFormLayoutProperties>
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Desc." FieldName="Descricao" VisibleIndex="0" FixedStyle="Left" MinWidth="85" Width="130px">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Left" Wrap="False" Paddings-PaddingRight="1px">
                                            <Paddings PaddingRight="1px"></Paddings>

                                            <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="1">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealAA" ToolTip="Venda do Ano Anterior (mesmo dia da semana)" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% de&lt;br&gt;Cresc" FieldName="percDifCresc" VisibleIndex="1" MinWidth="60" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>

                                    <dx:GridViewBandColumn Caption="Vendas" VisibleIndex="2"
                                        ToolTip="Grupo de vendas (Meta - Total)">
                                        <Columns>

                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda"
                                                VisibleIndex="0" ToolTip="Valor da meta revista de venda que foi replanejada.">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#009900" ForeColor="White" />
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                                <GroupFooterCellStyle ForeColor="#009900">
                                                </GroupFooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrRealVenda"
                                                VisibleIndex="1" ToolTip="Valor da venda realizada.">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                                <GroupFooterCellStyle ForeColor="Blue">
                                                </GroupFooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="%&lt;br&gt;Ating." FieldName="percAting"
                                                ToolTip="Percentual de atingimento (meta x realizado)" VisibleIndex="8" UnboundType="Decimal" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>


                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                    </dx:GridViewBandColumn>

                                    <dx:GridViewBandColumn Caption="% Margem Final" VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMetaMargemFinal" ToolTip="Meta" VisibleIndex="0" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                <CellStyle>
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Real" FieldName="percRealMargemSellOut" ToolTip="Margem com Sell-Out" VisibleIndex="1" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#003399" ForeColor="White" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Dif." FieldName="difMargemFinal" VisibleIndex="2" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle BackColor="#666666" />
                                    </dx:GridViewBandColumn>

                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />

                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Settings VerticalScrollBarMode="Hidden"
                                    ShowGroupFooter="VisibleAlways" ShowVerticalScrollBar="False"
                                    ShowFooter="False" HorizontalScrollBarMode="Hidden" />
                                <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
                                <SettingsText EmptyDataRow="Não há vendas realizadas para este dia." />
                                <FormatConditions>
                                    <dx:GridViewFormatConditionIconSet FieldName="percDifCresc" Format="PositiveNegativeArrowsColored" />
                                    <dx:GridViewFormatConditionIconSet FieldName="percAting" Format="PositiveNegativeTriangles" />

                                    <dx:GridViewFormatConditionTopBottom Threshold="10">
                                    </dx:GridViewFormatConditionTopBottom>
                                    <dx:GridViewFormatConditionIconSet Format="Quarters5" />

                                </FormatConditions>
                                <Styles>
                                    <FocusedRow BackColor="#66ffff" ForeColor="#0066FF" Font-Bold="true"></FocusedRow>
                                    <Header HorizontalAlign="Center">
                                    </Header>
                                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                    <Footer Font-Bold="True">
                                    </Footer>
                                </Styles>

                            </dx:ASPxGridView>

                            <asp:SqlDataSource ID="dsVendaLojaTotal" runat="server"
                                ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>"
                                SelectCommand="Ranking.biRankingDiarioTotalizador"
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="dia" SessionField="sDIA" DbType="Date" />

                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>

                        <br />
                        <br />

                        <div id="divRanking_Loja" class="Separacao">

                            <dx:ASPxGridView ID="ASPxGridView1" runat="server"
                                AutoGenerateColumns="False" EnableTheming="True" Font-Size="X-Small" KeyFieldName="Descricao"
                                Theme="SoftOrange" Width="100%" DataSourceID="dsVendaLoja">
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifCresc" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestaoVenda" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientes" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargem" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOut" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="NumClientes" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaMargem" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargem" SummaryType="Custom" />

                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVendaClube" SummaryType="Custom" />

                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaFunc" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="vlrTicketMedio" SummaryType="Custom" />

                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemClube" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOutClube" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientesClube" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="vlrTicketMedioClube" SummaryType="Custom" />

                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaCheckout"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMetragem"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargemSellOutKit" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOutKit" SummaryType="Custom" />
                                </TotalSummary>
                                <GroupSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestao"
                                        ShowInGroupFooterColumn="vlrSugestao" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda"
                                        ShowInGroupFooterColumn="vlrMetaVenda" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda"
                                        ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaLucro"
                                        ShowInGroupFooterColumn="vlrMetaLucro" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem"
                                        ShowInGroupFooterColumn="vlrMargem" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro"
                                        ShowInGroupFooterColumn="difLucro" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="NumClientes"
                                        ShowInGroupFooterColumn="NumClientes" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting"
                                        ShowInGroupFooterColumn="percAting" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro"
                                        ShowInGroupFooterColumn="percAtingLucro" SummaryType="Custom" />
                                </GroupSummary>
                                <EditFormLayoutProperties ColCount="1">
                                </EditFormLayoutProperties>
                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="Desc." FieldName="Descricao" VisibleIndex="0" FixedStyle="Left" MinWidth="105">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle HorizontalAlign="Left" Wrap="False" Paddings-PaddingRight="1px">
                                            <Paddings PaddingRight="1px"></Paddings>

                                            <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="1">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealAA" ToolTip="Venda do Ano Anterior (mesmo dia da semana)" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% de&lt;br&gt;Cresc" FieldName="percDifCresc" VisibleIndex="1" MinWidth="60">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>

                                    <dx:GridViewBandColumn Caption="Vendas" VisibleIndex="2"
                                        ToolTip="Grupo de vendas (Meta - Total)">
                                        <Columns>

                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda"
                                                VisibleIndex="0" ToolTip="Valor da meta revista de venda que foi replanejada.">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#009900" ForeColor="White" />
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                                <GroupFooterCellStyle ForeColor="#009900">
                                                </GroupFooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrRealVenda"
                                                VisibleIndex="1" ToolTip="Valor da venda realizada.">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                                <GroupFooterCellStyle ForeColor="Blue">
                                                </GroupFooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="%&lt;br&gt;Atingimento" FieldName="percAting"
                                                ToolTip="Percentual de atingimento (meta x realizado)" VisibleIndex="8" UnboundType="Decimal">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                                    </dx:GridViewBandColumn>

                                    <dx:GridViewBandColumn Caption="% Margem Final" VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMetaMargemFinal" ToolTip="Meta" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                <CellStyle>
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Real" FieldName="percRealMargemSellOut" ToolTip="Margem com Sell-Out" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#003399" ForeColor="White" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Dif." FieldName="difMargemFinal" VisibleIndex="2">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle BackColor="#666666" />
                                    </dx:GridViewBandColumn>

                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />

                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Settings VerticalScrollBarMode="Visible"
                                    ShowGroupFooter="VisibleAlways" VerticalScrollableHeight="300"
                                    ShowFooter="False" HorizontalScrollBarMode="Hidden" />
                                <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
                                <SettingsText EmptyDataRow="Não há vendas realizadas para este dia." />
                                <FormatConditions>
                                    <dx:GridViewFormatConditionIconSet FieldName="percDifCresc" Format="PositiveNegativeArrowsColored" />
                                    <dx:GridViewFormatConditionIconSet FieldName="percAting" Format="PositiveNegativeTriangles" />

                                    <dx:GridViewFormatConditionTopBottom Threshold="10">
                                    </dx:GridViewFormatConditionTopBottom>
                                    <dx:GridViewFormatConditionIconSet Format="Quarters5" />

                                </FormatConditions>
                                <Styles>
                                    <FocusedRow BackColor="#66ffff" ForeColor="#0066FF" Font-Bold="true"></FocusedRow>
                                    <Header HorizontalAlign="Center">
                                    </Header>
                                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                    <Footer Font-Bold="True">
                                    </Footer>
                                </Styles>

                            </dx:ASPxGridView>

                            <asp:SqlDataSource ID="dsVendaLoja" runat="server"
                                ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>"
                                SelectCommand="Vendas.uspBuscarVendaAcompanhamento"
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="dia" SessionField="sDIA" DbType="Date" />
                                    <asp:SessionParameter Name="idUsuario" SessionField="sUSUARIO" DbType="String" />

                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div class="Quebra_Pagina_Row">

                            <br />
                            <br />

                            <div class="row col-md-12 justify-content-center text-center">
                                <div class="row col-md-10 justify-content-center text-center" style="padding-bottom: 15px">
                                    <div class="widget-box">
                                        <div class="widget-header">
                                            <h6 class="widget-title"><span class="fa fa-desktop"></span>&nbsp; Projeção de Vendas</h6>
                                        </div>

                                        <div class="widget-body" style="overflow-x: auto">
                                            <div class="widget-main">

                                                <dx:ASPxGridView ID="gridProjecao" runat="server" AutoGenerateColumns="False" DataSourceID="dsProjecao" EnableTheming="True" Theme="Mulberry" Width="100%" Font-Size="Large">
                                                    <SettingsBehavior AllowFocusedRow="True" />
                                                    <SettingsText Title="Projeção Venda Hoje" />
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Projeção Venda" FieldName="vlrProjecao" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle HorizontalAlign="Right">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Crescim. AA" FieldName="percCresc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Ating. Meta" FieldName="percMeta" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Período" FieldName="myDesc" ShowInCustomizationForm="True" VisibleIndex="0">
                                                            <CellStyle HorizontalAlign="Left" Wrap="False">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <FormatConditions>
                                                        <dx:GridViewFormatConditionIconSet FieldName="percCresc" Format="PositiveNegativeArrowsColored" />
                                                        <dx:GridViewFormatConditionIconSet FieldName="percMeta" Format="PositiveNegativeTriangles" />
                                                    </FormatConditions>
                                                    <Styles>
                                                        <Header Font-Bold="False" BackColor="#009900" ForeColor="White" Font-Size="Small">
                                                        </Header>
                                                        <AlternatingRow BackColor="#EAEAEA">
                                                        </AlternatingRow>
                                                        <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                        </FocusedRow>
                                                        <Cell Font-Size="Small" HorizontalAlign="Center">
                                                        </Cell>
                                                    </Styles>
                                                </dx:ASPxGridView>
                                                <asp:SqlDataSource ID="dsProjecao" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Buscar_Projecao_Vendas_Diarias" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="Departamento" SessionField="sDEPARTAMENTO" Type="String" />
                                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>

                    <%-- ********************* L U C R O   N E G A T I V O ************************* --%>

                    <div id="divLucroNegativo" runat="server">

                        <div id="divTop30_Lucro_Negativo" class="Separacao_Separacao">
                            <dx:ASPxGridView ID="grid_Top30_Lucro_Negativo" ClientInstanceName="grid_Top30_Lucro_Negativo" runat="server" DataSourceID="ds_Top30_Lucro_Negativo"
                                AutoGenerateColumns="False" Width="100%" Font-Size="X-Small" KeyFieldName="CodProduto" Theme="SoftOrange" EnableTheming="True">
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

                                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialDesc" ShowInCustomizationForm="True" ToolTip="Descrição da Filial" VisibleIndex="0" MinWidth="180">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ToolTip="Código do produto" VisibleIndex="1">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ToolTip="Nome do produto" VisibleIndex="2" SortIndex="0" SortOrder="Ascending" MinWidth="250">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Vendas" VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ToolTip="Valor da venda de cada item" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <CellStyle Font-Bold="True" ForeColor="Blue">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Preço Venda" FieldName="precoVenda" UnboundType="Decimal" VisibleIndex="2">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#999999" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final " VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>

                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Settings VerticalScrollableHeight="460" VerticalScrollBarMode="Visible" ShowTitlePanel="True" ShowFilterRow="True" ShowFooter="True" />
                                <SettingsText Title="Todos Itens com Lucro Negativo na Empresa" />
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoVenda" SummaryType="Average" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercial" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut_Kit" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                </TotalSummary>
                                <Styles>
                                    <Header HorizontalAlign="Center">
                                    </Header>
                                    <AlternatingRow BackColor="#F2F2F2">
                                    </AlternatingRow>
                                    <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                    </FocusedRow>
                                    <TitlePanel BackColor="#660066" ForeColor="White" Font-Size="X-Large">
                                    </TitlePanel>
                                </Styles>
                            </dx:ASPxGridView>

                            <asp:SqlDataSource ID="ds_Top30_Lucro_Negativo" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Lucro_Negativo" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                    <asp:SessionParameter DbType="Int16" DefaultValue="99" Name="idFilial" SessionField="sFILIAL_LUCRO_NEGATIVO" />
                                    <asp:SessionParameter Name="idUsuario" SessionField="sUSUARIO" DbType="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>

                        <p></p>

                        <div id="div_Top30_Lucro_Negativa_Lojas_ate5" class="Separacao">
                            <dx:ASPxGridView ID="grid_Top30_Lucro_Negativo_ate5" ClientInstanceName="grid_Top30_Lucro_Negativo_ate5" runat="server" AutoGenerateColumns="False"
                                DataSourceID="ds_Top30_Lucro_Negativo_ate5" Theme="SoftOrange" EnableTheming="True" Width="100%" Font-Size="X-Small" KeyFieldName="CodProduto">
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

                                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialDesc" ShowInCustomizationForm="True" ToolTip="Descrição da Filial" VisibleIndex="0" MinWidth="180">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ToolTip="Código do produto" VisibleIndex="1">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ToolTip="Nome do produto" VisibleIndex="2" SortIndex="0" SortOrder="Ascending" MinWidth="250">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Vendas" VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ToolTip="Valor da venda de cada item" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <CellStyle Font-Bold="True" ForeColor="Blue">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Preço Venda" FieldName="precoVenda" UnboundType="Decimal" VisibleIndex="2">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <HeaderStyle BackColor="#999999" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final " VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowAutoFilter="False" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>

                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Settings VerticalScrollableHeight="460" VerticalScrollBarMode="Visible" ShowTitlePanel="True" ShowFilterRow="True" ShowFooter="True" />
                                <SettingsText Title="Todos Itens com Margem Final na Empresa entre 0,00% a 5,00%" />
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoVenda" SummaryType="Average" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercial" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut_Kit" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                </TotalSummary>
                                <Styles>
                                    <Header HorizontalAlign="Center">
                                    </Header>
                                    <AlternatingRow BackColor="#F2F2F2">
                                    </AlternatingRow>
                                    <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                    </FocusedRow>
                                    <TitlePanel BackColor="#FF6600" ForeColor="White" Font-Size="X-Large">
                                    </TitlePanel>
                                </Styles>
                            </dx:ASPxGridView>

                            <asp:SqlDataSource ID="ds_Top30_Lucro_Negativo_ate5" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Lucro_Ate5" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                    <asp:SessionParameter DbType="Int16" DefaultValue="99" Name="idFilial" SessionField="sFILIAL_LUCRO_NEGATIVO" />
                                    <asp:SessionParameter Name="idUsuario" SessionField="sUSUARIO" DbType="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>

                    </div>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <%--Menu Acumulado Mês--%>
    <div class="justify-content-center" runat="server" id="divAcumulado" visible="false" style="padding: 0 10px 0 10px">
        <div class="row justify-content-sm-center" style="padding-bottom: 15px">
            <div class="col col-auto sm" style="width: 130px; padding-right: 2px">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <div class="input-group-text sm-2">Ano</div>
                    </div>
                    <asp:DropDownList class="form-control" ID="selAnoMenu3" runat="server" DataTextField="Desc"></asp:DropDownList>
                </div>
            </div>
            <div class="col col-auto sm" style="width: 130px; padding-right: 2px">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <div class="input-group-text sm-2">Mês</div>
                    </div>
                    <asp:DropDownList class="form-control" ID="selMesMenu3" runat="server" DataTextField="Desc">
                        <asp:ListItem Text="Janeiro" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Fevereiro" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Março" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Abril" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Maio" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Junho" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Julho" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Agosto" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Setembro" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Outubro" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Novembro" Value="11"></asp:ListItem>
                        <asp:ListItem Text="Dezembro" Value="12"></asp:ListItem>
                        <asp:ListItem Text="Ano" Value="99"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col col-auto sm" style="width: 130px; padding-right: 2px">
                <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Atualizar" AutoPostBack="false" Theme="MetropolisBlue">
                    <ClientSideEvents Click="function(s, e) { cbPanel3.PerformCallback(); }" />
                </dx:ASPxButton>
            </div>
        </div>

        <div class="divDados">
            <dx:ASPxCallbackPanel ID="cbPanel3" runat="server" Width="100%" ClientInstanceName="cbPanel3" Theme="Metropolis" Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
                <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>

                <Images>
                    <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
                </Images>

                <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                        <div id="divRankingMensal_Total" class="col-12">

                            <dx:ASPxGridView ID="gridTotalizador" runat="server"
                                AutoGenerateColumns="False" EnableTheming="True" Font-Size="X-Small" KeyFieldName="idFilial"
                                Theme="SoftOrange" Width="100%" ClientInstanceName="gridTotalizador"
                                DataSourceID="dsSuperTotalizador">

                                <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>


                                <SettingsBehavior AllowFocusedRow="True" />
                                <Styles>
                                    <Header ImageSpacing="5px" SortingImageSpacing="5px"></Header>
                                    <Footer Font-Bold="True">
                                    </Footer>
                                    <LoadingPanel ImageSpacing="10px"></LoadingPanel>
                                    <FocusedRow BackColor="#66ffff" ForeColor="#0066FF" Font-Bold="true"></FocusedRow>
                                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                </Styles>
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <SettingsText EmptyDataRow="Não informações atualizadas financeiras para este período." />

                                <Toolbars>
                                    <dx:GridViewToolbar EnableAdaptivity="true">
                                        <Items>
                                            <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                            <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                            <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                        </Items>
                                    </dx:GridViewToolbar>
                                </Toolbars>

                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealMeta" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA2" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargMeta" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargReal" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargCheia" SummaryType="Custom" />
                                </TotalSummary>
                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista"
                                        VisibleIndex="0" FixedStyle="Left">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewBandColumn Caption="Ano" VisibleIndex="1" Name="bandAtual">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta"
                                                VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrRea"
                                                VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="Blue" ForeColor="White" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dx:GridViewBandColumn>

                                    <dx:GridViewBandColumn Caption="Atingimento e Crescimento" VisibleIndex="2">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="% Prev" FieldName="percCresc_RealMeta"
                                                ToolTip="% de crescimento. Meta sobre o  Realizado" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <EditCellStyle>
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </EditCellStyle>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="2010" FieldName="percCresc_RealAA1"
                                                VisibleIndex="1" Name="bandCrescAA2">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                    </dx:GridViewBandColumn>

                                    <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMargMetaFinal" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Real " FieldName="percMargCheia" ShowInCustomizationForm="True" ToolTip="Percentual de Margem com SellOut" VisibleIndex="1" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#003399" ForeColor="White" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Dif." FieldName="percMargMetaFinalDif" ShowInCustomizationForm="True" VisibleIndex="2">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle BackColor="Gray" ForeColor="White" HorizontalAlign="Center" />
                                    </dx:GridViewBandColumn>

                                </Columns>

                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />

                                <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                <Settings VerticalScrollBarMode="Hidden" ShowGroupFooter="VisibleAlways" ShowVerticalScrollBar="False"
                                    ShowFooter="False" HorizontalScrollBarMode="Hidden" />
                                <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
                                <FormatConditions>
                                    <dx:GridViewFormatConditionIconSet FieldName="percDifCresc" Format="PositiveNegativeArrowsColored" />
                                    <dx:GridViewFormatConditionIconSet FieldName="percAting" Format="PositiveNegativeTriangles" />

                                    <dx:GridViewFormatConditionTopBottom Threshold="10">
                                    </dx:GridViewFormatConditionTopBottom>
                                    <dx:GridViewFormatConditionIconSet Format="Quarters5" />

                                </FormatConditions>
                                <Styles>
                                    <FocusedRow BackColor="#66ffff" ForeColor="#0066FF" Font-Bold="true"></FocusedRow>
                                    <Header HorizontalAlign="Center">
                                    </Header>
                                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                    <Footer Font-Bold="True">
                                    </Footer>
                                </Styles>
                            </dx:ASPxGridView>

                            <asp:SqlDataSource ID="dsSuperTotalizador" runat="server"
                                ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>"
                                SelectCommand="Mes.uspBuscarRankingMes_Totalizador" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>

                        <br />

                        <div id="divRankingMensal">

                            <dx:ASPxGridView ID="gridRankingMensal" runat="server" ClientInstanceName="gridRankingMensal"
                                AutoGenerateColumns="False"
                                DataSourceID="dsSuper" KeyFieldName="idFilial"
                                Theme="SoftOrange" Width="100%">

                                <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                                <SettingsAdaptivity>
                                    <AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
                                </SettingsAdaptivity>

                                <SettingsBehavior AllowFocusedRow="True" />
                                <Styles>
                                    <Header ImageSpacing="5px" SortingImageSpacing="5px"></Header>
                                    <Footer Font-Bold="True">
                                    </Footer>
                                    <LoadingPanel ImageSpacing="10px"></LoadingPanel>
                                    <FocusedRow BackColor="#66ffff" ForeColor="#0066FF" Font-Bold="true"></FocusedRow>
                                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                </Styles>
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <SettingsText EmptyDataRow="Não informações atualizadas financeiras para este período." />

                                <Toolbars>
                                    <dx:GridViewToolbar EnableAdaptivity="true">
                                        <Items>
                                            <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                            <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                            <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                        </Items>
                                    </dx:GridViewToolbar>
                                </Toolbars>

                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealMeta"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMA"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA1"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA3"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA2"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaAnual"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_MetaAnual"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargMeta" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargReal" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargCheia" SummaryType="Custom" />

                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemDif"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlrRea"
                                        SummaryType="Custom" />
                                </TotalSummary>

                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista"
                                        VisibleIndex="0" FixedStyle="Left">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewBandColumn Caption="Ano" VisibleIndex="1" Name="bandAtual">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta"
                                                VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrRea"
                                                VisibleIndex="3">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="Blue" ForeColor="White" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dx:GridViewBandColumn>

                                    <dx:GridViewBandColumn Caption="Atingimento e Crescimento" VisibleIndex="2">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="% Prev" FieldName="percCresc_RealMeta"
                                                ToolTip="% de crescimento. Meta sobre o  Realizado" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <EditCellStyle>
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </EditCellStyle>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="2010" FieldName="percCresc_RealAA1"
                                                VisibleIndex="4" Name="bandCrescAA2">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                    </dx:GridViewBandColumn>

                                    <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMargMetaFinal" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Real " FieldName="percMargCheia" ShowInCustomizationForm="True" ToolTip="Percentual de Margem com SellOut" VisibleIndex="1" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#003399" ForeColor="White" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Dif." FieldName="percMargMetaFinalDif" ShowInCustomizationForm="True" VisibleIndex="2">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle BackColor="Gray" ForeColor="White" HorizontalAlign="Center" />
                                    </dx:GridViewBandColumn>

                                </Columns>

                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                <Settings VerticalScrollBarMode="Visible"
                                    ShowGroupFooter="VisibleAlways" VerticalScrollableHeight="300"
                                    ShowFooter="False" HorizontalScrollBarMode="Hidden" />
                                <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
                                <SettingsText EmptyDataRow="Não há vendas realizadas para este dia." />
                                <FormatConditions>
                                    <dx:GridViewFormatConditionIconSet FieldName="percDifCresc" Format="PositiveNegativeArrowsColored" />
                                    <dx:GridViewFormatConditionIconSet FieldName="percAting" Format="PositiveNegativeTriangles" />

                                    <dx:GridViewFormatConditionTopBottom Threshold="10">
                                    </dx:GridViewFormatConditionTopBottom>
                                    <dx:GridViewFormatConditionIconSet Format="Quarters5" />

                                </FormatConditions>
                                <Styles>
                                    <FocusedRow BackColor="#66ffff" ForeColor="#0066FF" Font-Bold="true"></FocusedRow>
                                    <Header HorizontalAlign="Center">
                                    </Header>
                                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                    <Footer Font-Bold="True">
                                    </Footer>
                                </Styles>
                            </dx:ASPxGridView>

                            <asp:SqlDataSource ID="dsSuper" runat="server"
                                ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>"
                                SelectCommand="Mes.uspBuscarRankingMes" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

    </div>
    
    <%--Menu Acumulado Ano--%>
    <div class="justify-content-center" runat="server" id="divAcumuladoAno" visible="false" style="padding: 0 10px 0 10px">
        <div class="row justify-content-sm-center" style="padding-bottom: 15px">
            <div class="col col-auto sm" style="width: 130px; padding-right: 2px">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <div class="input-group-text sm-2">Ano</div>
                    </div>
                    <asp:DropDownList class="form-control" ID="selAnoMenu6" runat="server" DataTextField="Desc"></asp:DropDownList>
                </div>
            </div>
            <div class="col col-auto sm" style="width: 130px; padding-right: 2px">
                <dx:ASPxButton ID="ASPxButtonAno" runat="server" Text="Atualizar" AutoPostBack="false" Theme="MetropolisBlue">
                    <ClientSideEvents Click="function(s, e) { cbPanelAno.PerformCallback(); }" />
                </dx:ASPxButton>
            </div>
        </div>

        <div class="divDados">
            <dx:ASPxCallbackPanel ID="cbPanelAno" runat="server" Width="100%" ClientInstanceName="cbPanelAno" Theme="Metropolis" Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
                <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>

                <Images>
                    <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
                </Images>

                <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">


                        <div id="divRankingMensal_Total_Ano" class="col-12">

                            <dx:ASPxGridView ID="gridTotalizadorAno" runat="server" ClientInstanceName="gridTotalizadorAno"
                                AutoGenerateColumns="False" EnableTheming="True" Font-Size="X-Small"
                                DataSourceID="dsSuperTotalizadorAno" KeyFieldName="idFilial"
                                Theme="SoftOrange" Width="100%">

                                <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                                <SettingsAdaptivity>
                                    <AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
                                </SettingsAdaptivity>

                                <SettingsBehavior AllowFocusedRow="True" />
                                <Styles>
                                    <Header ImageSpacing="5px" SortingImageSpacing="5px"></Header>
                                    <Footer Font-Bold="True">
                                    </Footer>
                                    <LoadingPanel ImageSpacing="10px"></LoadingPanel>
                                    <FocusedRow BackColor="#66ffff" ForeColor="#0066FF" Font-Bold="true"></FocusedRow>
                                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                </Styles>
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <SettingsText EmptyDataRow="Não informações atualizadas financeiras para este período." />

                                <Toolbars>
                                    <dx:GridViewToolbar EnableAdaptivity="true">
                                        <Items>
                                            <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                            <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                            <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                        </Items>
                                    </dx:GridViewToolbar>
                                </Toolbars>

                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealMeta" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA2" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargMeta" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargReal" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargCheia" SummaryType="Custom" />
                                </TotalSummary>
                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista"
                                        VisibleIndex="0" FixedStyle="Left">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewBandColumn Caption="Ano" VisibleIndex="1" Name="bandAtual">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta"
                                                VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrRea"
                                                VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="Blue" ForeColor="White" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dx:GridViewBandColumn>

                                    <dx:GridViewBandColumn Caption="Atingimento e Crescimento" VisibleIndex="2">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="% Prev" FieldName="percCresc_RealMeta"
                                                ToolTip="% de crescimento. Meta sobre o  Realizado" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <EditCellStyle>
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </EditCellStyle>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="2010" FieldName="percCresc_RealAA1"
                                                VisibleIndex="1" Name="bandCrescAA2">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                    </dx:GridViewBandColumn>

                                    <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMargMetaFinal" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Real " FieldName="percMargCheia" ShowInCustomizationForm="True" ToolTip="Percentual de Margem com SellOut" VisibleIndex="1" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#003399" ForeColor="White" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Dif." FieldName="percMargMetaFinalDif" ShowInCustomizationForm="True" VisibleIndex="2">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle BackColor="Gray" ForeColor="White" HorizontalAlign="Center" />
                                    </dx:GridViewBandColumn>

                                </Columns>


                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />

                                <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                <Settings VerticalScrollBarMode="Hidden" ShowGroupFooter="VisibleAlways" ShowVerticalScrollBar="False"
                                    ShowFooter="False" HorizontalScrollBarMode="Hidden" />
                                <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
                                <FormatConditions>
                                    <dx:GridViewFormatConditionIconSet FieldName="percDifCresc" Format="PositiveNegativeArrowsColored" />
                                    <dx:GridViewFormatConditionIconSet FieldName="percAting" Format="PositiveNegativeTriangles" />

                                    <dx:GridViewFormatConditionTopBottom Threshold="10">
                                    </dx:GridViewFormatConditionTopBottom>
                                    <dx:GridViewFormatConditionIconSet Format="Quarters5" />

                                </FormatConditions>
                                <Styles>
                                    <FocusedRow BackColor="#66ffff" ForeColor="#0066FF" Font-Bold="true"></FocusedRow>
                                    <Header HorizontalAlign="Center">
                                    </Header>
                                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                    <Footer Font-Bold="True">
                                    </Footer>
                                </Styles>
                            </dx:ASPxGridView>

                            <asp:SqlDataSource ID="dsSuperTotalizadorAno" runat="server"
                                ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>"
                                SelectCommand="Ano.uspBuscarRanking_Totalizador" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                </SelectParameters>
                            </asp:SqlDataSource>


                        </div>

                        <br />

                        <div id="divRankingMensalAno">

                            <dx:ASPxGridView ID="gridRankingAno" runat="server" ClientInstanceName="gridRankingAno"
                                AutoGenerateColumns="False"
                                DataSourceID="dsSuperAno" KeyFieldName="idFilial"
                                Theme="SoftOrange" Width="100%">

                                <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                                <SettingsAdaptivity>
                                    <AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
                                </SettingsAdaptivity>

                                <SettingsBehavior AllowFocusedRow="True" />
                                <Styles>
                                    <Header ImageSpacing="5px" SortingImageSpacing="5px"></Header>
                                    <Footer Font-Bold="True">
                                    </Footer>
                                    <LoadingPanel ImageSpacing="10px"></LoadingPanel>
                                    <FocusedRow BackColor="#66ffff" ForeColor="#0066FF" Font-Bold="true"></FocusedRow>
                                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                </Styles>
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <SettingsText EmptyDataRow="Não informações atualizadas financeiras para este período." />

                                <Toolbars>
                                    <dx:GridViewToolbar EnableAdaptivity="true">
                                        <Items>
                                            <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                            <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                            <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                        </Items>
                                    </dx:GridViewToolbar>
                                </Toolbars>

                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealMeta"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMA"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA1"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA3"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA2"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaAnual"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_MetaAnual"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargMeta" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargReal" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargCheia" SummaryType="Custom" />

                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemDif"
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlrRea"
                                        SummaryType="Custom" />
                                </TotalSummary>

                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista"
                                        VisibleIndex="0" FixedStyle="Left">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewBandColumn Caption="Ano" VisibleIndex="1" Name="bandAtual">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta"
                                                VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="Green" ForeColor="White" />
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrRea"
                                                VisibleIndex="3">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="Blue" ForeColor="White" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dx:GridViewBandColumn>

                                    <dx:GridViewBandColumn Caption="Atingimento e Crescimento" VisibleIndex="2">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="% Prev" FieldName="percCresc_RealMeta"
                                                ToolTip="% de crescimento. Meta sobre o  Realizado" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <EditCellStyle>
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </EditCellStyle>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="2010" FieldName="percCresc_RealAA1"
                                                VisibleIndex="4" Name="bandCrescAA2">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                    </dx:GridViewBandColumn>

                                    <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMargMetaFinal" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Real " FieldName="percMargCheia" ShowInCustomizationForm="True" ToolTip="Percentual de Margem com SellOut" VisibleIndex="1" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#003399" ForeColor="White" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Dif." FieldName="percMargMetaFinalDif" ShowInCustomizationForm="True" VisibleIndex="2">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle BackColor="Gray" ForeColor="White" HorizontalAlign="Center" />
                                    </dx:GridViewBandColumn>

                                </Columns>

                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                <Settings VerticalScrollBarMode="Visible"
                                    ShowGroupFooter="VisibleAlways" VerticalScrollableHeight="300"
                                    ShowFooter="False" HorizontalScrollBarMode="Hidden" />
                                <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
                                <SettingsText EmptyDataRow="Não há vendas realizadas para este dia." />
                                <FormatConditions>
                                    <dx:GridViewFormatConditionIconSet FieldName="percDifCresc" Format="PositiveNegativeArrowsColored" />
                                    <dx:GridViewFormatConditionIconSet FieldName="percAting" Format="PositiveNegativeTriangles" />

                                    <dx:GridViewFormatConditionTopBottom Threshold="10">
                                    </dx:GridViewFormatConditionTopBottom>
                                    <dx:GridViewFormatConditionIconSet Format="Quarters5" />

                                </FormatConditions>
                                <Styles>
                                    <FocusedRow BackColor="#66ffff" ForeColor="#0066FF" Font-Bold="true"></FocusedRow>
                                    <Header HorizontalAlign="Center">
                                    </Header>
                                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                    <Footer Font-Bold="True">
                                    </Footer>
                                </Styles>
                            </dx:ASPxGridView>

                            <asp:SqlDataSource ID="dsSuperAno" runat="server"
                                ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>"
                                SelectCommand="Ano.uspBuscarRankingAno" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />

                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

    </div>

    <script src="../../assets/bootstrap-5.0.2-dist/Modal/jquery.min.js"></script>
    <script src="../../assets/bootstrap-5.0.2-dist/Modal/bootstrap.min.js"></script>
    <link href="../../assets/bootstrap-5.0.2-dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../js/bootstrap.js"></script>
    <link href="../../css/Dashboard.css" rel="stylesheet" />
    <link href="../../css/ionicons.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <link href="../../assets/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../js/bootstrap.min.js"></script>
    <link href="../../css/ionicons.min.css" rel="stylesheet" />
    <link href="../../assets/css/widgetPainel.css" rel="stylesheet" />
    <link href="../../css/Banco_Gerencial/Banco_Gerencial.css" rel="stylesheet" />

    <script type="text/javascript"> 

        $("#cabecalho").hide();
        $("#ASPxMenu1").hide();

        //$(function () {
        //    var x = detectmob();

        //    if (x) {
        //        $("#cabecalho").hide();
        //        $("#ASPxMenu1").hide();
        //    }
        //    else {
        //        $("#ASPxMenu1").show();
        //        $("#cabecalho").show();
        //    };
        //});

        //function detectmob() {
        //    if (navigator.userAgent.includes("Android") ||
        //        navigator.userAgent.includes("webOS") ||
        //        navigator.userAgent.includes("iPhone") ||
        //        navigator.userAgent.includes("iPad") ||
        //        navigator.userAgent.includes("iPod") ||
        //        navigator.userAgent.includes("BlackBerry") ||
        //        navigator.userAgent.includes("Windows")) {

        //        $("#ASPxMenu1").hide();
        //        $("#cabecalho").hide();

        //        return true;

        //    } else {

        //        return false;
        //    }
        //};

        //var x = true;

        //if (x) {
        //    $("#cabecalho").hide();
        //    $("#ASPxMenu1").hide();
        //}
        //else {
        //    $("#ASPxMenu1").show();
        //    $("#cabecalho").show();
        //};

    </script>

    <style>
        #divAnoAcumulado {
            float: left;
        }

        #divMesAcumulado {
            float: left;
            margin-left: 5px;
        }
        /*
        .divDados {
            clear: both;
            float: left;
            width: 100%;
            padding-right: 3px;
            padding-top: 5px;
            padding-bottom: 5px;
        }*/
    </style>

</asp:Content>
