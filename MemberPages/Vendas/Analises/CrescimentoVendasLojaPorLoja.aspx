<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CrescimentoVendasLojaPorLoja.aspx.vb" Inherits="MemberPages_Vendas_Analises_CrescimentoVendasLojaPorLoja" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divDia {            
            float: left;
            margin-left: 10px;
            margin-top: 1px;
        }

        #divCaixaPercentualCaption {            
            float: left;
            margin-left: 15px;
            margin-top: 2px;
        }

        #divCaixaPercentual {            
            float: left;
            margin-left: 2px;
            margin-top: 1px;
        }

        #divMesmosDias {            
            float: left;
            margin-left: 15px;
            margin-top: 2px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 20px;
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
            width: 100%;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divDia">
        <uc1:wucListaDiaIniFin runat="server" ID="cboDia" />
    </div>


    <div id="divCaixaPercentualCaption">
        % 
    </div>

    <div id="divCaixaPercentual">
        <dx:ASPxTextBox ID="txtCaixaPercentual" runat="server" Width="60px" DisplayFormatString="{0:n2}" MaxLength="4" Font-Size="Medium" HorizontalAlign="Center" ToolTip="Informe o percentual. A consulta vai trazer todos o crescimentos abaixo do percentual informado." HelpText="Informe o percentual. A consulta vai trazer todos os crescimentos de vendas de todas a lojas e todas as seções abaixo do percentual informado." Text="5">
            <HelpTextSettings DisplayMode="Popup">
            </HelpTextSettings>
        </dx:ASPxTextBox>
    </div>

    <div id="divMesmosDias">
        <dx:ASPxCheckBox ID="chkMesmosDias" runat="server" Text="Mesmos Dias" Theme="DevEx" ForeColor ="Blue" ToolTip="Quando a opcão 'Mesmos Dias' estiver selecionado, a consulta retornará o mesmo dia da semana do ano anterior, por exemplo, quinta com quinta, sexta com sexta e etc." CheckState="Unchecked">
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

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>



    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" Width="100%" KeyFieldName="DescSecao">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrNR1" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="DescSecao" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Seção" FixedStyle="Left" Width="150px" SortIndex="0" SortOrder="Ascending">
                                <CellStyle Wrap="False">
                                    <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="3" ShowInCustomizationForm="True" VisibleIndex="1" ReadOnly="True" Caption="3-S.Felicidade" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="4" ShowInCustomizationForm="True" VisibleIndex="2" ReadOnly="True" Caption="4-Lapa" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="5" ShowInCustomizationForm="True" VisibleIndex="3" ReadOnly="True" Caption="5-Araucaria" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="6" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Caption="6-Pinheirinho" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="7" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Caption="7-Hauer" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="8" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" Caption="8-Paranaguá" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="9" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Caption="9-Londrina" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="10" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Caption="10-C.Comprido" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="11" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9" Caption="11-S. Bráz" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="13" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10" Caption="13-Sitio Cercado" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="14" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="11" Caption="14-S.J. dos Pinhais" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="15" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="12" Caption="15-Apucarana" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="17" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="13" Caption="17-Ahú" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="18" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="14" Caption="18-P.G.Centro" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="19" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="15" Caption="19-P.G.Nova" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="20" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="16" Caption="20-Maringá" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="21" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="17" Caption="21-Nilo Peçanha" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="22" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="18" Caption="22-Champagnat" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="23" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="19" Caption="23-Araucária Nova" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="24" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="20" Caption="24-Santa Cândida" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="25" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="21" Caption="25-Paranaguá Nova" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="26" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="22" Caption="26-Torres" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="27" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="23" Caption="27-Novo Mundo" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="28" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="24" Caption="28-Cristo Rei" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="29" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="25" Caption="29-Água Verde" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="30" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="26" Caption="30-Fazenda Rio Grande" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="31" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="27" Caption="31-Campo Largo" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="32" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="28" Caption="32-Uvaranas (Ponta Grossa)" ToolTip="32-Uvaranas (Ponta Grossa)" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="33" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="29" Caption="33-São José (Av. Joinvile)" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="34" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="30" Caption="34-Xaxim" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="36" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="31" Caption="36-Castro" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="37" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="32" Caption="37-Cajuru" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="38" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="33" Caption="38-Colombo" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="39" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="34" Caption="39-Pinhais" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="40" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="35" Caption="40-Maringá" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="42" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="37" Caption="42-P.G. Jd. Carv" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="43" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="38" Caption="43-Alm. Tamandaré" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="44" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="39" Caption="44-P.G. Oficinas" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="45" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="40" Caption="45-Arauc. Cost" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="46" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="41" Caption="46-Campo Largo" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="47" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="42" Caption="47-Pinhais" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="48" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="43" Caption="48-Joinvile" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="49" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="44" Caption="49-Boa Vista" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="41-Campo Mourão" FieldName="41" ShowInCustomizationForm="True" VisibleIndex="36" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="50-Santa Quitéria" FieldName="50" ShowInCustomizationForm="True" VisibleIndex="45" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="51-Joinvile America" FieldName="51" ShowInCustomizationForm="True" VisibleIndex="46" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="52-Mafra" FieldName="52" ShowInCustomizationForm="True" VisibleIndex="47" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="53-João Bettega" FieldName="53" ShowInCustomizationForm="True" VisibleIndex="48" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="54-Derosso" FieldName="54" ShowInCustomizationForm="True" VisibleIndex="49" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="55-Jaraguá" FieldName="55" ShowInCustomizationForm="True" VisibleIndex="50" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="56-Piraquara" FieldName="56" ShowInCustomizationForm="True" VisibleIndex="51" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="57-Joinvile" FieldName="57" ShowInCustomizationForm="True" VisibleIndex="52" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowTitlePanel="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue" Font-Bold="True">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>                    
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.sp_CrescimentoVenda_LojaSecao_comParametro" SelectCommandType="StoredProcedure">
                        <SelectParameters>                            
                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" Type="DateTime" />
                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" Type="DateTime" />
                            <asp:SessionParameter Name="perc" SessionField="sPERC" Type="Decimal" />
                            <asp:SessionParameter Name="MesmosDias" SessionField="sMESMOS" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: DW_Condor_One" Anotacao2="Stored Procedure: Analises.sp_CrescimentoVenda_LojaSecao_comParametro" />


</asp:Content>


