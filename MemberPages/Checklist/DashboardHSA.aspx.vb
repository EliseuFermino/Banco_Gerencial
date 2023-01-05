Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing


Partial Class MemberPages_Checklist_DashboardHSA
    Inherits System.Web.UI.Page

    Dim nota As String
    Dim descFilial As String
    Dim Periodo As String
    Dim varDesc As String

    Dim oTime As New myDateTimes
    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oDB As New clDataDb
            Dim ontem As Date
            ontem = DateAndTime.Today.AddDays(-1)

            Dim ano As Int16 = Year(ontem)
            Dim mes As Byte = Month(ontem)

            ' Dim varPeriodo As String = "Semana entre " & oTime.FirstDateOfWeek(Year(cboDia.CallDia), oTime.GetWeekNumber(cboDia.CallDia)) & " e " & DateAndTime.DateAdd(DateInterval.Day, +6, oTime.FirstDateOfWeek(Year(cboDia.CallDia), oTime.GetWeekNumber(cboDia.CallDia)))

            oVen.AtualizarEstatisticaPrograma(328, User.Identity.Name)

            CType(gauge_Pontuacao_Empresa.Gauges(0), ICircularGauge).Scales(0).Value = oDB.ExecuteStoredProcedure_Scalar("Pontuacao.usp_Nota_Buscar_Total_Empresa_Mes_HSA", Conexao.gerCheckList, "Ano", ano, "mes", mes)

            Call Buscar_Total_PiorLoja_Mes("Pontuacao.usp_Nota_Buscar_Total_PiorLoja_Mes_HSA", ano, mes, 1)
            CType(gauge_Pontuacao_Pior1.Gauges(0), ICircularGauge).Scales(0).Value = nota
            lblFilial_Pior1.Text = "Filial: " & descFilial
            lblPeriodo_Pior1.Text = Periodo
            MudaCor(btnPior1, nota)

            Call Buscar_Total_PiorLoja_Mes("Pontuacao.usp_Nota_Buscar_Total_PiorLoja_Mes_HSA", ano, mes, 2)
            CType(gauge_Pontuacao_Pior2.Gauges(0), ICircularGauge).Scales(0).Value = nota
            lblFilial_Pior2.Text = "Filial: " & descFilial
            lblPeriodo_Pior2.Text = Periodo
            MudaCor(btnPior2, nota)

            Call Buscar_Total_PiorLoja_Mes("Pontuacao.usp_Nota_Buscar_Total_MelhorLoja_Mes_HSA", ano, mes, 1)
            CType(gauge_Pontuacao_Melhor1.Gauges(0), ICircularGauge).Scales(0).Value = nota
            lblFilial_Melhor1.Text = "Filial: " & descFilial
            lblPeriodo_Melhor1.Text = Periodo
            MudaCor(btnMelhor1, nota)

            Call Buscar_Total_PiorLoja_Mes("Pontuacao.usp_Nota_Buscar_Total_MelhorLoja_Mes_HSA", ano, mes, 2)
            CType(gauge_Pontuacao_Melhor2.Gauges(0), ICircularGauge).Scales(0).Value = nota
            lblFilial_Melhor2.Text = "Filial: " & descFilial
            lblPeriodo_Melhor2.Text = Periodo
            MudaCor(btnMelhor2, nota)

            lblPeriodo_Empresa.Text = lblPeriodo_Melhor1.Text

            lblTodasFiliais.Text = "Pontuação - Todas as Filiais - " & lblPeriodo_Melhor1.Text
            lblSuper.Text = "Pontuação - Super - " & lblPeriodo_Melhor1.Text
            lblSuperE.Text = "Pontuação - Super E - " & lblPeriodo_Melhor1.Text
            lblHiper.Text = "Pontuação - Hiper - " & lblPeriodo_Melhor1.Text
            lblRegional205.Text = "Pontuação - Regional Edison - " & lblPeriodo_Melhor1.Text
            lblRegional206.Text = "Pontuação - Regional Mauricio - " & lblPeriodo_Melhor1.Text
            lblRegional214.Text = "Pontuação - Regional João - " & lblPeriodo_Melhor1.Text

            lblDepartamento.Text = lblPeriodo_Melhor1.Text
            lblNaoConforme.Text = "Total de Não-Conforme por Loja - " + lblPeriodo_Melhor1.Text
            lblNaoConformePorDepartamento.Text = "Total de Não-Conforme por Departamento - " + lblPeriodo_Melhor1.Text
            lblNaoConformePorFilial.Text = "Total de Não-Conforme por Loja e Departamento - " + lblPeriodo_Melhor1.Text

            cboGrupo.Text = 8
            cboSubgrupo.Text = 1

            cboGrupo_NA.Text = 8
            cboSubgrupo_NA.Text = 1

            cboFilial_NA.Visible_cboCorporacao = False
            cboFilial_NA.AutoPostBack = True

            '  Graficos 
            ' mySession()

            '---------------------------
            Dim varPeriodo As String = "Semana entre " & myDateTimes.GetFirstDayOfMonth(DateAndTime.Today.AddDays(-1)) & " e " & DateAndTime.Today.AddDays(-1)
            oFun.Grid_Title(grid, "Semana entre " & varPeriodo)
            Call ChangeTitles()
            cboAnoMes.Visible_btnAtualizar = False


            lblError.Text = varDesc

        End If
    End Sub

    Private Sub Buscar_Total_PiorLoja_Mes(ByVal iNomeStoredProcedure As String, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iOrdem As Byte)

        Dim con As New SqlConnection(Conexao.gerCheckList)
        Dim comando As New SqlCommand(iNomeStoredProcedure, con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@numOrdem", SqlDbType.TinyInt))
        comando.Parameters("@numOrdem").Value = iOrdem


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

    Private Sub MudaCor(ByVal iButton As Button, ByVal iNota As Decimal)
        'Select Case iNota
        '    Case Is > 0
        '        iButton.CssClass = "btn btn-default"
        '    Case Is > 70.010000000000005
        '        iButton.CssClass = "btn btn-danger"
        '    Case Is > 90.010000000000005
        '        iButton.CssClass = "btn btn-warning"
        '    Case Is > 95.010000000000005
        '        iButton.CssClass = "btn btn-sucess"
        '    Case Is > 97.010000000000005
        '        iButton.CssClass = "btn btn-primary"
        'End Select

        If iNota > 0.0 And iNota < 70 Then
            iButton.CssClass = "btn btn-danger"
        ElseIf iNota > 70.010000000000005 And iNota < 90 Then
            iButton.CssClass = "btn btn-warning"
        ElseIf iNota > 90.010000000000005 And iNota < 95 Then
            iButton.CssClass = "btn btn-info"
        ElseIf iNota > 95.010000000000005 And iNota < 97 Then
            iButton.CssClass = "btn btn-primary"
        ElseIf iNota > 97.010000000000005 And iNota <= 100 Then
            iButton.CssClass = "btn btn-success"
        End If

    End Sub

    Private Sub mySession()

        If oVen.Year_Return_Actual = cboAnoMes.CallAno Then
            Session("sANO") = Year(DateAndTime.Today.AddDays(-1))
        Else
            Session("sANO") = cboAnoMes.CallAno
        End If


        If oVen.Month_Return_Actual = cboAnoMes.CallMes Then
            Session("sMES") = Month(DateAndTime.Today.AddDays(-1))
        Else
            Session("sMES") = cboAnoMes.CallMes
        End If


        Session("sGRUPO") = cboGrupo.Value
        Session("sSUBGRUPO") = cboSubgrupo.Value

        Session("sGRUPO_NA") = cboGrupo_NA.Value
        Session("sSUBGRUPO_NA") = cboSubgrupo_NA.Value
        Session("sFILIAL_NA") = cboFilial_NA.CallFilial

        Session("sFILIAL") = cboFilial.CallFilial

    End Sub

    Protected Sub graph_PontuacaoTotal_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_PontuacaoTotal.CustomDrawSeriesPoint

        oFun.graph_Pontuacao_CheckList(sender, e)

    End Sub

    Protected Sub graph_SuperE_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_SuperE.CustomDrawSeriesPoint

        oFun.graph_Pontuacao_CheckList(sender, e)

    End Sub

    Protected Sub graph_Hiper_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Hiper.CustomDrawSeriesPoint
        oFun.graph_Pontuacao_CheckList(sender, e)
    End Sub

    Protected Sub graph_PontuacaoTodas_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_PontuacaoTodas.CustomDrawSeriesPoint
        oFun.graph_Pontuacao_CheckList(sender, e)
    End Sub

    Protected Sub graph_Regional205_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Regional205.CustomDrawSeriesPoint
        oFun.graph_Pontuacao_CheckList(sender, e)
    End Sub

    Protected Sub graph_Regional206_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Regional206.CustomDrawSeriesPoint
        oFun.graph_Pontuacao_CheckList(sender, e)
    End Sub

    Protected Sub graph_Regional214_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Regional214.CustomDrawSeriesPoint
        oFun.graph_Pontuacao_CheckList(sender, e)
    End Sub

    Protected Sub cboGrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboGrupo.SelectedIndexChanged
        cboSubgrupo.DataBind()
        If cboSubgrupo.SelectedIndex = -1 Then
            cboSubgrupo.SelectedIndex = 0
        End If
        mySession()
        graph_Subgrupo.DataBind()
    End Sub

    Protected Sub graph_Subgrupo_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Subgrupo.CustomDrawSeriesPoint
        oFun.graph_Pontuacao_CheckList(sender, e)
    End Sub

    Protected Sub cboSubgrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSubgrupo.SelectedIndexChanged
        mySession()
        graph_Subgrupo.DataBind()
    End Sub

    Protected Sub cboGrupo_NA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboGrupo_NA.SelectedIndexChanged
        cboSubgrupo_NA.DataBind()
        If cboSubgrupo_NA.SelectedIndex = -1 Then
            cboSubgrupo_NA.SelectedIndex = 0
        End If
        mySession()
        graphNaoConforme.DataBind()
    End Sub

    Protected Sub cboSubgrupo_NA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSubgrupo_NA.SelectedIndexChanged
        mySession()
        graphNaoConforme.DataBind()
    End Sub

    Protected Sub cboFilial_NA_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial_NA.ListFilialChanged
        mySession()
        graphNaoConformeDepartamentoFilial.DataBind()
    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboAnoMes.CallMes = Month(DateAndTime.Today.AddDays(-1))
            cboAnoMes.CallAno = Year(DateAndTime.Today.AddDays(-1))
            mySession()
            cboSize.CallSize = 100

            Atualizar()

            HideColumnDias()
            ShowColumnDias()
            Call ChangeTitles()

            

        End If
    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()

        Dim varPeriodo As String
        If cboAnoMes.CallMes = Month(DateAndTime.Now) Then
            varPeriodo = "Semana entre " & myDateTimes.GetFirstDayOfMonth(DateAndTime.Today.AddDays(-1)) & " e " & DateAndTime.Today.AddDays(-1)
        Else
            varPeriodo = "Semana entre " & myDateTimes.GetFirstDayOfMonth_baseYearMonth(cboAnoMes.CallMes, cboAnoMes.CallAno) & " e " & myDateTimes.GetLastDayOfMonth(myDateTimes.GetFirstDayOfMonth_baseYearMonth(cboAnoMes.CallMes, cboAnoMes.CallAno))
        End If

        HideColumnDias()
        ShowColumnDias()

        If chkGrupoSub.Checked = True Then
            oFun.Grid_Column_GroupIndex(grid, "listaGrupo", 0)
            oFun.Grid_Column_GroupIndex(grid, "listaSubgrupo", 1)
        Else
            oFun.Grid_Column_GroupIndex(grid, "listaGrupo", -1)
            oFun.Grid_Column_GroupIndex(grid, "listaSubgrupo", -1)
        End If

        grid.DataBind()

        oFun.Grid_Title(grid, varPeriodo)
        Call ChangeTitles()

        divGraph_PontuacaoTotal_Super.Visible = True
        divGraph_PontuacaoTotal_SuperE.Visible = True



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

        If oVen.Month_Return_Actual = cboAnoMes.CallMes Then
            numDiaSemana = DatePart(DateInterval.Day, DateAndTime.Today.AddDays(-1))
        Else
            Select Case cboAnoMes.CallMes
                Case 1, 3, 5, 7, 8, 10, 12
                    numDiaSemana = 31
                Case 4, 6, 9, 11
                    numDiaSemana = 30
                Case 2
                    If oVen.LeapYear(cboAnoMes.CallAno) = False Then
                        numDiaSemana = 28
                    Else
                        numDiaSemana = 29
                    End If
            End Select
        End If



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

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid, "Nota", "Conforme", "Validos", Funcoes.CalculateType.ValueOverRevenue)

        'oCheck.BuscarPontuacaoDiariaPorLoja(cboAnoMes.CallAno, cboAnoMes.CallMes, cboFilial.CallFilial)

        'On Error Resume Next
        'If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
        '    Dia1 = 0
        '    Dia2 = 0
        '    Dia3 = 0
        '    Dia4 = 0
        '    Dia5 = 0
        '    Dia6 = 0
        '    Dia7 = 0
        '    Dia8 = 0
        '    Dia9 = 0

        '    Dia10 = 0
        '    Dia11 = 0
        '    Dia12 = 0
        '    Dia13 = 0
        '    Dia14 = 0
        '    Dia15 = 0
        '    Dia16 = 0
        '    Dia17 = 0
        '    Dia18 = 0
        '    Dia19 = 0

        '    Dia20 = 0
        '    Dia21 = 0
        '    Dia22 = 0
        '    Dia23 = 0
        '    Dia24 = 0
        '    Dia25 = 0
        '    Dia26 = 0
        '    Dia27 = 0
        '    Dia28 = 0
        '    Dia29 = 0

        '    Dia30 = 0
        '    Dia31 = 0
        'End If

        'If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

        '    Dia1 = oCheck.Dia1
        '    Dia2 = oCheck.Dia2
        '    Dia3 = oCheck.Dia3
        '    Dia4 = oCheck.Dia4
        '    Dia5 = oCheck.Dia5
        '    Dia6 = oCheck.Dia6
        '    Dia7 = oCheck.Dia7
        '    Dia8 = oCheck.Dia8
        '    Dia9 = oCheck.Dia9

        '    Dia10 = oCheck.Dia10
        '    Dia11 = oCheck.Dia11
        '    Dia12 = oCheck.Dia12
        '    Dia13 = oCheck.Dia13
        '    Dia14 = oCheck.Dia14
        '    Dia15 = oCheck.Dia15
        '    Dia16 = oCheck.Dia16
        '    Dia17 = oCheck.Dia17
        '    Dia18 = oCheck.Dia18
        '    Dia19 = oCheck.Dia19

        '    Dia20 = oCheck.Dia20
        '    Dia21 = oCheck.Dia21
        '    Dia22 = oCheck.Dia22
        '    Dia23 = oCheck.Dia23
        '    Dia24 = oCheck.Dia24
        '    Dia25 = oCheck.Dia25
        '    Dia26 = oCheck.Dia26
        '    Dia27 = oCheck.Dia27
        '    Dia28 = oCheck.Dia28
        '    Dia29 = oCheck.Dia29

        '    Dia30 = oCheck.Dia30
        '    Dia31 = oCheck.Dia31
        'End If


        'If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia1" Then e.TotalValue = Dia1
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia2" Then e.TotalValue = Dia2
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia3" Then e.TotalValue = Dia3
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia4" Then e.TotalValue = Dia4
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia5" Then e.TotalValue = Dia5
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia6" Then e.TotalValue = Dia6
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia7" Then e.TotalValue = Dia7
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia8" Then e.TotalValue = Dia8
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia9" Then e.TotalValue = Dia9

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia10" Then e.TotalValue = Dia10
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia11" Then e.TotalValue = Dia11
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia12" Then e.TotalValue = Dia12
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia13" Then e.TotalValue = Dia13
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia14" Then e.TotalValue = Dia14
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia15" Then e.TotalValue = Dia15
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia16" Then e.TotalValue = Dia16
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia17" Then e.TotalValue = Dia17
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia18" Then e.TotalValue = Dia18
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia19" Then e.TotalValue = Dia19

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia20" Then e.TotalValue = Dia20
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia21" Then e.TotalValue = Dia21
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia22" Then e.TotalValue = Dia22
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia23" Then e.TotalValue = Dia23
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia24" Then e.TotalValue = Dia24
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia25" Then e.TotalValue = Dia25
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia26" Then e.TotalValue = Dia26
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia27" Then e.TotalValue = Dia27
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia28" Then e.TotalValue = Dia28
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia29" Then e.TotalValue = Dia29

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia30" Then e.TotalValue = Dia30
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dia31" Then e.TotalValue = Dia31

        'End If



    End Sub


    Private Sub ChangeTitles()
        Dim DiaInicial As Date

        DiaInicial = myDateTimes.GetFirstDayOfMonth_baseYearMonth(cboAnoMes.CallMes, cboAnoMes.CallAno)

        oFun.Grid_ColumnTitle(grid, "Dia1", NomeDiaAbreviado(DiaInicial) & " <br />" & CStr(Left(DiaInicial, 5)))
        oFun.Grid_ColumnTitle(grid, "Dia2", NomeDiaAbreviado(DiaInicial.AddDays(1)) & " <br />" & CStr(Left(DiaInicial.AddDays(1), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia3", NomeDiaAbreviado(DiaInicial.AddDays(2)) & " <br />" & CStr(Left(DiaInicial.AddDays(2), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia4", NomeDiaAbreviado(DiaInicial.AddDays(3)) & " <br />" & CStr(Left(DiaInicial.AddDays(3), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia5", NomeDiaAbreviado(DiaInicial.AddDays(4)) & " <br />" & CStr(Left(DiaInicial.AddDays(4), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia6", NomeDiaAbreviado(DiaInicial.AddDays(5)) & " <br />" & CStr(Left(DiaInicial.AddDays(5), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia7", NomeDiaAbreviado(DiaInicial.AddDays(6)) & " <br />" & CStr(Left(DiaInicial.AddDays(6), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia8", NomeDiaAbreviado(DiaInicial.AddDays(7)) & " <br />" & CStr(Left(DiaInicial.AddDays(7), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia9", NomeDiaAbreviado(DiaInicial.AddDays(8)) & " <br />" & CStr(Left(DiaInicial.AddDays(8), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia10", NomeDiaAbreviado(DiaInicial.AddDays(9)) & " <br />" & CStr(Left(DiaInicial.AddDays(9), 5)))

        oFun.Grid_ColumnTitle(grid, "Dia11", NomeDiaAbreviado(DiaInicial.AddDays(10)) & " <br />" & CStr(Left(DiaInicial.AddDays(10), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia12", NomeDiaAbreviado(DiaInicial.AddDays(11)) & " <br />" & CStr(Left(DiaInicial.AddDays(11), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia13", NomeDiaAbreviado(DiaInicial.AddDays(12)) & " <br />" & CStr(Left(DiaInicial.AddDays(12), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia14", NomeDiaAbreviado(DiaInicial.AddDays(13)) & " <br />" & CStr(Left(DiaInicial.AddDays(13), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia15", NomeDiaAbreviado(DiaInicial.AddDays(14)) & " <br />" & CStr(Left(DiaInicial.AddDays(14), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia16", NomeDiaAbreviado(DiaInicial.AddDays(15)) & " <br />" & CStr(Left(DiaInicial.AddDays(15), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia17", NomeDiaAbreviado(DiaInicial.AddDays(16)) & " <br />" & CStr(Left(DiaInicial.AddDays(16), 5)))

        oFun.Grid_ColumnTitle(grid, "Dia18", NomeDiaAbreviado(DiaInicial.AddDays(17)) & " <br />" & CStr(Left(DiaInicial.AddDays(17), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia19", NomeDiaAbreviado(DiaInicial.AddDays(18)) & " <br />" & CStr(Left(DiaInicial.AddDays(18), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia20", NomeDiaAbreviado(DiaInicial.AddDays(19)) & " <br />" & CStr(Left(DiaInicial.AddDays(19), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia21", NomeDiaAbreviado(DiaInicial.AddDays(20)) & " <br />" & CStr(Left(DiaInicial.AddDays(20), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia22", NomeDiaAbreviado(DiaInicial.AddDays(21)) & " <br />" & CStr(Left(DiaInicial.AddDays(21), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia23", NomeDiaAbreviado(DiaInicial.AddDays(22)) & " <br />" & CStr(Left(DiaInicial.AddDays(22), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia24", NomeDiaAbreviado(DiaInicial.AddDays(23)) & " <br />" & CStr(Left(DiaInicial.AddDays(23), 5)))

        oFun.Grid_ColumnTitle(grid, "Dia25", NomeDiaAbreviado(DiaInicial.AddDays(24)) & " <br />" & CStr(Left(DiaInicial.AddDays(24), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia26", NomeDiaAbreviado(DiaInicial.AddDays(25)) & " <br />" & CStr(Left(DiaInicial.AddDays(25), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia27", NomeDiaAbreviado(DiaInicial.AddDays(26)) & " <br />" & CStr(Left(DiaInicial.AddDays(26), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia28", NomeDiaAbreviado(DiaInicial.AddDays(27)) & " <br />" & CStr(Left(DiaInicial.AddDays(27), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia29", NomeDiaAbreviado(DiaInicial.AddDays(28)) & " <br />" & CStr(Left(DiaInicial.AddDays(28), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia30", NomeDiaAbreviado(DiaInicial.AddDays(29)) & " <br />" & CStr(Left(DiaInicial.AddDays(29), 5)))
        oFun.Grid_ColumnTitle(grid, "Dia31", NomeDiaAbreviado(DiaInicial.AddDays(30)) & " <br />" & CStr(Left(DiaInicial.AddDays(30), 5)))

    End Sub

    Public Function NomeDiaAbreviado(ByVal meuDia As Date) As String
        Dim numDiaWeek As Byte
        numDiaWeek = DatePart(DateInterval.Weekday, meuDia, Microsoft.VisualBasic.FirstDayOfWeek.Monday, FirstWeekOfYear.Jan1)
        NomeDiaAbreviado = Choose(numDiaWeek, "Seg", "Ter", "Quar", "Qui", "Sex", "Sáb", "Dom")
    End Function

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

End Class
