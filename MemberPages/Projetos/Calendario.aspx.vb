
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraScheduler
Imports DevExpress.Web.ASPxScheduler

Partial Public Class MemberPages_Calendario
    Inherits System.Web.UI.Page
    Private lastInsertedAppointmentId As Integer

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        Dim oVem As New VendaEmpresaMes()
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(28, User.Identity.Name)
            Me.ASPxScheduler1.Start = DateAndTime.Now
        End If
    End Sub


    Protected Sub ASPxScheduler1_AppointmentRowInserting(sender As Object, e As ASPxSchedulerDataInsertingEventArgs)
        e.NewValues.Remove("UniqueID")
    End Sub
    Protected Sub dsAppointment_Inserted(sender As Object, e As SqlDataSourceStatusEventArgs)
        Dim connection As SqlConnection = DirectCast(e.Command.Connection, SqlConnection)
        Using cmd As New SqlCommand("SELECT IDENT_CURRENT('Appointments')", connection)
            Me.lastInsertedAppointmentId = Convert.ToInt32(cmd.ExecuteScalar())
        End Using
    End Sub
    Protected Sub ASPxScheduler1_AppointmentRowInserted(sender As Object, e As ASPxSchedulerDataInsertedEventArgs)
        e.KeyFieldValue = Me.lastInsertedAppointmentId
    End Sub
    Protected Sub ASPxScheduler1_AppointmentsInserted(sender As Object, e As PersistentObjectsEventArgs)
        Dim apt As Appointment = DirectCast(e.Objects(0), Appointment)
        Dim storage As ASPxSchedulerStorage = DirectCast(sender, ASPxSchedulerStorage)
        storage.SetAppointmentId(apt, lastInsertedAppointmentId)
    End Sub


    Protected Sub ASPxScheduler1_AllowAppointmentDelete(sender As Object, e As AppointmentOperationEventArgs)
        ' Allow only the user who created this appontment to delete it.
        e.Allow = CanUserModifyThisAppointment(e.Appointment)
    End Sub
    Protected Sub ASPxScheduler1_AllowAppointmentEdit(sender As Object, e As AppointmentOperationEventArgs)
        ' Allow only the user who created this appontment to modify it.
        e.Allow = CanUserModifyThisAppointment(e.Appointment)
    End Sub

    ' Determine if the current user is the same 
    ' as the one who created the specified appointment
    Private Function CanUserModifyThisAppointment(apt As Appointment) As Boolean
        Dim obj As Object = apt.CustomFields("Owner")
        If obj Is Nothing Then
            Return True
        End If
        Dim appointmentOwner As String = obj.ToString()
        If appointmentOwner = [String].Empty Then
            Return True
        End If
        Return ([String].Compare(appointmentOwner, User.Identity.Name, True) = 0)
    End Function

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Agenda do Auditório - Jefferson Fidelis - PGR28"
    End Sub

    Protected Sub ASPxScheduler1_Load(sender As Object, e As EventArgs) Handles ASPxScheduler1.Load

    End Sub
End Class