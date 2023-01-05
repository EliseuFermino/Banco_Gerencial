<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaAnoAA.aspx.vb" Inherits="MemberPages_Vendas_VendaAnoAA" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divMesInicial {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-bottom: 2px;
        }     
        
        #divMesFinal {           
            float: left;
            margin-left: 2px;
            margin-bottom: 2px;
        }    

        #divCheckCorrecao {
            float: left;
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 2px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 1px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            width: 99.5%;
        }

        #divSize {            
            float: left;  
            margin-top: -3px;         
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

     <div id="divMesInicial" >
       <dx:ASPxDateEdit ID="cboMesInicial" runat="server" AllowUserInput="False" AutoPostBack="False" EditFormat="Custom" EditFormatString="MMMM" PickerDisplayMode="Auto" PickerType="Months" PopupHorizontalAlign="Center" Theme="Mulberry" Caption="Mês" Date="2021-01-01" MaxDate="2021-12-31" MinDate="2020-07-01" >
        <CalendarProperties EnableLargePeriodNavigation="False" EnablePeriodNavigation="False" ShowClearButton="False" ShowHeader="False" TodayButtonText="Mês Inicial" ShowTodayButton="False" >
        </CalendarProperties>
        <ClearButton DisplayMode="Never">
        </ClearButton>
        </dx:ASPxDateEdit>
     </div>

     <div id="divMesFinal" >
       <dx:ASPxDateEdit ID="cboMesFinal" runat="server" AllowUserInput="False" AutoPostBack="False" EditFormat="Custom" EditFormatString="MMMM" PickerDisplayMode="Auto" PickerType="Months" PopupHorizontalAlign="Center" Theme="Mulberry" Caption="Mês" Date="2021-01-01" MaxDate="2021-12-31" MinDate="2020-07-01" >
        <CalendarProperties EnableLargePeriodNavigation="False" EnablePeriodNavigation="False" ShowClearButton="False" ShowHeader="False" TodayButtonText="Mês Final" ShowTodayButton="False" >
        </CalendarProperties>
        <ClearButton DisplayMode="Never">
        </ClearButton>
        </dx:ASPxDateEdit>
     </div>

    <div id="divCheckCorrecao">
        <dx:ASPxCheckBox ID="chkCorrecao" runat="server" Text="Corrigir Venda" Theme="Mulberry" CheckState="Unchecked" >
            <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>



    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" EnableTheming="True" Theme="SoftOrange" Width="100%">
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Visible" ShowFilterRow="True" />
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsResizing ColumnResizeMode="Control" />
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Filial" FieldName="idFilial" ShowInCustomizationForm="False" VisibleIndex="0" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Nome da Filial" FieldName="descFilial" ShowInCustomizationForm="True" VisibleIndex="1" FixedStyle="Left" Width="180px">
                                <Settings AllowAutoFilter="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="% Cresc 21 x 11" FieldName="percCresc" ShowInCustomizationForm="True" VisibleIndex="32" Width="115px" ToolTip="Percentual de Crescimento 2021 sobre 2011">                               
                                <Settings AllowAutoFilter="False" />
                                <HeaderStyle BackColor="#996633" ForeColor="White" />
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Super / Hiper" FieldName="descSuperHiper" ShowInCustomizationForm="True" VisibleIndex="33" Width="100px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Região" FieldName="descRegiao" ShowInCustomizationForm="True" VisibleIndex="34" Width="100px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                 <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <Settings AllowAutoFilter="True" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Venda 2010" Name="band2010" ShowInCustomizationForm="True" VisibleIndex="2" Visible="false">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlr2010" ShowInCustomizationForm="True" VisibleIndex="1" >
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="#" FieldName="rnk2010" ShowInCustomizationForm="True" ToolTip="Posição" VisibleIndex="0" Width="40px">
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc Real" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" FieldName="percCrescCorr2010">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Corrigida IPCA" FieldName="vlr2010c" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda 2011" Name="band2011" ShowInCustomizationForm="True" VisibleIndex="3">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlr2011" ShowInCustomizationForm="True" VisibleIndex="1" >
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% A.A" FieldName="percCresc2011" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento 2011 sobre 2010" VisibleIndex="4" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="#" FieldName="rnk2011" ShowInCustomizationForm="True" ToolTip="Posição" VisibleIndex="0" Width="40px">
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc Real" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" FieldName="percCrescCorr2011">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Corrigida IPCA" FieldName="vlr2011c" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda 2012" Name="band2012" ShowInCustomizationForm="True" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlr2012" ShowInCustomizationForm="True" VisibleIndex="1" >
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% A.A" FieldName="percCresc2012" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento 2012 sobre 2011" VisibleIndex="4" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="#" FieldName="rnk2012" ShowInCustomizationForm="True" ToolTip="Posição" VisibleIndex="0" Width="40px">
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc Real" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" FieldName="percCrescCorr2012">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Corrigida IPCA" FieldName="vlr2012c" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda 2013" Name="band2013" ShowInCustomizationForm="True" VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlr2013" ShowInCustomizationForm="True" VisibleIndex="1" >
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% A.A" FieldName="percCresc2013" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento 2013 sobre 2012" VisibleIndex="4" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="#" FieldName="rnk2013" ShowInCustomizationForm="True" ToolTip="Posição" VisibleIndex="0" Width="40px">
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc Real" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" FieldName="percCrescCorr2013">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Corrigida IPCA" FieldName="vlr2013c" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda 2014" Name="band2014" ShowInCustomizationForm="True" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlr2014" ShowInCustomizationForm="True" VisibleIndex="1" >
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% A.A" FieldName="percCresc2014" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento 2014 sobre 2013" VisibleIndex="4" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="#" FieldName="rnk2014" ShowInCustomizationForm="True" ToolTip="Posição" VisibleIndex="0" Width="40px">
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc Real" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" FieldName="percCrescCorr2014">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Corrigida IPCA" FieldName="vlr2014c" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda 2015" Name="band2015" ShowInCustomizationForm="True" VisibleIndex="8">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlr2015" ShowInCustomizationForm="True" VisibleIndex="1" >
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% A.A" FieldName="percCresc2015" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento 2015 sobre 2014" VisibleIndex="4" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="#" FieldName="rnk2015" ShowInCustomizationForm="True" ToolTip="Posição" VisibleIndex="0" Width="40px">
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc Real" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" FieldName="percCrescCorr2015">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Corrigida IPCA" FieldName="vlr2015c" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda 2016" Name="band2016" ShowInCustomizationForm="True" VisibleIndex="9">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlr2016" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% A.A" FieldName="percCresc2016" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento 2016 sobre 2015" VisibleIndex="4" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="#" FieldName="rnk2016" ShowInCustomizationForm="True" ToolTip="Posição" VisibleIndex="0" Width="40px">
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc Real" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" FieldName="percCrescCorr2016">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Corrigida IPCA" FieldName="vlr2016c" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda 2017" Name="band2017" ShowInCustomizationForm="True" VisibleIndex="10">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="#" FieldName="rnk2017" ShowInCustomizationForm="True" ToolTip="Posição" VisibleIndex="0" Width="40px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlr2017" ShowInCustomizationForm="True" VisibleIndex="1" >
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% A.A" FieldName="percCresc2017" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento 2017 sobre 2016" VisibleIndex="4" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc Real" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" FieldName="percCrescCorr2017">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Corrigida IPCA" FieldName="vlr2017c" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda 2018" Name="band2018" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="#" FieldName="rnk2018" ShowInCustomizationForm="True" ToolTip="Posição" VisibleIndex="0" Width="40px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlr2018" ShowInCustomizationForm="True" VisibleIndex="1" >
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% A.A" FieldName="percCresc2018" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento 2018 sobre 2017" VisibleIndex="4" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc Real" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" FieldName="percCrescCorr2018">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Corrigida IPCA" FieldName="vlr2018c" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda 2019" Name="band2019" ShowInCustomizationForm="True" VisibleIndex="14">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlr2019" ShowInCustomizationForm="True" VisibleIndex="1" >
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="#" FieldName="rnk2019" ShowInCustomizationForm="True" ToolTip="Posição" VisibleIndex="0" Width="40px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% A.A" FieldName="percCresc2019" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento 2019 sobre 2018" VisibleIndex="4" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc Real" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" FieldName="percCrescCorr2019">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Corrigida IPCA" FieldName="vlr2019c" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda 2020" Name="band2020" ShowInCustomizationForm="True" VisibleIndex="16">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlr2020" ShowInCustomizationForm="True" VisibleIndex="1" >
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" /> 
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />                                       
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="#" FieldName="rnk2020" ShowInCustomizationForm="True" ToolTip="Posição" VisibleIndex="0" Width="40px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% A.A" FieldName="percCresc2020" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento 2020 sobre 2019" VisibleIndex="4" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Corrigida IPCA" FieldName="vlr2020c" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc Real" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" FieldName="percCrescCorr2020">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda 2021" Name="band2021" ShowInCustomizationForm="True" VisibleIndex="18">
                                <HeaderStyle BackColor="#666666" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlr2021" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="#" FieldName="rnk2021" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" ToolTip="Posição" VisibleIndex="0" Width="40px">
                                        <Settings AllowAutoFilter="False" />                                        
                                        <HeaderStyle BackColor="#666666" />
                                        <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% A.A" FieldName="percCresc2021" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento 2021 sobre 2020" VisibleIndex="5" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc Real" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4" FieldName="percCrescCorr2021">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Corrigida IPCA" FieldName="vlr2021c" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#ff9900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2010" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2011" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2012" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2013" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2014" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2015" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2016" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2017" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2018" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2019" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2020" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2021" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2010c" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2011c" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2012c" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2013c" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2014c" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2015c" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2016c" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2017c" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2018c" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2019c" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2020c" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr2021c" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc2011" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc2012" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc2013" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc2014" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc2015" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc2016" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc2017" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc2018" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc2019" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc2020" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc2021" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCorr2010" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCorr2011" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCorr2012" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCorr2013" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCorr2014" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCorr2015" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCorr2016" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCorr2017" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCorr2018" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCorr2019" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCorr2020" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCorr2021" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />

                        </TotalSummary>

                        <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>

                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#E1E1E1">
                            </AlternatingRow>
                            <FocusedRow BackColor="Yellow" ForeColor="Blue">
                            </FocusedRow>
                            <Footer BackColor="#CCFFCC">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>
                  
                                      
                    
<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="dbo.usp_Venda_por_Ano_Joanir_12meses" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="rndAnoInteiro" SessionField="sANO_INTEIRO" Type="Byte"/>
                            <asp:SessionParameter Name="MesInicial" SessionField="sDIA_INICIAL" Type="Byte"  />
                            <asp:SessionParameter Name="MesFinal" SessionField="sDIA_FINAL" Type="Byte"  />                            
                            <asp:SessionParameter Name="Correcao" SessionField="sCORRECAO" Type="Byte"  />  
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

        <uc1:wucObsPrograma runat="server" id="wucObsPrograma" lbAnotacao1="Database: DW" lbAnotacao2="Stored Procedure: dbo.usp_Venda_por_Ano_Joanir" />

    </div>

    

</asp:Content>


