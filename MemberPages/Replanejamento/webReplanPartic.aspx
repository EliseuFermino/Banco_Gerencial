<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteMetas.master" AutoEventWireup="false" CodeFile="webReplanPartic.aspx.vb" Inherits="MemberPages_Replanejamento_webReplanPartic" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

     <meta charset="utf-8" />

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

    <script type="text/javascript">
        function OnBatchEditEndEditing(s, e) {
            CalculateSummary(s, e.rowValues, e.visibleIndex, false);
        }
        var savedValue;
        function OnEndCallback(s, e) {
            if (!savedValue) return;
            labelSum.SetValue(savedValue);
        }
        function CalculateSummary(grid, rowValues, visibleIndex, isDeleting) {
            var originalValue = grid.batchEditApi.GetCellValue(visibleIndex, "C2");
            var newValue = rowValues[(grid.GetColumnByField("C2").index)].value;
            var dif = isDeleting ? -newValue : newValue - originalValue;
            var sum = (parseFloat(labelSum.GetValue()) + dif).toFixed(1);
            savedValue = sum;
            labelSum.SetValue(sum);
        }
        function OnBatchEditRowDeleting(s, e) {
            CalculateSummary(s, e.rowValues, e.visibleIndex, true);
        }
        function OnChangesCanceling(s, e) {
            if (s.batchEditApi.HasChanges())
                setTimeout(function () {
                    savedValue = null;
                    s.Refresh();
                }, 0);
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes" >
       <dx:ASPxDateEdit ID="cboMes" runat="server" AllowUserInput="False" AutoPostBack="False" EditFormat="Custom" EditFormatString="MMMM" PickerDisplayMode="Auto" PickerType="Months" PopupHorizontalAlign="Center" Theme="Mulberry" Caption="Mês" Date="2020-07-01" MaxDate="2020-07-31" MinDate="2020-07-01" >
        <CalendarProperties EnableLargePeriodNavigation="False" EnablePeriodNavigation="False" ShowClearButton="False" ShowHeader="False" TodayButtonText="Mês Atual" ShowTodayButton="False" >
        </CalendarProperties>
        <ClearButton DisplayMode="Never">
        </ClearButton>
    </dx:ASPxDateEdit>
        
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>
    
    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>



    <div id="divDados">

       <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
            <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttributes="both">

                        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="idProdutoSecao" Width="100%" ClientInstanceName="grid">
                            <ClientSideEvents BatchEditChangesSaving="function(s, e) {

}" BatchEditConfirmShowing="function(s, e) {
}" BatchEditEndEditing="function(s, e) {
}" EndCallback="function(s, e) {
	grid_Departamento.Refresh();	
}" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <SettingsEditing Mode="Batch">
                                <BatchEditSettings StartEditAction="Click" />
                            </SettingsEditing>
                            <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="400" />
                            <SettingsResizing ColumnResizeMode="Control" />
                            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                            <SettingsText CommandBatchEditCancel="Cancelar" CommandBatchEditPreviewChanges="Alterações" CommandBatchEditUpdate="Salvar" />
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Ano" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Mes" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="idProdutoSecao" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="nomeSecao" ShowInCustomizationForm="True" VisibleIndex="4" FixedStyle="Left" Caption="Seção" Width="150px">
                                    <Settings ShowEditorInBatchEditMode="False" />
                                    <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Metas" ShowInCustomizationForm="True" VisibleIndex="5">
                                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="vlrMeta" ShowInCustomizationForm="True" VisibleIndex="0" Caption="R$ Meta">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                <MaskSettings IncludeLiterals="DecimalSymbol" ShowHints="True" />
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#009900" ForeColor="White" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percPart" ShowInCustomizationForm="True" VisibleIndex="1" Caption="% Part" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#33CC33" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Histórico - Vendas" ShowInCustomizationForm="True" VisibleIndex="6" Name="band_Crescimento">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="vlrHistM1" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#99CCFF" />
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
                                        <dx:GridViewDataTextColumn FieldName="vlrHistM4" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="vlrHistAA" ShowInCustomizationForm="True" VisibleIndex="4">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#0033CC" ForeColor="White" />
                                            <CellStyle ForeColor="#0033CC">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#0033CC">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Histórico - % Participação" ShowInCustomizationForm="True" VisibleIndex="7">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="percPartM1" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#99CCFF" />
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
                                        <dx:GridViewDataTextColumn FieldName="percPartAA" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#0033CC" ForeColor="White" />
                                            <CellStyle ForeColor="#0033CC">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#0033CC">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Histórico - % Crescimento" ShowInCustomizationForm="True" VisibleIndex="15" Name="band_Crescimento">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="percCrescM1" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#99CCFF" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percCrescM2" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percCrescM3" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percCrescAA" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#0033CC" ForeColor="White" />
                                            <CellStyle ForeColor="#0033CC">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#0033CC">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                            </Columns>
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistM1" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistM2" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistM3" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistM4" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistAA" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartM1" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartM2" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartM3" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescM3" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescM2" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescM1" SummaryType="Custom" />

                                
                                
                            </TotalSummary>
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#EFEFEF">
                                </AlternatingRow>
                                <Footer Font-Bold="True">
                                </Footer>
                            </Styles>
                        </dx:ASPxGridView>
 
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" DeleteCommand="DELETE FROM [tblReplanejamento_Vendas] WHERE [Ano] = @Ano AND [Mes] = @Mes AND [idFilial] = @idFilial AND [idProdutoSecao] = @idProdutoSecao" InsertCommand="INSERT INTO [tblReplanejamento_Vendas] ([Ano], [Mes], [idFilial], [idProdutoSecao], [nomeSecao], [vlrHistAA], [percPartAA], [vlrHistM3], [percPartM3], [vlrHistM2], [percPartM2], [vlrHistM1], [percPartM1], [vlrMeta], [percPart], [percCrescM1], [percCrescM2], [percCrescM3], [vlrHistM4], [percCrescAA]) VALUES (@Ano, @Mes, @idFilial, @idProdutoSecao, @nomeSecao, @vlrHistAA, @percPartAA, @vlrHistM3, @percPartM3, @vlrHistM2, @percPartM2, @vlrHistM1, @percPartM1, @vlrMeta, @percPart, @percCrescM1, @percCrescM2, @percCrescM3, @vlrHistM4, @percCrescAA)" SelectCommand="SELECT [Ano], [Mes], [idFilial], [idProdutoSecao], [nomeSecao], [vlrHistAA], [percPartAA], [vlrHistM3], [percPartM3], [vlrHistM2], [percPartM2], [vlrHistM1], [percPartM1], [vlrMeta], [percPart], [percCrescM1], [percCrescM2], [percCrescM3], [vlrHistM4], [percCrescAA] FROM [tblReplanejamento_Vendas] WHERE (([Ano] = @Ano) AND ([Mes] = @Mes) AND ([idFilial] = @idFilial)) ORDER BY [idProdutoSecao]" UpdateCommand="UPDATE [tblReplanejamento_Vendas] SET [nomeSecao] = @nomeSecao, [vlrHistAA] = @vlrHistAA, [percPartAA] = @percPartAA, [vlrHistM3] = @vlrHistM3, [percPartM3] = @percPartM3, [vlrHistM2] = @vlrHistM2, [percPartM2] = @percPartM2, [vlrHistM1] = @vlrHistM1, [percPartM1] = @percPartM1, [vlrMeta] = @vlrMeta, [percPart] = @percPart, [percCrescM1] = @percCrescM1, [percCrescM2] = @percCrescM2, [percCrescM3] = @percCrescM3, [vlrHistM4] = @vlrHistM4, [percCrescAA] = @percCrescAA WHERE [Ano] = @Ano AND [Mes] = @Mes AND [idFilial] = @idFilial AND [idProdutoSecao] = @idProdutoSecao">
                            <DeleteParameters>
                                <asp:Parameter Name="Ano" Type="Int16" />
                                <asp:Parameter Name="Mes" Type="Byte" />
                                <asp:Parameter Name="idFilial" Type="Int16" />
                                <asp:Parameter Name="idProdutoSecao" Type="Int16" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Ano" Type="Int16" />
                                <asp:Parameter Name="Mes" Type="Byte" />
                                <asp:Parameter Name="idFilial" Type="Int16" />
                                <asp:Parameter Name="idProdutoSecao" Type="Int16" />
                                <asp:Parameter Name="nomeSecao" Type="String" />
                                <asp:Parameter Name="vlrHistAA" Type="Decimal" />
                                <asp:Parameter Name="percPartAA" Type="Decimal" />
                                <asp:Parameter Name="vlrHistM3" Type="Decimal" />
                                <asp:Parameter Name="percPartM3" Type="Decimal" />
                                <asp:Parameter Name="vlrHistM2" Type="Decimal" />
                                <asp:Parameter Name="percPartM2" Type="Decimal" />
                                <asp:Parameter Name="vlrHistM1" Type="Decimal" />
                                <asp:Parameter Name="percPartM1" Type="Decimal" />
                                <asp:Parameter Name="vlrMeta" Type="Decimal" />
                                <asp:Parameter Name="percPart" Type="Decimal" />
                                <asp:Parameter Name="percCrescM1" Type="Decimal" />
                                <asp:Parameter Name="percCrescM2" Type="Decimal" />
                                <asp:Parameter Name="percCrescM3" Type="Decimal" />
                                <asp:Parameter Name="vlrHistM4" Type="Decimal" />
                                <asp:Parameter Name="percCrescAA" Type="Decimal" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="nomeSecao" Type="String" />
                                <asp:Parameter Name="vlrHistAA" Type="Decimal" />
                                <asp:Parameter Name="percPartAA" Type="Decimal" />
                                <asp:Parameter Name="vlrHistM3" Type="Decimal" />
                                <asp:Parameter Name="percPartM3" Type="Decimal" />
                                <asp:Parameter Name="vlrHistM2" Type="Decimal" />
                                <asp:Parameter Name="percPartM2" Type="Decimal" />
                                <asp:Parameter Name="vlrHistM1" Type="Decimal" />
                                <asp:Parameter Name="percPartM1" Type="Decimal" />
                                <asp:Parameter Name="vlrMeta" Type="Decimal" />
                                <asp:Parameter Name="percPart" Type="Decimal" />
                                <asp:Parameter Name="percCrescM1" Type="Decimal" />
                                <asp:Parameter Name="percCrescM2" Type="Decimal" />
                                <asp:Parameter Name="percCrescM3" Type="Decimal" />
                                <asp:Parameter Name="vlrHistM4" Type="Decimal" />
                                <asp:Parameter Name="percCrescAA" Type="Decimal" />
                                <asp:Parameter Name="Ano" Type="Int16" />
                                <asp:Parameter Name="Mes" Type="Byte" />
                                <asp:Parameter Name="idFilial" Type="Int16" />
                                <asp:Parameter Name="idProdutoSecao" Type="Int16" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
 
        <br />

                        <dx:ASPxGridView ID="grid_Departamento" runat="server" AutoGenerateColumns="False" DataSourceID="dsDepartamento" KeyFieldName="idProdutoDepartamento" Width="100%" ClientInstanceName="grid_Departamento">
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <SettingsEditing Mode="PopupEditForm" UseFormLayout="False">
                                <BatchEditSettings StartEditAction="Click" />
                            </SettingsEditing>
                            <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="400" />
                            <SettingsResizing ColumnResizeMode="Control" />
                            <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />
                            <SettingsText CommandBatchEditCancel="Cancelar" CommandBatchEditPreviewChanges="Alterações" CommandBatchEditUpdate="Salvar" />
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Ano" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Mes" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="idProdutoSecao" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="nomeDepartamento" ShowInCustomizationForm="True" VisibleIndex="4" FixedStyle="Left" Caption="Departamento" Width="150px">
                                    <Settings ShowEditorInBatchEditMode="False" />
                                    <HeaderStyle BackColor="#996633" ForeColor="White" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Metas" ShowInCustomizationForm="True" VisibleIndex="5">
                                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="vlrMeta" ShowInCustomizationForm="True" VisibleIndex="0" Caption="R$ Meta">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#009900" ForeColor="White" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percPart" ShowInCustomizationForm="True" VisibleIndex="1" Caption="% Part" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#33CC33" ForeColor="White" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Histórico - Vendas" ShowInCustomizationForm="True" VisibleIndex="6" Name="band_Crescimento">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="vlrHistM1" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#99CCFF" />
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
                                        <dx:GridViewDataTextColumn FieldName="vlrHistM4" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="vlrHistAA" ShowInCustomizationForm="True" VisibleIndex="4">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#0033CC" ForeColor="White" />
                                            <CellStyle ForeColor="#0033CC">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#0033CC">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Histórico - % Participação" ShowInCustomizationForm="True" VisibleIndex="7">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="percPartM1" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#99CCFF" />
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
                                        <dx:GridViewDataTextColumn FieldName="percPartAA" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#0033CC" ForeColor="White" />
                                            <CellStyle ForeColor="#0033CC">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#0033CC">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Histórico - % Crescimento" ShowInCustomizationForm="True" VisibleIndex="15" Name="band_Crescimento">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="percCrescM1" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#99CCFF" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percCrescM2" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percCrescM3" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percCrescAA" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings ShowEditorInBatchEditMode="False" />
                                            <HeaderStyle BackColor="#0033CC" ForeColor="White" />
                                            <CellStyle ForeColor="#0033CC">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#0033CC">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                            </Columns>
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistM1" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistM2" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistM3" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistM4" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrHistAA" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartM1" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartM2" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartM3" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescM3" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescM2" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescM1" SummaryType="Custom" />

                                
                                
                            </TotalSummary>
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#EFEFEF">
                                </AlternatingRow>
                                <Footer Font-Bold="True">
                                </Footer>
                                <TitlePanel BackColor="Gray">
                                </TitlePanel>
                            </Styles>
                        </dx:ASPxGridView>


                        <asp:SqlDataSource ID="dsDepartamento" runat="server" ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" SelectCommand="Replanejamento_Participacao_New_Departamento" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>


        </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

    </div>

</asp:Content>

