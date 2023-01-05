
Imports DevExpress.Web
Imports System.Data
Imports System.Data.SqlClient

Partial Class Controles_wuciAno
    Inherits System.Web.UI.UserControl

    Private varAnoInicial As Int16
    Private varAnoFinal As Int16

    Public Event ListAnoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property AnoInicial() As Int16
        Get
            Return varAnoInicial
        End Get
        Set(value As Int16)
            varAnoInicial = value
        End Set
    End Property

    Public Property AnoFinal() As Int16
        Get
            Return varAnoFinal
        End Get
        Set(value As Int16)
            varAnoFinal = value
        End Set
    End Property

    Public Property CallAno() As String
        Get
            Return cboAno.Value
        End Get
        Set(ByVal value As String)
            cboAno.Value = value
        End Set
    End Property

    Public Property aEnabled() As Boolean
        Get
            Return cboAno.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboAno.Enabled = value
        End Set
    End Property

    Public Property aVisible() As Boolean
        Get
            Return cboAno.Visible
        End Get
        Set(ByVal value As Boolean)
            cboAno.Visible = value
        End Set
    End Property

    Protected Sub cboAno_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboAno.SelectedIndexChanged
        Session("sANO") = cboAno.Value
        RaiseEvent ListAnoChanged(sender, e)
    End Sub


    Public Property AutoPostBack() As Boolean
        Get
            Return cboAno.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboAno.AutoPostBack = value
        End Set
    End Property

    Function ListaAno(ByVal iDDL As ASPxComboBox, ByVal iAnoInicial As Int16, ByVal iAnoFinal As Int16) As Boolean
        Dim strSQL As String
        strSQL = "SELECT Ano FROM tblCadAno WHERE Ano BETWEEN " & iAnoInicial & " AND " & iAnoFinal & " ORDER BY Ano"

        Dim Conn As New SqlConnection(clData_gerCadastro.dbConnect)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(CommandBehavior.CloseConnection)
            iDDL.DataSource = objDr
            iDDL.ValueField = "Ano"
            iDDL.TextField = "Ano"
            iDDL.DataBind()
            Conn.Close()

        Catch ex As Exception
            'Catch the error and display it.

        Finally
            Cmd.Dispose()
            Conn.Close()
        End Try

    End Function

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Call ListaAno(Me.cboAno, Year(Now()) - 2, Year(Now()) + 1)
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Session("sANO") = cboAno.Value
        End If
    End Sub

   
End Class
