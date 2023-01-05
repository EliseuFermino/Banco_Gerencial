    <%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Posto_CadMeta.aspx.vb" Inherits="MemberPages_Posto_Posto_CadMeta" %>


<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Src="~/Controles/wucLista_Filial_Postos.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Postos" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <link href="../../css/Banco_Gerencial/cboAno_Clear.css" rel="stylesheet" />
    <link href="../../css/Banco_Gerencial/cboMes.css" rel="stylesheet" />
    <link href="../../css/Banco_Gerencial/cboFilial.css" rel="stylesheet" />
  
    <style type ="text/css" >

        #divAtualizar {
            float: left;
            margin-left: 5px;
            padding: 5px;
        }

        .divDados {
            clear: both;  
            float: left; 
            margin-top: 5px;
            width: 100%;           
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div>
        <uc1:wucAno runat="server" ID="cboAno" AutoPostBack="false"  />
    </div>

    <div id="divMes" >
       <dx:ASPxDateEdit ID="cboMes" runat="server" AllowUserInput="False" AutoPostBack="False" EditFormat="Custom" EditFormatString="MMMM" PickerDisplayMode="Auto" PickerType="Months" PopupHorizontalAlign="Center" Theme="Mulberry" Caption="Mês" >
        <CalendarProperties EnableLargePeriodNavigation="False" EnablePeriodNavigation="False" ShowClearButton="False" ShowHeader="False" TodayButtonText="Mês Atual" >
        </CalendarProperties>
        <ClearButton DisplayMode="Never">
        </ClearButton>
    </dx:ASPxDateEdit>
        
    </div>

    <div>
        <uc1:wucLista_Filial_Postos runat="server" ID="cboFilial" AutoPostBack="false" Caption="Postos: "  />
    </div>

    <div id="divAtualizar" class="BGC_myBorder">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue" Height="22px">
            <ClientSideEvents Click="function(s, e) {	
                cbPanelGrid.PerformCallback();
                cbPanelConv.PerformCallback();
                cbPanelOleo.PerformCallback();
                cbPanelLavagem.PerformCallback();
                }" />
        </dx:ASPxButton>
    </div>


         <dx:ASPxPageControl ID="TabControl" runat="server" Width="100%" ActiveTabIndex="0" EnableHierarchyRecreation="True" Theme="SoftOrange" >
        <TabPages>

            <dx:TabPage Text="Combustivel">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">


    <div id="divDados" class="divDados">

            <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="100%" ClientInstanceName="cbPanelGrid" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
<SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttributes="both">

        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsMeta_Posto" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="idCod" Theme="MaterialCompact">
          
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <SettingsEditing Mode="Batch">
                <BatchEditSettings StartEditAction="Click" />
            </SettingsEditing>
            <Settings ShowFooter="True" />
            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
            <SettingsText CommandBatchEditCancel="Cancelar" CommandBatchEditPreviewChanges="Atualizações" CommandBatchEditUpdate="Salvar" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="idCod" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Codigo">
                    <Settings ShowEditorInBatchEditMode="False" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descCod" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Descrição">
                    <Settings ShowEditorInBatchEditMode="False" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ano" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="H I S T Ó R I C O   E M   V O L U M E S" ShowInCustomizationForm="True" VisibleIndex="2">
                    <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_AA" ShowInCustomizationForm="True" VisibleIndex="3" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_M3" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_M2" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_M1" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="% Crescimento" ShowInCustomizationForm="True" VisibleIndex="7">
                    <HeaderStyle HorizontalAlign="Center" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="percCresc_Meta" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento sobre o Ano Anterior..." UnboundType="Decimal" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Mês Anterior" FieldName="percCresc_Meta_MA" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento sobre o Mês Anterior..." UnboundType="Decimal" VisibleIndex="1" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="M E T A S" ShowInCustomizationForm="True" VisibleIndex="3">
                    <HeaderStyle BackColor="#336600" ForeColor="White" HorizontalAlign="Center" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="vlrMeta" ShowInCustomizationForm="True" ToolTip="Meta em Volume" VisibleIndex="0" Width="90px">
                            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#009900" ForeColor="White" HorizontalAlign="Center" />
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Preço" FieldName="precoMedio" ShowInCustomizationForm="True" ToolTip="Preço Médio do Combustivel" VisibleIndex="1">
                            <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#009900" ForeColor="White" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrMetaComb" ShowInCustomizationForm="True" ToolTip="Meta em Valor (Reais)" VisibleIndex="2">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <HeaderStyle BackColor="#009900" ForeColor="White" />
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_AA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_M3" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_M2" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_M1" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaComb" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Meta" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Meta_MA" SummaryType="Custom" />
            </TotalSummary>
            <Styles>
                <Header BackColor="#CCCCCC">
                </Header>
                <AlternatingRow BackColor="#EAEAEA">
                </AlternatingRow>
                <Footer Font-Bold="True">
                </Footer>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsMeta_Posto" runat="server" ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" 
            SelectCommand="SELECT [Ano], [Mes], [idFilial], [idCod], [descCod], [vlrReal_AA], [vlrReal_M3],[vlrReal_M2], [vlrReal_M1], [vlrMeta], [precoMedio], vlrMetaComb FROM [tblRev_Posto_UP] WHERE (([Ano] = @Ano) AND ([Mes] = @Mes) AND ([idFilial] = @idFilial)) ORDER BY [fieldOrder]" 
            InsertCommand="INSERT INTO [tblRev_Posto_UP] ([Ano], [Mes], [idFilial], [idCod], [descCod], [vlrReal_AA], [vlrReal_M2], [vlrReal_M1], [vlrMeta], [precoMedio]) VALUES (@Ano, @Mes, @idFilial, @idCod, @descCod, @vlrReal_AA, @vlrReal_M2, @vlrReal_M1, @vlrMeta, @precoMedio)" 
            UpdateCommand="UPDATE [tblRev_Posto_UP] SET [vlrMeta] = @vlrMeta, [precoMedio] = @precoMedio WHERE [Ano] = @Ano AND [Mes] = @Mes AND [idFilial] = @idFilial AND [idCod] = @idCod" 
            DeleteCommand="DELETE FROM [tblRev_Posto_UP] WHERE [Ano] = @Ano AND [Mes] = @Mes AND [idFilial] = @idFilial AND [idCod] = @idCod">
            <DeleteParameters>
                <asp:Parameter Name="Ano" Type="Int16" />
                <asp:Parameter Name="Mes" Type="Byte" />
                <asp:Parameter Name="idFilial" Type="Int16" />
                <asp:Parameter Name="idCod" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ano" Type="Int16" />
                <asp:Parameter Name="Mes" Type="Byte" />
                <asp:Parameter Name="idFilial" Type="Int16" />
                <asp:Parameter Name="idCod" Type="Int64" />
                <asp:Parameter Name="descCod" Type="String" />
                <asp:Parameter Name="vlrReal_AA" Type="Decimal" />
                <asp:Parameter Name="vlrReal_M2" Type="Decimal" />
                <asp:Parameter Name="vlrReal_M1" Type="Decimal" />
                <asp:Parameter Name="vlrMeta" Type="Decimal" />
                <asp:Parameter Name="precoMedio" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="precoMedio" Type="Decimal" />
                <asp:Parameter Name="vlrMeta" Type="Decimal" />
                <asp:Parameter Name="Ano" Type="Int16" />
                <asp:Parameter Name="Mes" Type="Byte" />
                <asp:Parameter Name="idFilial" Type="Int16" />
                <asp:Parameter Name="idCod" Type="Int64" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
                         <asp:Label ID="lblInfo" runat="server" Text=""></asp:Label>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

     </div>

                          </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>

            <dx:TabPage Text="Conveniência">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl5" runat="server">

    <div id="divConveniencia" class="divDados">

            <dx:ASPxCallbackPanel ID="cbPanelConv" runat="server" Width="100%" ClientInstanceName="cbPanelConv" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
<SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttributes="both">

        <dx:ASPxGridView ID="GridConv" runat="server" DataSourceID="dsMeta_Posto_Conv" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Mes" Theme="MaterialCompact">
          
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <SettingsEditing Mode="Batch">
                <BatchEditSettings StartEditAction="Click" />
            </SettingsEditing>
            <Settings ShowFooter="True" />
            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
            <SettingsText CommandBatchEditCancel="Cancelar" CommandBatchEditPreviewChanges="Atualizações" CommandBatchEditUpdate="Salvar" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Mes" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Codigo">
                    <Settings ShowEditorInBatchEditMode="False" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descCod" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Descrição">
                    <Settings ShowEditorInBatchEditMode="False" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ano" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="H I S T Ó R I C O   E M   R E A I S" ShowInCustomizationForm="True" VisibleIndex="2">
                    <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_AA" ShowInCustomizationForm="True" VisibleIndex="3" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_M3" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_M2" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_M1" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="% Crescimento" ShowInCustomizationForm="True" VisibleIndex="7">
                    <HeaderStyle HorizontalAlign="Center" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="percCresc_Meta" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento sobre o Ano Anterior..." UnboundType="Decimal" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Mês Anterior" FieldName="percCresc_Meta_MA" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento sobre o Mês Anterior..." UnboundType="Decimal" VisibleIndex="1" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="M E T A S" ShowInCustomizationForm="True" VisibleIndex="3">
                    <HeaderStyle BackColor="#336600" ForeColor="White" HorizontalAlign="Center" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrMeta" ShowInCustomizationForm="True" ToolTip="Meta em Reais" VisibleIndex="0" Width="90px">
                            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#009900" ForeColor="White" HorizontalAlign="Center" />
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                                             
                    </Columns>
                </dx:GridViewBandColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_AA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_M3" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_M2" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_M1" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />             
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Meta" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Meta_MA" SummaryType="Custom" />
            </TotalSummary>
            <Styles>
                <Header BackColor="#CCCCCC">
                </Header>
                <AlternatingRow BackColor="#EAEAEA">
                </AlternatingRow>
                <Footer Font-Bold="True">
                </Footer>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsMeta_Posto_Conv" runat="server" ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" 
            SelectCommand="SELECT [Ano], [Mes], [idFilial], [descCod], [vlrReal_AA], [vlrReal_M3],[vlrReal_M2], [vlrReal_M1], [vlrMeta] FROM [tblRev_Posto_UP_Conv] WHERE (([Ano] = @Ano) AND ([idFilial] = @idFilial)) ORDER BY [Mes]" 
            InsertCommand="INSERT INTO [tblRev_Posto_UP_Conv] ([Ano], [Mes], [idFilial], [descCod], [vlrReal_AA], [vlrReal_M2], [vlrReal_M1], [vlrMeta]) VALUES (@Ano, @Mes, @idFilial,  @descCod, @vlrReal_AA, @vlrReal_M2, @vlrReal_M1, @vlrMeta)" 
            UpdateCommand="UPDATE [tblRev_Posto_UP_Conv] SET [vlrMeta] = @vlrMeta WHERE [Ano] = @Ano AND [Mes] = @Mes AND [idFilial] = @idFilial " 
            DeleteCommand="DELETE FROM [tblRev_Posto_UP_Conv] WHERE [Ano] = @Ano AND [idFilial] = @idFilial ">
            <DeleteParameters>
                <asp:Parameter Name="Ano" Type="Int16" />
                <asp:Parameter Name="Mes" Type="Byte" />
                <asp:Parameter Name="idFilial" Type="Int16" />                
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ano" Type="Int16" />
                <asp:Parameter Name="Mes" Type="Byte" />
                <asp:Parameter Name="idFilial" Type="Int16" />                
                <asp:Parameter Name="descCod" Type="String" />
                <asp:Parameter Name="vlrReal_AA" Type="Decimal" />
                <asp:Parameter Name="vlrReal_M2" Type="Decimal" />
                <asp:Parameter Name="vlrReal_M1" Type="Decimal" />
                <asp:Parameter Name="vlrMeta" Type="Decimal" />               
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
            </SelectParameters>
            <UpdateParameters>                
                <asp:Parameter Name="vlrMeta" Type="Decimal" />
                <asp:Parameter Name="Ano" Type="Int16" />
                <asp:Parameter Name="Mes" Type="Byte" />
                <asp:Parameter Name="idFilial" Type="Int16" />             
            </UpdateParameters>
        </asp:SqlDataSource>
    
                         <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

     </div>

 </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>

            <dx:TabPage Text="Troca de Óleo">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server">

    <div id="divOleo" class="divDados">

            <dx:ASPxCallbackPanel ID="cbPanelOleo" runat="server" Width="100%" ClientInstanceName="cbPanelOleo" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
<SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent3" runat="server" SupportsDisabledAttributes="both">

        <dx:ASPxGridView ID="gridOleo" runat="server" DataSourceID="dsMeta_Posto_Oleo" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Mes" Theme="MaterialCompact">
          
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <SettingsEditing Mode="Batch">
                <BatchEditSettings StartEditAction="Click" />
            </SettingsEditing>
            <Settings ShowFooter="True" />
            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
            <SettingsText CommandBatchEditCancel="Cancelar" CommandBatchEditPreviewChanges="Atualizações" CommandBatchEditUpdate="Salvar" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Mes" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Codigo">
                    <Settings ShowEditorInBatchEditMode="False" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descCod" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Descrição">
                    <Settings ShowEditorInBatchEditMode="False" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ano" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="H I S T Ó R I C O   E M   R E A I S" ShowInCustomizationForm="True" VisibleIndex="2">
                    <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_AA" ShowInCustomizationForm="True" VisibleIndex="3" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_M3" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_M2" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_M1" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="% Crescimento" ShowInCustomizationForm="True" VisibleIndex="7">
                    <HeaderStyle HorizontalAlign="Center" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="percCresc_Meta" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento sobre o Ano Anterior..." UnboundType="Decimal" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Mês Anterior" FieldName="percCresc_Meta_MA" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento sobre o Mês Anterior..." UnboundType="Decimal" VisibleIndex="1" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="M E T A S" ShowInCustomizationForm="True" VisibleIndex="3">
                    <HeaderStyle BackColor="#336600" ForeColor="White" HorizontalAlign="Center" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrMeta" ShowInCustomizationForm="True" ToolTip="Meta em Reais" VisibleIndex="0" Width="90px">
                            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#009900" ForeColor="White" HorizontalAlign="Center" />
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                                             
                    </Columns>
                </dx:GridViewBandColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_AA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_M3" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_M2" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_M1" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />             
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Meta" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Meta_MA" SummaryType="Custom" />
            </TotalSummary>
            <Styles>
                <Header BackColor="#CCCCCC">
                </Header>
                <AlternatingRow BackColor="#EAEAEA">
                </AlternatingRow>
                <Footer Font-Bold="True">
                </Footer>
            </Styles>
        </dx:ASPxGridView>

        <asp:SqlDataSource ID="dsMeta_Posto_Oleo" runat="server" ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" 
            SelectCommand="SELECT [Ano], [Mes], [idFilial], [descCod], [vlrReal_AA], [vlrReal_M3],[vlrReal_M2], [vlrReal_M1], [vlrMeta] FROM [tblRev_Posto_UP_Oleo] WHERE (([Ano] = @Ano) AND ([idFilial] = @idFilial)) ORDER BY [Mes]" 
            InsertCommand="INSERT INTO [tblRev_Posto_UP_Oleo] ([Ano], [Mes], [idFilial], [descCod], [vlrReal_AA], [vlrReal_M2], [vlrReal_M1], [vlrMeta]) VALUES (@Ano, @Mes, @idFilial,  @descCod, @vlrReal_AA, @vlrReal_M2, @vlrReal_M1, @vlrMeta)" 
            UpdateCommand="UPDATE [tblRev_Posto_UP_Oleo] SET [vlrMeta] = @vlrMeta WHERE [Ano] = @Ano AND [Mes] = @Mes AND [idFilial] = @idFilial " 
            DeleteCommand="DELETE FROM [tblRev_Posto_UP_Oleo] WHERE [Ano] = @Ano AND [idFilial] = @idFilial ">
            <DeleteParameters>
                <asp:Parameter Name="Ano" Type="Int16" />
                <asp:Parameter Name="Mes" Type="Byte" />
                <asp:Parameter Name="idFilial" Type="Int16" />                
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ano" Type="Int16" />
                <asp:Parameter Name="Mes" Type="Byte" />
                <asp:Parameter Name="idFilial" Type="Int16" />                
                <asp:Parameter Name="descCod" Type="String" />
                <asp:Parameter Name="vlrReal_AA" Type="Decimal" />
                <asp:Parameter Name="vlrReal_M2" Type="Decimal" />
                <asp:Parameter Name="vlrReal_M1" Type="Decimal" />
                <asp:Parameter Name="vlrMeta" Type="Decimal" />               
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
            </SelectParameters>
            <UpdateParameters>                
                <asp:Parameter Name="vlrMeta" Type="Decimal" />
                <asp:Parameter Name="Ano" Type="Int16" />
                <asp:Parameter Name="Mes" Type="Byte" />
                <asp:Parameter Name="idFilial" Type="Int16" />             
            </UpdateParameters>
        </asp:SqlDataSource>
    
                         <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

     </div>

 </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>

            <dx:TabPage Text="Lavagem">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl3" runat="server">

    <div id="div1" class="divDados">

            <dx:ASPxCallbackPanel ID="cbPanelLavagem" runat="server" Width="100%" ClientInstanceName="cbPanelLavagem" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
<SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent4" runat="server" SupportsDisabledAttributes="both">

        <dx:ASPxGridView ID="gridLavagem" runat="server" DataSourceID="dsMeta_Posto_Lavagem" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Mes" Theme="MaterialCompact">
          
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <SettingsEditing Mode="Batch">
                <BatchEditSettings StartEditAction="Click" />
            </SettingsEditing>
            <Settings ShowFooter="True" />
            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
            <SettingsText CommandBatchEditCancel="Cancelar" CommandBatchEditPreviewChanges="Atualizações" CommandBatchEditUpdate="Salvar" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Mes" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Codigo">
                    <Settings ShowEditorInBatchEditMode="False" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="descCod" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Descrição">
                    <Settings ShowEditorInBatchEditMode="False" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ano" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="H I S T Ó R I C O   E M   R E A I S" ShowInCustomizationForm="True" VisibleIndex="2">
                    <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_AA" ShowInCustomizationForm="True" VisibleIndex="3" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_M3" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_M2" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="vlrReal_M1" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <HeaderStyle BackColor="#0066CC" ForeColor="White" />
                            <CellStyle ForeColor="Blue">
                            </CellStyle>
                            <FooterCellStyle ForeColor="Blue">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="% Crescimento" ShowInCustomizationForm="True" VisibleIndex="7">
                    <HeaderStyle HorizontalAlign="Center" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="percCresc_Meta" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento sobre o Ano Anterior..." UnboundType="Decimal" VisibleIndex="0" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <EditFormSettings Visible="False" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Mês Anterior" FieldName="percCresc_Meta_MA" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento sobre o Mês Anterior..." UnboundType="Decimal" VisibleIndex="1" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings ShowEditorInBatchEditMode="False" />
                            <FooterCellStyle ForeColor="Black">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="M E T A S" ShowInCustomizationForm="True" VisibleIndex="3">
                    <HeaderStyle BackColor="#336600" ForeColor="White" HorizontalAlign="Center" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrMeta" ShowInCustomizationForm="True" ToolTip="Meta em Reais" VisibleIndex="0" Width="90px">
                            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#009900" ForeColor="White" HorizontalAlign="Center" />
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                            <FooterCellStyle ForeColor="#009900">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                                             
                    </Columns>
                </dx:GridViewBandColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_AA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_M3" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_M2" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal_M1" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />             
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Meta" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Meta_MA" SummaryType="Custom" />
            </TotalSummary>
            <Styles>
                <Header BackColor="#CCCCCC">
                </Header>
                <AlternatingRow BackColor="#EAEAEA">
                </AlternatingRow>
                <Footer Font-Bold="True">
                </Footer>
            </Styles>
        </dx:ASPxGridView>

        <asp:SqlDataSource ID="dsMeta_Posto_Lavagem" runat="server" ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" 
            SelectCommand="SELECT [Ano], [Mes], [idFilial], [descCod], [vlrReal_AA], [vlrReal_M3],[vlrReal_M2], [vlrReal_M1], [vlrMeta] FROM [tblRev_Posto_UP_Lavagem] WHERE (([Ano] = @Ano) AND ([idFilial] = @idFilial)) ORDER BY [Mes]" 
            InsertCommand="INSERT INTO [tblRev_Posto_UP_Lavagem] ([Ano], [Mes], [idFilial], [descCod], [vlrReal_AA], [vlrReal_M2], [vlrReal_M1], [vlrMeta]) VALUES (@Ano, @Mes, @idFilial,  @descCod, @vlrReal_AA, @vlrReal_M2, @vlrReal_M1, @vlrMeta)" 
            UpdateCommand="UPDATE [tblRev_Posto_UP_Lavagem] SET [vlrMeta] = @vlrMeta WHERE [Ano] = @Ano AND [Mes] = @Mes AND [idFilial] = @idFilial " 
            DeleteCommand="DELETE FROM [tblRev_Posto_UP_Lavagem] WHERE [Ano] = @Ano AND [idFilial] = @idFilial ">
            <DeleteParameters>
                <asp:Parameter Name="Ano" Type="Int16" />
                <asp:Parameter Name="Mes" Type="Byte" />
                <asp:Parameter Name="idFilial" Type="Int16" />                
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ano" Type="Int16" />
                <asp:Parameter Name="Mes" Type="Byte" />
                <asp:Parameter Name="idFilial" Type="Int16" />                
                <asp:Parameter Name="descCod" Type="String" />
                <asp:Parameter Name="vlrReal_AA" Type="Decimal" />
                <asp:Parameter Name="vlrReal_M2" Type="Decimal" />
                <asp:Parameter Name="vlrReal_M1" Type="Decimal" />
                <asp:Parameter Name="vlrMeta" Type="Decimal" />               
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
            </SelectParameters>
            <UpdateParameters>                
                <asp:Parameter Name="vlrMeta" Type="Decimal" />
                <asp:Parameter Name="Ano" Type="Int16" />
                <asp:Parameter Name="Mes" Type="Byte" />
                <asp:Parameter Name="idFilial" Type="Int16" />             
            </UpdateParameters>
        </asp:SqlDataSource>
    
                         <asp:Label ID="Label3" runat="server" Text=""></asp:Label>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

     </div>

 </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>




        </TabPages>
    </dx:ASPxPageControl>
   
    <br />


    </asp:Content>

