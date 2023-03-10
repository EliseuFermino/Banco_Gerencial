<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ConcPrincipal.aspx.vb" Inherits="Ranking_ConcPrincipal_work" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxpc" %>





<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

    <script lang="javascript" type ="text/javascript">
        function OnGridFocusedRowChanged() {
            gridLojas.GetRowValues(gridLojas.GetFocusedRowIndex(), 'Nome;IE;Cidade;Bairro;Tipo', OnGetRowValues);
        }
        
        function OnGridFocusedRowChanged_Principal() {
            grid.GetRowValues(grid.GetFocusedRowIndex(), 'Nome;CNPJ_Principal', OnGetRowValues);
        }

        function OnGridFocusedRowChanged_Cad() {
            // Parte 3
            DetailNotes.SetText("Loading...");
            gridCadLojas.GetRowValues(gridCadLojas.GetFocusedRowIndex(), 'BAI_NO;IE;Notes;imgLoja', OnGetRowValues);      
        }   
        
        function OnGetRowValues(values) {
            
            txtIE.SetText(values[1]);
            //alert(values[1]);
            // Parte 3
            //txtCadIE.SetText(values[1]);
            //DetailNotes.SetText("~/image/Concorrentes/" + values[3]);
            //DetailImage.SetVisible(true);
            //DetailImage.SetImageUrl("~//image//Concorrentes//" + values[3]);
            

           
            //txtOnde.SetText(values[3]);
            //txtComo.SetText(values[4]);
            //txtQuanto.SetText(values[5]);
            //txtOque.SetText(values[6]);
            //txtStatusTarefa.SetText(values[7]);
        }

           
        
    </script>

    <table class="style1">
        <tr>
            <td>
                <asp:Panel ID="panelCabecalho" runat="server" BorderColor="Silver" 
                    BorderStyle="Solid" BorderWidth="1px" Width="745px">
                    <table class="style1">
                        <tr>
                            <td >
                                <asp:Panel ID="panelOpcao" runat="server" BorderColor="Silver" 
                                    BorderStyle="Solid" BorderWidth="1px" Height="152px" Width="202px">
                                    <table style="width: 100%; border-collapse: collapse">
                                        <tr>
                                            <td colspan="2" 
                                                
                                                style="font-family: Arial, Helvetica, sans-serif; font-size: small; color: #FFFFFF; background-color: #C0C0C0;">
                                                Selecione uma Opção</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <dxe:ASPxRadioButton ID="optConcDiretos" runat="server" AutoPostBack="True"                                                      
                                                    ForeColor="White" GroupName="grpOpcao" Layout="Flow" 
                                                    Text="Concorrentes Diretos" TextSpacing="2px" style="color: #808080" 
                                                    Theme="DevEx">
                                                </dxe:ASPxRadioButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <dxe:ASPxRadioButton ID="optTodasCidades" runat="server" AutoPostBack="True"                                                     
                                                    ForeColor="White" GroupName="grpOpcao" Layout="Flow" Text="Todas Cidades" 
                                                    TextSpacing="2px" style="color: #808080" Theme="DevEx">
                                                </dxe:ASPxRadioButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <dxe:ASPxRadioButton ID="optCidadesComCondor" runat="server" 
                                                    ForeColor="White" GroupName="grpOpcao" Layout="Flow" 
                                                    Text="Cidades com Condor" TextSpacing="2px" style="color: #808080" 
                                                    Theme="DevEx" AutoPostBack="True">
                                                </dxe:ASPxRadioButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <dxe:ASPxRadioButton ID="optParana" runat="server" AutoPostBack="True"                                                    
                                                    ForeColor="White" GroupName="grpOpcao" Layout="Flow" Text="Paraná" 
                                                    TextSpacing="2px" style="color: #808080" Theme="DevEx">
                                                </dxe:ASPxRadioButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td style="padding-top: 5px">
                                                <dxe:ASPxComboBox ID="cboCidade" runat="server" AutoPostBack="True"
                                                    
                                                    Enabled="False" ImageFolder="~/App_Themes/Aqua/{0}/" SettingsLoadingPanel-Text="" 
                                                    ShowShadow="False" ValueType="System.String" Width="190px" Theme="DevEx" 
                                                    DropDownRows="20" EnableCallbackMode="True">
                                                    <ButtonEditEllipsisImage Height="3px" 
                                                        Url="~/App_Themes/Aqua/Editors/edtEllipsis.png" 
                                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtEllipsisDisabled.png" 
                                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtEllipsisHottracked.png" 
                                                        UrlPressed="~/App_Themes/Aqua/Editors/edtEllipsisPressed.png" Width="12px" />
                                                    <DropDownButton>
                                                        <Image Height="7px" Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                                                            UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                                                            UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                                                            UrlPressed="~/App_Themes/Aqua/Editors/edtDropDownPressed.png" Width="9px" />
                                                    </DropDownButton>
                                                    <ValidationSettings>
                                                        <ErrorImage Height="14px" Url="~/App_Themes/Aqua/Editors/edtError.png" 
                                                            Width="14px" />
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td >
                                <asp:Panel ID="panelPeriodo" runat="server" BorderColor="Silver" 
                                    BorderStyle="Solid" BorderWidth="1px" Height="152px" Width="372px">
                                    <table style="width: 100%; border-collapse: collapse">
                                        <tr>
                                            <td>
                                                <span style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; color: #FFFFFF">
                                                &nbsp;</span><span class="dxncEmptyData_Office2010Silver" 
                                                    style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold; ">Opção 
                                                de período</span>&nbsp;</td>
                                            <td>
                                                <span style="color: #FFFFFF">&nbsp;</span><span 
                                                    style="font-family: Arial, Helvetica, sans-serif; font-size: small; " 
                                                    class="dxncEmptyData_Office2010Silver"><b>Mês</b></span>&nbsp;</td>
                                            <td>
                                                <span style="color: #FFFFFF">&nbsp;</span><span 
                                                    style="font-family: Arial, Helvetica, sans-serif; font-size: small; " 
                                                    class="dxncEmptyData_Office2010Silver"><b>Ano</b></span>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="style2" style="width: 165px">
                                                <dxe:ASPxRadioButton ID="optMensal" runat="server" 
                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                                    ForeColor="White" GroupName="grpPeriodo" Layout="Flow" Text="Mensal" 
                                                    TextSpacing="2px" AutoPostBack="True" style="color: #808080" Theme="DevEx">
                                                </dxe:ASPxRadioButton>
                                                &nbsp;<dxe:ASPxRadioButton ID="optAcumulado" runat="server" 
                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                                    ForeColor="White" GroupName="grpPeriodo" Layout="Flow" 
                                                    Text="Acumulado" TextSpacing="2px" AutoPostBack="True" 
                                                    style="color: #808080" Theme="DevEx">
                                                </dxe:ASPxRadioButton>
                                            </td>
                                            <td class="style2" style="width: 136px" >
                                                <dxe:ASPxComboBox ID="cboMes" runat="server" AutoPostBack="True" 
                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                                    ImageFolder="~/App_Themes/Aqua/{0}/" SettingsLoadingPanel-Text="" ShowShadow="False" 
                                                    ValueType="System.String" Width="105px" Theme="DevEx" DropDownRows="12" 
                                                    Native="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Janeiro" Value="1" />
                                                        <dxe:ListEditItem Text="Fevereiro" Value="2" />
                                                        <dxe:ListEditItem Text="Março" Value="3" />
                                                        <dxe:ListEditItem Text="Abril" Value="4" />
                                                        <dxe:ListEditItem Text="Maio" Value="5" />
                                                        <dxe:ListEditItem Text="Junho" Value="6" />
                                                        <dxe:ListEditItem Text="Julho" Value="7" />
                                                        <dxe:ListEditItem Text="Agosto" Value="8" />
                                                        <dxe:ListEditItem Text="Setembro" Value="9" />
                                                        <dxe:ListEditItem Text="Outubro" Value="10" />
                                                        <dxe:ListEditItem Text="Novembro" Value="11" />
                                                        <dxe:ListEditItem Text="Dezembro" Value="12" />
                                                    </Items>
                                                    <ButtonEditEllipsisImage Height="3px" 
                                                        Url="~/App_Themes/Aqua/Editors/edtEllipsis.png" 
                                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtEllipsisDisabled.png" 
                                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtEllipsisHottracked.png" 
                                                        UrlPressed="~/App_Themes/Aqua/Editors/edtEllipsisPressed.png" Width="12px" />
                                                    <DropDownButton>
                                                        <Image Height="7px" Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                                                            UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                                                            UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                                                            UrlPressed="~/App_Themes/Aqua/Editors/edtDropDownPressed.png" Width="9px" />
                                                    </DropDownButton>
                                                    <ValidationSettings>
                                                        <ErrorImage Height="14px" Url="~/App_Themes/Aqua/Editors/edtError.png" 
                                                            Width="14px" />
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dxe:ASPxComboBox>
                                            </td>
                                            <td >
                                                <dxe:ASPxComboBox ID="cboAno" runat="server" AutoPostBack="True"                                                      
                                                    ImageFolder="~/App_Themes/Aqua/{0}/" SettingsLoadingPanel-Text="" ShowShadow="False" Width="61px" Theme="DevEx" Native="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="2010" Value="2010" />
                                                        <dxe:ListEditItem Text="2011" Value="2011" />
                                                        <dxe:ListEditItem Text="2012" Value="2012" />
                                                        <dxe:ListEditItem Text="2013" Value="2013" />
                                                        <dxe:ListEditItem Text="2014" Value="2014" />
                                                    </Items>
                                                    <ButtonEditEllipsisImage Height="3px" 
                                                        Url="~/App_Themes/Aqua/Editors/edtEllipsis.png" 
                                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtEllipsisDisabled.png" 
                                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtEllipsisHottracked.png" 
                                                        UrlPressed="~/App_Themes/Aqua/Editors/edtEllipsisPressed.png" Width="12px" />
                                                    <DropDownButton>
                                                        <Image Height="7px" Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                                                            UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                                                            UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                                                            UrlPressed="~/App_Themes/Aqua/Editors/edtDropDownPressed.png" Width="9px" />
                                                    </DropDownButton>
                                                    <ValidationSettings>
                                                        <ErrorImage Height="14px" Url="~/App_Themes/Aqua/Editors/edtError.png" 
                                                            Width="14px" />
                                                        <ErrorFrameStyle ImageSpacing="4px">
                                                            <ErrorTextPaddings PaddingLeft="4px" />
                                                        </ErrorFrameStyle>
                                                    </ValidationSettings>
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="padding-top: 5px">
                                                <span style="color: #FFFFFF">&nbsp;</span><span 
                                                    style="font-family: Arial, Helvetica, sans-serif; font-size: small; " 
                                                    class="dxncEmptyData_Office2010Silver"><b>Opção 
                                                de classificação</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span 
                                                    class="dxncEmptyData_Office2010Silver"> </span>
                                                <span class="dxncEmptyData_Office2010Silver" 
                                                    style="font-family: Arial, Helvetica, sans-serif; font-size: small; font-weight: bold">
                                                Consulta</span></td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%; border-collapse: collapse">
                                        <tr>
                                            <td>
                                                <table class="style1">
                                                    <tr>
                                                        <td >
                                                            <asp:Panel ID="Panel3" runat="server" BorderColor="Silver" BorderStyle="Solid" 
                                                                BorderWidth="1px">
                                                                <dxe:ASPxRadioButton ID="optLoja" runat="server" AutoPostBack="True" 
                                                                    ForeColor="White" GroupName="optLojaSupermercadista" Layout="Flow" 
                                                                    Text="Loja" style="color: #808080" Theme="DevEx">
                                                                </dxe:ASPxRadioButton>
                                                                &nbsp;<dxe:ASPxRadioButton ID="optSupermercadista" runat="server" 
                                                                    AutoPostBack="True" ForeColor="White" GroupName="optLojaSupermercadista" 
                                                                    Layout="Flow" Text="Supermercadista" style="color: #808080" Theme="DevEx">
                                                                </dxe:ASPxRadioButton>
                                                            </asp:Panel>
                                                        </td>
                                                        <td style="width: 38px">
                                                            &nbsp;</td>
                                                        <td>
                                                            <asp:Panel ID="Panel2" runat="server" BorderColor="Silver" BorderStyle="Solid" 
                                                                BorderWidth="1px" Height="45px" Width="125px">
                                                                <dxe:ASPxRadioButton ID="optPrincipaisSup" runat="server" AutoPostBack="True"                                                                     
                                                                    ForeColor="Gray" GroupName="grpPrincipal" Layout="Flow" Text="Principais Sup." 
                                                                    TextSpacing="2px" Theme="DevEx">
                                                                </dxe:ASPxRadioButton>
                                                                &nbsp;<br />
                                                                <dxe:ASPxRadioButton ID="optTodos" runat="server" AutoPostBack="True"                                                                     
                                                                    ForeColor="Gray" GroupName="grpPrincipal" Layout="Flow" Text="Todos Sup." 
                                                                    TextSpacing="2px" Theme="DevEx">
                                                                </dxe:ASPxRadioButton>
                                                            </asp:Panel>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="lblObs" runat="server" Text="Label" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td >
                                <asp:Panel ID="optTipos" runat="server" BorderColor="Silver" BorderStyle="Solid" 
                                    BorderWidth="1px" Height="152px" Width="150px" ScrollBars="Vertical">
                                    <table  style="width: 100%; border-collapse: collapse">
                                        <tr>
                                            <td style="background-color: #C0C0C0">
                                                &nbsp;&nbsp;<span 
                                                    style="font-family: Arial, Helvetica, sans-serif; font-size: small; color: #FFFFFF">Selecione</span></td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <dxe:ASPxCheckBox ID="chkSupermercados" runat="server" AutoPostBack="True"                                                    
                                                    ForeColor="Gray" Text="Supermercados" TextSpacing="2px" Theme="DevEx">
                                                </dxe:ASPxCheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dxe:ASPxCheckBox ID="chkHipermercados" runat="server" AutoPostBack="True"                                                      
                                                    ForeColor="Gray" Text="Hipermercados" TextSpacing="2px" Theme="DevEx">
                                                </dxe:ASPxCheckBox>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <dxe:ASPxCheckBox ID="chkAtacarejo" runat="server" AutoPostBack="True"                                                    
                                                    ForeColor="Gray" Text="Atacarejo" TextSpacing="2px" Theme="DevEx">
                                                </dxe:ASPxCheckBox>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <dxe:ASPxCheckBox ID="chkAtacado" runat="server" AutoPostBack="True"                                                    
                                                    ForeColor="Gray" Text="Atacado" TextSpacing="2px" Theme="DevEx">
                                                </dxe:ASPxCheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dxe:ASPxCheckBox ID="chkDepositos" runat="server" AutoPostBack="True"                                                     
                                                    ForeColor="Gray" Text="Depósito" TextSpacing="2px" Theme="DevEx">
                                                </dxe:ASPxCheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dxe:ASPxCheckBox ID="chkFarmacia" runat="server" AutoPostBack="True"                                                     
                                                    ForeColor="Gray" Text="Farmácia" TextSpacing="2px" Theme="DevEx">
                                                </dxe:ASPxCheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dxe:ASPxCheckBox ID="chkPosto" runat="server" AutoPostBack="True"                                                     
                                                    ForeColor="Gray" Text="Posto" TextSpacing="2px" Theme="DevEx">
                                                </dxe:ASPxCheckBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dxe:ASPxCheckBox ID="chkOutros" runat="server" AutoPostBack="True"                                                     
                                                    ForeColor="Gray" Text="Outros" TextSpacing="2px" Theme="DevEx" 
                                                    Visible="False">
                                                </dxe:ASPxCheckBox>
                                            </td>
                                        </tr>
                                    </table>
                                </asp:Panel>
                            </td>
                            <td >
                                &nbsp;</td>
                            <td >
                                <table  class="style1">
                                    <tr>
                                        <td colspan="2">
                                            <dxe:ASPxButton ID="btnVendas" runat="server" Text="Ver Vendas" 
                                                ToolTip="Exibe as Vendas dos últimos 4 anos do Concorrente selecionado." 
                                                Enabled="False" Theme="DevEx" AutoPostBack="False">
                                                <ClientSideEvents Click="function(s, e) {
	panelVendaPorIE.Show();
    panelTodasVendas.PerformCallback();
}" />
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <dxe:ASPxButton ID="btnExportarExcel" runat="server" Enabled="False" 
                                                Text=" Exportar " Theme="DevEx">
                                                <Image Height="20px" Url="~/image/excel (1).PNG" Width="20px" />
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="auto-style2">
                                            <dxe:ASPxButton ID="btnCadLojas" runat="server" 
                                                ClientInstanceName="btnCadLojas" Text="Cadastro Lojas" Width="120px" Theme="DevEx">
                                                <ClientSideEvents Click="function(s, e) {
	popCadLojas.Show();
}" />
                                            </dxe:ASPxButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dxe:ASPxTextBox ID="txtIE" runat="server" BackColor="#EFEEEF" 
                                                ClientInstanceName="txtIE" ForeColor="Black" Width="60px">
                                                <Border BorderStyle="None" />
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td>
                                            <dxe:ASPxTextBox ID="txtCNPJ" runat="server" BackColor="#EFEEEF" 
                                                ClientInstanceName="txtCNPJ" Enabled="False" ForeColor="#EFEEEF" Width="31px">
                                                <Border BorderColor="#EFEEEF" BorderStyle="None" />
                                            </dxe:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <dxe:ASPxCheckBox ID="chkCabecalho" runat="server" AutoPostBack="True" 
                                                Checked="True" CheckState="Checked" Text="Fixar cabeçalho" Theme="DevEx">
                                            </dxe:ASPxCheckBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td  style="height: 522px; vertical-align: top;" >
                <dxwgv:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
                    ClientInstanceName="grid" DataSourceID="dsMaster" 
                    KeyFieldName="CNPJ_Principal" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                    CssPostfix="Aqua" Width="1000px" Theme="DevEx">
                    <Templates>
                        <DetailRow>
                            <dxwgv:ASPxGridView ID="detailGrid" runat="server" AutoGenerateColumns="False" 
                                ClientInstanceName="detailGrid" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                                CssPostfix="Aqua" DataSourceID="dsDetail" KeyFieldName="IE" 
                                OnBeforePerformDataSelect="detailGrid_DataSelect" 
                                onhtmldatacellprepared="detailGrid_HtmlDataCellPrepared" Theme="DevEx" 
                                OnSummaryDisplayText="detailGrid_SummaryDisplayText">
                                <Styles>	                               	
	                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                </Styles>
                                <SettingsLoadingPanel Text="" />
                                <SettingsBehavior AllowFocusedRow="True" />
                                <SettingsPager Mode="ShowAllRecords">
                                    <AllButton>
                                        <Image Height="19px" Width="27px" />
                                    </AllButton>
                                    <FirstPageButton>
                                        <Image Height="19px" Width="23px" />
                                    </FirstPageButton>
                                    <LastPageButton>
                                        <Image Height="19px" Width="23px" />
                                    </LastPageButton>
                                    <NextPageButton>
                                        <Image Height="19px" Width="19px" />
                                    </NextPageButton>
                                    <PrevPageButton>
                                        <Image Height="19px" Width="19px" />
                                    </PrevPageButton>
                                </SettingsPager>
                                <TotalSummary>
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAT" 
                                        ShowInGroupFooterColumn="vlr AT" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA" 
                                        ShowInGroupFooterColumn="vlr MA" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA" 
                                        ShowInGroupFooterColumn="vlr AA" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDifMA" 
                                        ShowInGroupFooterColumn="vlr Dif MA" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDifAA" 
                                        ShowInGroupFooterColumn="vlr Dif AA" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrDifMAperc" 
                                        ShowInGroupFooterColumn="vlr Dif MAperc" SummaryType="Average" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrDifAAperc" 
                                        ShowInGroupFooterColumn="vlr Dif AAperc" SummaryType="Average" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="Total de lojas: {0:n0}" FieldName="Nome" 
                                        ShowInColumn="Nome" SummaryType="Count" />
                                </TotalSummary>
                                <Images ImageFolder="~/App_Themes/Aqua/{0}/">
                                    <CollapsedButton Height="15px" 
                                        Url="~/App_Themes/Aqua/GridView/gvCollapsedButton.png" Width="15px" />
                                    <ExpandedButton Height="15px" 
                                        Url="~/App_Themes/Aqua/GridView/gvExpandedButton.png" Width="15px" />
                                    <DetailCollapsedButton Height="15px" 
                                        Url="~/App_Themes/Aqua/GridView/gvDetailCollapsedButton.png" Width="15px" />
                                    <DetailExpandedButton Height="15px" 
                                        Url="~/App_Themes/Aqua/GridView/gvDetailExpandedButton.png" Width="15px" />
                                    <HeaderFilter Height="19px" Url="~/App_Themes/Aqua/GridView/gvHeaderFilter.png" 
                                        Width="19px" />
                                    <HeaderActiveFilter Height="19px" 
                                        Url="~/App_Themes/Aqua/GridView/gvHeaderFilterActive.png" Width="19px" />
                                    <HeaderSortDown Height="5px" 
                                        Url="~/App_Themes/Aqua/GridView/gvHeaderSortDown.png" Width="7px" />
                                    <HeaderSortUp Height="5px" Url="~/App_Themes/Aqua/GridView/gvHeaderSortUp.png" 
                                        Width="7px" />
                                    <FilterRowButton Height="13px" Width="13px" />
                                   
                                </Images>
                                <SettingsText GroupPanel="Arraste uma coluna aqui para agrupar" />
                                <GroupSummary>
                                    <dxwgv:ASPxSummaryItem DisplayFormat="Total: {0:n0}" FieldName="Nome" 
                                        SummaryType="Count" />
                                </GroupSummary>
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn FieldName="Nome" 
                                        ToolTip="Nome do supermercadista, geralmente é o nome fantasia." 
                                        VisibleIndex="0">
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Tipo" 
                                        ToolTip="Formato do estabelecimento, H - Hipermercados,  S - Supermercados, A - Atacado,  D - Depósitos e O - Outros" 
                                        VisibleIndex="1">
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Cidade" 
                                        ToolTip="Cidade em que os estabelecimentos do supermercadista esta situado." 
                                        VisibleIndex="2">
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Bairro" 
                                        ToolTip="Bairro em que os estabelecimentos do supermercadista esta situado." 
                                        VisibleIndex="3">
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Rank" ReadOnly="True" 
                                        ToolTip="Ranking sobre vendas. A base é o próprio supermercadista." 
                                        VisibleIndex="4">
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="vlr." FieldName="vlrAT" 
                                        ToolTip="Valor da venda do mês selecionado." VisibleIndex="5">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Mês Ant." FieldName="vlrMA" 
                                        ToolTip="Valor da venda do mês anterior." VisibleIndex="6">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="vlr. A.A." FieldName="vlrAA" 
                                        ToolTip="Valor da venda do mês, só que Ano Anterior." VisibleIndex="7">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="vlr. Dif. MA." FieldName="vlrDifMA" 
                                        ReadOnly="True" ToolTip="Diferença entre Mês Selecionado e Mês Anterior." 
                                        VisibleIndex="8">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="vlrDifMAperc" 
                                        ReadOnly="True" ToolTip="Diferença entre Mês Selecionado e Mês Anterior." 
                                        VisibleIndex="9">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="vlr. Dif. AA." FieldName="vlrDifAA" 
                                        ReadOnly="True" ToolTip="Diferença entre Mês Selecionado e Ano Anterior." 
                                        VisibleIndex="10">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="%" FieldName="vlrDifAAperc" 
                                        ReadOnly="True" ToolTip="Diferença entre Mês Selecionado e Ano Anterior." 
                                        VisibleIndex="11">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="I.E." FieldName="IE" 
                                        ToolTip="Inscrição Estadual do Concorrentes" VisibleIndex="12">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Ano" Visible="False" VisibleIndex="11">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="Mes" Visible="False" VisibleIndex="11">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="IP" FieldName="IPUser" Visible="False" 
                                        VisibleIndex="12">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="CNPJ_Principal" Visible="False" 
                                        VisibleIndex="12">
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <Settings ShowFooter="True" ShowGroupPanel="True" />
                                <StylesEditors>
                                    <ProgressBar Height="25px">
                                    </ProgressBar>
                                </StylesEditors>
                                <ImagesEditors>
                                    <CalendarFastNavPrevYear Height="19px" 
                                        Url="~/App_Themes/Aqua/Editors/edtCalendarFNPrevYear.png" Width="19px" />
                                    <CalendarFastNavNextYear Height="19px" 
                                        Url="~/App_Themes/Aqua/Editors/edtCalendarFNNextYear.png" Width="19px" />
                                    <DropDownEditDropDown Height="7px" 
                                        Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                                        Width="9px" />
                                    <SpinEditIncrement Height="6px" 
                                        Url="~/App_Themes/Aqua/Editors/edtSpinEditIncrementImage.png" 
                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditIncrementDisabledImage.png" 
                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                                        UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                                        Width="7px" />
                                    <SpinEditDecrement Height="7px" 
                                        Url="~/App_Themes/Aqua/Editors/edtSpinEditDecrementImage.png" 
                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditDecrementDisabledImage.png" 
                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                                        UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                                        Width="7px" />
                                    <SpinEditLargeIncrement Height="9px" 
                                        Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncImage.png" 
                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncDisabledImage.png" 
                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                                        UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                                        Width="7px" />
                                    <SpinEditLargeDecrement Height="9px" 
                                        Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecImage.png" 
                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecDisabledImage.png" 
                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                                        UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                                        Width="7px" />
                                </ImagesEditors>
                            </dxwgv:ASPxGridView>
                        </DetailRow>
                    </Templates>
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                        <AlternatingRow BackColor="#F4FAFF">
                        </AlternatingRow>
                    </Styles>
                    <SettingsLoadingPanel Text="" />
                    <SettingsPager Mode="ShowAllRecords">
                        <AllButton Text="All">
                            <Image Height="19px" Width="27px" />
                        </AllButton>
                        <FirstPageButton>
                            <Image Height="19px" Width="23px" />
                        </FirstPageButton>
                        <LastPageButton>
                            <Image Height="19px" Width="23px" />
                        </LastPageButton>
                        <NextPageButton Text="Next &gt;">
                            <Image Height="19px" Width="19px" />
                        </NextPageButton>
                        <PrevPageButton Text="&lt; Prev">
                            <Image Height="19px" Width="19px" />
                        </PrevPageButton>
                    </SettingsPager>
                    <GroupSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAT" 
                            ShowInGroupFooterColumn="vlr AT" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA" 
                            ShowInGroupFooterColumn="vlr MA" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA" 
                            ShowInGroupFooterColumn="vlr AA" SummaryType="Sum" />
                    </GroupSummary>
                    <TotalSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAT" 
                            ShowInGroupFooterColumn="vlr AT" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA" 
                            ShowInGroupFooterColumn="vlr MA" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA" 
                            ShowInGroupFooterColumn="vlr AA" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDifMA" 
                            ShowInGroupFooterColumn="vlr Dif MA" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDifAA" 
                            ShowInGroupFooterColumn="vlr Dif AA" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrDifMAperc" 
                            ShowInGroupFooterColumn="vlr Dif MAperc" SummaryType="Average" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrDifAAperc" 
                            ShowInGroupFooterColumn="vlr Dif AAperc" SummaryType="Average" />
                    </TotalSummary>
                    <Images ImageFolder="~/App_Themes/Aqua/{0}/">
                        <CollapsedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvCollapsedButton.png" Width="15px" />
                        <ExpandedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvExpandedButton.png" Width="15px" />
                        <DetailCollapsedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvDetailCollapsedButton.png" Width="15px" />
                        <DetailExpandedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvDetailExpandedButton.png" Width="15px" />
                        <HeaderFilter Height="19px" Url="~/App_Themes/Aqua/GridView/gvHeaderFilter.png" 
                            Width="19px" />
                        <HeaderActiveFilter Height="19px" 
                            Url="~/App_Themes/Aqua/GridView/gvHeaderFilterActive.png" Width="19px" />
                        <HeaderSortDown Height="5px" 
                            Url="~/App_Themes/Aqua/GridView/gvHeaderSortDown.png" Width="7px" />
                        <HeaderSortUp Height="5px" Url="~/App_Themes/Aqua/GridView/gvHeaderSortUp.png" 
                            Width="7px" />
                        <FilterRowButton Height="13px" Width="13px" />
                       
                    </Images>
                    <SettingsText EmptyDataRow="Não foi encontrado nenhuma informação para esta seleção." 
                        FilterBarCreateFilter="Filtrar informações" />
                    <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged_Principal()
}" />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="Nome" VisibleIndex="0" 
                            Caption="Supermercadista" 
                            ToolTip="Nome do supermercadista, geralmente é o nome fantasia." 
                            Width="200px">
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Lojas" VisibleIndex="1" 
                            ToolTip="Quantidade de lojas que o supermercadista tem atualmente." 
                            Width="50px">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="percPartAT" VisibleIndex="2" 
                            Caption="% P. " 
                            ToolTip="% de participação sobre o total da venda no mês selecionado." 
                            Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="percPartAA" VisibleIndex="3" 
                            Caption="% P. AA." 
                            
                            ToolTip="% de participação sobre o total da venda. Mesmo mês, só que Ano Anterior." 
                            Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Rank" ReadOnly="True" VisibleIndex="4" 
                            ToolTip="Posição em que o supermercadista esta com base na venda." 
                            Width="50px">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrAT" VisibleIndex="5" 
                            Caption="Vlr." ToolTip="Valor da venda do mês selecionado.">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrMA" VisibleIndex="6" 
                            Caption="Mês Ant." ToolTip="Valor da venda do mês anterior.">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrAA" VisibleIndex="7" 
                            Caption="Venda A.A." ToolTip="Valor da venda do mês, só que Ano Anterior.">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrDifMA" ReadOnly="True" 
                            VisibleIndex="8" Caption="vlr. Dif. MA." 
                            ToolTip="Diferença entre Mês Selecionado e Mês Anterior.">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrDifMAperc" ReadOnly="True" 
                            VisibleIndex="9" Caption="%" 
                            ToolTip="Percentual de diferença entre Mês Selecionado e Mês Anterior." 
                            Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrDifAA" ReadOnly="True" 
                            VisibleIndex="10" Caption="vlr. Dif. AA." 
                            ToolTip="Diferença entre Mês Selecionado e Ano Anterior.">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrDifAAperc" ReadOnly="True" 
                            VisibleIndex="11" Caption="%" 
                            ToolTip="Percentual de diferença entre Mês Selecionado e Ano Anterior." 
                            Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="CNPJ_Principal" VisibleIndex="12" 
                            Visible="False">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Ano" VisibleIndex="12" Visible="False">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Mes" VisibleIndex="12" Visible="False">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="IPUser" VisibleIndex="12" 
                            Visible="False">
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFooter="True" VerticalScrollableHeight="355" 
                        ShowVerticalScrollBar="True" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <SettingsDetail ShowDetailRow="True" />
                    <ImagesEditors>
                        <CalendarFastNavPrevYear Height="19px" 
                            Url="~/App_Themes/Aqua/Editors/edtCalendarFNPrevYear.png" Width="19px" />
                        <CalendarFastNavNextYear Height="19px" 
                            Url="~/App_Themes/Aqua/Editors/edtCalendarFNNextYear.png" Width="19px" />
                        <DropDownEditDropDown Height="7px" 
                            Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                            Width="9px" />
                        <SpinEditIncrement Height="6px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditIncrementImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditIncrementDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                            Width="7px" />
                        <SpinEditDecrement Height="7px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditDecrementImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditDecrementDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                            Width="7px" />
                        <SpinEditLargeIncrement Height="9px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                            Width="7px" />
                        <SpinEditLargeDecrement Height="9px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                            Width="7px" />
                    </ImagesEditors>
                </dxwgv:ASPxGridView>
                <dxwgv:ASPxGridView ID="gridLojas" runat="server" AutoGenerateColumns="False" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    DataSourceID="dsLojas" Visible="False" Width="1000px" 
                    KeyFieldName="IE" ClientInstanceName="gridLojas" Theme="DevEx">
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                        <AlternatingRow BackColor="#F4FAFF">
                        </AlternatingRow>
                    </Styles>
                    <SettingsLoadingPanel Text="" />
                    <SettingsPager Mode="ShowAllRecords">
                        <AllButton>
                            <Image Height="19px" Width="27px" />
                        </AllButton>
                        <FirstPageButton>
                            <Image Height="19px" Width="23px" />
                        </FirstPageButton>
                        <LastPageButton>
                            <Image Height="19px" Width="23px" />
                        </LastPageButton>
                        <NextPageButton>
                            <Image Height="19px" Width="19px" />
                        </NextPageButton>
                        <PrevPageButton>
                            <Image Height="19px" Width="19px" />
                        </PrevPageButton>
                    </SettingsPager>
                    <GroupSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="Total de Lojas : {0:n0}" FieldName="IE" 
                            SummaryType="Count" />
                    </GroupSummary>
                    <TotalSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAT" 
                            ShowInGroupFooterColumn="vlr AT" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA" 
                            ShowInGroupFooterColumn="vlr MA" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA" 
                            ShowInGroupFooterColumn="vlr AA" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDifMA" 
                            ShowInGroupFooterColumn="vlr Dif MA" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDifAA" 
                            ShowInGroupFooterColumn="vlr Dif AA" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrDifMAperc" 
                            ShowInGroupFooterColumn="vlr Dif MAperc" SummaryType="Average" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrDifAAperc" 
                            ShowInGroupFooterColumn="vlr Dif AAperc" SummaryType="Average" />
                    </TotalSummary>
                    <Images ImageFolder="~/App_Themes/Aqua/{0}/">
                        <CollapsedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvCollapsedButton.png" Width="15px" />
                        <ExpandedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvExpandedButton.png" Width="15px" />
                        <DetailCollapsedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvDetailCollapsedButton.png" Width="15px" />
                        <DetailExpandedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvDetailExpandedButton.png" Width="15px" />
                        <HeaderFilter Height="19px" Url="~/App_Themes/Aqua/GridView/gvHeaderFilter.png" 
                            Width="19px" />
                        <HeaderActiveFilter Height="19px" 
                            Url="~/App_Themes/Aqua/GridView/gvHeaderFilterActive.png" Width="19px" />
                        <HeaderSortDown Height="5px" 
                            Url="~/App_Themes/Aqua/GridView/gvHeaderSortDown.png" Width="7px" />
                        <HeaderSortUp Height="5px" Url="~/App_Themes/Aqua/GridView/gvHeaderSortUp.png" 
                            Width="7px" />
                        <FilterRowButton Height="13px" Width="13px" />                       
                    </Images>
                    <SettingsText CommandClearFilter="Limpar" 
                        GroupPanel="Arraste para cá uma coluna abaixo para agrupar." />
                    <ClientSideEvents FocusedRowChanged="function(s, e) {OnGridFocusedRowChanged();}" />
                    <Columns>
                        <dxwgv:GridViewCommandColumn VisibleIndex="0" Visible="False" ShowClearFilterButton="True"/>
                        <dxwgv:GridViewDataTextColumn FieldName="Nome" VisibleIndex="0" 
                            Caption="Supermercadista" 
                            ToolTip="Nome do supermercadista, geralmente é o nome fantasia." 
                            Width="150px">
                            <Settings AutoFilterCondition="Contains" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Tipo" VisibleIndex="1" 
                            
                            
                            ToolTip="Formato do estabelecimento, H - Hipermercados,  S - Supermercados, A - Atacado,  D - Depósitos e O - Outros" 
                            Width="35px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Cidade" VisibleIndex="2" 
                            
                            
                            ToolTip="Cidade em que os estabelecimentos do supermercadista esta situado." 
                            Width="100px">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Bairro" VisibleIndex="3" 
                            
                            
                            ToolTip="Bairro em que os estabelecimentos do supermercadista esta situado." 
                            Width="100px">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Rank" ReadOnly="True" VisibleIndex="4" 
                            Width="35px">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrAT" VisibleIndex="5" Caption="vlr" 
                            ToolTip="Valor da venda do mês selecionado." Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrMA" VisibleIndex="6" 
                            Caption="Mês Ant." ToolTip="Valor da venda do mês anterior." Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrAA" VisibleIndex="7" 
                            Caption="vlr A.A" ToolTip="Valor da venda do mês, só que Ano Anterior." 
                            Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrDifMA" ReadOnly="True" 
                            VisibleIndex="8" Caption="vlr. Dif. MA." 
                            ToolTip="Diferença entre Mês Selecionado e Mês Anterior." Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrDifMAperc" ReadOnly="True" 
                            VisibleIndex="9" Caption="%" 
                            ToolTip="Percentual de diferença entre Mês Selecionado e Mês Anterior." 
                            Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrDifAA" ReadOnly="True" 
                            VisibleIndex="10" Caption="vlr. Dif. AA." 
                            ToolTip="Diferença entre Mês Selecionado e Ano Anterior." Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrDifAAperc" ReadOnly="True" 
                            VisibleIndex="11" Caption="%" 
                            ToolTip="Percentual de diferença entre Mês Selecionado e Ano Anterior." 
                            Width="50px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="IE" VisibleIndex="12" Caption="I.E." 
                            ToolTip="Inscrição Estadual do Fornecedor" Width="90px">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Ano" Visible="False" VisibleIndex="12">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Mes" Visible="False" VisibleIndex="12">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="IPUser" Visible="False" 
                            VisibleIndex="12">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="CNPJ_Principal" Visible="False" 
                            VisibleIndex="12">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="StatusDesc" 
                            ToolTip="Status da Venda. 'Original' é a venda original que veio do arquivo da fonte. '% Cresc.' é o percentual de cresc. ou decresc. das vendas sobre o mês anterior do supermercadista. '% ABRAS' é o percentual de crescimento do ano anterior da ABRAS com base na venda do ano anterior do concorrente." 
                            VisibleIndex="13" Width="60px">
                            <Settings AutoFilterCondition="Contains" />
                            <CellStyle HorizontalAlign="Center" Wrap="False">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFooter="True" ShowGroupPanel="True" ShowFilterRow="True" 
                        VerticalScrollableHeight="320" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <ImagesEditors>
                        <CalendarFastNavPrevYear Height="19px" 
                            Url="~/App_Themes/Aqua/Editors/edtCalendarFNPrevYear.png" Width="19px" />
                        <CalendarFastNavNextYear Height="19px" 
                            Url="~/App_Themes/Aqua/Editors/edtCalendarFNNextYear.png" Width="19px" />
                        <DropDownEditDropDown Height="7px" 
                            Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                            Width="9px" />
                        <SpinEditIncrement Height="6px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditIncrementImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditIncrementDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                            Width="7px" />
                        <SpinEditDecrement Height="7px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditDecrementImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditDecrementDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                            Width="7px" />
                        <SpinEditLargeIncrement Height="9px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                            Width="7px" />
                        <SpinEditLargeDecrement Height="9px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                            Width="7px" />
                    </ImagesEditors>
                </dxwgv:ASPxGridView>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;<asp:Label ID="lblOptPrincipalTodos" runat="server" Text="Label" 
                    style="color: #000000" Visible="False"></asp:Label>
