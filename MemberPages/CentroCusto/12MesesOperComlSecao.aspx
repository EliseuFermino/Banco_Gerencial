<%@ Page Title="Consulta de Venda - Realizado" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="12MesesOperComlSecao.aspx.vb" Inherits="MemberPages_12MesesOperComlSecao" %>

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

        #divFilial {            
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
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="idGrupo" Width="1000px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrNR1" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="idGrupo" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="GrupoDesc" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrNR1" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrNR2" ShowInCustomizationForm="True" VisibleIndex="3" Width="50px">
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
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="CentroCusto.uspNivelRateio_AberturaPorGrupo" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


</asp:Content>


