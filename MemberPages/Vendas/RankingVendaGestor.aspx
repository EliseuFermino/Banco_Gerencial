<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="RankingVendaGestor.aspx.vb" Inherits="MemberPages_Vendas_RankingVendaGestor" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wuciAno.ascx" TagPrefix="uc1" TagName="wuciAno" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>





<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

     <style type ="text/css" >

         #divAno {
            float :left 
         }

         #divMesInicial {
            float :left 
         }

         #divMesFinal {
            float :left 
         }

         #divExcel {
             clear :both;
            float :left ;
            padding-top : 5px;
         }

         #divBotaoAtualizar {           
            float :left ;
            margin-left: 10px;
         }

         #divDados {
             clear :both ;
            float :left ;
            margin-left: 2px;
                
         }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">  

        <div id="divAno">
            <uc1:wucAno runat="server" ID="cboAno" AutoPostBack="False" />            
        </div>

        <div id="divMesInicial">
            <uc1:wuciListaMes runat="server" ID="cboMesInicial" AutoPostBack="False" />
        </div>

        <div id="divMesFinal">
            <uc1:wuciListaMes runat="server" ID="cboMesFinal" AutoPostBack="False" />
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

                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="DescCompradorAbrev">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut" SummaryType="Sum" />
                        </TotalSummary>

                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Ranking" ShowInCustomizationForm="True" VisibleIndex="0">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Gestor" FieldName="DescCompradorAbrev" VisibleIndex="1"  >
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ReadOnly="True" VisibleIndex="2" Width="80px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" ReadOnly="True" VisibleIndex="3" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle ForeColor="Blue">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Lucro" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercial" ReadOnly="True" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SellOut" FieldName="LucroSellOut" ReadOnly="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ReadOnly="True" VisibleIndex="4" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle Font-Bold="True">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Margem" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="% " FieldName="percMargem" ReadOnly="True" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% SellOut" FieldName="percMargemSellOut" ReadOnly="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>

                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" ShowTitlePanel="True" />
                        <SettingsText Title="Ranking por Gestor - Empresa" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F0F0F0">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspParticipacaoPorComprador_Empresa" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="MesInicial" SessionField="sMES_INICIAL" Type="Byte" />
                            <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />                    
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <br />

                    <dx:ASPxGridView ID="grid_Super" runat="server" DataSourceID="sd_Super" AutoGenerateColumns="False" KeyFieldName="DescCompradorAbrev">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut" SummaryType="Sum" />
                        </TotalSummary>

                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Ranking" ShowInCustomizationForm="True" VisibleIndex="0">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Gestor" FieldName="DescCompradorAbrev" VisibleIndex="1"  >
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ReadOnly="True" VisibleIndex="2" Width="80px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" ReadOnly="True" VisibleIndex="3" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle ForeColor="Blue">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Lucro" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercial" ReadOnly="True" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SellOut" FieldName="LucroSellOut" ReadOnly="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ReadOnly="True" VisibleIndex="4" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle Font-Bold="True">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Margem" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="% " FieldName="percMargem" ReadOnly="True" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% SellOut" FieldName="percMargemSellOut" ReadOnly="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>

                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" ShowTitlePanel="True" />
                        <SettingsText Title="Ranking por Gestor - Super" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F0F0F0">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="sd_Super" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspParticipacaoPorComprador_Super" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="MesInicial" SessionField="sMES_INICIAL" Type="Byte" />
                            <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />                    
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <br />

                    <dx:ASPxGridView ID="grid_SuperE" runat="server" DataSourceID="sd_SuperE" AutoGenerateColumns="False" KeyFieldName="DescCompradorAbrev">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut" SummaryType="Sum" />
                        </TotalSummary>

                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Ranking" ShowInCustomizationForm="True" VisibleIndex="0">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Gestor" FieldName="DescCompradorAbrev" VisibleIndex="1"  >
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ReadOnly="True" VisibleIndex="2" Width="80px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" ReadOnly="True" VisibleIndex="3" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle ForeColor="Blue">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Lucro" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercial" ReadOnly="True" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SellOut" FieldName="LucroSellOut" ReadOnly="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ReadOnly="True" VisibleIndex="4" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle Font-Bold="True">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Margem" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="% " FieldName="percMargem" ReadOnly="True" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% SellOut" FieldName="percMargemSellOut" ReadOnly="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>

                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" ShowTitlePanel="True" />
                        <SettingsText Title="Ranking por Gestor - Super E" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F0F0F0">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="sd_SuperE" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspParticipacaoPorComprador_SuperE" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="MesInicial" SessionField="sMES_INICIAL" Type="Byte" />
                            <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />                    
                        </SelectParameters>
                    </asp:SqlDataSource>


                    <br />

                    <dx:ASPxGridView ID="grid_Hiper" runat="server" DataSourceID="sd_Hiper" AutoGenerateColumns="False" KeyFieldName="DescCompradorAbrev">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut" SummaryType="Sum" />
                        </TotalSummary>

                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Ranking" ShowInCustomizationForm="True" VisibleIndex="0">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Gestor" FieldName="DescCompradorAbrev" VisibleIndex="1"  >
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ReadOnly="True" VisibleIndex="2" Width="80px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" ReadOnly="True" VisibleIndex="3" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle ForeColor="Blue">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Lucro" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercial" ReadOnly="True" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="SellOut" FieldName="LucroSellOut" ReadOnly="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ReadOnly="True" VisibleIndex="4" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle Font-Bold="True">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Margem" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="% " FieldName="percMargem" ReadOnly="True" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% SellOut" FieldName="percMargemSellOut" ReadOnly="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>

                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" ShowTitlePanel="True" />
                        <SettingsText Title="Ranking por Gestor - Hiper" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F0F0F0">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="sd_Hiper" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspParticipacaoPorComprador_Hiper" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="MesInicial" SessionField="sMES_INICIAL" Type="Byte" />
                            <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />                    
                        </SelectParameters>
                    </asp:SqlDataSource>


                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

    </div>

<%--        <div id="divExcel">
            <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="ASPxGridView1"  />           
        </div>--%>    

</asp:Content>

