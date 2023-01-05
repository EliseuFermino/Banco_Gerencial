
Partial Class MemberPages_SLV_Analise_Lucro_Depto_Secao
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(422, User.Identity.Name)

            cboPeriodo.AutoPostBack_cboDiaInicial = False
            cboPeriodo.AutoPostBack_cboDiaFinal = False
            cboSize.AutoPostBack = False

            Session("sMERCADOLOGICO") = 1   ' Total
            Session("sOPCAO") = 1   ' Total

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Analise de Lucratividade por Mercadológico - PGR422"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()
            cboSize.CallSize = 100
            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal
        Session("sFILIAL") = cboFilial.CallFilial

        '    Select Case Session("sOPCAO")
        '    Case 1
        '        Session("sMERCADOLOGICO") = 1   ' Total
        '    Case 2
        '        Session("sMERCADOLOGICO") = 2   ' Departamento
        '    Case 3
        '        Session("sMERCADOLOGICO") = 3   ' Seção
        '    Case 4
        '        Session("sMERCADOLOGICO") = 4   ' Grupo
        '    Case 5
        '        Session("sMERCADOLOGICO") = 5   ' Subgrupo
        'End Select

        oFun.Grid_Column_BorderRight(grid, "DiaFinal", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCrescQtde_AA", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCrescVenda_AA", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "vlrLucroTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "vlrLucroComercial", Drawing.Color.Gray, BorderStyle.Dashed, 1)

        oFun.Grid_Column_BorderRight(grid, "percAting_Vendas", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "difMargem", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "numClienteClube", Drawing.Color.Gray, BorderStyle.Solid, 2)

        oFun.Grid_Column_BorderRight(grid, "percAting_LucroPDV", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percAting_LucroFinal", Drawing.Color.Gray, BorderStyle.Dashed, 1)

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
        grid.DataBind()

        '  lblOBS.Text = "Dia Inicial: " & Session("sDIA_INICIAL") & "; Dia Final: " & Session("sDIA_FINAL") & "; Filial: " & Session("sFILIAL") & "; Opção: " & Session("sOPCAO") & "; Mercadologico: " & Session("sMERCADOLOGICO")
        'lblOBS.Visible = True
       

    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)

    End Sub



    Protected Sub grid_HtmlDataCellPrepared1(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percAting_Vendas")
        oFun.Grid_RedIsNegative(e, "percAting_LucroPDV")
        oFun.Grid_RedIsNegative(e, "difMargem")

        oFun.Grid_RedIsNegative(e, "percAting_LucroFinal")
        oFun.Grid_RedIsNegative(e, "difMargemFinal")

        oFun.Grid_RedIsNegative(e, "percCrescQtde_MA")
        oFun.Grid_RedIsNegative(e, "percCrescQtde_AA")
        oFun.Grid_RedIsNegative(e, "percCrescVenda_MA")
        oFun.Grid_RedIsNegative(e, "percCrescVenda_AA")

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared

        Dim myPeriodo As String = Format(cboPeriodo.CallDiaFinal, "MMM")
        Dim myYear As Int16 = Year(cboPeriodo.CallDiaFinal)
        Dim firstLetter As String
        Dim vPeriodo As String

        Select Case Month(cboPeriodo.CallDiaFinal)
            Case 1, 6, 7
                firstLetter = "J"
            Case 2
                firstLetter = "F"
            Case 3, 5
                firstLetter = "M"
            Case 4, 8
                firstLetter = "A"
            Case 9
                firstLetter = "S"
            Case 10
                firstLetter = "O"
            Case 11
                firstLetter = "N"
            Case 12
                firstLetter = "D"

        End Select

        vPeriodo = CStr(firstLetter + Mid(myPeriodo, 2) + "/" + Right(myYear, 2))

        oFun.grid_RowSelectedWhole(grid, e, "desc_AnoMes", vPeriodo, Drawing.Color.LightGreen, True)
    End Sub
End Class

