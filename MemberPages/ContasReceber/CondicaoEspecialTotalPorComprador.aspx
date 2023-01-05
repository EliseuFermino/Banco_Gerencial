<%@ Page Title="Total por Comprador" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CondicaoEspecialTotalPorComprador.aspx.vb" Inherits="MemberPages_ContasReceber_CondicaoEspecialTotalPorComprador" %>



<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divMesInicial {            
            float: left;
            margin-left: 10px;
        }

        #divMesFinal {            
            float: left;
            margin-left: 10px;
        }

        #divBaseCNPJ {
            float: left;
            margin-left: 5px;
             margin-top: 4px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divShowAgenda {            
            float: left;
            margin-left: 10px;
            margin-top: 4px;
        }

        #divSize {            
            float: left;           
        }


        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divGrid0 {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-bottom: 10px;
        }

        #divGrid1 {            
            float: left;
            margin-left: 10px;
        }

        #divGrid2 {  
            clear: both;        
            float: left;
            margin-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMesInicial">
        <uc1:wuciListaMes runat="server" ID="cboMesInicial" />
    </div>

    <div id="divMesFinal">
        <uc1:wuciListaMes runat="server" ID="cboMesFinal" />
    </div>    

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    
    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>

                    <div id="divGrid0">

                    <dx:ASPxGridView ID="grid1" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados1" Width="565px" KeyFieldName="CODPESSOAFUNCIONARIO">
                        <TotalSummary>

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2013" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2014" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2015" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2016" SummaryType="Sum" />

                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Comprador" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="2013" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="2014" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="2015" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="2016" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager PageSize="20" Mode="ShowAllRecords">
                            <Summary AllPagesText="Pages: {0} - {1} ({2} fornecedores)" Text="Page {0} of {1} ({2} fornecedores)" />
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="400" ShowFooter="True" ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <SettingsDetail ShowDetailRow="True" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                        <Templates>
                            <DetailRow>
                                <p style="font-weight:600">
                                    Abertura por Condição Especial</p>
                                <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" OnBeforePerformDataSelect="grid_BeforePerformDataSelect" Width="500px">
                                    <TotalSummary>
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2013" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2014" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2015" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2016" SummaryType="Sum" />
                                    </TotalSummary>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Descrição Condição" FieldName="DESCCONDESP" ShowInCustomizationForm="True" VisibleIndex="0" Width="175px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="2013" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="2014" VisibleIndex="2" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="2015" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="2016" VisibleIndex="4" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" />
                                    <SettingsPager PageSize="20">
                                        <Summary AllPagesText="Pages: {0} - {1} ({2} fornecedores)" Text="Page {0} of {1} ({2} fornecedores)" />
                                    </SettingsPager>
                                    <Settings HorizontalScrollBarMode="Auto" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" VerticalScrollableHeight="400" />
                                    <SettingsDetail ShowDetailButtons="False" ShowDetailRow="True" />
                                    <Styles>
                                        <Header HorizontalAlign="Center">
                                        </Header>
                                        <AlternatingRow BackColor="#EEEEEE">
                                        </AlternatingRow>
                                        <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="Blue">
                                        </FocusedRow>
                                        <Footer Font-Bold="True">
                                        </Footer>
                                    </Styles>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerContasReceberConnectionString %>" SelectCommand="usp_Total_Condicao_Comprador_Detail" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="MesInicial" SessionField="sMES_INICIAL" Type="Byte" />
                                        <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />                                    
                                        <asp:SessionParameter Name="idComprador" SessionField="sCOMPRADOR" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </DetailRow>
                        </Templates>
                    </dx:ASPxGridView>
                    
		            <asp:SqlDataSource ID="dsDados1" runat="server" ConnectionString="<%$ ConnectionStrings:gerContasReceberConnectionString %>" SelectCommand="uspTotalComprador4Anos" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="MesInicial" SessionField="sMES_INICIAL" Type="Byte" />
                                        <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />
                                                                   
                                    </SelectParameters>
                                </asp:SqlDataSource>


                    </div>

                    <div id="divGrid1">                    
                  
                        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" Width="750px">
                            <TotalSummary>

                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCondicao" SummaryType="Sum" />

                            </TotalSummary>
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="DescCompradorAbrev" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Comprador">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrCondicao" ShowInCustomizationForm="True" VisibleIndex="1" ReadOnly="True" Width="100px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="PENDENTE" ShowInCustomizationForm="True" ToolTip="Venda Totalizada aguardando confirmação. Aguardando o Fornecedor vir para assinar o Acordo Comercial." VisibleIndex="3" Width="70px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="CONFIRMADO" ShowInCustomizationForm="True" ToolTip="Liberado para o setor contas a receber ( ou seja assinadas pelo fornecedor )" VisibleIndex="4" Width="90px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="ANALISE" ShowInCustomizationForm="True" ToolTip="Geradas na confirmação das campanhas ( em andamento )" VisibleIndex="2" Width="60px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="EFETIVADO" ShowInCustomizationForm="True" ToolTip="Lançados no contas a Receber" VisibleIndex="5" Width="80px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="PARCIAL" ShowInCustomizationForm="True" ToolTip="Condição paga parcialmente pelo fornecedor" VisibleIndex="6" Width="60px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="CANCELADO" ShowInCustomizationForm="True" ToolTip="A condição poderá ser cancelada caso tenha outra condição a ser substituída, o mesmo so poderá ser cancelada pelo Paulo mediante a explicação e n. de acordo substituto" VisibleIndex="8" Width="80px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="FECHADO" ShowInCustomizationForm="True" ToolTip="Condição paga pelo fornecedor" VisibleIndex="7" Width="70px">
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsPager PageSize="20">
                                <Summary AllPagesText="Pages: {0} - {1} ({2} fornecedores)" Text="Page {0} of {1} ({2} fornecedores)" />
                            </SettingsPager>
                            <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="400" ShowFooter="True" ShowFilterRowMenu="True" />
                            <SettingsText EmptyDataRow="Nenhuma Condição Espeical Efetivada para este período." />
                            <SettingsDetail ShowDetailButtons="False" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#EEEEEE">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="Blue">
                                </FocusedRow>
                                <Footer Font-Bold="True">
                                </Footer>
                            </Styles>
                        </dx:ASPxGridView>
                    
		                <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerContasReceberConnectionString %>" SelectCommand="usp_Total_Condicao_Comprador" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="MesInicial" SessionField="sMES_INICIAL" Type="Byte" />
                                            <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />
                                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                    </div>


                    <div id="divGrid2">                    
                  
                        <dx:ASPxGridView ID="grid2" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados2" Width="650px">
                            <TotalSummary>

                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2013" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2014" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2015" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2016" SummaryType="Sum" />

                            </TotalSummary>
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="TIPOCONDICAO" ShowInCustomizationForm="True" VisibleIndex="0" Caption="ID" Width="50px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="DESCCONDESP" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px" Caption="Descrição Condição Especial">
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Agenda" FieldName="CODTIPOPER" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="2013" FieldName="2013" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="2014" ShowInCustomizationForm="True" VisibleIndex="4" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="2015" ShowInCustomizationForm="True" VisibleIndex="5" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="2016" ShowInCustomizationForm="True" VisibleIndex="6" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsPager PageSize="20" Mode="ShowAllRecords">
                                <Summary AllPagesText="Pages: {0} - {1} ({2} fornecedores)" Text="Page {0} of {1} ({2} fornecedores)" />
                            </SettingsPager>
                            <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="400" ShowFooter="True" ShowFilterRowMenu="True" />
                            <SettingsText EmptyDataRow="Nenhuma Condição Espeical Efetivada para este período." />
                            <SettingsDetail ShowDetailButtons="False" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#EEEEEE">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="Blue">
                                </FocusedRow>
                                <Footer Font-Bold="True">
                                </Footer>
                            </Styles>
                        </dx:ASPxGridView>
                    
		                <asp:SqlDataSource ID="dsDados2" runat="server" ConnectionString="<%$ ConnectionStrings:gerContasReceberConnectionString %>" SelectCommand="usp_CondicaoEspecialAnalitica" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            
                                            <asp:SessionParameter Name="MesInicial" SessionField="sMES_INICIAL" Type="Byte" />
                                            <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />
                            
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                    </div>



                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


</asp:Content>


