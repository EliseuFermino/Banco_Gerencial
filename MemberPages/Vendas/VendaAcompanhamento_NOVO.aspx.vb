Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing
Imports System.Net


Partial Class MemberPages_menuPrincipal
    Inherits System.Web.UI.Page

    Dim nota As String
    Dim descFilial As String
    Dim Periodo As String
    Dim varDesc As String

    Dim oPro As New Projeto
    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(355, User.Identity.Name)

        End If
    End Sub

    Private Sub Buscar_Total_PiorLoja_Mes(ByVal iNomeStoredProcedure As String, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iOrdem As Byte, ByVal iFilial As Byte)

        Dim con As New SqlConnection(Conexao.gerCheckList)
        Dim comando As New SqlCommand(iNomeStoredProcedure, con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@numOrdem", SqlDbType.TinyInt))
        comando.Parameters("@numOrdem").Value = iOrdem

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial


        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                nota = CDbl(reader5.GetSqlMoney(0)).ToString("n2")
                descFilial = reader5.GetSqlString(1)
                Periodo = reader5.GetSqlString(2)

            End While

        Catch ex As Exception
            varDesc = "Private Sub - Buscar_Total_PiorLoja_Mes " & ex.Message

        Finally
            con.Close()
        End Try
    End Sub

   

    Private Sub mySession()

        Session("sANO") = Year(DateAndTime.Today.AddDays(-1))
        Session("sMES") = Month(DateAndTime.Today.AddDays(-1))
      

    End Sub



    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        On Error Resume Next
        If Not IsPostBack Then

            lblRelogios.Text = "Percentual de Crescimento de Número de Clientes comparando com a Empresa - Últimos 12 meses"

            Session("sFILIAL") = CByte(Right(User.Identity.Name, 2))




        End If
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged

        Session("sFILIAL") = 99

        CreateCookie(99)
        ' CreateCookie(cboFilial.CallFilial)

    End Sub

    Private Sub CreateCookie(ByVal iFilial As Byte)
        ' Create the Cookie object
        Dim Cookie As New HttpCookie("Lojas")

        ' Set a value in it
        Cookie("numLoja") = iFilial

        ' Add it to the current web response
        Response.Cookies.Add(Cookie)

    End Sub

End Class
