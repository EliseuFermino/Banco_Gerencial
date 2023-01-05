<%@ Page Title="Agenda Condor" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="true" CodeFile="Calendario.aspx.vb" Inherits="MemberPages_Calendario" Culture="pt-BR" uiCulture="pt-BR" %>
<%@ Register assembly="DevExpress.Web.ASPxScheduler.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>
<%@ Register assembly="DevExpress.XtraScheduler.v18.2.Core, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="dxschsc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" 
        AppointmentDataSourceID="dsAppointment" ClientIDMode="AutoID" 
        ResourceDataSourceID="dsResource" Start="2012-08-31" Theme="DevEx" ActiveViewType="WorkWeek">
        <storage>
            <appointments>
                <mappings allday="AllDay" appointmentid="UniqueID" description="Description" 
                    end="EndDate" label="Label" location="Location" recurrenceinfo="RecurrenceInfo" 
                    reminderinfo="ReminderInfo" resourceid="ResourceID" start="StartDate" 
                    status="Status" subject="Subject" type="Type" />
                <labels>
                    <dxwschs:AppointmentLabel Color="Window" DisplayName="Nenhum" 
                        MenuCaption="&amp;Nenhum" />
                    <dxwschs:AppointmentLabel Color="255, 194, 190" DisplayName="Logística" 
                        MenuCaption="&amp;Logística" />
                    <dxwschs:AppointmentLabel Color="168, 213, 255" DisplayName="Gestão de Estoque" 
                        MenuCaption="&amp;Gestão de Estoque" />
                    <dxwschs:AppointmentLabel Color="193, 244, 156" DisplayName="Gestão Economico/Financeiro" 
                        MenuCaption="&amp;Gestão Economico/Financeiro" />
                    <dxwschs:AppointmentLabel Color="243, 228, 199" DisplayName="Pessoal" 
                        MenuCaption="&amp;Pessoal" />
                    <dxwschs:AppointmentLabel Color="244, 206, 147" DisplayName="Ger. Mix e Categoria" 
                        MenuCaption="&amp;Ger. Mix e Categoria" />
                    <dxwschs:AppointmentLabel Color="199, 244, 255" DisplayName="Manutenção e Limpeza" 
                        MenuCaption="&amp;Manutenção e Limpeza" />
                    <dxwschs:AppointmentLabel Color="207, 219, 152" DisplayName="CRM" 
                        MenuCaption="&amp;CRM Preparation" />
                    <dxwschs:AppointmentLabel Color="224, 207, 233" DisplayName="Ampliação e Adequação de Lojas" 
                        MenuCaption="&amp;Ampliação e Adequação de Lojas" />
                    <dxwschs:AppointmentLabel Color="141, 233, 223" DisplayName="Redesenhar Processos" 
                        MenuCaption="&amp;Redesenhar Processos" />
                    <dxwschs:AppointmentLabel Color="255, 247, 165" DisplayName="Condor" 
                        MenuCaption="&amp;Condor" />
                    <dxwschs:AppointmentLabel Color="255, 184, 180" DisplayName="Prevenção de Perdas" 
                        MenuCaption="&amp;Prevenção de Perdas" />
                </labels>
            </appointments>
            <resources>
                <mappings caption="ResourceName" color="Color" image="Image" 
                    resourceid="ResourceID" />
            </resources>
        </storage>
<Views>
<DayView DisplayName="Dia" MenuCaption="Visualizar por &amp;Dia" 
        ShortDisplayName="Dia">
    <VisibleTime End="19:00:00" Start="07:00:00" />
    <TimeSlots>
        <dxschsc:TimeSlot DisplayName="60 Minutos" MenuCaption="6&amp;0 Minutos" 
            Value="01:00:00" />
        <dxschsc:TimeSlot DisplayName="30 Minutos" MenuCaption="&amp;30 Minutos" 
            Value="00:30:00" />
        <dxschsc:TimeSlot DisplayName="15 Minutos" MenuCaption="&amp;15 Minutos" 
            Value="00:15:00" />
        <dxschsc:TimeSlot DisplayName="10 Minutos" MenuCaption="10 &amp;Minutos" 
            Value="00:10:00" />
        <dxschsc:TimeSlot DisplayName="6 Minutos" MenuCaption="&amp;6 Minutos" 
            Value="00:06:00" />
        <dxschsc:TimeSlot DisplayName="5 Minutos" MenuCaption="&amp;5 Minutos" />
    </TimeSlots>
    <TimeRulers>
<dxschsc:TimeRuler></dxschsc:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
</DayView>

<WorkWeekView DisplayName="Semana de Trabalho" 
        MenuCaption="Visualizar por Semana de Trabalho" 
        ShortDisplayName="Semana de Trabalho">
    <VisibleTime End="19:00:00" Start="07:00:00" />
    <WorkTime End="18:00:00" Start="08:00:00" />
    <TimeRulers>
