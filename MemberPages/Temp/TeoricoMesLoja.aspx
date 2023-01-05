<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/mpPrincipal.master" AutoEventWireup="false" CodeFile="TeoricoMesLoja.aspx.vb" Inherits="MemberPages_TeoricoMesLoja1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register src="../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc1" %>
<%@ Register src="../Controles/wucListaMesAcumulado.ascx" tagname="wucListaMesAcumulado" tagprefix="uc2" %>
<%@ Register src="../Controles/wucListaAno.ascx" tagname="wucListaAno" tagprefix="uc1" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register src="../Controles/wucListaGrupoTodas.ascx" tagname="wucListaGrupoTodas" tagprefix="uc3" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script language ="javascript" type ="text/javascript">
        function OnGridFocusedRowChanged() {
            gridGrupoMes.GetRowValues(gridGrupoMes.GetFocusedRowIndex(), 'idGrupo;descConta', OnGetRowValues);           
        }
       
        function OnGetRowValues(values) {
            txtIE.SetText(values[0]);   
                       
        }       
    </script>

    <style type="text/css">
    .style12
    {
        width: 161px;
    }
    .style13
    {
        width: 33px;
    }
        .style14
        {
            width: 2px;
        }
.dxgvControl_Office2003_Blue,
.dxgvDisabled_Office2003_Blue
{
	border: solid 1px #4f93e3;
	font: 9pt Tahoma;
	background-color: White;
	color: Black;
	cursor: default;
}

.dxgvTitlePanel_Office2003_Blue,
.dxgvTable_Office2003_Blue caption
{
	color: White;
	font-weight:bold;
	padding:3px;
	text-align:center;	
	border-bottom: solid 1px #4f93e3;
	background: #0f439d url('../App_Themes/Office2003%20Blue/GridView/gvTitleBack.gif') repeat-x center top;
        }

.dxgvTable_Office2003_Blue
{
	background-color: transparent;
	border:0;
	border-collapse: separate !important;
	overflow:hidden;
	font: 9pt Tahoma;
	color: Black;
}

