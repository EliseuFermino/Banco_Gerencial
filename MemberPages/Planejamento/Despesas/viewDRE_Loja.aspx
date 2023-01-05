<%@ Page Title="D.R.E. - Demonstração do Resultado do Exercício" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="viewDRE_Loja.aspx.vb" Inherits="MemberPages_Planejamento_Despesas_viewDRE_Loja" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>



<%@ Register Src="~/Controles/wucListaLojas.ascx" TagPrefix="uc1" TagName="wucListaLojas" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">

        html {            
                overflow-x:hidden;            
            }        

        #moldura {
            width:1024px; 
            margin: 0 auto ;                      
        }

        #divAno {
            float: left;            
        }

        #divFilial {
            float: left;
            width: 330px;
            padding-left: 2px;
            padding-top: 2px;
        }

        #BotaoAtualizar {
            float: left;
            margin-left: 2px;
            margin-top: 2px;
        }

        #divDados {
            clear: both;
            float: left;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="moldura">

        <div id="divAno">
            <uc1:wucAno runat="server" ID="cboAno" />
        </div>

        <div id="divFilial">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>

         <div id="BotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme ="Metropolis" AutoPostBack ="False" >
                <ClientSideEvents Click="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

         <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="1020px" Theme ="Metropolis" ClientInstanceName="cbPanel" SettingsLoadingPanel-Text="Atualizando">
                <PanelCollection>
                    <dx:PanelContent>
                
        <div id="divDados">
            <dx:ASPxGridView ID="gridAno" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" Width="400px">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="ID" FieldName="idGrupo" ToolTip="Número da Conta" VisibleIndex="0" Width="40px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Conta" FieldName="descGrupo" ToolTip="Descrição da Conta" VisibleIndex="1" Width="100px">
                        <CellStyle Wrap="False">
                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewBandColumn Caption="Definitiva" VisibleIndex="3">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Valor" FieldName="pd_vlr" VisibleIndex="0" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="%" FieldName="pd_perc" VisibleIndex="1" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <HeaderStyle Font-Bold="True" ForeColor="Blue" />
                    </dx:GridViewBandColumn>
                    <dx:GridViewBandColumn Caption="Loja" VisibleIndex="2">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Valor" FieldName="pl_vlr" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="%" FieldName="pl_perc" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <HeaderStyle Font-Bold="True" />
                    </dx:GridViewBandColumn>
                </Columns>
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowTitlePanel="True" />
                <Styles>
                    <Header HorizontalAlign="Center">
                    </Header>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerOrcamentoConnectionString %>" SelectCommand="uspBuscarDRE" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

         </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

    </div>
</asp:Content>

