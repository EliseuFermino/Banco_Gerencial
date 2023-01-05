Imports DevExpress.Web

Partial Class Consulta12Meses_MetaGrupo_TodasLojas
    Inherits System.Web.UI.Page

    Private vOri_01 As Decimal = 0
    Private vOri_02 As Decimal = 0
    Private vOri_03 As Decimal = 0
    Private vOri_04 As Decimal = 0
    Private vOri_05 As Decimal = 0
    Private vOri_06 As Decimal = 0
    Private vOri_07 As Decimal = 0
    Private vOri_08 As Decimal = 0
    Private vOri_09 As Decimal = 0
    Private vOri_10 As Decimal = 0
    Private vOri_11 As Decimal = 0
    Private vOri_12 As Decimal = 0
    Private vOri_99 As Decimal = 0
    Private vRea_99 As Decimal = 0
    Private vRea_AA As Decimal = 0

    Private pOri_01 As Decimal = 0
    Private pOri_02 As Decimal = 0
    Private pOri_03 As Decimal = 0
    Private pOri_04 As Decimal = 0
    Private pOri_05 As Decimal = 0
    Private pOri_06 As Decimal = 0
    Private pOri_07 As Decimal = 0
    Private pOri_08 As Decimal = 0
    Private pOri_09 As Decimal = 0
    Private pOri_10 As Decimal = 0
    Private pOri_11 As Decimal = 0
    Private pOri_12 As Decimal = 0
    Private pOri_99 As Decimal = 0
    Private pRea_99 As Decimal = 0
    Private pRea_AA As Decimal = 0

    Private perCrescAA As Decimal = 0
    Private perCrescAT As Decimal = 0

    Dim oFun As New Funcoes

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(175, User.Identity.Name)
            Me.ASPxGridView1.Visible = False

            Dim varAno As Int32
            varAno = Year(Now()) + 1
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False
            Me.cboGrupo.AutoPostBack_cboGrupo = False
            cboSize.CallSize = 100

            Me.cboGrupo.Visible_cboSubgrupo = False
            Me.cboGrupo.Visible_LabelSubGrupo = False

        End If
    End Sub

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sGRUPO") = Me.cboGrupo.CallGrupo
        Session("sPOSICAO") = Me.cboPosicao.CallPosicao
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        oFun.Grid_Title(ASPxGridView1, "Grupo: " & cboGrupo.CallGrupoDesc)
        Me.ASPxGridView1.Visible = True
        Me.ASPxGridView1.DataBind()
    End Sub


    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vOri_01 = 0
            vOri_02 = 0
            vOri_03 = 0
            vOri_04 = 0
            vOri_05 = 0
            vOri_06 = 0
            vOri_07 = 0
            vOri_08 = 0
            vOri_09 = 0
            vOri_10 = 0
            vOri_11 = 0
            vOri_12 = 0
            vOri_99 = 0
            vRea_99 = 0
            vRea_AA = 0

            pOri_01 = 0
            pOri_02 = 0
            pOri_03 = 0
            pOri_04 = 0
            pOri_05 = 0
            pOri_06 = 0
            pOri_07 = 0
            pOri_08 = 0
            pOri_09 = 0
            pOri_10 = 0
            pOri_11 = 0
            pOri_12 = 0
            pOri_99 = 0
            pRea_99 = 0
            pRea_AA = 0

            perCrescAA = 0
            perCrescAT = 0

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idGrupo"))
            If myFilter = 7777 Then
                vOri_01 += Convert.ToDecimal(e.GetValue("vOri_01"))
                vOri_02 += Convert.ToDecimal(e.GetValue("vOri_02"))
                vOri_03 += Convert.ToDecimal(e.GetValue("vOri_03"))
                vOri_04 += Convert.ToDecimal(e.GetValue("vOri_04"))
                vOri_05 += Convert.ToDecimal(e.GetValue("vOri_05"))
                vOri_06 += Convert.ToDecimal(e.GetValue("vOri_06"))
                vOri_07 += Convert.ToDecimal(e.GetValue("vOri_07"))
                vOri_08 += Convert.ToDecimal(e.GetValue("vOri_08"))
                vOri_09 += Convert.ToDecimal(e.GetValue("vOri_09"))
                vOri_10 += Convert.ToDecimal(e.GetValue("vOri_10"))
                vOri_11 += Convert.ToDecimal(e.GetValue("vOri_11"))
                vOri_12 += Convert.ToDecimal(e.GetValue("vOri_12"))
                vOri_99 += Convert.ToDecimal(e.GetValue("vOri_99"))
                vRea_99 += Convert.ToDecimal(e.GetValue("vRea_99"))
                vRea_AA += Convert.ToDecimal(e.GetValue("vRea_AA"))

                pOri_01 += Convert.ToDecimal(e.GetValue("pOri_01"))
                pOri_02 += Convert.ToDecimal(e.GetValue("pOri_02"))
                pOri_03 += Convert.ToDecimal(e.GetValue("pOri_03"))
                pOri_04 += Convert.ToDecimal(e.GetValue("pOri_04"))
                pOri_05 += Convert.ToDecimal(e.GetValue("pOri_05"))
                pOri_06 += Convert.ToDecimal(e.GetValue("pOri_06"))
                pOri_07 += Convert.ToDecimal(e.GetValue("pOri_07"))
                pOri_08 += Convert.ToDecimal(e.GetValue("pOri_08"))
                pOri_09 += Convert.ToDecimal(e.GetValue("pOri_09"))
                pOri_10 += Convert.ToDecimal(e.GetValue("pOri_10"))
                pOri_11 += Convert.ToDecimal(e.GetValue("pOri_11"))
                pOri_12 += Convert.ToDecimal(e.GetValue("pOri_12"))
                pOri_99 += Convert.ToDecimal(e.GetValue("pOri_99"))
                pRea_99 += Convert.ToDecimal(e.GetValue("pRea_99"))
                pRea_AA += Convert.ToDecimal(e.GetValue("pRea_AA"))

                perCrescAA += Convert.ToDecimal(e.GetValue("perCrescAA"))
                perCrescAT += Convert.ToDecimal(e.GetValue("perCrescAT"))
            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_01" Then e.TotalValue = vOri_01
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_02" Then e.TotalValue = vOri_02
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_03" Then e.TotalValue = vOri_03
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_04" Then e.TotalValue = vOri_04
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_05" Then e.TotalValue = vOri_05
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_06" Then e.TotalValue = vOri_06
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_07" Then e.TotalValue = vOri_07
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_08" Then e.TotalValue = vOri_08
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_09" Then e.TotalValue = vOri_09
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_10" Then e.TotalValue = vOri_10
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_11" Then e.TotalValue = vOri_11
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_12" Then e.TotalValue = vOri_12
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vOri_99" Then e.TotalValue = vOri_99
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vRea_99" Then e.TotalValue = vRea_99
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vRea_AA" Then e.TotalValue = vRea_AA

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_01" Then e.TotalValue = pOri_01
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_02" Then e.TotalValue = pOri_02
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_03" Then e.TotalValue = pOri_03
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_04" Then e.TotalValue = pOri_04
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_05" Then e.TotalValue = pOri_05
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_06" Then e.TotalValue = pOri_06
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_07" Then e.TotalValue = pOri_07
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_08" Then e.TotalValue = pOri_08
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_09" Then e.TotalValue = pOri_09
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_10" Then e.TotalValue = pOri_10
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_11" Then e.TotalValue = pOri_11
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_12" Then e.TotalValue = pOri_12
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pOri_99" Then e.TotalValue = pOri_99
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pRea_99" Then e.TotalValue = pRea_99
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pRea_AA" Then e.TotalValue = pRea_AA

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "perCrescAA" Then e.TotalValue = perCrescAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "perCrescAT" Then e.TotalValue = perCrescAT
        End If

        'Me.Label1.Text = oVem.varDesc
    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "vOri_01")
        oFun.Grid_RedIsNegative(e, "vOri_02")
        oFun.Grid_RedIsNegative(e, "vOri_03")
        oFun.Grid_RedIsNegative(e, "vOri_04")
        oFun.Grid_RedIsNegative(e, "vOri_05")
        oFun.Grid_RedIsNegative(e, "vOri_06")
        oFun.Grid_RedIsNegative(e, "vOri_07")
        oFun.Grid_RedIsNegative(e, "vOri_08")
        oFun.Grid_RedIsNegative(e, "vOri_09")
        oFun.Grid_RedIsNegative(e, "vOri_10")
        oFun.Grid_RedIsNegative(e, "vOri_11")
        oFun.Grid_RedIsNegative(e, "vOri_12")
        oFun.Grid_RedIsNegative(e, "vOri_99")
        oFun.Grid_RedIsNegative(e, "vRea_99")
        oFun.Grid_RedIsNegative(e, "vRea_AA")
        oFun.Grid_RedIsNegative(e, "pOri_01")
        oFun.Grid_RedIsNegative(e, "pOri_02")
        oFun.Grid_RedIsNegative(e, "pOri_03")
        oFun.Grid_RedIsNegative(e, "pOri_04")
        oFun.Grid_RedIsNegative(e, "pOri_05")
        oFun.Grid_RedIsNegative(e, "pOri_06")
        oFun.Grid_RedIsNegative(e, "pOri_07")
        oFun.Grid_RedIsNegative(e, "pOri_08")
        oFun.Grid_RedIsNegative(e, "pOri_09")
        oFun.Grid_RedIsNegative(e, "pOri_10")
        oFun.Grid_RedIsNegative(e, "pOri_11")
        oFun.Grid_RedIsNegative(e, "pOri_12")
        oFun.Grid_RedIsNegative(e, "pOri_99")
        oFun.Grid_RedIsNegative(e, "pRea_99")
        oFun.Grid_RedIsNegative(e, "pRea_AA")
        oFun.Grid_RedIsNegative(e, "perCrescAA")
        oFun.Grid_RedIsNegative(e, "perCrescAT")

        oFun.Grid_FillCell_ForeColor_WithFilter(e, "idGrupo", "7777")

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        cboPosicao.Enabled = True
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If IsPostBack Then
            oFun.Grid_ColumnTitle(ASPxGridView1, "bandOrcamento", "Orçamento " & Me.cboAno.CallAno)
            oFun.Grid_ColumnTitle(ASPxGridView1, "bandRealizado", "Realizado " & Me.cboAno.CallAno - 1)
            oFun.Grid_ColumnTitle(ASPxGridView1, "bandRealizadoAA", "Realizado " & Me.cboAno.CallAno - 2)
            oFun.Grid_ColumnTitle(ASPxGridView1, "perCrescAA", Right(Me.cboAno.CallAno, 2) - 1 & " x " & Right(Me.cboAno.CallAno, 2) - 2)
            oFun.Grid_ColumnTitle(ASPxGridView1, "perCrescAT", Right(Me.cboAno.CallAno, 2) & " x " & Right(Me.cboAno.CallAno, 2) - 1)
        End If
        CType(Master.FindControl("lblTitle"), Label).Text = "Orçamento - Despesas 12 Meses - Todas Filiais - por Grupo - PGR175'"
    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "ASPxGridView1"
    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idGrupo", "7777", System.Drawing.Color.LightGreen, True)
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(ASPxGridView1, cboSize.CallSize)
    End Sub
End Class