.dxgvHeader_Office2003_Blue {
	cursor:pointer;
	white-space:nowrap;
	padding: 4px 6px 5px 6px;
	border: solid 1px #4f93e3;
	background: #94b6e8 url('../App_Themes/Office2003%20Blue/GridView/gvGradient.gif') repeat-x center top;
	overflow:hidden;
	-moz-user-select: none;
    font-weight: normal;
    text-align: left;
}
.dxgvFooter_Office2003_Blue
{	
	background-color: #94B6E8;
	white-space: nowrap;
}
        .style15
        {
            width: 697px;
        }
        .style16
        {
            width: 678px;
        }
    .dxbButton_Aqua
{	
    color: #2C4D79;   
    font-size: 9pt;
    font-family: Tahoma;				    
	font-weight:normal;    
    vertical-align: middle;	 		
    border: solid 1px #A3C0E8;	
    background: #E2F0FF url('../App_Themes/Aqua/Editors/edtButtonBack.gif') repeat-x 50% top;
    padding: 1px 1px 1px 1px;
	cursor: pointer;
	cursor: hand;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>                                        
            
                                    
        <table cellspacing="1" class="style1">
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        
                        <ContentTemplate>
                            <table cellspacing="1" class="style1">
                                <tr>
                                    <td class="style13">
                                        <uc1:wucListaAno ID="cboAno" runat="server" />
                                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                                            AssociatedUpdatePanelID="UpdatePanel1">
                                            <progresstemplate>
                                                <asp:Image ID="Image1" runat="server" ImageUrl="~/image/update.gif" />
                                                &nbsp;&nbsp;<span class="style3"><b>Processando...</b></span>
                                            </progresstemplate>
                                        </asp:UpdateProgress>
                                    </td>
                                    <td class="style12">
                                        <uc2:wucListaMesAcumulado ID="cboMes" runat="server" />
                                    </td>
                                    <td class="style16">
                                        <uc1:wucListaLojasComCorporacao ID="cboFilial" 
                                            runat="server" />
                                    </td>
                                    <td align="right">
                                        <uc3:wucListaGrupoTodas ID="cboGrupo" runat="server" />
                                    </td>
                                    <td align="left">
                                        <asp:Button ID="Button1" runat="server" Text="loja x loja" BackColor="#009900" 
                                            ForeColor="White" />
                                        <asp:ModalPopupExtender ID="Button1_ModalPopupExtender" runat="server" 
                                            BackgroundCssClass="modalBackground" CancelControlID="btnCancela" 
                                            DropShadow="true" DynamicServicePath="" Enabled="True" 
                                            PopupControlID="pnl_TodasContas" TargetControlID="Button1">
                                        </asp:ModalPopupExtender>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnOther" runat="server" Text="Button" Visible="False" />
                                        <asp:ModalPopupExtender ID="btnOther_ModalPopupExtender" runat="server"
                                         BackgroundCssClass="modalBackground" CancelControlID="btn_CloseOther"
                                         DropShadow="true" DynamicServicePath="" Enabled="True"  
                                         PopupControlID="pnlOther" TargetControlID="btnOther">
                                        </asp:ModalPopupExtender>
                                    </td>
                                    <td>
                                        <asp:Button ID="btnTerceiro" runat="server" Text="Terceiro" Visible="False" />
                                        <asp:ModalPopupExtender ID="btnTerceiro_ModalPopupExtender" runat="server" 
                                            BackgroundCssClass="modalBackground" CancelControlID="btnClose_Terceiro"
                                            DropShadow="true" DynamicServicePath="" Enabled="True"
                                            PopupControlID="pnl_Terceiro" TargetControlID="btnTerceiro">
                                        </asp:ModalPopupExtender>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <table cellspacing="1" class="style1">
                                <tr>
                                    <td align="left" class="style15" valign="top">
                                        <asp:Accordion ID="Accordion1" runat="server" 
                                            ContentCssClass="accordionContent" CssClass="accordion" 
                                            HeaderCssClass="accordionHeader" 
                                            HeaderSelectedCssClass="accordionHeaderSelected">
                                            <Panes>
                                                <asp:AccordionPane runat="server">
                                                    <Header>
                                                        <asp:Label runat="server" Text="% da Última Linha do Resultado - 2012"></asp:Label>
                                                    </Header>
                                                    <Content>
                                                        <%--COMEÇA AQUI--%>
                                                        <dxwgv:ASPxGridView ID="gridUltimaLinhaTodosMeses" runat="server" 
                                                            AutoGenerateColumns="False" 
                                                            CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                            CssPostfix="Office2003_Blue" DataSourceID="dsUltimaLinhaTodosMeses" 
                                                            KeyFieldName="Mes">
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                                CssPostfix="Office2003_Blue">
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <AlternatingRow BackColor="#E6F2FF">
                                                                </AlternatingRow>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                            </Styles>
                                                            <SettingsPager Mode="ShowAllRecords">
                                                                <AllButton Text="All">
                                                                </AllButton>
                                                                <NextPageButton Text="Next &gt;">
                                                                </NextPageButton>
                                                                <PrevPageButton Text="&lt; Prev">
                                                                </PrevPageButton>
                                                            </SettingsPager>
                                                            <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                                                <CollapsedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                                    Width="11px" />
                                                                <ExpandedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                                                <DetailCollapsedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                                    Width="11px" />
                                                                <DetailExpandedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                                                <FilterRowButton Height="13px" Width="13px" />
                                                            </Images>
                                                            <SettingsText Title="Ano 2012" />
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="Mês" FieldName="DescMes" ReadOnly="True" 
                                                                    VisibleIndex="0">
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Real AA" FieldName="percRealAA" 
                                                                    ToolTip="% do Realizado do resultado teórico do ano anterior" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Ori" FieldName="percOri" 
                                                                    ToolTip="percentual (%) da meta Original" VisibleIndex="2">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Rev" FieldName="percRev" 
                                                                    ToolTip="percentual (%) da meta Revista" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Real" FieldName="percReal" 
                                                                    ToolTip="percentual (%) do Realizado" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Dif." FieldName="difPercRev" 
                                                                    ReadOnly="True" 
                                                                    ToolTip="Percentual de diferença entre Realizado e Meta Revista." 
                                                                    VisibleIndex="5">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                            <Settings ShowTitlePanel="True" />
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                        </dxwgv:ASPxGridView>
                                                        <%--TERMINA AQUI--%>
                                                    </Content>
                                                </asp:AccordionPane>
                                                <asp:AccordionPane ID="AccordionPane1" runat="server">
                                                    <Header>
                                                        <asp:Label runat="server" Text="Histórico Última Linha Real - Janeiro"></asp:Label>
                                                    </Header>
                                                    <Content>
                                                        <%--COMEÇA AQUI--%>
                                                        <dxchartsui:WebChartControl ID="WebChartControl3" runat="server" 
                                                            BackColor="Transparent" DataSourceID="dsHistAcu"  
                                                            Height="200px" PaletteName="Median" Width="300px">
                                                            <seriesserializable>
                                                                <cc1:Series ArgumentDataMember="Obs"  
                                                                    Name="Series 1"  
                                                                     SynchronizePointOptions="False" 
                                                                    ValueDataMembersSerializable="perc">
                                                                    <ViewSerializable>
<cc1:SideBySideBarSeriesView coloreach="True" hiddenserializablestring="to be serialized" 
                                                                        transparency="50">
                                                                        

                                                                    </cc1:SideBySideBarSeriesView>
</ViewSerializable>
                                                                    <LabelSerializable>
<cc1:SideBySideBarSeriesLabel hiddenserializablestring="to be serialized" linevisible="True" 
                                                                        overlappingoptionstypename="OverlappingOptions" position="Center">
                                                                    <fillstyle >
                                                    <OptionsSerializable>
<cc1:SolidFillOptions hiddenserializablestring="to be serialized" />
</OptionsSerializable>
                                                </fillstyle>
                                                                    </cc1:SideBySideBarSeriesLabel>
</LabelSerializable>
                                                                    <PointOptionsSerializable>
<cc1:PointOptions hiddenserializablestring="to be serialized">
                                                                        

                                                                        <valuenumericoptions format="Number" />
                                                                        

                                                                    </cc1:PointOptions>
</PointOptionsSerializable>
                                                                    <LegendPointOptionsSerializable>
<cc1:PointOptions hiddenserializablestring="to be serialized">
                                                                        

                                                                        <valuenumericoptions format="Number" />
                                                                        

                                                                    </cc1:PointOptions>
</LegendPointOptionsSerializable>
                                                                </cc1:Series>
                                                            </seriesserializable>
                                                            <seriestemplate  
                                                                 
                                                                >
                                                                

                                                                <ViewSerializable>
<cc1:SideBySideBarSeriesView hiddenserializablestring="to be serialized">
                                                                    

                                                                </cc1:SideBySideBarSeriesView>
</ViewSerializable>
                                                                

                                                                <LabelSerializable>
<cc1:SideBySideBarSeriesLabel hiddenserializablestring="to be serialized" linevisible="True" 
                                                                    overlappingoptionstypename="OverlappingOptions">
                                                                

                                                                <fillstyle >
                                                <OptionsSerializable>
<cc1:SolidFillOptions hiddenserializablestring="to be serialized" />
</OptionsSerializable>
                                            </fillstyle>
                                                                

                                                                </cc1:SideBySideBarSeriesLabel>
</LabelSerializable>
                                                                

                                                                <PointOptionsSerializable>
<cc1:PointOptions hiddenserializablestring="to be serialized">
                                                                    

                                                                </cc1:PointOptions>
</PointOptionsSerializable>
                                                                

                                                                <LegendPointOptionsSerializable>
<cc1:PointOptions hiddenserializablestring="to be serialized">
                                                                    

                                                                </cc1:PointOptions>
</LegendPointOptionsSerializable>
                                                                

                                                            </seriestemplate>
                                                            <DiagramSerializable>
<cc1:XYDiagram>
                                                                

                                                                <axisx color="CornflowerBlue" visibleinpanesserializable="-1">
<label textcolor="White"></label>

<range sidemarginsenabled="True"></range>
</axisx>
                                                                

                                                                <axisy visible="False" visibleinpanesserializable="-1">
<range sidemarginsenabled="True"></range>
</axisy>
                                                                

                                                                <defaultpane backcolor="Transparent" bordervisible="False"></defaultpane>
                                                                

                                                            </cc1:XYDiagram>
</DiagramSerializable>
                                                            <fillstyle >
                                                                

                                                                <OptionsSerializable>
<cc1:SolidFillOptions hiddenserializablestring="to be serialized" />
</OptionsSerializable>
                                                                

                                                            </fillstyle>
                                                            <legend Visibility="False"></legend>
                                                            <borderoptions color="Transparent" visible="False" />
                                                        </dxchartsui:WebChartControl>
                                                        <%--TERMINA AQUI--%>
                                                    </Content>
                                                </asp:AccordionPane>
                                                <asp:AccordionPane ID="AccordionPane2" runat="server">
                                                    <Header>
                                                        Análise de Vendas
                                                    </Header>
                                                    <Content>
                                                        <%--COMEÇA AQUI--%>
                                                        <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                                                            AutoGenerateColumns="False" 
                                                            CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                            CssPostfix="Office2003_Blue" DataSourceID="dsMetaRealizado" KeyFieldName="Mes">
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                                CssPostfix="Office2003_Blue">
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <AlternatingRow BackColor="#E6F2FF">
                                                                </AlternatingRow>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                            </Styles>
                                                            <SettingsPager Mode="ShowAllRecords">
                                                                <AllButton Text="All">
                                                                </AllButton>
                                                                <NextPageButton Text="Next &gt;">
                                                                </NextPageButton>
                                                                <PrevPageButton Text="&lt; Prev">
                                                                </PrevPageButton>
                                                            </SettingsPager>
                                                            <TotalSummary>
                                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" 
                                                                    SummaryType="Sum" />
                                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                                                    SummaryType="Sum" />
                                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                                                                    SummaryType="Sum" />
                                                            </TotalSummary>
                                                            <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                                                <CollapsedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                                    Width="11px" />
                                                                <ExpandedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                                                <DetailCollapsedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                                    Width="11px" />
                                                                <DetailExpandedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                                                <FilterRowButton Height="13px" Width="13px" />
                                                            </Images>
                                                            <SettingsText Title="Ano 2012" />
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="Mês" FieldName="DescMes" ReadOnly="True" 
                                                                    VisibleIndex="0">
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Original" FieldName="vlrOri" 
                                                                    ToolTip="Meta de venda original" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Revista" FieldName="vlrRev" 
                                                                    ToolTip="Meta de venda revista" VisibleIndex="2">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Realizada" FieldName="vlrReal" 
                                                                    ToolTip="Venda Realizada" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                            <Settings ShowFooter="True" ShowTitlePanel="True" />
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                        </dxwgv:ASPxGridView>
                                                        <%--TERMINA AQUI--%>
                                                    </Content>
                                                </asp:AccordionPane>
                                                <%-- ***************** ANALISE DAS MARGENS ***********************************************************************  --%>
                                                <asp:AccordionPane ID="AccordionPane3" runat="server">
                                                    <Header>
                                                        Análise das Margens
                                                    </Header>
                                                    <Content>
                                                        <%--COMEÇA AQUI--%>
                                                        <dxwgv:ASPxGridView ID="gridMargens" runat="server" AutoGenerateColumns="False" 
                                                            CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                            CssPostfix="Office2003_Blue" DataSourceID="dsMetaRealizadoMargem" 
                                                            KeyFieldName="Mes" Width="300px">
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                                CssPostfix="Office2003_Blue">
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <AlternatingRow BackColor="#E6F2FF">
                                                                </AlternatingRow>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                            </Styles>
                                                            <SettingsPager Mode="ShowAllRecords">
                                                                <AllButton Text="All">
                                                                </AllButton>
                                                                <NextPageButton Text="Next &gt;">
                                                                </NextPageButton>
                                                                <PrevPageButton Text="&lt; Prev">
                                                                </PrevPageButton>
                                                            </SettingsPager>
                                                            <TotalSummary>
                                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" 
                                                                    SummaryType="Sum" />
                                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                                                    SummaryType="Sum" />
                                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                                                                    SummaryType="Sum" />
                                                            </TotalSummary>
                                                            <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                                                <CollapsedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                                    Width="11px" />
                                                                <ExpandedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                                                <DetailCollapsedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                                    Width="11px" />
                                                                <DetailExpandedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                                                <FilterRowButton Height="13px" Width="13px" />
                                                            </Images>
                                                            <SettingsText Title="Ano 2012" />
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="Mês" FieldName="DescMes" 
                                                                    FixedStyle="Left" ReadOnly="True" VisibleIndex="0" Width="30px">
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Revista" FieldName="vlrRev" 
                                                                    ToolTip="Meta de venda revista" VisibleIndex="1" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Rev" FieldName="percRev" 
                                                                    ToolTip="% da Meta de venda revista" VisibleIndex="2" Width="40px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Realizada" FieldName="vlrReal" 
                                                                    ToolTip="Venda Realizada" VisibleIndex="3" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Real" FieldName="percReal" 
                                                                    ToolTip="% da venda realizada" VisibleIndex="4" Width="40px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Dif" FieldName="difPercRev" 
                                                                    ToolTip="Diferença entre a meta revista e o realizado" VisibleIndex="5" 
                                                                    Width="40px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Original" FieldName="vlrOri" 
                                                                    ToolTip="Meta de venda original" VisibleIndex="6" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Ori" FieldName="percOri" 
                                                                    ToolTip="% Meta de venda original" VisibleIndex="7" Width="40px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                            <Settings ShowHorizontalScrollBar="False" ShowTitlePanel="True" />
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                        </dxwgv:ASPxGridView>
                                                        <%--TERMINA AQUI--%>
                                                    </Content>
                                                </asp:AccordionPane>
                                                <%-- ***********************  TERMINA ANALISE  DE  MARGENS ************************************************************ --%>
                                                <%-- ***************** ANALISE DAS DESPESAS ***********************************************************************  --%>
                                                <asp:AccordionPane ID="AccordionPane4" runat="server">
                                                    <Header>
                                                        Análise de Despesas
                                                    </Header>
                                                    <Content>
                                                        <%--COMEÇA AQUI--%>
                                                        <dxwgv:ASPxGridView ID="gridVendas" runat="server" AutoGenerateColumns="False" 
                                                            CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                            CssPostfix="Office2003_Blue" DataSourceID="dsMetaRealizadoDespesa" 
                                                            KeyFieldName="Mes" Width="300px">
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                                CssPostfix="Office2003_Blue">
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <AlternatingRow BackColor="#E6F2FF">
                                                                </AlternatingRow>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                            </Styles>
                                                            <SettingsPager Mode="ShowAllRecords">
                                                                <AllButton Text="All">
                                                                </AllButton>
                                                                <NextPageButton Text="Next &gt;">
                                                                </NextPageButton>
                                                                <PrevPageButton Text="&lt; Prev">
                                                                </PrevPageButton>
                                                            </SettingsPager>
                                                            <TotalSummary>
                                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" 
                                                                    SummaryType="Sum" />
                                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                                                    SummaryType="Sum" />
                                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                                                                    SummaryType="Sum" />
                                                            </TotalSummary>
                                                            <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                                                <CollapsedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                                    Width="11px" />
                                                                <ExpandedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                                                <DetailCollapsedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                                    Width="11px" />
                                                                <DetailExpandedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                                                <FilterRowButton Height="13px" Width="13px" />
                                                            </Images>
                                                            <SettingsText Title="Ano 2012" />
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="Mês" FieldName="DescMes" 
                                                                    FixedStyle="Left" ReadOnly="True" VisibleIndex="0" Width="30px">
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Revista" FieldName="vlrRev" 
                                                                    ToolTip="Meta de venda revista" VisibleIndex="1" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Rev" FieldName="percRev" 
                                                                    ToolTip="% da Meta de venda revista" VisibleIndex="2" Width="40px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Realizada" FieldName="vlrReal" 
                                                                    ToolTip="Venda Realizada" VisibleIndex="3" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Real" FieldName="percReal" 
                                                                    ToolTip="% da venda realizada" VisibleIndex="4" Width="40px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Dif" FieldName="difPercRev" 
                                                                    ToolTip="Diferença entre a meta revista e o realizado" VisibleIndex="5" 
                                                                    Width="40px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Original" FieldName="vlrOri" 
                                                                    ToolTip="Meta de venda original" VisibleIndex="6" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Ori" FieldName="percOri" 
                                                                    ToolTip="% Meta de venda original" VisibleIndex="7" Width="40px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                            <Settings ShowHorizontalScrollBar="False" ShowTitlePanel="True" />
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                        </dxwgv:ASPxGridView>
                                                        <%--TERMINA AQUI--%>
                                                    </Content>
                                                </asp:AccordionPane>
                                                <%-- ***********************  TERMINA ANALISE  DE  DESPESAS ************************************************************ --%>
                                                <%-- ***************** ANALISE DO RESULTADO OPERACIONAL ***********************************************************************  --%>
                                                <asp:AccordionPane ID="AccordionPane5" runat="server">
                                                    <Header>
                                                        Análise do Resultado Operacional
                                                    </Header>
                                                    <Content>
                                                        <%--COMEÇA AQUI--%>
                                                        <dxwgv:ASPxGridView ID="gridResultadoOperacional" runat="server" 
                                                            AutoGenerateColumns="False" 
                                                            CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                            CssPostfix="Office2003_Blue" DataSourceID="dsMetaRealizadoResultadoOperacional" 
                                                            KeyFieldName="Mes" Width="300px">
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                                CssPostfix="Office2003_Blue">
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <AlternatingRow BackColor="#E6F2FF">
                                                                </AlternatingRow>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                            </Styles>
                                                            <SettingsPager Mode="ShowAllRecords">
                                                                <AllButton Text="All">
                                                                </AllButton>
                                                                <NextPageButton Text="Next &gt;">
                                                                </NextPageButton>
                                                                <PrevPageButton Text="&lt; Prev">
                                                                </PrevPageButton>
                                                            </SettingsPager>
                                                            <TotalSummary>
                                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" 
                                                                    SummaryType="Sum" />
                                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                                                    SummaryType="Sum" />
                                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                                                                    SummaryType="Sum" />
                                                            </TotalSummary>
                                                            <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                                                <CollapsedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                                    Width="11px" />
                                                                <ExpandedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                                                <DetailCollapsedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                                    Width="11px" />
                                                                <DetailExpandedButton Height="12px" 
                                                                    Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                                                <FilterRowButton Height="13px" Width="13px" />
                                                            </Images>
                                                            <SettingsText Title="Ano 2012" />
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="Mês" FieldName="DescMes" 
                                                                    FixedStyle="Left" ReadOnly="True" VisibleIndex="0" Width="30px">
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Revista" FieldName="vlrRev" 
                                                                    ToolTip="Meta de venda revista" VisibleIndex="1" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Rev" FieldName="percRev" 
                                                                    ToolTip="% da Meta de venda revista" VisibleIndex="2" Width="40px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Realizada" FieldName="vlrReal" 
                                                                    ToolTip="Venda Realizada" VisibleIndex="3" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Real" FieldName="percReal" 
                                                                    ToolTip="% da venda realizada" VisibleIndex="4" Width="40px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Dif" FieldName="difPercRev" 
                                                                    ToolTip="Diferença entre a meta revista e o realizado" VisibleIndex="5" 
                                                                    Width="40px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Original" FieldName="vlrOri" 
                                                                    ToolTip="Meta de venda original" VisibleIndex="6" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Ori" FieldName="percOri" 
                                                                    ToolTip="% Meta de venda original" VisibleIndex="7" Width="40px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        

                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                            <Settings ShowHorizontalScrollBar="False" ShowTitlePanel="True" />
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                        </dxwgv:ASPxGridView>
                                                        <%--TERMINA AQUI--%>
                                                    </Content>
                                                </asp:AccordionPane>
                                                <%-- ***********************  TERMINA ANALISE  DE  DESPESAS ************************************************************ --%>
                                            </Panes>
                                        </asp:Accordion>
                                    </td>
                                    <td align="left" class="style14" valign="top">
                                        &nbsp;</td>
                                    <td align="left" valign="top">
                                        <dxwgv:ASPxGridView ID="gridGrupoMes" runat="server" 
                                            AutoGenerateColumns="False" ClientInstanceName="gridGrupoMes" 
                                            CssFilePath="~/App_Themes/Office2003 Blue/GridView/stylesHeader.css" 
                                            CssPostfix="Office2003_Blue" DataSourceID="dsGrupoMes" KeyFieldName="idGrupo" 
                                            Width="900px">
                                            <settingsbehavior allowfocusedrow="True" 
                                                ProcessFocusedRowChangedOnServer="False" />
                                            <styles cssfilepath="~/App_Themes/Office2003 Blue/GridView/stylesHeader.css" 
                                                csspostfix="Office2003_Blue">
                                                <header imagespacing="5px" sortingimagespacing="5px">
                                                </header>
                                                <loadingpanel imagespacing="10px">
                                                </loadingpanel>
                                            </styles>
                                            <settingspager mode="ShowAllRecords">
                                            </settingspager>
                                            <TotalSummary>
                                                <dxwgv:ASPxSummaryItem FieldName="descConta" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAA" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percReal" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOri" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRev" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrRev" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercRev" 
                                                    SummaryType="Custom" />
                                            </TotalSummary>
                                            <images imagefolder="~/App_Themes/Office2003 Blue/{0}/">
                                                <collapsedbutton height="12px" 
                                                    url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                    width="11px" />
                                                <expandedbutton height="12px" 
                                                    url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" width="11px" />
                                                <detailcollapsedbutton height="12px" 
                                                    url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                    width="11px" />
                                                <detailexpandedbutton height="12px" 
                                                    url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" width="11px" />
                                                <filterrowbutton height="13px" width="13px" />
                                            </images>
                                            <settingstext title="Meta x Realizado - Teórico Mensal" />
                                           <%-- <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged()
}


