Imports Microsoft.Reporting.WebForms
Imports System.Net

Public Class ReportServerCredentials
    Implements IReportServerCredentials

    Private _username As String
    Private _password As String
    Private _domain As String

    Public Sub New(ByVal userName As String, ByVal password As String, ByVal domain As String)
        _username = userName
        _password = password
        _domain = domain
    End Sub

    Public Function GetFormsCredentials(ByRef authCookie As System.Net.Cookie, ByRef userName As String, ByRef password As String, ByRef authority As String) As Boolean Implements Microsoft.Reporting.WebForms.IReportServerCredentials.GetFormsCredentials
        authCookie = Nothing
        userName = Nothing
        password = Nothing
        authority = Nothing
        Return False
    End Function

    Public ReadOnly Property ImpersonationUser() As System.Security.Principal.WindowsIdentity Implements Microsoft.Reporting.WebForms.IReportServerCredentials.ImpersonationUser
        Get
            Return Nothing
        End Get
    End Property

    Public ReadOnly Property NetworkCredentials() As System.Net.ICredentials Implements Microsoft.Reporting.WebForms.IReportServerCredentials.NetworkCredentials
        Get
            Return New NetworkCredential(_username, _password, _domain)
        End Get
    End Property

End Class
