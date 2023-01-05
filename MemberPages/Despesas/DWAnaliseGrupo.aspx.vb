
Partial Class MemberPages_Despesas_DWAnaliseGrupo
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(0, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False



        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Titulo - PGR000"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboSize.CallSize = 100
            mySession()

            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sFILIAL") = cboFilial.CallFilial
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        oFun.Grid_Title(grid, "Titulo do Formulário")

        OcultarTodos()

        Select Case cboListaVer.Value
            Case 1  'Meta
                Ver_Meta()
            Case 2 'Realizado
                Ver_Realizado()
        End Select


        Me.grid.DataBind()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

    Private Sub OcultarTodos()

        oFun.Grid_Column_Visible(grid, "Mes1m", False)
        oFun.Grid_Column_Visible(grid, "Perc1m", False)
        oFun.Grid_Column_Visible(grid, "Mes1v", False)
        oFun.Grid_Column_Visible(grid, "Perc1v", False)
        oFun.Grid_Column_Visible(grid, "Mes1d", False)
        oFun.Grid_Column_Visible(grid, "Perc1d", False)
        oFun.Grid_Column_Visible(grid, "Mes2m", False)
        oFun.Grid_Column_Visible(grid, "Perc2m", False)
        oFun.Grid_Column_Visible(grid, "Mes2v", False)
        oFun.Grid_Column_Visible(grid, "Perc2v", False)
        oFun.Grid_Column_Visible(grid, "Mes2d", False)
        oFun.Grid_Column_Visible(grid, "Perc2d", False)
        oFun.Grid_Column_Visible(grid, "Mes3m", False)
        oFun.Grid_Column_Visible(grid, "Perc3m", False)
        oFun.Grid_Column_Visible(grid, "Mes3v", False)
        oFun.Grid_Column_Visible(grid, "Perc3v", False)
        oFun.Grid_Column_Visible(grid, "Mes3d", False)
        oFun.Grid_Column_Visible(grid, "Perc3d", False)
        oFun.Grid_Column_Visible(grid, "Mes4m", False)
        oFun.Grid_Column_Visible(grid, "Perc4m", False)
        oFun.Grid_Column_Visible(grid, "Mes4v", False)
        oFun.Grid_Column_Visible(grid, "Perc4v", False)
        oFun.Grid_Column_Visible(grid, "Mes4d", False)
        oFun.Grid_Column_Visible(grid, "Perc4d", False)
        oFun.Grid_Column_Visible(grid, "Mes5m", False)
        oFun.Grid_Column_Visible(grid, "Perc5m", False)
        oFun.Grid_Column_Visible(grid, "Mes5v", False)
        oFun.Grid_Column_Visible(grid, "Perc5v", False)
        oFun.Grid_Column_Visible(grid, "Mes5d", False)
        oFun.Grid_Column_Visible(grid, "Perc5d", False)
        oFun.Grid_Column_Visible(grid, "Mes6m", False)
        oFun.Grid_Column_Visible(grid, "Perc6m", False)
        oFun.Grid_Column_Visible(grid, "Mes6v", False)
        oFun.Grid_Column_Visible(grid, "Perc6v", False)
        oFun.Grid_Column_Visible(grid, "Mes6d", False)
        oFun.Grid_Column_Visible(grid, "Perc6d", False)
        oFun.Grid_Column_Visible(grid, "Mes7m", False)
        oFun.Grid_Column_Visible(grid, "Perc7m", False)
        oFun.Grid_Column_Visible(grid, "Mes7v", False)
        oFun.Grid_Column_Visible(grid, "Perc7v", False)
        oFun.Grid_Column_Visible(grid, "Mes7d", False)
        oFun.Grid_Column_Visible(grid, "Perc7d", False)
        oFun.Grid_Column_Visible(grid, "Mes8m", False)
        oFun.Grid_Column_Visible(grid, "Perc8m", False)
        oFun.Grid_Column_Visible(grid, "Mes8v", False)
        oFun.Grid_Column_Visible(grid, "Perc8v", False)
        oFun.Grid_Column_Visible(grid, "Mes8d", False)
        oFun.Grid_Column_Visible(grid, "Perc8d", False)
        oFun.Grid_Column_Visible(grid, "Mes9m", False)
        oFun.Grid_Column_Visible(grid, "Perc9m", False)
        oFun.Grid_Column_Visible(grid, "Mes9v", False)
        oFun.Grid_Column_Visible(grid, "Perc9v", False)
        oFun.Grid_Column_Visible(grid, "Mes9d", False)
        oFun.Grid_Column_Visible(grid, "Perc9d", False)
        oFun.Grid_Column_Visible(grid, "Mes10m", False)
        oFun.Grid_Column_Visible(grid, "Perc10m", False)
        oFun.Grid_Column_Visible(grid, "Mes10v", False)
        oFun.Grid_Column_Visible(grid, "Perc10v", False)
        oFun.Grid_Column_Visible(grid, "Mes10d", False)
        oFun.Grid_Column_Visible(grid, "Perc10d", False)
        oFun.Grid_Column_Visible(grid, "Mes11m", False)
        oFun.Grid_Column_Visible(grid, "Perc11m", False)
        oFun.Grid_Column_Visible(grid, "Mes11v", False)
        oFun.Grid_Column_Visible(grid, "Perc11v", False)
        oFun.Grid_Column_Visible(grid, "Mes11d", False)
        oFun.Grid_Column_Visible(grid, "Perc11d", False)
        oFun.Grid_Column_Visible(grid, "Mes12m", False)
        oFun.Grid_Column_Visible(grid, "Perc12m", False)
        oFun.Grid_Column_Visible(grid, "Mes12v", False)
        oFun.Grid_Column_Visible(grid, "Perc12v", False)
        oFun.Grid_Column_Visible(grid, "Mes12d", False)
        oFun.Grid_Column_Visible(grid, "Perc12d", False)
        oFun.Grid_Column_Visible(grid, "Mes14m", False)
        oFun.Grid_Column_Visible(grid, "Perc14m", False)
        oFun.Grid_Column_Visible(grid, "Mes14v", False)
        oFun.Grid_Column_Visible(grid, "Perc14v", False)
        oFun.Grid_Column_Visible(grid, "Mes14d", False)
        oFun.Grid_Column_Visible(grid, "Perc14d", False)
        oFun.Grid_Column_Visible(grid, "Mes24m", False)
        oFun.Grid_Column_Visible(grid, "Perc24m", False)
        oFun.Grid_Column_Visible(grid, "Mes24v", False)
        oFun.Grid_Column_Visible(grid, "Perc24v", False)
        oFun.Grid_Column_Visible(grid, "Mes24d", False)
        oFun.Grid_Column_Visible(grid, "Perc24d", False)
        oFun.Grid_Column_Visible(grid, "Mes34m", False)
        oFun.Grid_Column_Visible(grid, "Perc34m", False)
        oFun.Grid_Column_Visible(grid, "Mes34v", False)
        oFun.Grid_Column_Visible(grid, "Perc34v", False)
        oFun.Grid_Column_Visible(grid, "Mes34d", False)
        oFun.Grid_Column_Visible(grid, "Perc34d", False)
        oFun.Grid_Column_Visible(grid, "Mes77m", False)
        oFun.Grid_Column_Visible(grid, "Perc77m", False)
        oFun.Grid_Column_Visible(grid, "Mes77v", False)
        oFun.Grid_Column_Visible(grid, "Perc77v", False)
        oFun.Grid_Column_Visible(grid, "Mes77d", False)
        oFun.Grid_Column_Visible(grid, "Perc77d", False)
        oFun.Grid_Column_Visible(grid, "Mes99m", False)
        oFun.Grid_Column_Visible(grid, "Perc99m", False)
        oFun.Grid_Column_Visible(grid, "Mes99v", False)
        oFun.Grid_Column_Visible(grid, "Perc99v", False)
        oFun.Grid_Column_Visible(grid, "Mes99d", False)
        oFun.Grid_Column_Visible(grid, "Perc99d", False)
    End Sub

    Private Sub Ver(ByVal iValor As String, iPerc As String)
        Dim vTipo As Byte = 1

        Select Case vTipo
            Case 1  'Valor
                oFun.Grid_Column_Visible(grid, iValor, True)
            Case 2  'Percentual
                oFun.Grid_Column_Visible(grid, iPerc, True)
            Case 3  'Valor e Percentual
                oFun.Grid_Column_Visible(grid, iValor, True)
                oFun.Grid_Column_Visible(grid, iPerc, True)
        End Select
    End Sub

    Private Sub Ver_Realizado()
        Ver("Mes1v", "Perc1v")
        Ver("Mes2v", "Perc2v")
        Ver("Mes3v", "Perc3v")
        Ver("Mes4v", "Perc4v")
        Ver("Mes5v", "Perc5v")
        Ver("Mes6v", "Perc6v")
        Ver("Mes7v", "Perc7v")
        Ver("Mes8v", "Perc8v")
        Ver("Mes9v", "Perc9v")
        Ver("Mes10v", "Perc10v")
        Ver("Mes11v", "Perc11v")
        Ver("Mes12v", "Perc12v")
        Ver("Mes14v", "Perc14v")
        Ver("Mes24v", "Perc24v")
        Ver("Mes34v", "Perc34v")
        Ver("Mes77v", "Perc77v")
        Ver("Mes99v", "Perc99v")
        Formatar_Realizado()
    End Sub

    Private Sub Ver_Meta()
        Ver("Mes1m", "Perc1m")
        Ver("Mes2m", "Perc2m")
        Ver("Mes3m", "Perc3m")
        Ver("Mes4m", "Perc4m")
        Ver("Mes5m", "Perc5m")
        Ver("Mes6m", "Perc6m")
        Ver("Mes7m", "Perc7m")
        Ver("Mes8m", "Perc8m")
        Ver("Mes9m", "Perc9m")
        Ver("Mes10m", "Perc10m")
        Ver("Mes11m", "Perc11m")
        Ver("Mes12m", "Perc12m")
        Ver("Mes14m", "Perc14m")
        Ver("Mes24m", "Perc24m")
        Ver("Mes34m", "Perc34m")
        Ver("Mes77m", "Perc77m")
        Ver("Mes99m", "Perc99m")

        Formatar_Meta()
    End Sub


    Private Sub Formatar_Realizado()
        oFun.Grid_ColumnFormat(grid, "Mes1v", "Janeiro", "Despesas do Mês de Janeiro", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes2v", "Fevereiro", "Despesas do Mês de Fevereiro", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes3v", "Março", "Despesas do Mês de Março", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes4v", "Abril", "Despesas do Mês de Abril", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes5v", "Maio", "Despesas do Mês de maio", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes6v", "Junho", "Despesas do Mês de Junho", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes7v", "Julho", "Despesas do Mês de Julho", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes8v", "Agosto", "Despesas do Mês de Agosto", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes9v", "Setembro", "Despesas do Mês de Setembro", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes10v", "Outubro", "Despesas do Mês de Outubro", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes11v", "Novembro", "Despesas do Mês de Novembro", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes12v", "Dezembro", "Despesas do Mês de Dezembro", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes14v", "1º Quadrimestre", "Despesas do 1º Quadrimestre", Funcoes.CasaDecimais.Nenhuma, 100)
        oFun.Grid_ColumnFormat(grid, "Mes24v", "2º Quadrimestre", "Despesas do 2º Quadrimestre", Funcoes.CasaDecimais.Nenhuma, 100)
        oFun.Grid_ColumnFormat(grid, "Mes34v", "3º Quadrimestre", "Despesas do 3º Quadrimestre", Funcoes.CasaDecimais.Nenhuma, 100)
        oFun.Grid_ColumnFormat(grid, "Mes77v", "Acumulado", "Despesas do Acumulado", Funcoes.CasaDecimais.Nenhuma, 100)
        oFun.Grid_ColumnFormat(grid, "Mes99v", "Ano", "Despesas do Ano", Funcoes.CasaDecimais.Nenhuma, 80)
    End Sub

    Private Sub Formatar_Meta()
        oFun.Grid_ColumnFormat(grid, "Mes1m", "Janeiro", "Meta de Despesas do Mês de Janeiro", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes2m", "Fevereiro", "Meta de Despesas do Mês de Fevereiro", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes3m", "Março", "Meta de Despesas do Mês de Março", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes4m", "Abril", "Meta de Despesas do Mês de Abril", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes5m", "Maio", "Meta de Despesas do Mês de maio", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes6m", "Junho", "Meta de Despesas do Mês de Junho", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes7m", "Julho", "Meta de Despesas do Mês de Julho", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes8m", "Agosto", "Meta de Despesas do Mês de Agosto", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes9m", "Setembro", "Meta de Despesas do Mês de Setembro", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes10m", "Outubro", "Meta de Despesas do Mês de Outubro", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes11m", "Novembro", "Meta de Despesas do Mês de Novembro", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes12m", "Dezembro", "Meta de Despesas do Mês de Dezembro", Funcoes.CasaDecimais.Nenhuma)
        oFun.Grid_ColumnFormat(grid, "Mes14m", "1º Quadrimestre", "Meta de Despesas do 1º Quadrimestre", Funcoes.CasaDecimais.Nenhuma, 100)
        oFun.Grid_ColumnFormat(grid, "Mes24m", "2º Quadrimestre", "Meta de Despesas do 2º Quadrimestre", Funcoes.CasaDecimais.Nenhuma, 100)
        oFun.Grid_ColumnFormat(grid, "Mes34m", "3º Quadrimestre", "Meta de Despesas do 3º Quadrimestre", Funcoes.CasaDecimais.Nenhuma, 100)
        oFun.Grid_ColumnFormat(grid, "Mes77m", "Acumulado", "Meta de Despesas do Acumulado", Funcoes.CasaDecimais.Nenhuma, 100)
        oFun.Grid_ColumnFormat(grid, "Mes99m", "Ano", "Meta de Despesas do Ano", Funcoes.CasaDecimais.Nenhuma, 80)
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "Mes1v")
        oFun.Grid_RedIsNegative(e, "Mes2v")
        oFun.Grid_RedIsNegative(e, "Mes3v")
        oFun.Grid_RedIsNegative(e, "Mes4v")
        oFun.Grid_RedIsNegative(e, "Mes5v")
        oFun.Grid_RedIsNegative(e, "Mes6v")
        oFun.Grid_RedIsNegative(e, "Mes7v")
        oFun.Grid_RedIsNegative(e, "Mes8v")
        oFun.Grid_RedIsNegative(e, "Mes9v")
        oFun.Grid_RedIsNegative(e, "Mes10v")
        oFun.Grid_RedIsNegative(e, "Mes11v")
        oFun.Grid_RedIsNegative(e, "Mes12v")
        oFun.Grid_RedIsNegative(e, "Mes14v")
        oFun.Grid_RedIsNegative(e, "Mes24v")
        oFun.Grid_RedIsNegative(e, "Mes34v")
        oFun.Grid_RedIsNegative(e, "Mes77v")
        oFun.Grid_RedIsNegative(e, "Mes99v")
    End Sub
End Class