<dxschsc:TimeRuler></dxschsc:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
</WorkWeekView>
    <WeekView DisplayName="Semana" MenuCaption="Visualizar por &amp;Semana" 
        ShortDisplayName="Semana">
    </WeekView>
    <MonthView DisplayName="Mês" MenuCaption="Visualizar por &amp;Mês" 
        ShortDisplayName="Mês">
    </MonthView>
    <TimelineView MenuCaption="Visualizar por Linha do Tempo" 
        ShortDisplayName="Linha do Tempo">
        <Scales>
            <dxschsc:TimeScaleYear DisplayName="Ano" Enabled="False" />
            <dxschsc:TimeScaleQuarter Enabled="False" />
            <dxschsc:TimeScaleMonth Enabled="False" />
            <dxschsc:TimeScaleWeek />
            <dxschsc:TimeScaleDay />
            <dxschsc:TimeScaleHour Enabled="False" />
            <dxschsc:TimeScaleFixedInterval Enabled="False" />
        </Scales>
    </TimelineView>

<FullWeekView ViewSelectorItemAdaptivePriority="7"><TimeRulers>
<dxschsc:TimeRuler></dxschsc:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
</FullWeekView>

<AgendaView ViewSelectorItemAdaptivePriority="1"></AgendaView>
</Views>

<ClientSideEvents MouseUp=""></ClientSideEvents>        
        <OptionsBehavior ClientTimeZoneId="Central America Standard Time" />
        <OptionsLoadingPanel Text="Atualizando. Aguarde...&amp;hellip;" />
    </dxwschs:ASPxScheduler>
<asp:SqlDataSource ID="dsResource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
    SelectCommand="SELECT [UniqueID], [ResourceID], [ResourceName], [Color], [Image], [CustomField1] FROM [Resources]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="dsAppointment" runat="server" 
    ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
    DeleteCommand="DELETE FROM [Appointments] WHERE [UniqueID] = @UniqueID" 
    InsertCommand="INSERT INTO [Appointments] ([Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ReminderInfo], [RecurrenceInfo], [CustomField1]) VALUES (@Type, @StartDate, @EndDate, @AllDay, @Subject, @Location, @Description, @Status, @Label, @ResourceID, @ReminderInfo, @RecurrenceInfo, @CustomField1)" 
    oninserted="dsAppointment_Inserted" 
    SelectCommand="SELECT [UniqueID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ReminderInfo], [RecurrenceInfo], [CustomField1] FROM [Appointments]" 
    UpdateCommand="UPDATE [Appointments] SET [Type] = @Type, [StartDate] = @StartDate, [EndDate] = @EndDate, [AllDay] = @AllDay, [Subject] = @Subject, [Location] = @Location, [Description] = @Description, [Status] = @Status, [Label] = @Label, [ResourceID] = @ResourceID, [ReminderInfo] = @ReminderInfo, [RecurrenceInfo] = @RecurrenceInfo, [CustomField1] = @CustomField1 WHERE [UniqueID] = @UniqueID">
    <DeleteParameters>
        <asp:Parameter Name="UniqueID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="Type" Type="Int32" />
        <asp:Parameter Name="StartDate" Type="DateTime" />
        <asp:Parameter Name="EndDate" Type="DateTime" />
        <asp:Parameter Name="AllDay" Type="Boolean" />
        <asp:Parameter Name="Subject" Type="String" />
        <asp:Parameter Name="Location" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="Status" Type="Int32" />
        <asp:Parameter Name="Label" Type="Int32" />
        <asp:Parameter Name="ResourceID" Type="Int32" />
        <asp:Parameter Name="ReminderInfo" Type="String" />
        <asp:Parameter Name="RecurrenceInfo" Type="String" />
        <asp:Parameter Name="CustomField1" Type="String" />
        <asp:Parameter Name="UniqueID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="Type" Type="Int32" />
        <asp:Parameter Name="StartDate" Type="DateTime" />
        <asp:Parameter Name="EndDate" Type="DateTime" />
        <asp:Parameter Name="AllDay" Type="Boolean" />
        <asp:Parameter Name="Subject" Type="String" />
        <asp:Parameter Name="Location" Type="String" />
        <asp:Parameter Name="Description" Type="String" />
        <asp:Parameter Name="Status" Type="Int32" />
        <asp:Parameter Name="Label" Type="Int32" />
        <asp:Parameter Name="ResourceID" Type="Int32" />
        <asp:Parameter Name="ReminderInfo" Type="String" />
        <asp:Parameter Name="RecurrenceInfo" Type="String" />
        <asp:Parameter Name="CustomField1" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
</asp:Content>

