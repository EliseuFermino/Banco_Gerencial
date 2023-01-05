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
    Dim oProjeto As New Projeto

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If cboFilial.IsLoja = True Then btnAtualizar.Visible = False
            oVen.AtualizarEstatisticaPrograma(354, User.Identity.Name)
            mySession()

        End If
    End Sub

    Private Sub Buscar_Total_PiorLoja_Mes(ByVal iNomeStoredProcedure As String, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iOrdem As Byte, ByVal iFilial As Int16)

        Dim con As New SqlConnection(Conexao.gerCheckList)
        Dim comando As New SqlCommand(iNomeStoredProcedure, con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@numOrdem", SqlDbType.TinyInt))
        comando.Parameters("@numOrdem").Value = iOrdem

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
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


            'Session("sFILIAL") = CByte(Right(User.Identity.Name, 2))
            'lblOBS.Text = "REGIONAL " & Session("sREGIONAL") & " USUARIO: " & Session("sUSUARIO") & " DEPARTAMENTO: " & Session("sDEPARTAMENTO")
            Graph.DataBind()
            Chart_TicketMedio.DataBind()
            'cboFilial_ListFilialChanged(sender, e)

        End If
    End Sub


    Protected Sub Graph_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles Graph.CustomDrawSeriesPoint
        If e.SeriesPoint(0) < 0 Then
            e.SeriesDrawOptions.Color = Drawing.Color.Red
        End If

    End Sub

    Protected Sub graph_Depto1_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto1.CustomDrawSeriesPoint
        If e.SeriesPoint(0) < 0 Then
            e.SeriesDrawOptions.Color = Drawing.Color.Red
        End If
    End Sub

    Protected Sub graph_Depto2_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto2.CustomDrawSeriesPoint
        If e.SeriesPoint(0) < 0 Then
            e.SeriesDrawOptions.Color = Drawing.Color.Red
        End If
    End Sub

    Protected Sub graph_Depto3_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto3.CustomDrawSeriesPoint
        If e.SeriesPoint(0) < 0 Then
            e.SeriesDrawOptions.Color = Drawing.Color.Red
        End If
    End Sub

    Protected Sub graph_Depto4_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto4.CustomDrawSeriesPoint
        If e.SeriesPoint(0) < 0 Then
            e.SeriesDrawOptions.Color = Drawing.Color.Red
        End If
    End Sub

    Protected Sub graph_Depto5_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto5.CustomDrawSeriesPoint
        If e.SeriesPoint(0) < 0 Then
            e.SeriesDrawOptions.Color = Drawing.Color.Red
        End If
    End Sub

    Protected Sub WebChartControl1_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles WebChartControl1.CustomDrawSeriesPoint
        If e.SeriesPoint(0) < 0 Then
            e.SeriesDrawOptions.Color = Drawing.Color.Red
        End If
    End Sub

    
    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        mySession()
        Session("sFILIAL") = cboFilial.CallFilial
        ' lblOBS.Text = "REGIONAL " & Session("sREGIONAL") & " USUARIO: " & Session("sUSUARIO") & " DEPARTAMENTO: " & Session("sDEPARTAMENTO") & " - Session: " & Session("sFILIAL")



        WebChartControl1.DataBind()
        graph_Depto1.DataBind()
        graph_Depto2.DataBind()
        graph_Depto3.DataBind()
        graph_Depto4.DataBind()
        graph_Depto5.DataBind()
        Graph.DataBind()
        Chart_TicketMedio.DataBind()

    End Sub

    Protected Sub Chart_TicketMedio_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles Chart_TicketMedio.CustomDrawSeriesPoint
        If e.SeriesPoint(0) < 0 Then
            e.SeriesDrawOptions.Color = Drawing.Color.Red
        End If
    End Sub



End Class
