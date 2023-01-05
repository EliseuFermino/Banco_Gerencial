<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="frmCadVendaGrupo.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_frmCadVendaGrupo" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divMes {            
            float: left;
            margin-left: 10px;
        }

        #divFilial {            
            float: left;
            margin-left: 10px;
        }

         #divSecao {            
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
            width: 100%;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
         <dx:ASPxDateEdit ID="cboMes" runat="server" AllowUserInput="False" AutoPostBack="False" EditFormat="Custom" EditFormatString="MMMM" PickerDisplayMode="Auto" PickerType="Months" PopupHorizontalAlign="Center" Theme="Mulberry" Caption="Mês" Date="2019-09-01" >
            <CalendarProperties EnableLargePeriodNavigation="False" EnablePeriodNavigation="False" ShowClearButton="False" ShowHeader="False" TodayButtonText="Mês Atual" >
            </CalendarProperties>
            <ClearButton DisplayMode="Never">
            </ClearButton>
    </dx:ASPxDateEdit>
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divSecao">
        <uc1:wucListaSecao runat="server" ID="cboSecao" />
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
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="idProdutoGrupo" 
                        Width="100%" EnableTheming="True" Theme="MaterialCompact" >
                         
                        <SettingsBehavior AllowFocusedRow="True" />
                         
                        <Columns>
                            <dx:GridViewBandColumn FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="nomeGrupo" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px">
                                        <Settings ShowEditorInBatchEditMode="False" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="No_Visible" Name="band_No_Visible" ShowInCustomizationForm="True" Visible="False" VisibleIndex="31">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Mes" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="idDepto" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="idSecao" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="idGrupo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Ano" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="idProdutoGrupo" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Metas 2020" Name="band_Meta" ShowInCustomizationForm="True" VisibleIndex="1">
                                <HeaderStyle BackColor="#009900" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrMeta" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#00C100" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                        <HeaderStyle BackColor="#00C100" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescAA" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                        <HeaderStyle BackColor="#00C100" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Histórico  -  Vendas" ShowInCustomizationForm="True" VisibleIndex="2">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrHistAA1" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                        <HeaderStyle BackColor="#000099" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrHistAA2" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                        <HeaderStyle BackColor="#000099" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrHistAA3" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                        <HeaderStyle BackColor="#000099" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrHistAA4" ShowInCustomizationForm="True" VisibleIndex="3" Visible="False">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                        <HeaderStyle BackColor="#000099" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Histórico  -  % Participação" ShowInCustomizationForm="True" VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="percPartAA1" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                        <HeaderStyle BackColor="#000099" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percPartAA2" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                        <HeaderStyle BackColor="#000099" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percPartAA3" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                        <HeaderStyle BackColor="#000099" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Histórico - % Crescimento" ShowInCustomizationForm="True" VisibleIndex="13">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="percCrescAA1" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                        <HeaderStyle BackColor="#000099" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percCrescAA2" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                        <HeaderStyle BackColor="#000099" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percCrescAA3" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                        <HeaderStyle BackColor="#000099" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Histórico Últimos 3 Meses - Vendas" ShowInCustomizationForm="True" VisibleIndex="17">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrHistM1" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrHistM2" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrHistM3" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrHistM4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Histórico Últimos 3 Meses - Participação" ShowInCustomizationForm="True" VisibleIndex="23">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="percPartM1" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percPartM2" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percPartM3" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings ShowEditorInBatchEditMode="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn ShowInCustomizationForm="True" VisibleIndex="30" Caption="Histórico Últimos 3 Meses - Crescimento">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="percCrescM1" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percCrescM2" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percCrescM3" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>

                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>

                        <SettingsEditing Mode="Batch" >                        
                            <BatchEditSettings StartEditAction="Click" />
                        </SettingsEditing>
                        <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />

                        <TotalSummary>

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistAA1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistAA2" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistAA3" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistAA4" SummaryType="Sum" />
                      

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistM1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistM2" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistM3" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistM4" SummaryType="Sum" />
                 

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA2" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA3" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartM1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartM2" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartM3" SummaryType="Sum" />                            
                    
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA" SummaryType="Custom" />
                    
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA1" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA2" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA3" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescM1" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescM2" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescM3" SummaryType="Custom" />

                        </TotalSummary>
                        <FormatConditions>
                            <dx:GridViewFormatConditionIconSet FieldName="percCrescAA1" Format="PositiveNegativeArrowsColored" />
                            <dx:GridViewFormatConditionIconSet FieldName="percCrescAA2" Format="PositiveNegativeArrowsColored" />
                            <dx:GridViewFormatConditionIconSet FieldName="percCrescAA3" Format="PositiveNegativeArrowsColored" />
                        </FormatConditions>
                        <Styles>
                            <Header BackColor="Gray" Font-Size="Medium" ForeColor="White" HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                            <TitlePanel BackColor="#666666" ForeColor="#FFFFCC">
                            </TitlePanel>
                        </Styles>

                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerOrcamentoConnectionString %>"  SelectCommand="SELECT * FROM [tblOri_Venda_Grupo] WHERE (([Ano] = @Ano) AND ([Mes] = @Mes) AND ([idFilial] = @idFilial) AND ([idSecao] = @idSecao)) ORDER BY [idProdutoGrupo]" 
                                                                                                                                          UpdateCommand="UPDATE [tblOri_Venda_Grupo] SET [idDepto] = @idDepto, [idSecao] = @idSecao, [idGrupo] = @idGrupo, [nomeGrupo] = @nomeGrupo, [vlrHistAA1] = @vlrHistAA1, [vlrHistAA2] = @vlrHistAA2, [vlrHistAA3] = @vlrHistAA3, [vlrHistAA4] = @vlrHistAA4, [vlrHistAA5] = @vlrHistAA5, [percPartAA1] = @percPartAA1, [percPartAA2] = @percPartAA2, [percPartAA3] = @percPartAA3, [percPartAA4] = @percPartAA4, [vlrMeta] = @vlrMeta, [percPart] = @percPart, [percCrescAA1] = @percCrescAA1, [percCrescAA2] = @percCrescAA2, [percCrescAA3] = @percCrescAA3, [vlrHistM1] = @vlrHistM1, [vlrHistM2] = @vlrHistM2, [vlrHistM3] = @vlrHistM3, [vlrHistM4] = @vlrHistM4, [vlrHistM5] = @vlrHistM5, [percPartM1] = @percPartM1, [percPartM2] = @percPartM2, [percPartM3] = @percPartM3, [percPartM4] = @percPartM4, [percPartM5] = @percPartM5 WHERE [Ano] = @Ano AND [Mes] = @Mes AND [idFilial] = @idFilial AND [idProdutoGrupo] = @idProdutoGrupo">
                       <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="idDepto" Type="Byte" />
                            <asp:Parameter Name="idSecao" Type="Byte" />
                            <asp:Parameter Name="idGrupo" Type="Int16" />
                            <asp:Parameter Name="nomeGrupo" Type="String" />
                            <asp:Parameter Name="vlrHistAA1" Type="Decimal" />
                            <asp:Parameter Name="vlrHistAA2" Type="Decimal" />
                            <asp:Parameter Name="vlrHistAA3" Type="Decimal" />
                            <asp:Parameter Name="vlrHistAA4" Type="Decimal" />
                            <asp:Parameter Name="vlrHistAA5" Type="Decimal" />
                            <asp:Parameter Name="percPartAA1" Type="Decimal" />
                            <asp:Parameter Name="percPartAA2" Type="Decimal" />
                            <asp:Parameter Name="percPartAA3" Type="Decimal" />
                            <asp:Parameter Name="percPartAA4" Type="Decimal" />
                            <asp:Parameter Name="vlrMeta" Type="Decimal" />
                            <asp:Parameter Name="percPart" Type="Decimal" />
                            <asp:Parameter Name="percCrescAA1" Type="Decimal" />
                            <asp:Parameter Name="percCrescAA2" Type="Decimal" />
                            <asp:Parameter Name="percCrescAA3" Type="Decimal" />
                            <asp:Parameter Name="vlrHistM1" Type="Decimal" />
                            <asp:Parameter Name="vlrHistM2" Type="Decimal" />
                            <asp:Parameter Name="vlrHistM3" Type="Decimal" />
                            <asp:Parameter Name="vlrHistM4" Type="Decimal" />
                            <asp:Parameter Name="vlrHistM5" Type="Decimal" />
                            <asp:Parameter Name="percPartM1" Type="Decimal" />
                            <asp:Parameter Name="percPartM2" Type="Decimal" />
                            <asp:Parameter Name="percPartM3" Type="Decimal" />
                            <asp:Parameter Name="percPartM4" Type="Decimal" />
                            <asp:Parameter Name="percPartM5" Type="Decimal" />
                            <asp:Parameter Name="Ano" Type="Int16" />
                            <asp:Parameter Name="Mes" Type="Byte" />
                            <asp:Parameter Name="idFilial" Type="Int16" />
                            <asp:Parameter Name="idProdutoGrupo" Type="Int16" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


</asp:Content>


