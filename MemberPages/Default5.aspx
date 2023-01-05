<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Default5.aspx.vb" Inherits="MemberPages_Default5" %>


<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

   

    <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" AllowUserInput="False" AutoPostBack="True" EditFormat="Custom" EditFormatString="MMMM" PickerDisplayMode="Auto" PickerType="Months" PopupHorizontalAlign="Center" Theme="Mulberry" >
        <CalendarProperties EnableLargePeriodNavigation="False" EnablePeriodNavigation="False" ShowClearButton="False" ShowHeader="False" TodayButtonText="Mês Atual" >
        </CalendarProperties>
        <ClearButton DisplayMode="Never">
        </ClearButton>
    </dx:ASPxDateEdit>

    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

    <uc1:wuciListaMes runat="server" ID="wuciListaMes" />

    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="idMes">
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <SettingsEditing Mode="Batch">
            <BatchEditSettings HighlightDeletedRows="False" StartEditAction="Click" KeepChangesOnCallbacks="False" />
        </SettingsEditing>
        <Settings ShowFooter="True" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="descTri" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="idMes" VisibleIndex="1" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="descMes" VisibleIndex="2">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="vlrTri" VisibleIndex="3">
                <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:n2}" EncodeHtml="False">
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTri" SummaryType="Sum" />
        </TotalSummary>
</dx:ASPxGridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" SelectCommand="Posto.usp_Atualiza_Meta_Replanejamento_Posto" 
    InsertCommand="INSERT INTO [gerMetas].[Filial].[tblRev_Posto] ([Ano]  ,[Mes]  ,[idFilial]  ,[idCod]  ,[vlr])
SELECT @Ano, @Mes, @idFilial, @idCod, @vlrMeta 
WHERE Ano=@Ano AND Mes=@Mes AND idFilial=@idFilial
" SelectCommandType="StoredProcedure">
    <InsertParameters>
        <asp:Parameter Name="Ano" />
        <asp:Parameter Name="Mes" />
        <asp:Parameter Name="idFilial" />
        <asp:Parameter Name="idCod" />
        <asp:Parameter Name="vlrMeta" />
    </InsertParameters>
    <SelectParameters>
        <asp:FormParameter FormField="Ano" Name="Ano" Type="Int16" />
        <asp:FormParameter FormField="Mes" Name="Mes" Type="Byte" />
        <asp:FormParameter FormField="idFilial" Name="idFilial" Type="Int16" />
    </SelectParameters>
</asp:SqlDataSource>

</asp:Content>

