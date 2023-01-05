    <%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CalculoCentroCusto.aspx.vb" Inherits="MemberPages_CentroCusto_CalculoCentroCusto" %>

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

        #divMes {            
            float: left;
            margin-left: 10px;
        }

        #divFilial {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divDeptoAberto {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divDepto {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }

        #divSecao {            
            float: left;
            margin-left: 80px;
            margin-top: -120px;
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

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
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
                  
                    <div id="divDeptoAberto">
                   
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDepto_Despesa" SummaryType="Sum" />
                            </TotalSummary>
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="idDepto" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="descDepto" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrDepto_Despesa" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="idCentroCusto" ShowInCustomizationForm="True" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <Settings ShowFooter="True" />
                        </dx:ASPxGridView>                                 
                    
            		    <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="CentroCusto.uspBuscarDespesa_DeptoAberto_Loja" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>

                    <div id="divDepto">

                        <dx:ASPxGridView ID="gridDepto" runat="server" AutoGenerateColumns="False" DataSourceID="dsDepto">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDepto_Despesa" SummaryType="Sum" />
                            </TotalSummary>
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="idDepto" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="descDepto" ShowInCustomizationForm="True" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="vlrDepto_Despesa" ShowInCustomizationForm="True" VisibleIndex="2">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <Settings ShowFooter="True" />
                        </dx:ASPxGridView>                                 
                    
            		    <asp:SqlDataSource ID="dsDepto" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="CentroCusto.uspBuscarDespesa_Depto_Loja" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                    </div>

                    <div id="divSecao">

                        <dx:ASPxGridView ID="gridSecao" runat="server" AutoGenerateColumns="False" DataSourceID="dsSecao" KeyFieldName="idSecao" Width="950px">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSecao_Despesa" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSecao_Rateio" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDespTotal" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                            </TotalSummary>
                            <Columns>
                                <dx:GridViewBandColumn Caption="Mercadológico" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Seção" FieldName="idSecao" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Nome da Seção" FieldName="descSecao" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px">
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn FieldName="idDepto" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Despesas" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Desp. Seção" FieldName="vlrSecao_Despesa" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Desp. Rateio" FieldName="vlrSecao_Rateio" ShowInCustomizationForm="True" ToolTip="Valor do Rateio sobre o Percentual de Participação da Venda no Departamento" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Desp. Total" FieldName="vlrDespTotal" ShowInCustomizationForm="True" ToolTip="Soma de 'Desp. Seção' + 'Desp. Rateio'" VisibleIndex="2" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Desp. s/ Venda" FieldName="percDespVenda" ShowInCustomizationForm="True" VisibleIndex="3" Width="110px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle Font-Bold="True">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Vendas, Lucro e % Margem" ShowInCustomizationForm="True" VisibleIndex="9">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" ShowInCustomizationForm="True" ToolTip="Valor da Venda por Seção" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucro" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Margem" FieldName="percMargem" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Participação" FieldName="percPartSecao" ShowInCustomizationForm="True" ToolTip="Percentual de Participação da Venda no Departamento" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF66" Font-Bold="True" ForeColor="Blue">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>                                 
                    
            		    <asp:SqlDataSource ID="dsSecao" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="CentroCusto.uspBuscarDespesa_Secao_Loja" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                    </div>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>


