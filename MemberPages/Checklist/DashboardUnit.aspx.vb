Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing


Partial Class MemberPages_Checklist_DashboardUnit
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
            'Dim oDB As New clDataDb
            'Dim ontem As Date
            'ontem = DateAndTime.Today.AddDays(-1)

            'Dim ano As Int16 = Year(ontem)
            'Dim mes As Byte = Month(ontem)
            'Dim idRegional As Byte = CByte(cboFilial_NA.idRegional)

            ' Dim varPeriodo As String = "Semana entre " & oTime.FirstDateOfWeek(Year(cboDia.CallDia), oTime.GetWeekNumber(cboDia.CallDia)) & " e " & DateAndTime.DateAdd(DateInterval.Day, +6, oTime.FirstDateOfWeek(Year(cboDia.CallDia), oTime.GetWeekNumber(cboDia.CallDia)))

            oVen.AtualizarEstatisticaPrograma(323, User.Identity.Name)



            'CType(gauge_Pontuacao_Empresa.Gauges(0), ICircularGauge).Scales(0).Value = oDB.ExecuteStoredProcedure_Scalar("Pontuacao.usp_Nota_Buscar_Total_Regional_Mes", Conexao.gerCheckList, "Ano", ano, "mes", mes, "idRegional", idRegional)

            'Call Buscar_Total_PiorLoja_Mes("Pontuacao.usp_Nota_Buscar_Total_PiorLoja_Mes_Regional", ano, mes, 1, idRegional)
            'CType(gauge_Pontuacao_Pior1.Gauges(0), ICircularGauge).Scales(0).Value = nota
            'lblFilial_Pior1.Text = "Filial: " & descFilial
            'lblPeriodo_Pior1.Text = Periodo
            'MudaCor(btnPior1, nota)

            'Call Buscar_Total_PiorLoja_Mes("Pontuacao.usp_Nota_Buscar_Total_PiorLoja_Mes_Regional", ano, mes, 2, idRegional)
            'CType(gauge_Pontuacao_Pior2.Gauges(0), ICircularGauge).Scales(0).Value = nota
            'lblFilial_Pior2.Text = "Filial: " & descFilial
            'lblPeriodo_Pior2.Text = Periodo
            'MudaCor(btnPior2, nota)

            'Call Buscar_Total_PiorLoja_Mes("Pontuacao.usp_Nota_Buscar_Total_MelhorLoja_Mes_Regional", ano, mes, 1, idRegional)
            'CType(gauge_Pontuacao_Melhor1.Gauges(0), ICircularGauge).Scales(0).Value = nota
            'lblFilial_Melhor1.Text = "Filial: " & descFilial
            'lblPeriodo_Melhor1.Text = Periodo
            'MudaCor(btnMelhor1, nota)

            'Call Buscar_Total_PiorLoja_Mes("Pontuacao.usp_Nota_Buscar_Total_MelhorLoja_Mes_Regional", ano, mes, 2, idRegional)
            'CType(gauge_Pontuacao_Melhor2.Gauges(0), ICircularGauge).Scales(0).Value = nota
            'lblFilial_Melhor2.Text = "Filial: " & descFilial
            'lblPeriodo_Melhor2.Text = Periodo
            'MudaCor(btnMelhor2, nota)

            'lblPeriodo_Empresa.Text = lblPeriodo_Melhor1.Text


            'lblRegional206.Text = "Pontuação - Regional Mauricio - " & lblPeriodo_Melhor1.Text


            'lblDepartamento.Text = lblPeriodo_Melhor1.Text
            'lblNaoConforme.Text = "Total de Não-Conforme por Loja - " + lblPeriodo_Melhor1.Text
            'lblNaoConformePorDepartamento.Text = "Total de Não-Conforme por Departamento - " + lblPeriodo_Melhor1.Text
            'lblNaoConformePorFilial.Text = "Total de Não-Conforme por Loja e Departamento - " + lblPeriodo_Melhor1.Text

            cboGrupo.Text = 1
            cboSubgrupo.Text = 1

            cboGrupo_NA.Text = 1
            cboSubgrupo_NA.Text = 1

            cboFilial_NA.Visible_cboCorporacao = False
            cboFilial_NA.AutoPostBack = True


            oFun.Grid_Column_BorderRight(grid_Notas, "Descricao", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Notas, "mes1Q", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Notas, "mes2Q", Drawing.Color.Gray, BorderStyle.Solid, 2)

            ''  Graficos 
            ''mySession()




            'lblError.Text = varDesc

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

        Session("sANO") = Year(DateAndTime.Today.AddDays(-1))
        Session("sMES") = Month(DateAndTime.Today.AddDays(-1))
        Session("sGRUPO") = cboGrupo.Value
        Session("sSUBGRUPO") = cboSubgrupo.Value
        Session("sREGIONAL") = cboFilial_NA.idRegional

        Session("sGRUPO_NA") = cboGrupo_NA.Value
        Session("sSUBGRUPO_NA") = cboSubgrupo_NA.Value
        Session("sFILIAL_NA") = cboFilial_NA.CallFilial

    End Sub

    Protected Sub graph_Regional206_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Regional206.CustomDrawSeriesPoint
        oFun.graph_Pontuacao_CheckList(sender, e)
    End Sub

    Protected Sub cboGrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboGrupo.SelectedIndexChanged
        cboSubgrupo.DataBind()
        If cboSubgrupo.SelectedIndex = -1 Then
            cboSubgrupo.SelectedIndex = 0
        End If
        Session("sGRUPO") = cboGrupo.Value
        Session("sSUBGRUPO") = cboSubgrupo.Value
        graph_Subgrupo.DataBind()
    End Sub

    Protected Sub graph_Subgrupo_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Subgrupo.CustomDrawSeriesPoint
        oFun.graph_Pontuacao_CheckList(sender, e)
    End Sub

    Protected Sub cboSubgrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSubgrupo.SelectedIndexChanged
        Session("sSUBGRUPO") = cboSubgrupo.Value
        graph_Subgrupo.DataBind()
    End Sub

    Protected Sub cboGrupo_NA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboGrupo_NA.SelectedIndexChanged
        cboSubgrupo_NA.DataBind()
        If cboSubgrupo_NA.SelectedIndex = -1 Then
            cboSubgrupo_NA.SelectedIndex = 0
        End If
        Session("sGRUPO_NA") = cboGrupo_NA.Value
        Session("sSUBGRUPO_NA") = cboSubgrupo_NA.Value
        graphNaoConforme.DataBind()
    End Sub

    Protected Sub cboSubgrupo_NA_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSubgrupo_NA.SelectedIndexChanged

        Session("sSUBGRUPO_NA") = cboSubgrupo_NA.Value
        graphNaoConforme.DataBind()
    End Sub

    Protected Sub cboFilial_NA_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial_NA.ListFilialChanged
        Session("sFILIAL_NA") = cboFilial_NA.CallFilial
        graphNaoConformeDepartamentoFilial.DataBind()
    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()
            graphNaoConformeDepartamentoFilial.DataBind()
            graph_Subgrupo.DataBind()

            Dim oDB As New clDataDb
            Dim ontem As Date
            ontem = DateAndTime.Today.AddDays(-1)

            Dim ano As Int16 = Year(ontem)
            Dim mes As Byte = Month(ontem)
            Dim idRegional As Byte = CByte(cboFilial_NA.idRegional)

            lblNomeRegional.Text = "Regional " & cboFilial_NA.nomeUsuario
            lblRelogios.Text = "Pontuação - Regional " & cboFilial_NA.nomeUsuario & " - Melhores e Piores Lojas"

            CType(gauge_Pontuacao_Empresa.Gauges(0), ICircularGauge).Scales(0).Value = oDB.ExecuteStoredProcedure_Scalar("Pontuacao.usp_Nota_Buscar_Total_Regional_Mes", Conexao.gerCheckList, "Ano", ano, "mes", mes, "idRegional", idRegional)

            Call Buscar_Total_PiorLoja_Mes("Pontuacao.usp_Nota_Buscar_Total_PiorLoja_Mes_Regional", ano, mes, 1, idRegional)
            CType(gauge_Pontuacao_Pior1.Gauges(0), ICircularGauge).Scales(0).Value = nota
            lblFilial_Pior1.Text = "Filial: " & descFilial
            lblPeriodo_Pior1.Text = Periodo
            MudaCor(btnPior1, nota)

            Call Buscar_Total_PiorLoja_Mes("Pontuacao.usp_Nota_Buscar_Total_PiorLoja_Mes_Regional", ano, mes, 2, idRegional)
            CType(gauge_Pontuacao_Pior2.Gauges(0), ICircularGauge).Scales(0).Value = nota
            lblFilial_Pior2.Text = "Filial: " & descFilial
            lblPeriodo_Pior2.Text = Periodo
            MudaCor(btnPior2, nota)

            Call Buscar_Total_PiorLoja_Mes("Pontuacao.usp_Nota_Buscar_Total_MelhorLoja_Mes_Regional", ano, mes, 1, idRegional)
            CType(gauge_Pontuacao_Melhor1.Gauges(0), ICircularGauge).Scales(0).Value = nota
            lblFilial_Melhor1.Text = "Filial: " & descFilial
            lblPeriodo_Melhor1.Text = Periodo
            MudaCor(btnMelhor1, nota)

            Call Buscar_Total_PiorLoja_Mes("Pontuacao.usp_Nota_Buscar_Total_MelhorLoja_Mes_Regional", ano, mes, 2, idRegional)
            CType(gauge_Pontuacao_Melhor2.Gauges(0), ICircularGauge).Scales(0).Value = nota
            lblFilial_Melhor2.Text = "Filial: " & descFilial
            lblPeriodo_Melhor2.Text = Periodo
            MudaCor(btnMelhor2, nota)

            lblPeriodo_Empresa.Text = lblPeriodo_Melhor1.Text


            lblRegional206.Text = "Pontuação - Regional " & cboFilial_NA.nomeUsuario & " - " & lblPeriodo_Melhor1.Text


            lblDepartamento.Text = "Pontuação - Regional " & cboFilial_NA.nomeUsuario & " - " & lblPeriodo_Melhor1.Text
            lblNaoConforme.Text = "Total de Não-Conforme por Loja - Regional " & cboFilial_NA.nomeUsuario & " - " & lblPeriodo_Melhor1.Text
            lblNaoConformePorDepartamento.Text = "Total de Não-Conforme por Departamento - Regional " & cboFilial_NA.nomeUsuario & " - " & lblPeriodo_Melhor1.Text
            lblNaoConformePorFilial.Text = "Total de Não-Conforme por Loja e Departamento - Regional " & cboFilial_NA.nomeUsuario & " - " & lblPeriodo_Melhor1.Text


            'lblError.Text = Session("sANO") & " - " & Session("sMES") & " - " & Session("sGRUPO") & " - " & Session("sSUBGRUPO") & " - " & Session("sREGIONAL")


        End If
    End Sub

End Class
