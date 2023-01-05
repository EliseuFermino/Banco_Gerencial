<%@ Page Title="Margem Chave" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="MargemChave.aspx.vb" Inherits="MemberPages_Gerencial_MargemChave" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divPeriodo {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }

        #divTipoMargem {
            float: left;
            margin-left: 5px;
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
        }

        #divSize {            
            float: left;           
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }



    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divPeriodo">
        <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
    </div>

    <div id="divTipoMargem">
        <dx:ASPxRadioButtonList ID="tipoMargem" runat="server" ValueType="System.Byte" ItemSpacing="15px" RepeatDirection="Horizontal" SelectedIndex="0" Height="25px">
            <Paddings Padding="0px" PaddingTop="2px" />
            <Items>
                <dx:ListEditItem Selected="True" Text="Margem PDV" Value="1" />
                <dx:ListEditItem Text="Margem Sell-Out" Value="2" />
                <dx:ListEditItem Text="Margem PDV + Sell-Out" Value="3" />
            </Items>
            <Border BorderStyle="None" />
        </dx:ASPxRadioButtonList>
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
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>

                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" EnableTheming="True" KeyFieldName="idSecao" Theme="Default" Width="1050px">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="idSecao" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Seção" FieldName="descSecao" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Left" Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Hiper" ShowInCustomizationForm="True" VisibleIndex="2">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="hFilial_1" ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="hFilial_2" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="hFilial_3" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="hFilial_4" ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="hFilial_5" ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="hFilial_99" ShowInCustomizationForm="True" VisibleIndex="5">
                                        <HeaderStyle BackColor="Silver" />
                                        <CellStyle Font-Bold="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Super" ShowInCustomizationForm="True" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="sFilial_1" ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="sFilial_2" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="sFilial_3" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="sFilial_4" ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="sFilial_5" ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="sFilial_99" ShowInCustomizationForm="True" VisibleIndex="5">
                                        <HeaderStyle BackColor="Silver" />
                                        <CellStyle Font-Bold="True">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="sFilial" ShowInCustomizationForm="True" VisibleIndex="9">
                                <HeaderStyle BackColor="#0066FF" ForeColor="White" />
                                <CellStyle Font-Bold="True" ForeColor="Blue">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings VerticalScrollableHeight="600" VerticalScrollBarMode="Visible" />
                        <SettingsDetail ShowDetailRow="True" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F0F0F0">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="#3333FF">
                            </FocusedRow>
                        </Styles>
                        <Templates>
                            <DetailRow>
                                <dx:ASPxGridView ID="detail" runat="server" OnBeforePerformDataSelect="detail_BeforePerformDataSelect" DataSourceID="dsDadosGrupo" AutoGenerateColumns="False" Width="800px" OnLoad="detail_Load" Theme="Default">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="idGrupo" VisibleIndex="0" Visible="False">
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Left" Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="descGrupo" VisibleIndex="1" Width="200px" Caption="Grupo">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="idSecao" ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="hFilial_1" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="hFilial_2" ShowInCustomizationForm="True" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="hFilial_3" ShowInCustomizationForm="True" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="hFilial_4" ShowInCustomizationForm="True" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="hFilial_5" ShowInCustomizationForm="True" VisibleIndex="7">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="hFilial_99" ShowInCustomizationForm="True" VisibleIndex="8">
                                            <HeaderStyle BackColor="Silver" />
                                            <CellStyle Font-Bold="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="sFilial_1" ShowInCustomizationForm="True" VisibleIndex="9">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="sFilial_2" ShowInCustomizationForm="True" VisibleIndex="10">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="sFilial_3" ShowInCustomizationForm="True" VisibleIndex="11">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="sFilial_4" ShowInCustomizationForm="True" VisibleIndex="12">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="sFilial_5" ShowInCustomizationForm="True" VisibleIndex="13">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="sFilial_99" ShowInCustomizationForm="True" VisibleIndex="14">
                                            <HeaderStyle BackColor="Silver" />
                                            <CellStyle Font-Bold="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="sFilial" ShowInCustomizationForm="True" VisibleIndex="15">
                                            <HeaderStyle BackColor="#0066FF" ForeColor="White" />
                                            <CellStyle Font-Bold="True" ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <Settings VerticalScrollableHeight="300" VerticalScrollBarMode="Visible" />                                    
                                    <Styles>
                                        <Header HorizontalAlign="Center">
                                        </Header>
                                        <AlternatingRow BackColor="#F0F0F0">
                                        </AlternatingRow>
                                        <FocusedRow BackColor="#FFFF66" ForeColor="#3333FF">
                                        </FocusedRow>
                                    </Styles>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="dsDadosGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspMargemChave_Grupo" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                        <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                                        <asp:SessionParameter Name="TipoMargem" SessionField="sTIPO" Type="Byte" />
                                        <asp:SessionParameter Name="idMercadologico" SessionField="sMERCADOLOGICO" Type="Int16" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </DetailRow>
                        </Templates>
                    </dx:ASPxGridView>
                  
                 <%--Arraste seu controle aqui --%>                         
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspMargemChave" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" DbType="Date" />
                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" DbType="Date" />
                            <asp:SessionParameter Name="TipoMargem" SessionField="sTIPO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>