" />--%>
                                            <Columns>
                                                <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="idGrupo" VisibleIndex="0" 
                                                    Width="30px">
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="descConta" 
                                                    VisibleIndex="1" Width="150px">
                                                    <cellstyle wrap="False">
                                                        <BorderRight BorderColor="#4787DF" BorderStyle="Solid" BorderWidth="2px" />
                                                    </cellstyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Real A.A." FieldName="vlrRealAA" 
                                                    VisibleIndex="2" Width="80px">
                                                    <propertiestextedit displayformatstring="{0:n0}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="% Rea AA" FieldName="percRealAA" 
                                                    VisibleIndex="3" Width="50px">
                                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                    <CellStyle>
                                                        <BorderRight BorderColor="#4787DF" BorderStyle="Solid" BorderWidth="2px" />
                                                    </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Meta Ori" FieldName="vlrOri" 
                                                    ToolTip="Valor da meta original" VisibleIndex="4" Width="80px">
                                                    <propertiestextedit displayformatstring="{0:n0}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="% Ori" FieldName="percOri" 
                                                    ToolTip="Percentual da meta original" VisibleIndex="5" Width="50px">
                                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Meta Rev" FieldName="vlrRev" 
                                                    ToolTip="Valor da meta revista" VisibleIndex="6" Width="80px">
                                                    <propertiestextedit displayformatstring="{0:n0}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="% Rev" FieldName="percRev" 
                                                    ToolTip="Percentual da meta revista" VisibleIndex="7" Width="50px">
                                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                    <CellStyle>
                                                        <BorderRight BorderColor="#4787DF" BorderStyle="Solid" BorderWidth="2px" />
                                                    </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" 
                                                    VisibleIndex="8" Width="80px">
                                                    <propertiestextedit displayformatstring="{0:n0}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="% Rea" FieldName="percReal" 
                                                    VisibleIndex="9" Width="50px">
                                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                    <CellStyle>
                                                        <BorderRight BorderColor="#4787DF" BorderStyle="Solid" BorderWidth="2px" />
                                                    </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="difVlrRev" 
                                                    ToolTip="Diferença entre meta x realizado" VisibleIndex="10" Width="80px">
                                                    <propertiestextedit displayformatstring="{0:n0}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Dif. %" FieldName="difPercRev" 
                                                    VisibleIndex="11" Width="50px">
                                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                            </Columns>
                                            <settings showfooter="True" showtitlepanel="True" showverticalscrollbar="True" 
                                                VerticalScrollableHeight="450" />
                                            <styleseditors>
                                                <progressbar height="25px">
                                                </progressbar>
                                            </styleseditors>
                                        </dxwgv:ASPxGridView>
                                    </td>
                                </tr>
                            </table>
                            <table cellspacing="1" class="style1">
                                <tr>
                                    <td>
                                        <asp:SqlDataSource ID="dsGrupoMes" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                                            
                                            SelectCommand="SELECT idGrupo, descConta, vlrRealAA, percRealAA, vlrOri, percOri, vlrRev, percRev, vlrReal, percReal, difVlrRev, difPercRev FROM Resultados.tbl_Teorico_Mes_Lojas_Grupo WHERE (Ano = @Ano) AND (Mes = @Mes) AND (idFilial = @idFilial) AND (idGrupo NOT IN(46,49,11,47)) AND ISNULL(Ordem,0)&lt;&gt;0 ORDER BY Ordem">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" />
                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="dsMetaRealizado" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                                            SelectCommand="usp_Buscar_GrupoMetaRealizado" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="String" />
                                                <asp:SessionParameter DefaultValue="" Name="idFilial" SessionField="sFILIAL" 
                                                    Type="Byte" />
                                                <asp:Parameter DefaultValue="1" Name="idGrupo" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="dsUltimaLinhaTodosMeses" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                                            SelectCommand="usp_Buscar_UltimaLinhaTodosMeses" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="String" />
                                                <asp:SessionParameter DefaultValue="" Name="idFilial" SessionField="sFILIAL" 
                                                    Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="dsHistAcu" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                            SelectCommand="SELECT [Ano] AS 'Obs', [perc] FROM [gerManager].[Realizado].[tblRea] WHERE Mes=@Mes AND idFilial=@idFilial AND idCod=47 ORDER BY [Ano]">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" />
                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="dsHistMes" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                            SelectCommand="SELECT [Obs], [perc] FROM [graff] ORDER BY [Obs]">
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:SqlDataSource ID="dsMetaRealizadoMargem" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                                            SelectCommand="usp_Buscar_GrupoMetaRealizado" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="String" />
                                                <asp:SessionParameter DefaultValue="" Name="idFilial" SessionField="sFILIAL" 
                                                    Type="Byte" />
                                                <asp:Parameter DefaultValue="5" Name="idGrupo" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="dsMetaRealizadoResultadoOperacional" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                                            SelectCommand="usp_Buscar_GrupoMetaRealizado" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="String" />
                                                <asp:SessionParameter DefaultValue="" Name="idFilial" SessionField="sFILIAL" 
                                                    Type="Byte" />
                                                <asp:Parameter DefaultValue="40" Name="idGrupo" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="dsMetaRealizadoDespesa" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                                            SelectCommand="usp_Buscar_GrupoMetaRealizado" 
                                            SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="String" />
                                                <asp:SessionParameter DefaultValue="" Name="idFilial" SessionField="sFILIAL" 
                                                    Type="Byte" />
                                                <asp:Parameter DefaultValue="14" Name="idGrupo" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:SqlDataSource ID="dsPorGrupo" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                                            SelectCommand="SELECT a.idFilial AS 'idGrupo', b.FilialLista AS 'descConta', a.vlrRealAA, a.percRealAA, a.vlrOri, a.percOri, a.vlrRev, a.percRev, a.vlrReal, a.percReal, a.difVlrRev, a.difPercRev 
