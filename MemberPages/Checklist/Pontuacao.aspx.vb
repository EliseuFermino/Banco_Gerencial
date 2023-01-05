Imports DevExpress.Web
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_CheckList_Pontuacao
    Inherits System.Web.UI.Page
    Private connManager As String = clData_gerManager.dbConnect  '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"


    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
    End Sub

    Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
    End Sub

    Protected Sub cboMes_ListMesChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            Session("sANO") = Me.cboAno.CallAno
            Session("sFILIAL") = Me.cboFilial.CallFilial
            Session("sMES") = Me.cboMes.CallMes
            Me.cboFilial.Visible_cboCorporacao = False
            oVem.AtualizarEstatisticaPrograma(67, User.Identity.Name)
        End If
    End Sub

    Protected Sub ASPxGridView2_BeforePerformDataSelect(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("sGRUPO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(ByVal sender As Object, ByVal e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate

        Dim oCH As New Check

        If e.Item.FieldName = "Semana 1" Then
            oCH.BuscarPontuacaoSemanaTotal(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, "Semana 1")
            e.TotalValue = oCH.Pontuacao.ToString()
        End If

        If e.Item.FieldName = "Resultado 1" Then
            oCH.BuscarPontuacaoSemanaTotal(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, "Semana 1")
            e.TotalValue = oCH.Descricao
        End If

        If e.Item.FieldName = "Semana 2" Then
            oCH.BuscarPontuacaoSemanaTotal(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, "Semana 2")
            e.TotalValue = oCH.Pontuacao.ToString()
        End If

        If e.Item.FieldName = "Resultado 2" Then
            oCH.BuscarPontuacaoSemanaTotal(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, "Semana 2")
            e.TotalValue = oCH.Descricao
        End If

        If e.Item.FieldName = "Semana 3" Then
            oCH.BuscarPontuacaoSemanaTotal(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, "Semana 3")
            e.TotalValue = oCH.Pontuacao.ToString()
        End If

        If e.Item.FieldName = "Resultado 3" Then
            oCH.BuscarPontuacaoSemanaTotal(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, "Semana 3")
            e.TotalValue = oCH.Descricao
        End If

        If e.Item.FieldName = "Semana 4" Then
            oCH.BuscarPontuacaoSemanaTotal(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, "Semana 4")
            e.TotalValue = oCH.Pontuacao.ToString()
        End If

        If e.Item.FieldName = "Resultado 4" Then
            oCH.BuscarPontuacaoSemanaTotal(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, "Semana 4")
            e.TotalValue = oCH.Descricao
        End If

        If e.Item.FieldName = "Semana 5" Then
            oCH.BuscarPontuacaoSemanaTotal(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, "Semana 5")
            e.TotalValue = oCH.Pontuacao.ToString()
        End If

        If e.Item.FieldName = "Resultado 5" Then
            oCH.BuscarPontuacaoSemanaTotal(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, "Semana 5")
            e.TotalValue = oCH.Descricao
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Pontuação do Check-List "
    End Sub

   
    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        Session("sANO") = Me.cboAno.CallAno
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sMES") = Me.cboMes.CallMes
        Me.ASPxGridView1.DataBind()
    End Sub
End Class
