
Partial Class Controles_wuc_KPI_Secao_Depto
    Inherits System.Web.UI.UserControl

    Dim oFun As New Funcoes
    Dim oCon As New Conexao
    Dim oMy As New MyFunction

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            'If cboFilial.IsLoja = True Then

            'End If

            '    oFun.Grid_Decimals(grid_KPI_Secao, "vlrVendaOntemAT", Funcoes.CasaDecimais.Nenhuma)
            '    oFun.Grid_Decimals(grid_KPI_Secao, "vlrVendaOntemAA", Funcoes.CasaDecimais.Nenhuma)
            '    'oFun.Grid_Decimals(grid_KPI_Secao, "percCresc_VendaOntem", Funcoes.CasaDecimais.Nenhuma)

            Dim myDia As Date
            myDia = DateAdd(DateInterval.Day, -1, DateAndTime.Now())
            lblMes.Text = oMy.UpperCaseFirstLetter(DateAndTime.MonthName(Month(myDia)))

            lblAno.Text = "Ano " & Year(myDia)

        End If

    End Sub

    'Protected Sub grid_KPI_Secao_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_KPI_Secao.HtmlDataCellPrepared
    '    'oFun.Grid_RedIsNegative(e, "percCresc_VendaOntem")
    'End Sub

    Private Sub Atualizar()
        Session("sFILIAL") = Me.hFilial.Value
        'ONTEM()
        Periodo(lblVenda_Ontem, lblPerc_Ontem, img_Ontem, "KPI_Vendas.uspVendaOntem", 1)

        ' SEMANA
        Periodo(lblVenda_Semana, lblPerc_Semana, img_Semana, "KPI_Vendas.uspVendaSemana", 1)

        ' MES
        Periodo(lblVenda_Mes, lblPerc_Mes, img_Mes, "KPI_Vendas.uspVendaMes", 1)

        ' ANO
        Periodo(lblVenda_Ano, lblPerc_Ano, img_Ano, "KPI_Vendas.uspVendaAno", 1)

        dsGraphMensal.DataBind()



    End Sub

    Private Sub Periodo(ByVal lblValor As Label, lblPerc As Label, myImagem As Image, nomeStoredProcedure As String, Tipo As Byte, Optional ByVal Mes As Byte = 1)

        Dim myAno As Int16 = Year(DateAdd(DateInterval.Day, -30, DateAndTime.Now()))

        If Tipo = 1 Then    'Com base Dia Ontem
            lblValor.Text = CDec(oCon.spScalar_pFilial(Conexao.DW_Condor_One_ConnectionString, nomeStoredProcedure, CByte(Me.hFilial.Value))).ToString("n2")
        Else    'Mensal
            lblValor.Text = CDec(oCon.spScalar_pFilialAnoMes(Conexao.DW_Condor_One_ConnectionString, nomeStoredProcedure, CByte(Me.hFilial.Value), myAno, Mes)).ToString("n2")
        End If

        oFun.Label_RedIsNegative(lblValor)
        If CDbl(lblValor.Text) < 0.0 Then
            lblPerc.ForeColor = Drawing.Color.Red
            myImagem.ImageUrl = "~/image/circle_red.png"
        Else
            lblValor.ForeColor = Drawing.Color.Green
            lblPerc.ForeColor = Drawing.Color.Green
            myImagem.ImageUrl = "~/image/circle green.png"
        End If
    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            If cboFilial.IsLoja Then
                Me.hFilial.Value = cboFilial.CallFilial
            Else
                Me.hFilial.Value = 99

            End If

            'lblFilial.Text = hFilial.Value
            lblFilial.Visible = False
            cboFilial.Visible = False
            Atualizar()
        End If
    End Sub
End Class