FROM Resultados.tbl_Teorico_Mes_Lojas_Grupo AS a JOIN gerManager.Cadastros.tblCadFiliais AS b
ON a.idFilial = b.Filial 
WHERE (a.Ano = @Ano) AND (a.Mes = @Mes) AND (a.idGrupo = @idGrupo)
ORDER BY b.ClassificaCorporacao">
<%--
WHERE (a.Ano = @Ano) AND (a.Mes = @Mes) AND (a.idGrupo = @idGrupo) --%>
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" />   
                                                <%--<asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" />--%>                                          
                                               <asp:ControlParameter Name="idGrupo" ControlID="txtIE"  PropertyName="Value" 
                                                    Type="String" />
                                                
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        
                                       
                                        
                                    </td>
                                    <td>
                                    <dxe:ASPxTextBox ID="txtIE" runat="server" ClientInstanceName="txtIE" 
                                            Width="170px" AutoPostBack="True" Visible = "false" >
                                        </dxe:ASPxTextBox>
                                        </td>
                                </tr>
                            </table>
                            <br />
                           
                            <asp:Panel ID="pnl_TodasContas" runat="server" CssClass="modalPopup1" 
                                Style="display: none;">
                                
                                
                                <%--Inicio--%>
                                <asp:Button ID="btnCancela" runat="server" Text="Sair" BackColor="Red" 
                                    ForeColor="White" />
                                <dxwgv:ASPxGridView ID="gridPorGrupo" runat="server" 
                                            AutoGenerateColumns="False"  
                                            CssFilePath="~/App_Themes/Office2003 Blue/{0}/stylesFooter.css" 
                                            CssPostfix="Office2003_Blue" 
        DataSourceID="dsPorGrupo" KeyFieldName="idGrupo" 
                                            Width="1000px">
                                            <settingsbehavior allowfocusedrow="True" />
                                            <styles cssfilepath="~/App_Themes/Office2003 Blue/{0}/stylesFooter.css" 
                                                csspostfix="Office2003_Blue">
                                                <header imagespacing="5px" sortingimagespacing="5px">
                                                </header>
                                                <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                                                <loadingpanel imagespacing="10px">
                                                </loadingpanel>
                                            </styles>
                                            <settingspager mode="ShowAllRecords">
                                            </settingspager>
                                            <TotalSummary>
                                                <dxwgv:ASPxSummaryItem FieldName="descConta" SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAA" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percReal" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOri" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRev" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrRev" 
                                                    SummaryType="Custom" />
                                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercRev" 
                                                    SummaryType="Custom" />
                                            </TotalSummary>
                                            <images imagefolder="~/App_Themes/Office2003 Blue/{0}/">
                                                <collapsedbutton height="12px" 
                                                    url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                    width="11px" />
                                                <expandedbutton height="12px" 
                                                    url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" 
                                                    width="11px" />
                                                <detailcollapsedbutton height="12px" 
                                                    url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                                    width="11px" />
                                                <detailexpandedbutton height="12px" 
                                                    url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" 
                                                    width="11px" />
                                                <filterrowbutton height="13px" width="13px" />
                                            </images>
                                            <settingstext title="Analise por Conta" />
                                            
                                            <Columns>
                                                <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="idGrupo" VisibleIndex="0" 
                                                    Width="30px" Visible ="false" >
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="descConta" 
                                                    VisibleIndex="1" Width="180px">
                                                    <cellstyle wrap="False">
                                                        <BorderRight BorderColor="#4787DF" BorderStyle="Solid" BorderWidth="2px" />
                                                    </cellstyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Real A.A." FieldName="vlrRealAA" 
                                                    VisibleIndex="2" Width="90px">
                                                    <propertiestextedit displayformatstring="{0:n0}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="% Rea AA" FieldName="percRealAA" 
                                                    VisibleIndex="3" Width="70px">
                                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                    <CellStyle>
                                                        <BorderRight BorderColor="#4787DF" BorderStyle="Solid" BorderWidth="2px" />
                                                    </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Meta Ori" FieldName="vlrOri" 
                                                    ToolTip="Valor da meta original" VisibleIndex="4" Width="90px">
                                                    <propertiestextedit displayformatstring="{0:n0}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="% Ori" FieldName="percOri" 
                                                    ToolTip="Percentual da meta original" VisibleIndex="5" Width="70px">
                                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Meta Rev" FieldName="vlrRev" 
                                                    ToolTip="Valor da meta revista" VisibleIndex="6" Width="90px">
                                                    <propertiestextedit displayformatstring="{0:n0}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="% Rev" FieldName="percRev" 
                                                    ToolTip="Percentual da meta revista" VisibleIndex="7" Width="70px">
                                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                    <CellStyle>
                                                        <BorderRight BorderColor="#4787DF" BorderStyle="Solid" BorderWidth="2px" />
                                                    </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" 
                                                    VisibleIndex="8" Width="90px">
                                                    <propertiestextedit displayformatstring="{0:n0}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="% Rea" FieldName="percReal" 
                                                    VisibleIndex="9" Width="70px">
                                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                    <CellStyle>
                                                        <BorderRight BorderColor="#4787DF" BorderStyle="Solid" BorderWidth="2px" />
                                                    </CellStyle>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Dif. Vlr" FieldName="difVlrRev" 
                                                    ToolTip="Diferença entre meta x realizado" VisibleIndex="10" Width="90px">
                                                    <propertiestextedit displayformatstring="{0:n0}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                                <dxwgv:GridViewDataTextColumn Caption="Dif. %" FieldName="difPercRev" 
                                                    VisibleIndex="11" Width="60px">
                                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                        

                                                    </propertiestextedit>
                                                </dxwgv:GridViewDataTextColumn>
                                            </Columns>
                                            <settings showfooter="False" showtitlepanel="True" showverticalscrollbar="True" 
                                                VerticalScrollableHeight="450" />
                                            <styleseditors>
                                                <progressbar height="25px">
                                                </progressbar>
                                            </styleseditors>
                                        </dxwgv:ASPxGridView>
                                
                                <%--Final--%>                                
                                <br />
                            </asp:Panel>
                           
                            <asp:Panel ID="pnlOther" runat="server" CssClass="modalPopup1" Style="display: none;">
                                Panel Other<br />
                                <asp:Button ID="btn_CloseOther" runat="server" Text="Button" />
                            </asp:Panel>
                           
                            <asp:Panel ID="pnl_Terceiro" runat="server" CssClass="modalPopup1" Style="display: none;">
                                Panel Terceiro<br />
                                <asp:Button ID="btnClose_Terceiro" runat="server" Text="Button" />
                            </asp:Panel>

                           
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            </asp:UpdatePanel>

                           
                            <br />
                            
                        </ContentTemplate>                

                        
                    </asp:UpdatePanel>
                    
                     <dxwgv:ASPxGridViewExporter ID="ExporterExcel1" runat="server" 
                GridViewID="gridGrupoMes">
            </dxwgv:ASPxGridViewExporter>
            
            <dxe:ASPxButton ID="btnExcel" runat="server" 
                                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                            Text="Excel" Width="60px" Native="True">
                                        </dxe:ASPxButton>
                    
                </td>
               
            
            </tr>
        </table>
                                        
                                    </asp:Content>