&nbsp;<asp:Label ID="lblOptFormato" runat="server" Text="Label" style="color: #000000" 
                    Visible="False"></asp:Label>
                &nbsp;
                <asp:Label ID="lblIPUser" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
                <asp:SqlDataSource ID="dsMaster" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                    SelectCommand="uspConc_BuscaView" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblIPUser" Name="IPUser" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsDetail" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                    SelectCommand="uspConc_ViewRetornaLojasMD" 
                SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblIPUser" Name="IPUser" PropertyName="Text" 
                            Type="String" />
                        <asp:SessionParameter Name="CNPJ" SessionField="CNPJ" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsLojas" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                    SelectCommand="uspConc_ViewRetornaLojas" 
                SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblIPUser" Name="IPUser" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <dxwgv:ASPxGridViewExporter ID="ExporterExcel1" runat="server" 
                    GridViewID="gridLojas">
                </dxwgv:ASPxGridViewExporter>
                <br />
                <dxpc:ASPxPopupControl ID="popVendaPorIE" runat="server" 
                    ClientInstanceName="panelVendaPorIE" Height="350px" Width="500px" 
                    AllowDragging="True" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                    CssPostfix="Aqua" HeaderText="Vendas do Concorrente Selecionado" 
                    ImageFolder="~/App_Themes/Aqua/{0}/" Modal="True" 
                    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" 
                    Theme="DevEx" AllowResize="True">
                    <ContentStyle VerticalAlign="Top">
                    </ContentStyle>
                    <SizeGripImage Height="12px" Width="12px" />
                    <ContentCollection>
