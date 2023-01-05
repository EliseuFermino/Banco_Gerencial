<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Venda_Item_12Meses.aspx.vb" Inherits="MemberPages_SLV_Venda_Item_12Meses" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc4" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="../../Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">

        #divAno {
            clear: both;
            float: left;
            margin-left: 5px;
            padding-top: 2px;
        }

        #divSecao {     
            float: left;
            padding-left: 5px;  
               
        }

         #divBotaoAtualizar {     
            float: left;
            margin-left: 10px;  
            padding-top: 4px;     
        }

        #divParticipacao {
            float: left;
            margin-left: 10px; 
            padding-top: 7px;
        }

        #divLucro {
            float: left;
            padding-left: 15px; 
        }

        #divSize {
            float: left;
           padding-left: 15px; 
        }
        
        #divDados {
            clear: both;
            float: left;
            width: 100%;
        }

       

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno ID="cboAno" runat="server" AutoPostBack="false"  />
    </div>
       
    <div id="divSecao">
        <uc1:wucListaSecao runat="server" ID="cboSecao" />
    </div>

    <div id="divBotaoAtualizar" >
        <dxe:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue" Height="30px" >
                <ClientSideEvents Click="function(s, e) {	cbPanelGrid.PerformCallback();  }" />
            </dxe:ASPxButton>
    </div>
    

    <div id="divParticipacao" >
        <dxe:ASPxCheckBox ID="chkpariticipacao" runat="server" Text="Exibir Participação" Theme="Mulberry" CheckState="Unchecked"  Visible="true"  >
            <ClientSideEvents CheckedChanged="function(s, e) {cbPanelGrid.PerformCallback();" />
        </dxe:ASPxCheckBox>
    </div>


    <div id="divLucro" >
        <dxe:ASPxCheckBox ID="chkLucro" runat="server" Text="Exibir Lucro" Theme="DevEx" CheckState="Unchecked" Visible="false">
            <ClientSideEvents CheckedChanged="function(s, e) {	cbPanelGrid.PerformCallback();}" />
        </dxe:ASPxCheckBox>
    </div>

    

    <div id="divSize" >
        <uc1:wucSize runat="server" ID="wucSize" AutoPostBack="False" Visible="false" />
    </div>

    <div id="divDados">

        <dxe:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="100%" ClientInstanceName="cbPanelGrid" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
                
        <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                
                <PanelCollection>
                    <dxe:PanelContent runat="server" SupportsDisabledAttributes="both">

                       <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" zataSourceID="dsSuper" KeyFieldName="idProduto" Theme="SoftOrange" Width="100%" DataSourceID="dsSuper">
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <FormatConditions>
                                <dxe:GridViewFormatConditionIconSet FieldName="percCresc_MetaAnual" Format="PositiveNegativeArrowsColored" />
                                <dxe:GridViewFormatConditionIconSet FieldName="percCresc_RealMeta" Format="PositiveNegativeTriangles" />
                                <dxe:GridViewFormatConditionIconSet FieldName="percCresc_RealAA1" Format="PositiveNegativeTriangles" />
                                <dxe:GridViewFormatConditionIconSet FieldName="percMA" Format="PositiveNegativeTriangles" />
                            </FormatConditions>
                            <Styles >
                                <Header ImageSpacing="5px" SortingImageSpacing="5px" HorizontalAlign="Center"></Header>                            
                                <Footer Font-Bold="True">
                                </Footer>
                                <LoadingPanel ImageSpacing="10px"></LoadingPanel>
                                <FocusedRow BackColor="Yellow" ForeColor="Black"> </FocusedRow>
                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                            </Styles>
                            <SettingsText EmptyDataRow="Não informações atualizadas financeiras para este período." />
                            
                            <TotalSummary>
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_m1"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_m2"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_m3"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_m4"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_m5"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_m6"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_m7"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_m8"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_m9"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_m10"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_m11"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_m12"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_m99"  SummaryType="Sum" />

                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr_m1"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr_m2"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr_m3"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr_m4"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr_m5"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr_m6"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr_m7"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr_m8"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr_m9"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr_m10"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr_m11"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr_m12"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr_m99"  SummaryType="Sum" />

                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Qtde_m1"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Qtde_m2"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Qtde_m3"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Qtde_m4"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Qtde_m5"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Qtde_m6"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Qtde_m7"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Qtde_m8"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Qtde_m9"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Qtde_m10"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Qtde_m11"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Qtde_m12"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Qtde_m99"  SummaryType="Sum" />

                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlr_m1"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlr_m2"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlr_m3"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlr_m4"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlr_m5"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlr_m6"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlr_m7"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlr_m8"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlr_m9"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlr_m10"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlr_m11"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlr_m12"  SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlr_m99"  SummaryType="Sum" />

                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde_2"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde_3"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde_4"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde_5"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde_6"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde_7"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde_8"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde_9"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde_10"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde_11"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde_12"  SummaryType="Custom" />

                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vlr_2"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vlr_3"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vlr_4"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vlr_5"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vlr_6"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vlr_7"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vlr_8"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vlr_9"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vlr_10"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vlr_11"  SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vlr_12"  SummaryType="Custom" />
                                

                            </TotalSummary>
                            <Columns>
                                <dxwgv:GridViewBandColumn Caption="Abril" ToolTip="Mês 04 - Abril" 
                                    VisibleIndex="6" Name="bandMetaMes">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde_m4" 
                                            VisibleIndex="0" Width="80px" ToolTip="Valor da meta do mês selecionado">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vlr_m4" 
                                            VisibleIndex="3" Width="80px" UnboundType="Decimal">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part Q" FieldName="percPart_Qtde_m4" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part V" FieldName="percPart_vlr_m4" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc Q" FieldName="percCresc_Qtde_4" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc V" FieldName="percCresc_Vlr_4" ShowInCustomizationForm="True" VisibleIndex="5" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>

                                       
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Março" VisibleIndex="5" ToolTip="Mês 03 - Março">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde_m3" 
                                            ToolTip="% de crescimento. Meta sobre o  Realizado" VisibleIndex="0" 
                                            Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <EditCellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </EditCellStyle>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vlr_m3" 
                                            VisibleIndex="3" Width="80px" ToolTip="Percentual de Crescimento sobre o Mês Anterior">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part Q" FieldName="percPart_Qtde_m3" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part V" FieldName="percPart_vlr_m3" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc Q" FieldName="percCresc_Qtde_3" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc V" FieldName="percCresc_Vlr_3" ShowInCustomizationForm="True" VisibleIndex="5" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Fevereiro" VisibleIndex="4" ToolTip="Mês 02 - Fevereiro">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde_m2" 
                                            VisibleIndex="0" Width="80px" Name="bandAA1" ToolTip="Valor da venda do ano anterior acumulado no mesmo período de dias.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vlr_m2" 
                                            VisibleIndex="3" Width="80px" Name="bandAA2" ToolTip="Valor da venda de dois anos anteriores acumulado no mesmo período de dias.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part Q" FieldName="percPart_Qtde_m2" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part V" FieldName="percPart_vlr_m2" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc Q" FieldName="percCresc_Qtde_2" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc V" FieldName="percCresc_Vlr_2" ShowInCustomizationForm="True" VisibleIndex="5" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Janeiro" VisibleIndex="3" ToolTip="Mês de Janeiro">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde_m1" 
                                            VisibleIndex="0" Width="80px" ToolTip="Valor da meta acumulada até o dia de ontem">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vlr_m1" 
                                            VisibleIndex="2" Width="80px" ToolTip="Valor do realizado acumulado até o dia de ontem">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part Q" FieldName="percPart_Qtde_m1" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part V" FieldName="percPart_vlr_m1" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Código" FieldName="idProduto" VisibleIndex="0" 
                                    Width="90px" FixedStyle="Left">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Produto" FieldName="nomeProduto" 
                                    VisibleIndex="1" Width="250px" ToolTip="Nome do Comprador" FixedStyle="Left">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewBandColumn Caption="Maio" VisibleIndex="7" ToolTip="Mês 05 - Maio">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde_m5" 
                                            VisibleIndex="0" Width="80px" ToolTip="Percentual de Meta de Margem">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vlr_m5" 
                                            VisibleIndex="3" Width="80px" ToolTip="Percentual de Margem Real">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part Q" FieldName="percPart_Qtde_m5" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part V" FieldName="percPart_vlr_m5" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc Q" FieldName="percCresc_Qtde_5" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc V" FieldName="percCresc_Vlr_5" ShowInCustomizationForm="True" VisibleIndex="5" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Agosto" Name="bandLucro" VisibleIndex="10" ToolTip="Mês 08 - Agosto">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde_m8" VisibleIndex="0" Width="80px" ToolTip="Valor do lucro do ano atual">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vlr_m8" VisibleIndex="3" Width="80px" ToolTip="Valor do lucro do ano anterior">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part Q" FieldName="percPart_Qtde_m8" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part V" FieldName="percPart_vlr_m8" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc Q" FieldName="percCresc_Qtde_8" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc V" FieldName="percCresc_Vlr_8" ShowInCustomizationForm="True" VisibleIndex="5" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                    </Columns>
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Junho" ToolTip="Mês 06 - Junho" VisibleIndex="8">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde_m6" ToolTip="Valor do SellOut no ano atual" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vlr_m6" ToolTip="Percentual de Margem com SellOut" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle ForeColor="Blue" />
                                            <CellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part Q" FieldName="percPart_Qtde_m6" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part V" FieldName="percPart_vlr_m6" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc Q" FieldName="percCresc_Qtde_6" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc V" FieldName="percCresc_Vlr_6" ShowInCustomizationForm="True" VisibleIndex="5" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle BackColor="Gray" />
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Julho" ToolTip="Mês 07 - Julho" VisibleIndex="9">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde_m7" ToolTip="Valor da Margem Final = Valor da Margem Praticada + Valor do SellOut" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vlr_m7" ToolTip="Percentual da Margem Final = Percentual da Margem Praticada + Percentual do SellOut" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle ForeColor="Blue" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part Q" FieldName="percPart_Qtde_m7" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part V" FieldName="percPart_vlr_m7" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc Q" FieldName="percCresc_Qtde_7" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc V" FieldName="percCresc_Vlr_7" ShowInCustomizationForm="True" VisibleIndex="5" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                    </Columns>
                                </dxwgv:GridViewBandColumn>
                                <dxe:GridViewBandColumn Caption="Setembro" ShowInCustomizationForm="True" ToolTip="Mês 09 - Setembro" VisibleIndex="11">
                                    <Columns>
                                        <dxe:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde_m9" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="R$" FieldName="vlr_m9" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part Q" FieldName="percPart_Qtde_m9" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part V" FieldName="percPart_vlr_m9" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc Q" FieldName="percCresc_Qtde_9" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc V" FieldName="percCresc_Vlr_9" ShowInCustomizationForm="True" VisibleIndex="5" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                    </Columns>
                                </dxe:GridViewBandColumn>
                                <dxe:GridViewBandColumn Caption="Outubro" ShowInCustomizationForm="True" ToolTip="Mês 10 - Outubro" VisibleIndex="12">
                                    <Columns>
                                        <dxe:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde_m10" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="R$" FieldName="vlr_m10" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part Q" FieldName="percPart_Qtde_m10" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part V" FieldName="percPart_vlr_m10" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc Q" FieldName="percCresc_Qtde_10" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc V" FieldName="percCresc_Vlr_10" ShowInCustomizationForm="True" VisibleIndex="5" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                    </Columns>
                                </dxe:GridViewBandColumn>
                                <dxe:GridViewBandColumn Caption="Novembro" ShowInCustomizationForm="True" ToolTip="Mês 11 - Novembro" VisibleIndex="13">
                                    <Columns>
                                        <dxe:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde_m11" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="R$" FieldName="vlr_m11" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part Q" FieldName="percPart_Qtde_m11" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part V" FieldName="percPart_vlr_m11" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc Q" FieldName="percCresc_Qtde_11" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc V" FieldName="percCresc_Vlr_11" ShowInCustomizationForm="True" VisibleIndex="5" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                    </Columns>
                                </dxe:GridViewBandColumn>
                                <dxe:GridViewBandColumn Caption="Dezembro" ShowInCustomizationForm="True" ToolTip="Mês 12 - Dezembro" VisibleIndex="14">
                                    <Columns>
                                        <dxe:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde_m12" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="R$" FieldName="vlr_m12" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part Q" FieldName="percPart_Qtde_m12" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part V" FieldName="percPart_vlr_m12" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc Q" FieldName="percCresc_Qtde_12" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Cresc V" FieldName="percCresc_Vlr_12" ShowInCustomizationForm="True" VisibleIndex="5" Width="75px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                    </Columns>
                                </dxe:GridViewBandColumn>
                                <dxe:GridViewBandColumn Caption="Ano" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Ano" VisibleIndex="2">
                                    <HeaderStyle BackColor="#666666" ForeColor="White" />
                                    <Columns>
                                        <dxe:GridViewDataTextColumn Caption="Qtde" FieldName="Qtde_m99" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="R$" FieldName="vlr_m99" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part Q" FieldName="percPart_Qtde_m99" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                        <dxe:GridViewDataTextColumn Caption="% Part V" FieldName="percPart_vlr_m99" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxe:GridViewDataTextColumn>
                                    </Columns>
                                </dxe:GridViewBandColumn>
                            </Columns>
                            <Settings ShowTitlePanel="True"  ShowFooter="True" HorizontalScrollBarMode="Visible"  />
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                            <Templates>
                                <DetailRow>
                                    <h4>Por Seção do Comprador</h4>
                                </DetailRow>
                            </Templates>
                        </dxwgv:ASPxGridView>

                       <asp:SqlDataSource ID="dsSuper" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                        
                        
                            SelectCommand="usp_Venda_Item_12_Meses_por_Secao" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Int16" />
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </dxe:PanelContent>
                </PanelCollection>
            </dxe:ASPxCallbackPanel>
    </div>

</asp:Content>

