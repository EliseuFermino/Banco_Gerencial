<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ashBoard_DespesaLoja_CentroCusto.aspx.vb" Inherits="MemberPages_Despesas_DashBoard_DespesaLoja_CentroCusto" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMesPeriodo.ascx" TagPrefix="uc1" TagName="wuciListaMesPeriodo" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css" >
        html {            
            overflow-y:hidden;
            overflow-x:hidden ;
        }

        #moldura {
            width:1024px;
            margin:0 auto;           
        }

        #Ano {
            float: left;
        }

        #Periodo {
            float: left;
            margin-left: 2px;
            width: 255px;
        }

        #Filial {
            float: left;
            margin-left: 2px;
            width: 320px;
        }

        #FixarCabecalho {
            float: left;
            margin-left: 2px;
            width: 115px;             
            padding-left: 2px;            
        }

        #ShowButton {
            float: left;
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px;                      
        }

        #Grupo {
            float: left;
            margin-left: 2px;                     
        }

        #CheckSubgrupo {
            float: left;
            margin-left: 2px;                     
        }

        #Subgrupo {
            float: left;
            margin-left: 2px;                     
        }

        #gridPrincipal {
            clear:both ;
            float: left;            
            padding-top: 2px;   
            width: 1015px;
            margin-left: 2px;                  
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 28px;
            margin-left: 1px;            
        }

        .Panel_ShowButton {
           
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="moldura" >
        <div id="Ano" class="myBorder ">
            <uc1:wucAno runat="server" ID="cboAno" />
        </div>

        <div id="Periodo" class="myBorder"> 
            <uc1:wuciListaMesPeriodo runat="server" ID="cboMes" />
        </div>

        <div id="Filial" class="myBorder">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilialNew" />
        </div>

        <div id="FixarCabecalho" class="myBorder">
            <dx:ASPxComboBox ID="cboCentroCusto" runat="server" ValueType="System.String" Width="110px"></dx:ASPxComboBox>
        </div>

        <div id="ShowButton" >
            <dx:ASPxButton ID="btnShowButton" runat="server" Text="Ver Loja a Loja" AutoPostBack="false" 
                Theme="SoftOrange" ClientInstanceName="meuBotao" ClientSideEvents-Click="function(s, e) { MudarTextoBotao(); }">

            </dx:ASPxButton>
        </div>

        <div id="gridPrincipal">
                <dx:ASPxGridView ID="gridGrupoMes" runat="server" 
                    AutoGenerateColumns="False" DataSourceID="dsGrupoMes" EnableTheming="True" 
                    KeyFieldName="idGrupo" Theme="Default" width="1015px">
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" 
                            SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                            SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                            SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrRev" 
                            SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAA" 
                            SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRev" 
                            SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percReal" 
                            SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercRev" 
                            SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMA" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMA" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescMA" SummaryType="Custom" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="idGrupo" ToolTip="ID do grupo" Visible="false" 
                            VisibleIndex="1" Caption="ID" Width="30px" SortIndex="0" SortOrder="Ascending">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Descrição" FieldName="descConta" 
                            VisibleIndex="0" Width="150px" ToolTip="Descrição do grupo." FixedStyle="Left">
                            <CellStyle Wrap="False">
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                            <FooterCellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewBandColumn Caption="Ano Atual" VisibleIndex="4" ToolTip="Este quadro exibe informações do ano atual.">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrRev" 
                                    VisibleIndex="0" Width="90px" ToolTip="Valor de meta revista de despesa do ano atual.">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="#009900">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#009900">
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="%" FieldName="percRev" VisibleIndex="1" 
                                    Width="60px" ToolTip="Percentual de meta revista do ano atual.">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="#009900">
                                        <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#009900">
                                        <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" 
                                    VisibleIndex="2" Width="90px" ToolTip="Valor realizado do ano atual.">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="%" FieldName="percReal" VisibleIndex="3" 
                                    Width="60px" ToolTip="Percentual realizado do ano atual.">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="Blue">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="Ano Anterior (AA)" VisibleIndex="2" ToolTip="Este quadro exibe informações do ano anterior.">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealAA" 
                                    VisibleIndex="0" Width="90px" ToolTip="Valor realizado do ano anterior.">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="%" FieldName="percRealAA" 
                                    VisibleIndex="1" Width="60px" ToolTip="Percentual realizado do ano anterior.">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="Diferenças" VisibleIndex="5" ToolTip="Este quadro exibe informações de diferença entre meta versus realizado e percentual de crescimento.">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" 
                                    VisibleIndex="0" Width="90px" ToolTip="Diferença entre valor de realizado x meta.">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle Font-Bold="True">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="%" FieldName="difPercRev" 
                                    VisibleIndex="1" Width="60px" ToolTip="Diferença entre percentual de realizado x meta.">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle Font-Bold="True">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="Mês Anterior (MA)" Name="bandMesAnterior" ToolTip="Este quadro exibe informações do mês anterior." VisibleIndex="3">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealMA" ToolTip="Valor realizado do mês anterior. Quando o mês de janeiro estiver selecionado será exibido o mês de Dezembro do ano anterior." VisibleIndex="0" Width="90px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="%" FieldName="percRealMA" ToolTip="Percentual realizado do mês anterior. Quando o mês de janeiro estiver selecionado será exibido o mês de Dezembro do ano anterior." VisibleIndex="1" Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="Crescimento" Name="bandCrescimento" ToolTip="Exibe informações sobre o crescimento do mês anterior e ano anterior." VisibleIndex="8">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="% AA" FieldName="percCresc" ToolTip="Percentual de crescimento sobre o ano anterior" VisibleIndex="0" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% MA" FieldName="percCrescMA" ToolTip="Percentual de crescimento sobre o mês anterior" VisibleIndex="1" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dx:GridViewBandColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <SettingsPager Mode="ShowAllRecords" />
                    <Styles>
                        <Header HorizontalAlign="Center"></Header>                                
	                    <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                    <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                        <Footer Font-Bold="True"></Footer>
                    </Styles>
                    <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="420" ShowFooter="True" />
                    <SettingsDetail ShowDetailRow="True" />

                    <Templates>
                        <DetailRow>
                            <dx:ASPxGridView ID="gridSub" runat="server" AutoGenerateColumns="False" 
                                DataSourceID="dsDetail" EnableTheming="True" KeyFieldName="idGrupo" 
                                OnBeforePerformDataSelect="gridSub_BeforePerformDataSelect" 
                                OnCustomSummaryCalculate="gridSub_CustomSummaryCalculate" 
                                OnHtmlDataCellPrepared="gridSub_HtmlDataCellPrepared" 
                                Theme="Default">
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" 
                                        SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                        SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                                        SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrRev" 
                                        SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAA" 
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRev" 
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percReal" 
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercRev" 
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMA" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMA" SummaryType="Custom" />
                                </TotalSummary>
                                <Columns>
                                    <dx:GridViewBandColumn Caption="Mês Anterior" VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealMA" VisibleIndex="0" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percRealMA" VisibleIndex="1" Width="50px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewDataTextColumn Caption="ID" FieldName="idGrupo" VisibleIndex="0" 
                                        Width="30px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="2">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealAA" 
                                                VisibleIndex="0" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percRealAA" 
                                                VisibleIndex="1" Width="50px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewDataTextColumn Caption="Descrição - Subgrupo" 
                                        FieldName="descConta" VisibleIndex="1" Width="150px">
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Ano Atual" VisibleIndex="4">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrRev" 
                                                VisibleIndex="0" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percRev" VisibleIndex="1" 
                                                Width="50px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" 
                                                VisibleIndex="2" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle ForeColor="Blue">
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percReal" VisibleIndex="3" 
                                                Width="50px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Diferenças" VisibleIndex="7">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" 
                                                VisibleIndex="0" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="difPercRev" 
                                                VisibleIndex="1" Width="50px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" />
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Settings ShowFooter="True" />
                                <SettingsDetail ShowDetailRow="True" />
                                <Styles>
                                    <Header HorizontalAlign="Center"></Header>
	                                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>     
                                </Styles>
                                <Templates>
                                    <DetailRow>
                                        <dx:ASPxGridView ID="gridNota" runat="server" AutoGenerateColumns="False" 
                                            DataSourceID="dsdNota" 
                                            OnBeforePerformDataSelect="gridNota_BeforePerformDataSelect" Theme="Default" 
                                            KeyFieldName="CODIGO">
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="VALOR" 
                                                    SummaryType="Sum" />
                                            </TotalSummary>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="CODIGO" VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="AGENDA" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Descric" ReadOnly="True" 
                                                    VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="NOTA" VisibleIndex="7">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Observacao" ReadOnly="True" 
                                                    VisibleIndex="8">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn Caption="Data" FieldName="DATA" VisibleIndex="10">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="VALOR" 
                                                    VisibleIndex="11">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="CCusto" ReadOnly="True" 
                                                    VisibleIndex="12" Caption="Centro Custo">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" />
                                            <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                            <Settings ShowFooter="True" ShowGroupPanel="True" />
                                            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                                            <Styles>                                          
	                                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>                                                         
                                            </Styles>
                                        </dx:ASPxGridView>
                                    </DetailRow>
                                </Templates>
                            </dx:ASPxGridView>
                        </DetailRow>
                    </Templates>
                </dx:ASPxGridView>

                <%--DataSources--%>
                <asp:SqlDataSource ID="dsGrupoMes" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                            
                    SelectCommand="Despesas.uspBuscarGrupos" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                    </SelectParameters>
                </asp:SqlDataSource>
                   
                <asp:SqlDataSource ID="dsDetail" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                    SelectCommand="Despesas.uspBuscarSubgrupos" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                        <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" />
                    </SelectParameters>
                </asp:SqlDataSource>                      
                   
                <asp:SqlDataSource ID="dsdNota" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Despesas.uspBuscarDespesasAnaliticas" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        <asp:SessionParameter Name="Mes" SessionField="sMES" />
                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                        <asp:SessionParameter Name="idSubgrupo" SessionField="sSUBGRUPO" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </div>
    </div>


    <dx:ASPxPopupControl ID="PopupControl" runat="server" LoadContentViaCallback="OnFirstShow" Theme="Metropolis"
                                PopupElementID="ShowButton" PopupVerticalAlign="Below" PopupHorizontalAlign="WindowCenter" AllowDragging="True"
                          ShowHeader="true" ShowCloseButton="true" Width="900px" Height="115px" 
                         HeaderText="Updatable content" ClientInstanceName="ClientPopupControl" ShowRefreshButton="True" SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;">
        <HeaderTemplate>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="Grupo" >
                        <dx:ASPxComboBox ID="cboGrupo" runat="server" DataSourceID="dsSecao" TextField="GrupoDesc" ValueField="idGrupo" DropDownRows="15"
                            AutoPostBack="true" ClientSideEvents-ValueChanged="function(s, e) { ClientPopupControl.PerformCallback(); }" >
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsSecao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            SelectCommand="SELECT idGrupo, GrupoDesc FROM Cadastros.tblCategoriaLinha WHERE idCat = 7 ORDER BY Ordem">
                        </asp:SqlDataSource>
                    </div>
                    <div id="CheckSubgrupo">
                        <dx:ASPxCheckBox ID="chkSubgrupo" runat="server" Checked="false" Text="Sub-grupo" AutoPostBack="true" ></dx:ASPxCheckBox>
                    </div>

                    <div id="Subgrupo">
                        <dx:ASPxComboBox ID="cboSubgrupo" runat="server" DataSourceID="dsSubGrupo" TextField="SubGrupoDesc" ValueField="idSubgrupo" DropDownRows="15" AutoPostBack="true" 
                            ClientSideEvents-SelectedIndexChanged="function(s, e) { ClientPopupControl.PerformCallback(); }" >
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsSubGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SELECT idSubgrupo, SubGrupoDesc FROM Cadastros.tblCategoriaLinhaDet WHERE (idGrupo = @Grupo) ORDER BY Ordem">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cboGrupo" Name="Grupo" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                       
                    </div>
                    
                </ContentTemplate>
            </asp:UpdatePanel>           
        </HeaderTemplate>

        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl" runat="server">
  <%--              <div style="vertical-align:middle">
                    The content of this popup control is relevant to: <b> <%= DateTime.Now.ToLongTimeString() %></b>
                     <asp:Label ID="lblDados" runat="server" Text="Label"></asp:Label>
                </div>--%>
                <div>
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsDespesaTodasFiliais" Width="900px" KeyFieldName="idFilial">
                       <Columns>
            <dx:GridViewBandColumn Caption="Ano Anterior (AA)" ToolTip="Este quadro exibe informações do ano anterior" VisibleIndex="1">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealAA" ReadOnly="True" ToolTip="Valor realizado do ano anterior" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="%" FieldName="percRealAA" ReadOnly="True" ToolTip="Percentual realizado do ano anterior" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewDataTextColumn FieldName="descConta" FixedStyle="Left" VisibleIndex="0" Caption="Descrição" Width="150px">
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Ano Atual" ToolTip="Este quadro exibe informações sobre o mês atual" VisibleIndex="3">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrRev" ReadOnly="True" ToolTip="Valor da meta revista de despesa do ano atual" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="%" FieldName="percRev" ReadOnly="True" ToolTip="Percentual da meta revista de despesa do ano atual" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" ReadOnly="True" ToolTip="Valor realizado do ano atual" VisibleIndex="2" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="%" FieldName="percReal" ReadOnly="True" ToolTip="Percentual realizado do ano atual" VisibleIndex="3" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Diferenças" ToolTip="Este quadro exibe informações de diferença entre meta versus realizado e percentual de crescimento." VisibleIndex="6">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" ReadOnly="True" ToolTip="Diferença entre valor realizado x meta." VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="%" FieldName="difPercRev" ReadOnly="True" ToolTip="Diferença entre percentual realizado x meta." VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Mês Anterior" ToolTip="Este quadro exibe informações sobre o mês anterior" VisibleIndex="2">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealMA" ReadOnly="True" ToolTip="Valor realizado do mês anterior. Quando o mês de janeiro estiver selecionado será exibido o mês de Dezembro do ano anterior." VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="%" FieldName="percRealMA" ReadOnly="True" ToolTip="Percentual realizado do mês anterior. Quando o mês de janeiro estiver selecionado será exibido o mês de Dezembro do ano anterior." VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Crescimento" ToolTip="Este quadro exibe informações sobre o crescimento sobre o mês anterior e ano anterior" VisibleIndex="11">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="% AA" FieldName="percCresc" ReadOnly="True" ToolTip="Percentual de crescimento sobre o ano anterior" VisibleIndex="0" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% MA" FieldName="percCrescMA" ReadOnly="True" ToolTip="Percentual de crescimento sobre o mês anterior" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Indicadores" ToolTip="Este quadro exibe informações sobre indicadores." VisibleIndex="14">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Func" FieldName="indFunc" ReadOnly="True" ToolTip="Indcador por Funcionário" VisibleIndex="0" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Metro" FieldName="indMet" ReadOnly="True" ToolTip="Indicador por metro quadrado de área de venda" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
        </Columns>
                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto"  />
                        <Styles>
	        <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	        <Header HorizontalAlign="Center">
            </Header>
	        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
            <HeaderPanel HorizontalAlign="Center">
            </HeaderPanel>
        </Styles>
                    </dx:ASPxGridView>

                         <asp:SqlDataSource ID="dsDespesaTodasFiliais" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="Despesas.uspBuscarGrupo_TodasFiliais" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                <asp:SessionParameter Name="idGrupo"  SessionField="sGRUPO" Type="Int16" />
                                <asp:SessionParameter Name="idTipo" SessionField="sTIPO" Type="Byte"  />
                            </SelectParameters>
                        </asp:SqlDataSource>

                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>

    </dx:ASPxPopupControl>
</asp:Content>

