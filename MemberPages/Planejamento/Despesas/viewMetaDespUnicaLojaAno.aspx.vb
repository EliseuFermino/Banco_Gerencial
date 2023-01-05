Imports DevExpress.Web


Partial Class MemberPages_Planejamento_Despesas_viewMetaDespUnicaLojaMes
    Inherits System.Web.UI.Page

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sAno") = Me.cboAno.CallAno
        Call Atualizar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFilial") = Me.cboFilial.CallFilial
        Call Atualizar()
    End Sub

    Protected Sub cboPosicao_ListPosicaoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboPosicao.ListPosicaoChanged
        Session("sPosicao") = Me.cboPosicao.CallPosicao
    End Sub

    Sub Atualizar()
        Dim oBI As New BI
        oBI.BuscaGrupoAno_Ori(1, Me.cboFilial.CallFilial, Me.cboAno.CallAno, 1)
        Me.lblVenda.Text = oBI.vlrOri
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(ByVal sender As Object, ByVal e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next
        If e.Item.FieldName = "perc" Then
            Dim Meta As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlr")

            Dim vMeta As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(Meta))
            Dim vVenda As Decimal = Me.lblVenda.Text

            If vMeta > 0 Then
                e.TotalValue = ((vMeta / vVenda) * 100).ToString("n2")
            End If

        End If


    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        If e.DataColumn.FieldName = "vlr" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "perc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Me.cboAno.AutoPostBack = True
            Me.cboFilial.AutoPostBack = True

            Me.cboAno.AnoInicial = 2014
            Me.cboAno.AnoFinal = Year(DateAndTime.Now().AddYears(1))

            If Month(Now()) > 9 Then
                Me.cboAno.CallAno = Year(Now()) + 1
            Else
                Me.cboAno.CallAno = Year(Now())
            End If

        End If
    End Sub

    Protected Sub ASPxButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButton1.Click
        Me.ExporterExcel1.WriteXlsToResponse()
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Session("sAno") = Me.cboAno.CallAno
            Session("sFilial") = Me.cboFilial.CallFilial
            Session("sPosicao") = Me.cboPosicao.CallPosicao
            Call Atualizar()
        End If

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Call Atualizar()
            Me.ASPxGridView1.DataBind()
            Call Atualizar()
        End If
    End Sub
End Class