<dxpc:PopupControlContentControl runat="server">
    <table class="style1">
        <tr>
            <td>
                <dx:ASPxCallbackPanel ID="panelTodasVendas" runat="server" Width="775px" ClientInstanceName="panelTodasVendas">
                    <PanelCollection>
                        <dx:PanelContent runat="server" SupportsDisabledAttribute="true">
                            <div id="moldura1" style="width:750px">
                                <div style="margin-left:2px;width:500px">
                                    <dxe:ASPxLabel ID="lbl_VCS_NomeFantasia" runat="server" Text="ASPxLabel" Font-Size="30px" ForeColor="#666666"></dxe:ASPxLabel>
                                </div>




                                <div style="float:left;margin-left:2px;clear:both ">
                                    <asp:Label ID="lblEndereco" runat="server" Text="" Font-Size="20px" ForeColor="#999999"></asp:Label>
                                </div>

                                <div style="float:left;margin-left:2px;clear:both ">
                                    <asp:Label ID="lblCEP" runat="server" Text="" Font-Size="16px" ForeColor="#999999"></asp:Label>
                                </div>

                                <div style="float:left;padding-left:600px;width: 150px;margin-top:-85px">
                                    <asp:Image ID="imgLogo" runat="server" />
                                </div>

                                <div style="float:left;clear:both;padding-top:5px;padding-bottom:2px ">
                                    <b>Inscrição Estadual:</b>
                                </div>
                                <div style="float:left;margin-left:2px;padding-top:5px;padding-bottom:2px">
                                    <dxe:ASPxLabel ID="lbl_VCS_IE" runat="server" Text="ASPxLabel"></dxe:ASPxLabel>
                                </div>
                            </div>

                            <dxwgv:ASPxGridView ID="gridVendasPorIE" runat="server" 
                    AutoGenerateColumns="False" ClientInstanceName="gridVendasPorIE" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    KeyFieldName="Mes" Theme="DevEx" DataSourceID="dsTodasVendas">
                    <TotalSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2012" 
                            ShowInColumn="2012" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2011" 
                            ShowInColumn="2011" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2010" 
                            ShowInColumn="2010" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2009" 
                            ShowInColumn="2009" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2008" 
                            ShowInColumn="2008" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2007" 
                            ShowInColumn="2007" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="2013" 
                            ShowInColumn="2013" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc2012" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc2011" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc2010" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc2009" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc2008" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc2013" 
                            SummaryType="Custom" />
                    </TotalSummary>
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="Mes" VisibleIndex="0">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="2007" ReadOnly="True" VisibleIndex="1">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="2008" ReadOnly="True" VisibleIndex="3">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="2009" ReadOnly="True" VisibleIndex="5">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="2010" ReadOnly="True" VisibleIndex="7">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="perc2008" 
                            ShowInCustomizationForm="True" VisibleIndex="2">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="perc2009" 
                            ShowInCustomizationForm="True" VisibleIndex="4">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="perc2010" 
                            ShowInCustomizationForm="True" VisibleIndex="6">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="perc2011" 
                            ShowInCustomizationForm="True" VisibleIndex="8">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="2011" ShowInCustomizationForm="True" 
                            VisibleIndex="9">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="perc2012" 
                            ShowInCustomizationForm="True" VisibleIndex="10">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="2012" ShowInCustomizationForm="True" 
                            VisibleIndex="11">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="perc2013" 
                            ShowInCustomizationForm="True" VisibleIndex="12">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="2013" ShowInCustomizationForm="True" 
                            VisibleIndex="13">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsPager Mode="ShowAllRecords">
                        <AllButton>
                            <Image Height="19px" Width="27px" />
                        </AllButton>
                        <FirstPageButton>
                            <Image Height="19px" Width="23px" />
                        </FirstPageButton>
                        <LastPageButton>
                            <Image Height="19px" Width="23px" />
                        </LastPageButton>
                        <NextPageButton>
                            <Image Height="19px" Width="19px" />
                        </NextPageButton>
                        <PrevPageButton>
                            <Image Height="19px" Width="19px" />
                        </PrevPageButton>
                    </SettingsPager>
                    <Settings ShowFooter="True" />
                    <SettingsLoadingPanel Text="" />
                    <Images ImageFolder="~/App_Themes/Aqua/{0}/">
                        <CollapsedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvCollapsedButton.png" Width="15px" />
                        <ExpandedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvExpandedButton.png" Width="15px" />
                        <DetailCollapsedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvDetailCollapsedButton.png" Width="15px" />
                        <DetailExpandedButton Height="15px" 
                            Url="~/App_Themes/Aqua/GridView/gvDetailExpandedButton.png" Width="15px" />
                        <HeaderFilter Height="19px" Url="~/App_Themes/Aqua/GridView/gvHeaderFilter.png" 
                            Width="19px" />
                        <HeaderActiveFilter Height="19px" 
                            Url="~/App_Themes/Aqua/GridView/gvHeaderFilterActive.png" Width="19px" />
                        <HeaderSortDown Height="5px" 
                            Url="~/App_Themes/Aqua/GridView/gvHeaderSortDown.png" Width="7px" />
                        <HeaderSortUp Height="5px" Url="~/App_Themes/Aqua/GridView/gvHeaderSortUp.png" 
                            Width="7px" />
                        <FilterRowButton Height="13px" Width="13px" />
                       
                    </Images>
                    <ImagesEditors>
                        <CalendarFastNavPrevYear Height="19px" 
                            Url="~/App_Themes/Aqua/Editors/edtCalendarFNPrevYear.png" Width="19px" />
                        <CalendarFastNavNextYear Height="19px" 
                            Url="~/App_Themes/Aqua/Editors/edtCalendarFNNextYear.png" Width="19px" />
                        <DropDownEditDropDown Height="7px" 
                            Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                            Width="9px" />
                        <SpinEditIncrement Height="6px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditIncrementImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditIncrementDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditIncrementHottrackedImage.png" 
                            Width="7px" />
                        <SpinEditDecrement Height="7px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditDecrementImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditDecrementDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditDecrementHottrackedImage.png" 
                            Width="7px" />
                        <SpinEditLargeIncrement Height="9px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                            Width="7px" />
                        <SpinEditLargeDecrement Height="9px" 
                            Url="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecImage.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecDisabledImage.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                            Width="7px" />
                    </ImagesEditors>
                    <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                        <AlternatingRow BackColor="#FFFFC1">
                        </AlternatingRow>
                        <Footer Font-Bold="True">
                        </Footer>
                    </Styles>
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dxwgv:ASPxGridView> 
                            <asp:SqlDataSource ID="dsTodasVendas" runat="server" ConnectionString="<%$ ConnectionStrings:gerContCalend %>" SelectCommand="Concorrentes.uspBuscarTodasVendas" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtIE" Name="iIE" PropertyName="Text" Type="Int64" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </dx:PanelContent>
                       
                    </PanelCollection>
                </dx:ASPxCallbackPanel>

            </td>
        </tr>
    </table>
    <br />
                        <dxe:ASPxButton ID="btnAlterar" runat="server" 
        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
        Text="Alterar" Theme="DevEx">
                            <ClientSideEvents Click="function(s, e) {
	lpAlterar.Show();
}" />
    </dxe:ASPxButton>
                        </dxpc:PopupControlContentControl>
