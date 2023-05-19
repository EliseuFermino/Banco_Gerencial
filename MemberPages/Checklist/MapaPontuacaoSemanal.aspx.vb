Imports DevExpress.Web
Imports DevExpress.XtraCharts

Partial Class MemberPages_Checklist_MapaPontuacaoSemanal
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Dim oTime As New myDateTimes
    Dim oDat As New clDataDb
    Dim oCheck As New Check


    Private Dia1 As Decimal = 0
    Private Dia2 As Decimal = 0
    Private Dia3 As Decimal = 0
    Private Dia4 As Decimal = 0
    Private Dia5 As Decimal = 0
    Private Dia6 As Decimal = 0
    Private Dia7 As Decimal = 0
    Private Dia8 As Decimal = 0
    Private Dia9 As Decimal = 0

    Private Dia10 As Decimal = 0
    Private Dia11 As Decimal = 0
    Private Dia12 As Decimal = 0
    Private Dia13 As Decimal = 0
    Private Dia14 As Decimal = 0
    Private Dia15 As Decimal = 0
    Private Dia16 As Decimal = 0
    Private Dia17 As Decimal = 0
    Private Dia18 As Decimal = 0
    Private Dia19 As Decimal = 0

    Private Dia20 As Decimal = 0
    Private Dia21 As Decimal = 0
    Private Dia22 As Decimal = 0
    Private Dia23 As Decimal = 0
    Private Dia24 As Decimal = 0
    Private Dia25 As Decimal = 0
    Private Dia26 As Decimal = 0
    Private Dia27 As Decimal = 0
    Private Dia28 As Decimal = 0
    Private Dia29 As Decimal = 0

    Private Dia30 As Decimal = 0
    Private Dia31 As Decimal = 0



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            cboAno.AnoInicial = Year(DateAndTime.Today.AddYears(-2))
            cboAno.AnoFinal = Year(DateAndTime.Today)
            cboAno.CallAno = Year(DateAndTime.Today)

            cboAno.AutoPostBack = False
            cboMes.AutoPostBack = False

            'mySession()
            'oFun.Grid_Title(grid_Notas, "Pontuação por Mes e por Quadrimestre")

        End If

    End Sub

    Private Sub Titulo_Cabecalho()
        Dim varPeriodo As String
        If cboMes.CallMes = Month(DateAndTime.Now) Then
            varPeriodo = "Semana entre " & myDateTimes.GetFirstDayOfMonth(DateAndTime.Today.AddDays(-1)) & " e " & DateAndTime.Today.AddDays(-1)
        Else
            varPeriodo = "Semana entre " & myDateTimes.GetFirstDayOfMonth_baseYearMonth(cboMes.CallMes, cboAno.CallAno) & " e " & myDateTimes.GetLastDayOfMonth(myDateTimes.GetFirstDayOfMonth_baseYearMonth(cboMes.CallMes, cboAno.CallAno))
        End If
        oFun.Grid_Title(grid, varPeriodo)
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Session("sANO") = cboAno.CallAno
        Session("sMES") = cboMes.CallMes
        Session("sFILIAL") = cboFilial.CallFilial

        lblError.Text = "Ano " & Session("sANO") & " Mes: " & Session("sMES") & " Filial: " & Session("sFILIAL")

        Titulo_Cabecalho()

        HideColumnDias()
        ShowColumnDias()

        If chkGrupoSub.Checked = True Then
            oFun.Grid_Column_GroupIndex(grid, "listaGrupo", 0)
        Else
            oFun.Grid_Column_GroupIndex(grid, "listaGrupo", -1)
        End If

        grid.DataBind()
        grid_Notas.DataBind()


        Call ChangeTitles(Session("sMES"))

        ' divGraph_PontuacaoTotal_Super.Visible = True
        ' divGraph_PontuacaoTotal_SuperE.Visible = True

    End Sub


    Private Sub mySession()

        Session("sANO") = cboAno.CallAno
        Session("sMES") = cboMes.CallMes
        Session("sFILIAL") = cboFilial.CallFilial

        lblError.Text = "Ano " & Session("sANO") & " Mes: " & Session("sMES") & " Filial: " & Session("sFILIAL")

        'Session("sFILIAL") = cboFilial.CallFilial
        'Session("sGRUPO") = cboGrupo.Value
        'Session("sSUBGRUPO") = cboSubgrupo.Value
        'Session("sGRUPO_NA") = cboGrupo_NA.Value
        'Session("sSUBGRUPO_NA") = cboSubgrupo_NA.Value
        'Session("sFILIAL_NA") = cboFilial_NA.CallFilial


    End Sub

    Private Sub HideColumnDias()
        oFun.Grid_Column_Visible(grid, "Dia1", False)
        oFun.Grid_Column_Visible(grid, "Dia2", False)
        oFun.Grid_Column_Visible(grid, "Dia3", False)
        oFun.Grid_Column_Visible(grid, "Dia4", False)
        oFun.Grid_Column_Visible(grid, "Dia5", False)
        oFun.Grid_Column_Visible(grid, "Dia6", False)
        oFun.Grid_Column_Visible(grid, "Dia7", False)
        oFun.Grid_Column_Visible(grid, "Dia8", False)
        oFun.Grid_Column_Visible(grid, "Dia9", False)
        oFun.Grid_Column_Visible(grid, "Dia10", False)
        oFun.Grid_Column_Visible(grid, "Dia11", False)
        oFun.Grid_Column_Visible(grid, "Dia12", False)
        oFun.Grid_Column_Visible(grid, "Dia13", False)
        oFun.Grid_Column_Visible(grid, "Dia14", False)
        oFun.Grid_Column_Visible(grid, "Dia15", False)
        oFun.Grid_Column_Visible(grid, "Dia16", False)
        oFun.Grid_Column_Visible(grid, "Dia17", False)
        oFun.Grid_Column_Visible(grid, "Dia18", False)
        oFun.Grid_Column_Visible(grid, "Dia19", False)
        oFun.Grid_Column_Visible(grid, "Dia20", False)
        oFun.Grid_Column_Visible(grid, "Dia21", False)
        oFun.Grid_Column_Visible(grid, "Dia22", False)
        oFun.Grid_Column_Visible(grid, "Dia23", False)
        oFun.Grid_Column_Visible(grid, "Dia24", False)
        oFun.Grid_Column_Visible(grid, "Dia25", False)
        oFun.Grid_Column_Visible(grid, "Dia26", False)
        oFun.Grid_Column_Visible(grid, "Dia27", False)
        oFun.Grid_Column_Visible(grid, "Dia28", False)
        oFun.Grid_Column_Visible(grid, "Dia29", False)
        oFun.Grid_Column_Visible(grid, "Dia30", False)
        oFun.Grid_Column_Visible(grid, "Dia31", False)
    End Sub

    Private Sub ShowColumnDias()

        Dim numDiaSemana As Byte

        If oVen.Month_Return_Actual = cboMes.CallMes Then
            numDiaSemana = DatePart(DateInterval.Day, DateAndTime.Today.AddDays(-1))
        Else
            Select Case cboMes.CallMes
                Case 1, 3, 5, 7, 8, 10, 12
                    numDiaSemana = 31
                Case 4, 6, 9, 11
                    numDiaSemana = 30
                Case 2
                    If oVen.LeapYear(cboAno.CallAno) = False Then
                        numDiaSemana = 28
                    Else
                        numDiaSemana = 29
                    End If
            End Select
        End If

        ' numDiaSemana = 30

        If numDiaSemana = 1 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
        ElseIf numDiaSemana = 2 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
        ElseIf numDiaSemana = 3 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
        ElseIf numDiaSemana = 4 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
        ElseIf numDiaSemana = 5 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
        ElseIf numDiaSemana = 6 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
        ElseIf numDiaSemana = 7 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
        ElseIf numDiaSemana = 8 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
        ElseIf numDiaSemana = 9 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
        ElseIf numDiaSemana = 10 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
        ElseIf numDiaSemana = 11 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
        ElseIf numDiaSemana = 12 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
        ElseIf numDiaSemana = 13 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
        ElseIf numDiaSemana = 14 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
        ElseIf numDiaSemana = 15 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
        ElseIf numDiaSemana = 16 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
        ElseIf numDiaSemana = 17 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
        ElseIf numDiaSemana = 18 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
        ElseIf numDiaSemana = 19 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
            oFun.Grid_Column_Visible(grid, "Dia19", True)
        ElseIf numDiaSemana = 20 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
            oFun.Grid_Column_Visible(grid, "Dia19", True)
            oFun.Grid_Column_Visible(grid, "Dia20", True)
        ElseIf numDiaSemana = 21 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
            oFun.Grid_Column_Visible(grid, "Dia19", True)
            oFun.Grid_Column_Visible(grid, "Dia20", True)
            oFun.Grid_Column_Visible(grid, "Dia21", True)
        ElseIf numDiaSemana = 22 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
            oFun.Grid_Column_Visible(grid, "Dia19", True)
            oFun.Grid_Column_Visible(grid, "Dia20", True)
            oFun.Grid_Column_Visible(grid, "Dia21", True)
            oFun.Grid_Column_Visible(grid, "Dia22", True)
        ElseIf numDiaSemana = 23 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
            oFun.Grid_Column_Visible(grid, "Dia19", True)
            oFun.Grid_Column_Visible(grid, "Dia20", True)
            oFun.Grid_Column_Visible(grid, "Dia21", True)
            oFun.Grid_Column_Visible(grid, "Dia22", True)
            oFun.Grid_Column_Visible(grid, "Dia23", True)
        ElseIf numDiaSemana = 24 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
            oFun.Grid_Column_Visible(grid, "Dia19", True)
            oFun.Grid_Column_Visible(grid, "Dia20", True)
            oFun.Grid_Column_Visible(grid, "Dia21", True)
            oFun.Grid_Column_Visible(grid, "Dia22", True)
            oFun.Grid_Column_Visible(grid, "Dia23", True)
            oFun.Grid_Column_Visible(grid, "Dia24", True)
        ElseIf numDiaSemana = 25 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
            oFun.Grid_Column_Visible(grid, "Dia19", True)
            oFun.Grid_Column_Visible(grid, "Dia20", True)
            oFun.Grid_Column_Visible(grid, "Dia21", True)
            oFun.Grid_Column_Visible(grid, "Dia22", True)
            oFun.Grid_Column_Visible(grid, "Dia23", True)
            oFun.Grid_Column_Visible(grid, "Dia24", True)
            oFun.Grid_Column_Visible(grid, "Dia25", True)
        ElseIf numDiaSemana = 26 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
            oFun.Grid_Column_Visible(grid, "Dia19", True)
            oFun.Grid_Column_Visible(grid, "Dia20", True)
            oFun.Grid_Column_Visible(grid, "Dia21", True)
            oFun.Grid_Column_Visible(grid, "Dia22", True)
            oFun.Grid_Column_Visible(grid, "Dia23", True)
            oFun.Grid_Column_Visible(grid, "Dia24", True)
            oFun.Grid_Column_Visible(grid, "Dia25", True)
            oFun.Grid_Column_Visible(grid, "Dia26", True)
        ElseIf numDiaSemana = 27 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
            oFun.Grid_Column_Visible(grid, "Dia19", True)
            oFun.Grid_Column_Visible(grid, "Dia20", True)
            oFun.Grid_Column_Visible(grid, "Dia21", True)
            oFun.Grid_Column_Visible(grid, "Dia22", True)
            oFun.Grid_Column_Visible(grid, "Dia23", True)
            oFun.Grid_Column_Visible(grid, "Dia24", True)
            oFun.Grid_Column_Visible(grid, "Dia25", True)
            oFun.Grid_Column_Visible(grid, "Dia26", True)
            oFun.Grid_Column_Visible(grid, "Dia27", True)
        ElseIf numDiaSemana = 28 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
            oFun.Grid_Column_Visible(grid, "Dia19", True)
            oFun.Grid_Column_Visible(grid, "Dia20", True)
            oFun.Grid_Column_Visible(grid, "Dia21", True)
            oFun.Grid_Column_Visible(grid, "Dia22", True)
            oFun.Grid_Column_Visible(grid, "Dia23", True)
            oFun.Grid_Column_Visible(grid, "Dia24", True)
            oFun.Grid_Column_Visible(grid, "Dia25", True)
            oFun.Grid_Column_Visible(grid, "Dia26", True)
            oFun.Grid_Column_Visible(grid, "Dia27", True)
            oFun.Grid_Column_Visible(grid, "Dia28", True)
        ElseIf numDiaSemana = 29 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
            oFun.Grid_Column_Visible(grid, "Dia19", True)
            oFun.Grid_Column_Visible(grid, "Dia20", True)
            oFun.Grid_Column_Visible(grid, "Dia21", True)
            oFun.Grid_Column_Visible(grid, "Dia22", True)
            oFun.Grid_Column_Visible(grid, "Dia23", True)
            oFun.Grid_Column_Visible(grid, "Dia24", True)
            oFun.Grid_Column_Visible(grid, "Dia25", True)
            oFun.Grid_Column_Visible(grid, "Dia26", True)
            oFun.Grid_Column_Visible(grid, "Dia27", True)
            oFun.Grid_Column_Visible(grid, "Dia28", True)
            oFun.Grid_Column_Visible(grid, "Dia29", True)
        ElseIf numDiaSemana = 30 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
            oFun.Grid_Column_Visible(grid, "Dia19", True)
            oFun.Grid_Column_Visible(grid, "Dia20", True)
            oFun.Grid_Column_Visible(grid, "Dia21", True)
            oFun.Grid_Column_Visible(grid, "Dia22", True)
            oFun.Grid_Column_Visible(grid, "Dia23", True)
            oFun.Grid_Column_Visible(grid, "Dia24", True)
            oFun.Grid_Column_Visible(grid, "Dia25", True)
            oFun.Grid_Column_Visible(grid, "Dia26", True)
            oFun.Grid_Column_Visible(grid, "Dia27", True)
            oFun.Grid_Column_Visible(grid, "Dia28", True)
            oFun.Grid_Column_Visible(grid, "Dia29", True)
            oFun.Grid_Column_Visible(grid, "Dia30", True)
        ElseIf numDiaSemana = 31 Then
            oFun.Grid_Column_Visible(grid, "Dia1", True)
            oFun.Grid_Column_Visible(grid, "Dia2", True)
            oFun.Grid_Column_Visible(grid, "Dia3", True)
            oFun.Grid_Column_Visible(grid, "Dia4", True)
            oFun.Grid_Column_Visible(grid, "Dia5", True)
            oFun.Grid_Column_Visible(grid, "Dia6", True)
            oFun.Grid_Column_Visible(grid, "Dia7", True)
            oFun.Grid_Column_Visible(grid, "Dia8", True)
            oFun.Grid_Column_Visible(grid, "Dia9", True)
            oFun.Grid_Column_Visible(grid, "Dia10", True)
            oFun.Grid_Column_Visible(grid, "Dia11", True)
            oFun.Grid_Column_Visible(grid, "Dia12", True)
            oFun.Grid_Column_Visible(grid, "Dia13", True)
            oFun.Grid_Column_Visible(grid, "Dia14", True)
            oFun.Grid_Column_Visible(grid, "Dia15", True)
            oFun.Grid_Column_Visible(grid, "Dia16", True)
            oFun.Grid_Column_Visible(grid, "Dia17", True)
            oFun.Grid_Column_Visible(grid, "Dia18", True)
            oFun.Grid_Column_Visible(grid, "Dia19", True)
            oFun.Grid_Column_Visible(grid, "Dia20", True)
            oFun.Grid_Column_Visible(grid, "Dia21", True)
            oFun.Grid_Column_Visible(grid, "Dia22", True)
            oFun.Grid_Column_Visible(grid, "Dia23", True)
            oFun.Grid_Column_Visible(grid, "Dia24", True)
            oFun.Grid_Column_Visible(grid, "Dia25", True)
            oFun.Grid_Column_Visible(grid, "Dia26", True)
            oFun.Grid_Column_Visible(grid, "Dia27", True)
            oFun.Grid_Column_Visible(grid, "Dia28", True)
            oFun.Grid_Column_Visible(grid, "Dia29", True)
            oFun.Grid_Column_Visible(grid, "Dia30", True)
            oFun.Grid_Column_Visible(grid, "Dia31", True)
        End If

    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            HideColumnDias()
            ShowColumnDias()
            Call ChangeTitles(Session("sMES"))

            ''If cboFilial.IsLoja = True Then grid_Notas.Visible = False
        End If
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid, "Nota", "Conforme", "Validos", Funcoes.CalculateType.ValueOverRevenue)

        oCheck.BuscarPontuacaoDiariaPorLoja(Session("sANO"), Session("sMES"), Session("sFILIAL"))

        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            Dia1 = 0
            Dia2 = 0
            Dia3 = 0
            Dia4 = 0
            Dia5 = 0
            Dia6 = 0
            Dia7 = 0
            Dia8 = 0
            Dia9 = 0

            Dia10 = 0
            Dia11 = 0
            Dia12 = 0
            Dia13 = 0
            Dia14 = 0
            Dia15 = 0
            Dia16 = 0
            Dia17 = 0
            Dia18 = 0
            Dia19 = 0

            Dia20 = 0
            Dia21 = 0
            Dia22 = 0
            Dia23 = 0
            Dia24 = 0
            Dia25 = 0
            Dia26 = 0
            Dia27 = 0
            Dia28 = 0
            Dia29 = 0

            Dia30 = 0
            Dia31 = 0
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dia1 = oCheck.Dia1
            Dia2 = oCheck.Dia2
            Dia3 = oCheck.Dia3
            Dia4 = oCheck.Dia4
            Dia5 = oCheck.Dia5
            Dia6 = oCheck.Dia6
            Dia7 = oCheck.Dia7
            Dia8 = oCheck.Dia8
            Dia9 = oCheck.Dia9

            Dia10 = oCheck.Dia10
            Dia11 = oCheck.Dia11
            Dia12 = oCheck.Dia12
            Dia13 = oCheck.Dia13
            Dia14 = oCheck.Dia14
            Dia15 = oCheck.Dia15
            Dia16 = oCheck.Dia16
            Dia17 = oCheck.Dia17
            Dia18 = oCheck.Dia18
            Dia19 = oCheck.Dia19

            Dia20 = oCheck.Dia20
            Dia21 = oCheck.Dia21
            Dia22 = oCheck.Dia22
            Dia23 = oCheck.Dia23
            Dia24 = oCheck.Dia24
            Dia25 = oCheck.Dia25
            Dia26 = oCheck.Dia26
            Dia27 = oCheck.Dia27
            Dia28 = oCheck.Dia28
            Dia29 = oCheck.Dia29

            Dia30 = oCheck.Dia30
            Dia31 = oCheck.Dia31
        End If


        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia1" Then e.TotalValue = Dia1
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia2" Then e.TotalValue = Dia2
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia3" Then e.TotalValue = Dia3
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia4" Then e.TotalValue = Dia4
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia5" Then e.TotalValue = Dia5
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia6" Then e.TotalValue = Dia6
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia7" Then e.TotalValue = Dia7
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia8" Then e.TotalValue = Dia8
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia9" Then e.TotalValue = Dia9

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia10" Then e.TotalValue = Dia10
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia11" Then e.TotalValue = Dia11
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia12" Then e.TotalValue = Dia12
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia13" Then e.TotalValue = Dia13
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia14" Then e.TotalValue = Dia14
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia15" Then e.TotalValue = Dia15
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia16" Then e.TotalValue = Dia16
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia17" Then e.TotalValue = Dia17
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia18" Then e.TotalValue = Dia18
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia19" Then e.TotalValue = Dia19

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia20" Then e.TotalValue = Dia20
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia21" Then e.TotalValue = Dia21
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia22" Then e.TotalValue = Dia22
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia23" Then e.TotalValue = Dia23
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia24" Then e.TotalValue = Dia24
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia25" Then e.TotalValue = Dia25
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia26" Then e.TotalValue = Dia26
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia27" Then e.TotalValue = Dia27
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia28" Then e.TotalValue = Dia28
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia29" Then e.TotalValue = Dia29

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia30" Then e.TotalValue = Dia30
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia31" Then e.TotalValue = Dia31

        End If



    End Sub


    Private Sub ChangeTitles(ByVal iMes As Byte)
        Dim DiaInicial As Date

        DiaInicial = myDateTimes.GetFirstDayOfMonth_baseYearMonth(Session("sMES"), Session("sANO")).AddYears(-1)
        lblError.Text = DiaInicial

        oFun.Grid_ColumnTitle(grid, "Dia1", NomeDiaAbreviado(DiaInicial, iMes) & " <br />" & CStr(Left(DiaInicial, 5)))
        oFun.Grid_ColumnTitle(grid, "Dia2", NomeDiaAbreviado(DiaInicial.AddDays(1), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(1), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia3", NomeDiaAbreviado(DiaInicial.AddDays(2), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(2), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia4", NomeDiaAbreviado(DiaInicial.AddDays(3), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(3), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia5", NomeDiaAbreviado(DiaInicial.AddDays(4), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(4), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia6", NomeDiaAbreviado(DiaInicial.AddDays(5), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(5), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia7", NomeDiaAbreviado(DiaInicial.AddDays(6), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(6), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia8", NomeDiaAbreviado(DiaInicial.AddDays(7), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(7), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia9", NomeDiaAbreviado(DiaInicial.AddDays(8), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(8), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia10", NomeDiaAbreviado(DiaInicial.AddDays(9), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(9), 5)))

        oFun.Grid_ColumnTitle(grid, "Dia11", NomeDiaAbreviado(DiaInicial.AddDays(10), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(10), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia12", NomeDiaAbreviado(DiaInicial.AddDays(11), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(11), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia13", NomeDiaAbreviado(DiaInicial.AddDays(12), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(12), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia14", NomeDiaAbreviado(DiaInicial.AddDays(13), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(13), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia15", NomeDiaAbreviado(DiaInicial.AddDays(14), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(14), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia16", NomeDiaAbreviado(DiaInicial.AddDays(15), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(15), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia17", NomeDiaAbreviado(DiaInicial.AddDays(16), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(16), 5)))

        oFun.Grid_ColumnTitle(grid, "Dia18", NomeDiaAbreviado(DiaInicial.AddDays(17), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(17), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia19", NomeDiaAbreviado(DiaInicial.AddDays(18), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(18), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia20", NomeDiaAbreviado(DiaInicial.AddDays(19), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(19), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia21", NomeDiaAbreviado(DiaInicial.AddDays(20), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(20), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia22", NomeDiaAbreviado(DiaInicial.AddDays(21), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(21), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia23", NomeDiaAbreviado(DiaInicial.AddDays(22), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(22), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia24", NomeDiaAbreviado(DiaInicial.AddDays(23), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(23), 5)))

        oFun.Grid_ColumnTitle(grid, "Dia25", NomeDiaAbreviado(DiaInicial.AddDays(24), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(24), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia26", NomeDiaAbreviado(DiaInicial.AddDays(25), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(25), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia27", NomeDiaAbreviado(DiaInicial.AddDays(26), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(26), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia28", NomeDiaAbreviado(DiaInicial.AddDays(27), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(27), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia29", NomeDiaAbreviado(DiaInicial.AddDays(28), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(28), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia30", NomeDiaAbreviado(DiaInicial.AddDays(29), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(29), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia31", NomeDiaAbreviado(DiaInicial.AddDays(30), iMes) & " <br />" & CStr(Left(DiaInicial.AddDays(30), 5)))

    End Sub

    Public Function NomeDiaAbreviado(ByVal meuDia As Date, ByVal iMes As Byte) As String

        Dim myCulture As System.Globalization.CultureInfo = System.Globalization.CultureInfo.CurrentCulture

        Select Case iMes
            Case 1
                Dim dayOfWeek As DayOfWeek = myCulture.Calendar.GetDayOfWeek(meuDia.AddDays(1))
                NomeDiaAbreviado = myCulture.DateTimeFormat.GetDayName(dayOfWeek)
            Case 2
                Dim dayOfWeek As DayOfWeek = myCulture.Calendar.GetDayOfWeek(meuDia.AddDays(1))
                NomeDiaAbreviado = myCulture.DateTimeFormat.GetDayName(dayOfWeek)
            Case 3
                Dim dayOfWeek As DayOfWeek = myCulture.Calendar.GetDayOfWeek(meuDia.AddDays(1))
                NomeDiaAbreviado = myCulture.DateTimeFormat.GetDayName(dayOfWeek)
            Case 4
                Dim dayOfWeek As DayOfWeek = myCulture.Calendar.GetDayOfWeek(meuDia.AddDays(1))
                NomeDiaAbreviado = myCulture.DateTimeFormat.GetDayName(dayOfWeek)
            Case 5
                Dim dayOfWeek As DayOfWeek = myCulture.Calendar.GetDayOfWeek(meuDia.AddDays(1))
                NomeDiaAbreviado = myCulture.DateTimeFormat.GetDayName(dayOfWeek)
            Case 6
                Dim dayOfWeek As DayOfWeek = myCulture.Calendar.GetDayOfWeek(meuDia.AddDays(1))
                NomeDiaAbreviado = myCulture.DateTimeFormat.GetDayName(dayOfWeek)
            Case 7
                Dim dayOfWeek As DayOfWeek = myCulture.Calendar.GetDayOfWeek(meuDia.AddDays(1))
                NomeDiaAbreviado = myCulture.DateTimeFormat.GetDayName(dayOfWeek)
            Case 8
                Dim dayOfWeek As DayOfWeek = myCulture.Calendar.GetDayOfWeek(meuDia.AddDays(1))
                NomeDiaAbreviado = myCulture.DateTimeFormat.GetDayName(dayOfWeek)
            Case 9
                Dim dayOfWeek As DayOfWeek = myCulture.Calendar.GetDayOfWeek(meuDia.AddDays(1))
                NomeDiaAbreviado = myCulture.DateTimeFormat.GetDayName(dayOfWeek)
            Case 10
                Dim dayOfWeek As DayOfWeek = myCulture.Calendar.GetDayOfWeek(meuDia.AddDays(1))
                NomeDiaAbreviado = myCulture.DateTimeFormat.GetDayName(dayOfWeek)
            Case 11
                Dim dayOfWeek As DayOfWeek = myCulture.Calendar.GetDayOfWeek(meuDia.AddDays(0))
                NomeDiaAbreviado = myCulture.DateTimeFormat.GetDayName(dayOfWeek)
            Case 12
                Dim dayOfWeek As DayOfWeek = myCulture.Calendar.GetDayOfWeek(meuDia.AddDays(0))
                NomeDiaAbreviado = myCulture.DateTimeFormat.GetDayName(dayOfWeek)
        End Select




        'Dim numDiaWeek As Byte
        'numDiaWeek = WeekdayName(Weekday(meuDia))
        'NomeDiaAbreviado = Choose(numDiaWeek, "Seg", "Ter", "Quar", "Qui", "Sex", "Sáb", "Dom")
    End Function




End Class
