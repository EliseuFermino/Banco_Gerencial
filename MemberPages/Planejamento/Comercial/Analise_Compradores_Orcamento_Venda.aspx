<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Analise_Compradores_Orcamento_Venda.aspx.vb" Inherits="MemberPages_Planejamento_Comercial_Analise_Compradores_Orcamento_Venda" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

   <script type="text/javascript">

       function UpdateDetailGrid(s, e) {
           gridComprador.PerformCallback();
       }

       function UpdateAnaliseGrid(s, e) {
           gridAnalise.PerformCallback();
       }

       //function OnGridFocusedRowChanged() {
       //    // Query the server for the "EmployeeID" and "Notes" fields from the focused row
       //    // The values will be returned to the OnGetRowValues() function
           
       //    grid.GetRowValues(grid.GetFocusedRowIndex(), 'idProdutoSecao', OnGetRowValues);
       //}

       //// Value array contains "EmployeeID" and "Notes" field values returned from the server
       //function OnGetRowValues(values) {          
       //    lblSecao.SetText(values[0]);
       //}
       
    </script>

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            width: 100%;
        }

        #divDadosComprador {
            clear: both;
            float: left;
            margin-left: 2px;
            width: 100%;
            margin-top: 20px;
        }

        #divDadosAnalise {
             clear: both;
            float: left;
            margin-left: 2px;         
            margin-top: 20px;
        }


    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>
    
    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>    

    
        
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
        <Images>
        <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
        </Images>

        <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

                    <div id="divDados">

                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="idProdutoSecao" Width="100%" ClientInstanceName="grid">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrNR1" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="descComprador" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px" Caption="Comprador" ToolTip="Nome do Comprador da seção.">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="desSecao" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="3" Width="200px" Caption="Seção do Comprador" ToolTip="Seção do Comprador. Há compradores que podem ter mais de uma seção.">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Meta" ShowInCustomizationForm="True" VisibleIndex="4">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrMeta" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Meta" ToolTip="Valor da Meta cadastrada.">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="#009900">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percPartMeta_Gestor" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px" Caption="% Part. &lt;br&gt; Gestor" ToolTip="Percentual da participação sobre a Meta de Venda de todas as seções do gestor.">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percPartMeta" ShowInCustomizationForm="True" VisibleIndex="2" Caption="% Part. &lt;br&gt; Total" ToolTip="Percentual da participação sobre a Meta de Venda Total da empresa." Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Histórico 2022" ShowInCustomizationForm="True" ToolTip="Histórico da Venda Realizada e Participações por Gestor e Total da Empresa do Ano de 2022." VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrAA1" ShowInCustomizationForm="True" ToolTip="Venda Realizada " VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part. &lt;br&gt; Total" FieldName="percPartAA1" ShowInCustomizationForm="True" ToolTip="Percentual da participação sobre a Venda Total da empresa." VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part. &lt;br&gt; Gestor" FieldName="percPartAA1_Gestor" ShowInCustomizationForm="True" ToolTip="Percentual da participação sobre a Venda de todas as seções do gestor." VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Histórico 2021" ShowInCustomizationForm="True" ToolTip="Histórico da Venda Realizada e Participações por Gestor e Total da Empresa do Ano de 2021." VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrAA2" ShowInCustomizationForm="True" ToolTip="Venda Realizada " VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part. &lt;br&gt; Gestor" FieldName="percPartAA2_Gestor" ShowInCustomizationForm="True" ToolTip="Percentual da participação sobre a Venda de todas as seções do gestor." VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part. &lt;br&gt; Total" FieldName="percPartAA2" ShowInCustomizationForm="True" ToolTip="Percentual da participação sobre a Venda Total da empresa." VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Histórico 2020" ShowInCustomizationForm="True" ToolTip="Histórico da Venda Realizada e Participações por Gestor e Total da Empresa do Ano de 2020." VisibleIndex="10">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrAA3" ShowInCustomizationForm="True" ToolTip="Venda Realizada " VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part. &lt;br&gt; Gestor" FieldName="percPartAA3_Gestor" ShowInCustomizationForm="True" ToolTip="Percentual da participação sobre a Venda de todas as seções do gestor." VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part. &lt;br&gt; Total" FieldName="percPartAA3" ShowInCustomizationForm="True" ToolTip="Percentual da participação sobre a Venda Total da empresa." VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="% Cresc. da Meta s/ Histórico" ShowInCustomizationForm="True" ToolTip="Calculo do crescimento de vendas da Meta de Venda sobre o Histórico Realizado os últimos 3 (três) anos." VisibleIndex="14">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="% Cresc &lt;br&gt; Meta x 22" FieldName="percCrescMeta_AA1" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento da Meta de Venda em Relação ao ano de 2022 projetado (Realizado até ontem e meta de venda de hoje até o final do ano)." VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="#009900">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc &lt;br&gt; 22 x 21" FieldName="percCrescMeta_AA2" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento da Venda Realizada do Ano de 2022 sobre Venda Realizada de 2021." VisibleIndex="1" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc &lt;br&gt; 21 x 20" FieldName="percCrescMeta_AA3" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento da Venda Realizada do Ano de 2021 sobre Venda Realizada de 2020." VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="idProdutoSecao" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Gestor" FieldName="nomeGestor" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="250" VerticalScrollBarMode="Auto" />
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <ClientSideEvents FocusedRowChanged="function(s, e) { 
UpdateDetailGrid();
UpdateAnaliseGrid();
 }" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>                    
                    
		            <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="dbo.usp_Ver_Meta_Compradores_Todos" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                                                
                        </SelectParameters>
                    </asp:SqlDataSource>

                         </div>

                    <br />

                    <div id="divDadosComprador">

                    <dx:ASPxGridView ID="gridComprador" ClientInstanceName="gridComprador" runat="server" DataSourceID="dsDadosMes" AutoGenerateColumns="False" KeyFieldName="Mes" Width="100%">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrNR1" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="descMes" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px" Caption="Mês" ToolTip="Descrição do Mês.">
                            </dx:GridViewDataTextColumn>
                           
                            <dx:GridViewBandColumn Caption="Meta" ShowInCustomizationForm="True" VisibleIndex="2">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrMeta" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Meta" ToolTip="Valor da Meta cadastrada.">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="#009900">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percPartMeta_Gestor" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px" Caption="% Part. &lt;br&gt; Gestor" ToolTip="Percentual da participação sobre a Meta de Venda de todas as seções do gestor.">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percPartMeta" ShowInCustomizationForm="True" VisibleIndex="2" Caption="% Part. &lt;br&gt; Total" ToolTip="Percentual da participação sobre a Meta de Venda Total da empresa." Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Histórico 2022" ShowInCustomizationForm="True" ToolTip="Histórico da Venda Realizada e Participações por Gestor e Total da Empresa do Ano de 2022." VisibleIndex="3">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrAA1" ShowInCustomizationForm="True" ToolTip="Venda Realizada " VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part. &lt;br&gt; Total" FieldName="percPartAA1" ShowInCustomizationForm="True" ToolTip="Percentual da participação sobre a Venda Total da empresa." VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part. &lt;br&gt; Gestor" FieldName="percPartAA1_Gestor" ShowInCustomizationForm="True" ToolTip="Percentual da participação sobre a Venda de todas as seções do gestor." VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Histórico 2021" ShowInCustomizationForm="True" ToolTip="Histórico da Venda Realizada e Participações por Gestor e Total da Empresa do Ano de 2021." VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrAA2" ShowInCustomizationForm="True" ToolTip="Venda Realizada " VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part. &lt;br&gt; Gestor" FieldName="percPartAA2_Gestor" ShowInCustomizationForm="True" ToolTip="Percentual da participação sobre a Venda de todas as seções do gestor." VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part. &lt;br&gt; Total" FieldName="percPartAA2" ShowInCustomizationForm="True" ToolTip="Percentual da participação sobre a Venda Total da empresa." VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Histórico 2020" ShowInCustomizationForm="True" ToolTip="Histórico da Venda Realizada e Participações por Gestor e Total da Empresa do Ano de 2020." VisibleIndex="10">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrAA3" ShowInCustomizationForm="True" ToolTip="Venda Realizada " VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part. &lt;br&gt; Gestor" FieldName="percPartAA3_Gestor" ShowInCustomizationForm="True" ToolTip="Percentual da participação sobre a Venda de todas as seções do gestor." VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part. &lt;br&gt; Total" FieldName="percPartAA3" ShowInCustomizationForm="True" ToolTip="Percentual da participação sobre a Venda Total da empresa." VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="% Cresc. da Meta s/ Histórico" ShowInCustomizationForm="True" ToolTip="Calculo do crescimento de vendas da Meta de Venda sobre o Histórico Realizado os últimos 3 (três) anos." VisibleIndex="14">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="% Cresc &lt;br&gt; Meta x 22" FieldName="percCrescMeta_AA1" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento da Meta de Venda em Relação ao ano de 2022 projetado (Realizado até ontem e meta de venda de hoje até o final do ano)." VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="#009900">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc &lt;br&gt; 22 x 21" FieldName="percCrescMeta_AA2" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento da Venda Realizada do Ano de 2022 sobre Venda Realizada de 2021." VisibleIndex="1" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc &lt;br&gt; 21 x 20" FieldName="percCrescMeta_AA3" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento da Venda Realizada do Ano de 2021 sobre Venda Realizada de 2020." VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="350" VerticalScrollBarMode="Auto" />
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                            <TitlePanel HorizontalAlign="Left">
                            </TitlePanel>
                        </Styles>
                    </dx:ASPxGridView>                    
                    
		            <asp:SqlDataSource ID="dsDadosMes" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="dbo.usp_Ver_Meta_Compradores_Por_Mes" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="idProdutoSecao" SessionField="sSECAO" Type="Int16" />                           
                        </SelectParameters>
                    </asp:SqlDataSource>

                        </div>

                    <div id="divDadosAnalise">

                        <dx:ASPxGridView ID="gridAnalise" runat="server" DataSourceID="dsAnalise" ClientInstanceName="gridAnalise" Width="700px" AutoGenerateColumns="False" KeyFieldName="descFilial">

                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />

                            <Columns>                               
                                <dx:GridViewDataTextColumn FieldName="descFilial" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Filial" Width="150px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M1" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Jan" Width="20px">
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M2" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Fev" Width="20px">
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M3" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Mar" Width="20px">
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M4" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Abr" Width="20px">
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M5" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Mai" Width="20px">
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M6" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Jun" Width="20px">
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M7" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Jul" Width="20px">
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M8" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Ago" Width="20px">
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M9" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Set" Width="20px">
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M10" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Out" Width="20px">
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M11" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Nov" Width="20px">
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M12" ShowInCustomizationForm="True" VisibleIndex="13" Caption="Dez" Width="20px">
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>

                            <FormatConditions>
                                 <dx:GridViewFormatConditionHighlight Expression="[M1]&lt;=0.0" FieldName="M1" ShowInColumn="Jan"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M1]&gt;0.0" FieldName="M1" Format="GreenFillWithDarkGreenText" ShowInColumn="Jan"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M2]&lt;=0.0" FieldName="M2" ShowInColumn="Fev"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M2]&gt;0.0" FieldName="M2" Format="GreenFillWithDarkGreenText" ShowInColumn="Fev"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M3]&lt;=0.0" FieldName="M3" ShowInColumn="Mar"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M3]&gt;0.0" FieldName="M3" Format="GreenFillWithDarkGreenText" ShowInColumn="Mar"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M4]&lt;=0.0" FieldName="M4" ShowInColumn="Abr"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M4]&gt;0.0" FieldName="M4" Format="GreenFillWithDarkGreenText" ShowInColumn="Abr"></dx:GridViewFormatConditionHighlight>
                                                                
                                <dx:GridViewFormatConditionHighlight Expression="[M5]&lt;=0.0" FieldName="M5" ShowInColumn="Mai"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M5]&gt;0.0" FieldName="M5" Format="GreenFillWithDarkGreenText" ShowInColumn="Mai"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M6]&lt;=0.0" FieldName="M6" ShowInColumn="Jun"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M6]&gt;0.0" FieldName="M6" Format="GreenFillWithDarkGreenText" ShowInColumn="Jun"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M7]&lt;=0.0" FieldName="M7" ShowInColumn="Jul"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M7]&gt;0.0" FieldName="M7" Format="GreenFillWithDarkGreenText" ShowInColumn="Jul"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M8]&lt;=0.0" FieldName="M8" ShowInColumn="Ago"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M8]&gt;0.0" FieldName="M8" Format="GreenFillWithDarkGreenText" ShowInColumn="Ago"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M9]&lt;=0.0" FieldName="M9" ShowInColumn="Set"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M9]&gt;0.0" FieldName="M9" Format="GreenFillWithDarkGreenText" ShowInColumn="Set"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M10]&lt;=0.0" FieldName="M10" ShowInColumn="Out"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M10]&gt;0.0" FieldName="M10" Format="GreenFillWithDarkGreenText" ShowInColumn="Out"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M11]&lt;=0.0" FieldName="M11" ShowInColumn="Nov"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M11]&gt;0.0" FieldName="M11" Format="GreenFillWithDarkGreenText" ShowInColumn="Nov"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M12]&lt;=0.0" FieldName="M12" ShowInColumn="Dez"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M12]&gt;0.0" FieldName="M12" Format="GreenFillWithDarkGreenText" ShowInColumn="Dez"></dx:GridViewFormatConditionHighlight>

                            </FormatConditions>

                        </dx:ASPxGridView>

                    <asp:SqlDataSource ID="dsAnalise" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="dbo.usp_Ver_Meta_Compradores_Matriz" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="idProdutoSecao" SessionField="sSECAO" Type="Int16" />                           
                        </SelectParameters>
                    </asp:SqlDataSource>

                    </div>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
   


</asp:Content>