</ContentCollection>
                    <CloseButtonImage Height="16px" Width="17px" />
                    <HeaderStyle Font-Size="Small" HorizontalAlign="Center" />
                </dxpc:ASPxPopupControl>
                <br />
                <dxpc:ASPxPopupControl ID="popAlterarVenda" runat="server" AllowDragging="True" 
                    ClientInstanceName="lpAlterar" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                    CssPostfix="Aqua" HeaderText="Alterar Vendas" Height="200px" 
                    ImageFolder="~/App_Themes/Aqua/{0}/" PopupHorizontalAlign="WindowCenter" 
                    PopupVerticalAlign="WindowCenter" Width="320px">
                    <ContentStyle VerticalAlign="Top">
                    </ContentStyle>
                    <SizeGripImage Height="12px" Width="12px" />
                    <ContentCollection>
<dxpc:PopupControlContentControl runat="server">
    <table  class="style1">
        <tr>
            <td style="width: 109px">
                Inscrição Estadual :</td>
            <td>
                <dxe:ASPxTextBox ID="txtIE_U" runat="server" HorizontalAlign="Right" 
                    Width="120px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td style="width: 42px">
                Ano :</td>
            <td>
                <dxe:ASPxComboBox ID="cboAno_U" runat="server" ValueType="System.String" 
                    Width="71px">
                    <Items>
                        <dxe:ListEditItem Text="2006" Value="2006" />
                        <dxe:ListEditItem Text="2007" Value="2007" />
                        <dxe:ListEditItem Text="2008" Value="2008" />
                        <dxe:ListEditItem Text="2009" Value="2009" />
                        <dxe:ListEditItem Text="2010" Value="2010" />
                        <dxe:ListEditItem Text="2011" Value="2011" />
                        <dxe:ListEditItem Text="2012" Value="2012" />
                        <dxe:ListEditItem Text="2013" Value="2013" />
                        <dxe:ListEditItem Text="2014" Value="2014" />
                    </Items>
                </dxe:ASPxComboBox>
            </td>
            <td>
                Mês:</td>
            <td>
                <dxe:ASPxComboBox ID="cboMes_U" runat="server" ValueType="System.String" 
                    Width="101px" AutoPostBack="True">
                    <Items>
                        <dxe:ListEditItem Text="Janeiro" Value="1" />
                        <dxe:ListEditItem Text="Fevereiro" Value="2" />
                        <dxe:ListEditItem Text="Março" Value="3" />
                        <dxe:ListEditItem Text="Abril" Value="4" />
                        <dxe:ListEditItem Text="Maio" Value="5" />
                        <dxe:ListEditItem Text="Junho" Value="6" />
                        <dxe:ListEditItem Text="Julho" Value="7" />
                        <dxe:ListEditItem Text="Agosto" Value="8" />
                        <dxe:ListEditItem Text="Setembro" Value="9" />
                        <dxe:ListEditItem Text="Outubro" Value="10" />
                        <dxe:ListEditItem Text="Novembro" Value="11" />
                        <dxe:ListEditItem Text="Dezembro" Value="12" />
                    </Items>
                </dxe:ASPxComboBox>
            </td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td style="width: 50px">
                Venda :</td>
            <td>
                <dxe:ASPxTextBox ID="txtVenda_U" runat="server" HorizontalAlign="Right" 
                    Width="100px">
                </dxe:ASPxTextBox>
            </td>
            <td>
                <dxe:ASPxComboBox ID="cboStatus" runat="server" ValueType="System.String" 
                    Width="90px">
                    <Items>
                        <dxe:ListEditItem Text="Fechada" Value="1" />
                        <dxe:ListEditItem Text="Calculada" Value="2" />
                        <dxe:ListEditItem Text="Manual" Value="3" />
                    </Items>
                </dxe:ASPxComboBox>
            </td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td>
                <asp:Label ID="lblMesU" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <dxe:ASPxButton ID="btnSalvar" runat="server" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Text="Salvar">
                    <ClientSideEvents Click="function(s, e) {
	lpAlterar.Show();
}" />
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
                        </dxpc:PopupControlContentControl>
