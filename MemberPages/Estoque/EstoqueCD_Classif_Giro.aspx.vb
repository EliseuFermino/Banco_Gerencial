Imports DevExpress.Web

Partial Class MemberPages_Estoque_EstoqueCD_Classif_Giro
    Inherits System.Web.UI.Page

    Dim oVen As New VendaEmpresaMes
    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            oVen.AtualizarEstatisticaPrograma(288, User.Identity.Name)



            'oFun.Grid_Column_BorderRight(grid, "nomeProduto", Drawing.Color.Gray, BorderStyle.Solid, 1)
            ' oFun.Grid_Column_BorderRight(gridDetail_Secao, "Cobertura", Drawing.Color.Gray, BorderStyle.Solid, 1)
            'oFun.Grid_Column_BorderRight(gridDetail_Secao, "TotalEstoque", Drawing.Color.Gray, BorderStyle.Solid, 1)
            'oFun.Grid_Column_BorderRight(grid, "DiaUltimaEntrada", Drawing.Color.Gray, BorderStyle.Solid, 1)
            'oFun.Grid_Column_BorderRight(grid, "QTDEMBALAGEM", Drawing.Color.Gray, BorderStyle.Solid, 1)
            'oFun.Grid_Column_BorderRight(gridDetail_Secao, "Depto", Drawing.Color.Gray, BorderStyle.Solid, 1)


            cboFilial.Visible_cboCorporacao = False

            cboSize.CallSize = 100

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Estoque do CD - por Classificação Giro por Quantidade - PGR288"
        End If
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        'oFun.Grid_Size(gridDetail_Secao, cboSize.CallSize)

        'Select Case cboSize.CallSize
        '    Case 100
        '        gridDetail_Secao.SettingsPager.PageSize = 17
        '    Case 110
        '        gridDetail_Secao.SettingsPager.PageSize = 20
        '    Case 120
        '        gridDetail_Secao.SettingsPager.PageSize = 22
        '    Case 130
        '        gridDetail_Secao.SettingsPager.PageSize = 23
        '    Case 140
        '        gridDetail_Secao.SettingsPager.PageSize = 25
        '    Case 150
        '        gridDetail_Secao.SettingsPager.PageSize = 26
        '    Case 160
        '        gridDetail_Secao.SettingsPager.PageSize = 29
        '    Case 170
        '        gridDetail_Secao.SettingsPager.PageSize = 32
        '    Case 180
        '        gridDetail_Secao.SettingsPager.PageSize = 33
        '    Case 190
        '        gridDetail_Secao.SettingsPager.PageSize = 34
        'End Select
        'Me.gridDetail_Secao.DataBind()
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()

        mySession()
        AtualizarTitulo()



        Me.grid.DataBind()
    End Sub

    Private Sub mySession()
        Session("sFILIAL") = cboFilial.CallFilial

    End Sub

    Private Sub AtualizarTitulo()
        Dim myDia As Date
        myDia = DateAndTime.Today()
        oFun.Grid_Title(grid, "Posição do Estoque - " & cboFilial.CallFilialNome & " em " & myDia)
    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            AtualizarTitulo()
        End If
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next
        Dim MDV_Days As String = CStr(120)
        'oFun.Grid_Footer_Calculate(sender, e, gridDetail_Secao, "Cobertura", "QtdeEstoque", "MDV_Qtde", Funcoes.CalculateType.Division)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "Cobertura")
        oFun.Grid_RedIsNegative(e, "QtdeEstoque")
        oFun.Grid_RedIsNegative(e, "TotalEstoque")
        oFun.Grid_RedIsNegative(e, "Caixa")
    End Sub

  
    Protected Sub gridDetail_Secao_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sDEPTO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub


    Protected Sub gridDetail_Grupo_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sSECAO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

End Class
