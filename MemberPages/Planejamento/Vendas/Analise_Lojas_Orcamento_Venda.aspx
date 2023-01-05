<%@ Page Title="Análise do Orçamento de Vendas da Loja - PGR429" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Analise_Lojas_Orcamento_Venda.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_Analise_Lojas_Orcamento_Venda" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">


    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }
              

        #divDadosAnalise {
             clear: both;
            float: left;
            margin-left: 2px;         
            margin-top: 20px;
        }


    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>
    
    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>    

    
        
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
        <Images>
        <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
        </Images>

        <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>

                    <div id="divDadosAnalise">

                        <dx:ASPxGridView ID="gridAnalise" runat="server" DataSourceID="dsAnalise" ClientInstanceName="gridAnalise" Width="850px" AutoGenerateColumns="False">

                            <SettingsPager PageSize="40">
                            </SettingsPager>
                            <Settings VerticalScrollableHeight="500" ShowFilterRow="True" ShowTitlePanel="True" VerticalScrollBarMode="Auto" />

                            <SettingsBehavior AllowFocusedRow="True" />

                            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                            <SettingsText Title="Analise Digitação das Lojas:  Verde = Digitado, Vermelho = Falta Digitar" />

                            <Columns>                               
                                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="descFilial" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Filial" Width="150px">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M1" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Jan" Width="20px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M2" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Fev" Width="20px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M3" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Mar" Width="20px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M4" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Abr" Width="20px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M5" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Mai" Width="20px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M6" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Jun" Width="20px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M7" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Jul" Width="20px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M8" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Ago" Width="20px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M9" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Set" Width="20px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M10" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Out" Width="20px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M11" ShowInCustomizationForm="True" VisibleIndex="13" Caption="Nov" Width="20px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="M12" ShowInCustomizationForm="True" VisibleIndex="14" Caption="Dez" Width="20px">
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle Font-Overline="False" Font-Size="1pt" HorizontalAlign="Right"> </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Seção" FieldName="Secao" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>

                            <FormatConditions>
                            

                                <dx:GridViewFormatConditionHighlight Expression="[M1]&lt;=0.0" FieldName="M1" ShowInColumn="Jan"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M1]&gt;0.0" FieldName="M1" Format="GreenFillWithDarkGreenText" ShowInColumn="Jan"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M2]&lt;=0.0" FieldName="M2" ShowInColumn="Fev"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M2]&gt;0.0" FieldName="M2" Format="GreenFillWithDarkGreenText" ShowInColumn="Fev"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M3]&lt;=0.0" FieldName="M3" ShowInColumn="Mar"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M3]&gt;0.0" FieldName="M3" Format="GreenFillWithDarkGreenText" ShowInColumn="Mar"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M4]&lt;=0.0" FieldName="M4" ShowInColumn="Abr"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M4]&gt;0.0" FieldName="M4" Format="GreenFillWithDarkGreenText" ShowInColumn="Abr"></dx:GridViewFormatConditionHighlight>
                                                                
                                <dx:GridViewFormatConditionHighlight Expression="[M5]&lt;=0.0" FieldName="M5" ShowInColumn="Mai"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M5]&gt;0.0" FieldName="M5" Format="GreenFillWithDarkGreenText" ShowInColumn="Mai"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M6]&lt;=0.0" FieldName="M6" ShowInColumn="Jun"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M6]&gt;0.0" FieldName="M6" Format="GreenFillWithDarkGreenText" ShowInColumn="Jun"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M7]&lt;=0.0" FieldName="M7" ShowInColumn="Jul"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M7]&gt;0.0" FieldName="M7" Format="GreenFillWithDarkGreenText" ShowInColumn="Jul"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M8]&lt;=0.0" FieldName="M8" ShowInColumn="Ago"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M8]&gt;0.0" FieldName="M8" Format="GreenFillWithDarkGreenText" ShowInColumn="Ago"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M9]&lt;=0.0" FieldName="M9" ShowInColumn="Set"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M9]&gt;0.0" FieldName="M9" Format="GreenFillWithDarkGreenText" ShowInColumn="Set"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M10]&lt;=0.0" FieldName="M10" ShowInColumn="Out"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M10]&gt;0.0" FieldName="M10" Format="GreenFillWithDarkGreenText" ShowInColumn="Out"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M11]&lt;=0.0" FieldName="M11" ShowInColumn="Nov"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M11]&gt;0.0" FieldName="M11" Format="GreenFillWithDarkGreenText" ShowInColumn="Nov"></dx:GridViewFormatConditionHighlight>

                                <dx:GridViewFormatConditionHighlight Expression="[M12]&lt;=0.0" FieldName="M12" ShowInColumn="Dez"></dx:GridViewFormatConditionHighlight>
                                <dx:GridViewFormatConditionHighlight Expression="[M12]&gt;0.0" FieldName="M12" Format="GreenFillWithDarkGreenText" ShowInColumn="Dez"></dx:GridViewFormatConditionHighlight>

                            </FormatConditions>

                            <Styles>
                                <AlternatingRow BackColor="#EEEEEE">
                                </AlternatingRow>
                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                </FocusedRow>
                            </Styles>

                        </dx:ASPxGridView>

                    <asp:SqlDataSource ID="dsAnalise" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="dbo.usp_Ver_Meta_Loja_Matriz" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                                                
                        </SelectParameters>
                    </asp:SqlDataSource>

                    </div>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
   


</asp:Content>