</ContentCollection>
                    <CloseButtonImage Height="16px" Width="17px" />
                </dxpc:ASPxPopupControl>
                <br />
                <dxpc:ASPxPopupControl ID="popCadLojas" runat="server" AllowDragging="True" 
                    ClientInstanceName="popCadLojas" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                    CssPostfix="Aqua" Height="500px" ImageFolder="~/App_Themes/Aqua/{0}/" 
                    Modal="True" Width="901px" PopupHorizontalAlign="WindowCenter" 
                    PopupVerticalAlign="WindowCenter">
                    <ContentStyle VerticalAlign="Top">
                    </ContentStyle>
                    <SizeGripImage Height="12px" Width="12px" />
                    <ContentCollection>
<dxpc:PopupControlContentControl runat="server">
    <table class="style1">
        <tr>
            <td style="width: 25px">
                Supermercadista:
            </td>
            <td>
                <dxe:ASPxComboBox ID="cboSupermercadista" runat="server" AutoPostBack="True" 
                    DataSourceID="dsListaSupermercadista" TextField="NomeEstabFantasia" 
                    ValueField="CNPJ_Principal" ValueType="System.String">
                </dxe:ASPxComboBox>
            </td>
            <td>
                <asp:Image ID="imgProduct" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                    <ContentTemplate>
                        <dxwgv:ASPxGridView ID="gridCadLojas" runat="server" 
                            AutoGenerateColumns="False" ClientInstanceName="gridCadLojas" 
                            CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue" EnableCallBacks="False" KeyFieldName="IE" 
                            Width="901px">
                            <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                CssPostfix="Office2003_Blue">
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                            </Styles>
                            <SettingsPager Mode="ShowAllRecords">
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
                            <ClientSideEvents FocusedRowChanged="function(s, e) {
	OnGridFocusedRowChanged_Cad()
}" />
                            <Columns>
                                <dxwgv:GridViewCommandColumn VisibleIndex="0">
                                </dxwgv:GridViewCommandColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="IE" ReadOnly="True" VisibleIndex="1" 
                                    Width="90px">
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Cidade" FieldName="cidregDesc" 
                                    VisibleIndex="2" Width="110px">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Bairro" FieldName="BAI_NO" 
                                    VisibleIndex="3" Width="150px">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="Endereço" VisibleIndex="4" 
                                    Width="270px">
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataCheckColumn FieldName="Ativo" VisibleIndex="5" Width="30px">
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dxwgv:GridViewDataCheckColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Observação" FieldName="Obs" 
                                    VisibleIndex="6" Width="250px">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="Notes" Visible="False" 
                                    VisibleIndex="7">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="imgLoja" Visible="False" 
                                    VisibleIndex="7">
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" 
                                ProcessSelectionChangedOnServer="True" />
                            <Settings ShowGroupPanel="True" ShowVerticalScrollBar="True" 
                                VerticalScrollableHeight="400" />
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                        </dxwgv:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                            SelectCommand="SELECT [IE], [CNPJ_Principal], [BAI_NO], [Endereço], [Ativo], [cidregDesc], [Obs], [Notes], [imgLoja] FROM [viewConcPorCidade]">
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td>
                <dxe:ASPxMemo ID="DetailNotes" runat="server" ClientInstanceName="DetailNotes" 
                    Height="71px" Width="170px">
                </dxe:ASPxMemo>
            </td>
            <td>
                <dxe:ASPxImage ID="DetailImage" runat="server" ClientEnabled="False" 
                    ClientInstanceName="DetailImage">
                    <Border BorderColor="#6699FF" BorderStyle="Solid" BorderWidth="1px" />
                </dxe:ASPxImage>
            </td>
            <td>
                &nbsp;</td>
            <td style="width: 79px">
                <asp:SqlDataSource ID="dsListaSupermercadista" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                    
                    SelectCommand="SELECT CNPJ_Principal, NomeEstabFantasia, imgLogo FROM tblEstab_Principal WHERE (cadsuperLista = 1) ORDER BY NomeEstabFantasia">
                </asp:SqlDataSource>
            </td>
            <td>
                <dxe:ASPxTextBox ID="txtCadIE" runat="server" 
                    ClientInstanceName="txtCadIE" ForeColor="Black" Width="91px">
                    <Border BorderColor="#1E49B1" BorderStyle="Dotted" BorderWidth="1px" />
                </dxe:ASPxTextBox>
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                    SelectCommand="SELECT [IE], [imgLoja] FROM [viewConcPorCidade]">
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
    <br />
                        </dxpc:PopupControlContentControl>
</ContentCollection>
                    <CloseButtonImage Height="16px" Width="17px" />
                </dxpc:ASPxPopupControl>
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1 {
            width: 149px;
        }
        .auto-style2 {
            height: 40px;
        }
    </style>
</asp:Content>


