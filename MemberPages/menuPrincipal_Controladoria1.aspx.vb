Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing
Imports System.Net

Imports DevExpress.XtraGauges.Core.Model
Imports DevExpress.XtraGauges.Core.Drawing
Imports DevExpress.Web.ASPxGauges
Imports DevExpress.Web.ASPxGauges.Gauges.Circular

Imports DevExpress.XtraGauges.Win
Imports DevExpress.XtraGauges.Base



Partial Class MemberPages_menuPrincipal_Controladoria1
    Inherits System.Web.UI.Page

    Dim nota As String
    Dim descFilial As String
    Dim Periodo As String
    Dim varDesc As String

    Dim oPro As New Projeto
    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        On Error Resume Next
        If Not IsPostBack Then
            oVen.AtualizarEstatisticaPrograma(402, User.Identity.Name)
            mySession()

            'Private Sub Widgets_cw_KRIRatingAsPercent_Load(sender As Object, e As EventArgs) Handles Me.Load
            '    Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(sessionHandler.Culture)
            '    ldb = New CaRMSDataContext(sessionHandler.connection.ToString)

            '    Dim lUn = From k In ldb.tblRiskKRIs
            '              Where k.recordStatus = 1 And k.rating = 1
            '              Select New With {k.id}

            '    Dim lWa = From k In ldb.tblRiskKRIs
            '              Where k.recordStatus = 1 And k.rating = 2
            '              Select New With {k.id}

            '    Dim lAc = From k In ldb.tblRiskKRIs
            '              Where k.recordStatus = 1 And k.rating = 3
            '              Select New With {k.id}


            '    Dim total As Integer = lUn.Count + lWa.Count + lAc.Count
            '    Dim Unacceptable As Integer = lUn.Count * 100 / total
            '    Dim Warning As Integer = lWa.Count * 100 / total
            '    Dim Acceptable As Integer = lAc.Count * 100 / total

            GetGaugeScale(gauge_Margem_PDV, 0, 0).Value = CSng(15.80000000000001)
            GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(0).StartValue = CSng(6)
            GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(0).EndValue = CSng(10)
            GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(1).StartValue = CSng(10)
            GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(1).EndValue = CSng(15.800000000000001)
            GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(2).StartValue = CSng(15.800000000000001)
            GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(2).EndValue = CSng(20.0)
            GetGaugeScale(gauge_Margem_PDV, 0, 0).MinValue = CSng(6)
            GetGaugeScale(gauge_Margem_PDV, 0, 0).MaxValue = CSng(20.0)


        End If

    End Sub

    Private Function GetGaugeScale(ByVal gaugeControl As ASPxGaugeControl, ByVal gaugeIndex As Integer, ByVal scaleIndex As Integer) As ArcScaleComponent
        Return (CType(gaugeControl.Gauges(gaugeIndex), ICircularGauge)).Scales(scaleIndex)
    End Function


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

        Session("sFILIAL") = 99
        Session("sOPCAO") = 1
        Session("sMERCADOLOGICO") = 1
        Session("sDIA") = CDate(DateAndTime.Today)
        Session("sANO") = Year(DateAndTime.Today.AddDays(-1))
        Session("sMES") = Month(DateAndTime.Today.AddDays(-1))

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        On Error Resume Next
        If Not IsPostBack Then

            Legendas()

            'Session("sFILIAL") = CByte(Right(User.Identity.Name, 2))
            'lblOBS.Text = "REGIONAL " & Session("sREGIONAL") & " USUARIO: " & Session("sUSUARIO") & " DEPARTAMENTO: " & Session("sDEPARTAMENTO")
            'Graph.DataBind()
            'Chart_TicketMedio.DataBind()
            'cboFilial_ListFilialChanged(sender, e)

        End If
    End Sub


    'Protected Sub Graph_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles Graph.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If

    'End Sub

    'Protected Sub graph_Depto1_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto1.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub

    'Protected Sub graph_Depto2_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto2.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub

    'Protected Sub graph_Depto3_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto3.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub

    'Protected Sub graph_Depto4_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto4.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub

    'Protected Sub graph_Depto5_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto5.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub

    'Protected Sub WebChartControl1_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles WebChartControl1.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub


    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        mySession()



        Legendas()

        ' lblOBS.Text = "REGIONAL " & Session("sREGIONAL") & " USUARIO: " & Session("sUSUARIO") & " DEPARTAMENTO: " & Session("sDEPARTAMENTO") & " - Session: " & Session("sFILIAL")



        'WebChartControl1.DataBind()
        'graph_Depto1.DataBind()
        'graph_Depto2.DataBind()
        'graph_Depto3.DataBind()
        'graph_Depto4.DataBind()
        'graph_Depto5.DataBind()

        'Graph.DataBind()

        'Chart_TicketMedio.DataBind()

    End Sub

    Private Sub Legendas()

        Dim diaHoje, diaPrimeiro, diaOntem As Date
        Dim sPrimeiro, sHoje, sOntem As String

        diaHoje = DateAndTime.Now.Date
        diaOntem = DateAndTime.Now.Date.AddDays(-1)
        diaPrimeiro = myDateTimes.GetFirstDayOfMonth(diaHoje)

        sHoje = Left(CStr(diaHoje), 5)
        sOntem = Left(CStr(diaOntem), 5)
        sPrimeiro = Left(CStr(diaPrimeiro), 5)


        lbl_2_1.Text = sHoje
        lbl_3_1.Text = sHoje

        lbl_1_2.Text = sPrimeiro & " à " & sOntem
        lbl_2_2.Text = sPrimeiro & " à " & sOntem
        lbl_3_2.Text = sPrimeiro & " à " & sOntem

        lbl_1_3.Text = sOntem
    End Sub

    'Protected Sub Chart_TicketMedio_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles Chart_TicketMedio.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub

End Class
