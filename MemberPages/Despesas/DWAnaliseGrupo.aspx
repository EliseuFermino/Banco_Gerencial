<%@ Page Title="Despesas Históricas por Grupo" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="DWAnaliseGrupo.aspx.vb" Inherits="MemberPages_Despesas_DWAnaliseGrupo" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divFilial {            
            float: left;
            margin-left: 10px;
        }

        #divListaVer {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divSize {            
            float: left;           
        }

        #divDados {
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

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divListVer">
        <dx:ASPxComboBox ID="cboListaVer" runat="server" SelectedIndex="1">
            <Items>
                <dx:ListEditItem Text="Meta" Value="1" />
                <dx:ListEditItem Selected="True" Text="Realizado" Value="2" />
            </Items>
        </dx:ASPxComboBox>
    </div>


    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>



    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" Width="1000px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrNR1" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="listaGrupo" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes1m" ShowInCustomizationForm="True" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc1m" ShowInCustomizationForm="True" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes1r" ShowInCustomizationForm="True" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc1r" ShowInCustomizationForm="True" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes1d" ShowInCustomizationForm="True" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc1d" ShowInCustomizationForm="True" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes2m" ShowInCustomizationForm="True" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc2m" ShowInCustomizationForm="True" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes2r" ShowInCustomizationForm="True" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc2r" ShowInCustomizationForm="True" VisibleIndex="11">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes2d" ShowInCustomizationForm="True" VisibleIndex="12">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc2d" ShowInCustomizationForm="True" VisibleIndex="13">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes3m" ShowInCustomizationForm="True" VisibleIndex="14">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc3m" ShowInCustomizationForm="True" VisibleIndex="15">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes3r" ShowInCustomizationForm="True" VisibleIndex="16">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc3r" ShowInCustomizationForm="True" VisibleIndex="17">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes3d" ShowInCustomizationForm="True" VisibleIndex="18">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc3d" ShowInCustomizationForm="True" VisibleIndex="19">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes4m" ShowInCustomizationForm="True" VisibleIndex="20">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc4m" ShowInCustomizationForm="True" VisibleIndex="21">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes4r" ShowInCustomizationForm="True" VisibleIndex="22">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc4r" ShowInCustomizationForm="True" VisibleIndex="23">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes4d" ShowInCustomizationForm="True" VisibleIndex="24">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc4d" ShowInCustomizationForm="True" VisibleIndex="25">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes5m" ShowInCustomizationForm="True" VisibleIndex="26">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc5m" ShowInCustomizationForm="True" VisibleIndex="27">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes5r" ShowInCustomizationForm="True" VisibleIndex="28">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc5r" ShowInCustomizationForm="True" VisibleIndex="29">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes5d" ShowInCustomizationForm="True" VisibleIndex="30">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc5d" ShowInCustomizationForm="True" VisibleIndex="31">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes6m" ShowInCustomizationForm="True" VisibleIndex="32">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc6m" ShowInCustomizationForm="True" VisibleIndex="33">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes6r" ShowInCustomizationForm="True" VisibleIndex="34">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc6r" ShowInCustomizationForm="True" VisibleIndex="35">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes6d" ShowInCustomizationForm="True" VisibleIndex="36">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc6d" ShowInCustomizationForm="True" VisibleIndex="37">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes7m" ShowInCustomizationForm="True" VisibleIndex="38">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc7m" ShowInCustomizationForm="True" VisibleIndex="39">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes7r" ShowInCustomizationForm="True" VisibleIndex="40">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc7r" ShowInCustomizationForm="True" VisibleIndex="41">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes7d" ShowInCustomizationForm="True" VisibleIndex="42">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc7d" ShowInCustomizationForm="True" VisibleIndex="43">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes8m" ShowInCustomizationForm="True" VisibleIndex="44">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc8m" ShowInCustomizationForm="True" VisibleIndex="45">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes8r" ShowInCustomizationForm="True" VisibleIndex="46">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc8r" ShowInCustomizationForm="True" VisibleIndex="47">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes8d" ShowInCustomizationForm="True" VisibleIndex="48">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc8d" ShowInCustomizationForm="True" VisibleIndex="49">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes9m" ShowInCustomizationForm="True" VisibleIndex="50">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc9m" ShowInCustomizationForm="True" VisibleIndex="51">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes9r" ShowInCustomizationForm="True" VisibleIndex="52">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc9r" ShowInCustomizationForm="True" VisibleIndex="53">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes9d" ShowInCustomizationForm="True" VisibleIndex="54">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc9d" ShowInCustomizationForm="True" VisibleIndex="55">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes10m" ShowInCustomizationForm="True" VisibleIndex="56">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc10m" ShowInCustomizationForm="True" VisibleIndex="57">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes10r" ShowInCustomizationForm="True" VisibleIndex="58">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc10r" ShowInCustomizationForm="True" VisibleIndex="59">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes10d" ShowInCustomizationForm="True" VisibleIndex="60">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc10d" ShowInCustomizationForm="True" VisibleIndex="61">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes11m" ShowInCustomizationForm="True" VisibleIndex="62">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc11m" ShowInCustomizationForm="True" VisibleIndex="63">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes11r" ShowInCustomizationForm="True" VisibleIndex="64">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc11r" ShowInCustomizationForm="True" VisibleIndex="65">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes11d" ShowInCustomizationForm="True" VisibleIndex="66">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc11d" ShowInCustomizationForm="True" VisibleIndex="67">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes12m" ShowInCustomizationForm="True" VisibleIndex="68">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc12m" ShowInCustomizationForm="True" VisibleIndex="69">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes12r" ShowInCustomizationForm="True" VisibleIndex="70">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc12r" ShowInCustomizationForm="True" VisibleIndex="71">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes12d" ShowInCustomizationForm="True" VisibleIndex="72">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc12d" ShowInCustomizationForm="True" VisibleIndex="73">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes14m" ShowInCustomizationForm="True" VisibleIndex="74">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc14m" ShowInCustomizationForm="True" VisibleIndex="75">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes14r" ShowInCustomizationForm="True" VisibleIndex="76">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc14r" ShowInCustomizationForm="True" VisibleIndex="77">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes14d" ShowInCustomizationForm="True" VisibleIndex="78">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc14d" ShowInCustomizationForm="True" VisibleIndex="79">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes24m" ShowInCustomizationForm="True" VisibleIndex="80">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc24m" ShowInCustomizationForm="True" VisibleIndex="81">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes24r" ShowInCustomizationForm="True" VisibleIndex="82">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc24r" ShowInCustomizationForm="True" VisibleIndex="83">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes24d" ShowInCustomizationForm="True" VisibleIndex="84">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc24d" ShowInCustomizationForm="True" VisibleIndex="85">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes34m" ShowInCustomizationForm="True" VisibleIndex="86">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc34m" ShowInCustomizationForm="True" VisibleIndex="87">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes34r" ShowInCustomizationForm="True" VisibleIndex="88">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc34r" ShowInCustomizationForm="True" VisibleIndex="89">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes34d" ShowInCustomizationForm="True" VisibleIndex="90">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc34d" ShowInCustomizationForm="True" VisibleIndex="91">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes77m" ShowInCustomizationForm="True" VisibleIndex="92">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc77m" ShowInCustomizationForm="True" VisibleIndex="93">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes77r" ShowInCustomizationForm="True" VisibleIndex="94">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc77r" ShowInCustomizationForm="True" VisibleIndex="95">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes77d" ShowInCustomizationForm="True" VisibleIndex="96">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc77d" ShowInCustomizationForm="True" VisibleIndex="97">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes99m" ShowInCustomizationForm="True" VisibleIndex="98">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc99m" ShowInCustomizationForm="True" VisibleIndex="99">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes99r" ShowInCustomizationForm="True" VisibleIndex="100">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc99r" ShowInCustomizationForm="True" VisibleIndex="101">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes99d" ShowInCustomizationForm="True" VisibleIndex="102">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Perc99d" ShowInCustomizationForm="True" VisibleIndex="103">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
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
                        </Styles>
                    </dx:ASPxGridView>                    
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="gerDespesas.DW.uspBuscar_AnaliseGrupo" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                            
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


</asp:Content>


