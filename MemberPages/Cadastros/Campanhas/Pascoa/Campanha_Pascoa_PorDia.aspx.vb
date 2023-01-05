Imports DevExpress.Web

Partial Class MemberPages_Campanhas_Pascoa_Campanha_Pascoa_PorDia
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(209, Page.User.Identity.Name)
            cboFilial.AutoPostBack = True
           
            If Month(Now()) < 2 Then
                Session("sANO") = Year(Now()) - 1
            Else
                Session("sANO") = Year(Now())
            End If

            ' Session("sFILIAL") = 3
            Me.ASPxGridView1.DataBind()
        End If
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Venda Total de Páscoa por Dia - PGR209"
        End If

    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsGroupSummary Then
            If summary.FieldName = "OvosMargem" Then
                Dim OvosVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("OvosVlr")))
                Dim OvosMargemVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("OvosMargemVlr")))
                e.TotalValue = ((OvosMargemVlr / OvosVlr) * 100)
            End If

            If summary.FieldName = "CaixaMargem" Then
                Dim CaixaVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("CaixaVlr")))
                Dim CaixaMargemVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("CaixaMargemVlr")))
                e.TotalValue = ((CaixaMargemVlr / CaixaVlr) * 100)
            End If

            If summary.FieldName = "CoelhoMargem" Then
                Dim CoelhoVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("CoelhoVlr")))
                Dim CoelhoMargemVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("CoelhoMargemVlr")))
                e.TotalValue = ((CoelhoMargemVlr / CoelhoVlr) * 100)
            End If

            If summary.FieldName = "ColombaMargem" Then
                Dim ColombaVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("ColombaVlr")))
                Dim ColombaMargemVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("ColombaMargemVlr")))
                e.TotalValue = ((ColombaMargemVlr / ColombaVlr) * 100)
            End If

            If summary.FieldName = "BacalhauMargem" Then
                Dim BacalhauVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("BacalhauVlr")))
                Dim BacalhauMargemVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("BacalhauMargemVlr")))
                e.TotalValue = ((BacalhauMargemVlr / BacalhauVlr) * 100)
            End If

            If summary.FieldName = "BarrasMargem" Then
                Dim BarrasVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("BarrasVlr")))
                Dim BarrasMargemVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("BarrasMargemVlr")))
                e.TotalValue = ((BarrasMargemVlr / BarrasVlr) * 100)
            End If

            If summary.FieldName = "TotalMargem" Then
                Dim TotalVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("TotalVlr")))
                Dim TotalMargemVlr As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("TotalMargemVlr")))
                e.TotalValue = ((TotalMargemVlr / TotalVlr) * 100)
            End If

        ElseIf e.IsTotalSummary Then
            If summary.FieldName = "OvosMargem" Then
                Dim OvosVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("OvosVlr")))
                Dim OvosMargemVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("OvosMargemVlr")))
                e.TotalValue = ((OvosMargemVlr / OvosVlr) * 100)
            End If

            If summary.FieldName = "CaixaMargem" Then
                Dim CaixaVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("CaixaVlr")))
                Dim CaixaMargemVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("CaixaMargemVlr")))
                e.TotalValue = ((CaixaMargemVlr / CaixaVlr) * 100)
            End If

            If summary.FieldName = "CoelhoMargem" Then
                Dim CoelhoVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("CoelhoVlr")))
                Dim CoelhoMargemVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("CoelhoMargemVlr")))
                e.TotalValue = ((CoelhoMargemVlr / CoelhoVlr) * 100)
            End If

            If summary.FieldName = "ColombaMargem" Then
                Dim ColombaVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("ColombaVlr")))
                Dim ColombaMargemVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("ColombaMargemVlr")))
                e.TotalValue = ((ColombaMargemVlr / ColombaVlr) * 100)
            End If

            If summary.FieldName = "BacalhauMargem" Then
                Dim BacalhauVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("BacalhauVlr")))
                Dim BacalhauMargemVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("BacalhauMargemVlr")))
                e.TotalValue = ((BacalhauMargemVlr / BacalhauVlr) * 100)
            End If

            If summary.FieldName = "BarrasMargem" Then
                Dim BarrasVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("BarrasVlr")))
                Dim BarrasMargemVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("BarrasMargemVlr")))
                e.TotalValue = ((BarrasMargemVlr / BarrasVlr) * 100)
            End If

            If summary.FieldName = "TotalMargem" Then
                Dim TotalVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("TotalVlr")))
                Dim TotalMargemVlr As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("TotalMargemVlr")))
                e.TotalValue = ((TotalMargemVlr / TotalVlr) * 100)
            End If

        End If
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Session("sFILIAL") = Me.cboFilial.CallFilial
        If Month(Now()) < 2 Then
            Session("sANO") = Year(Now()) - 1
        Else
            Session("sANO") = Year(Now())
        End If
        Me.ASPxGridView1.DataBind()
    End Sub



    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        Dim oFun As New Funcoes
        oFun.Grid_Size(ASPxGridView1, cboSize.CallSize)
    End Sub
End Class
