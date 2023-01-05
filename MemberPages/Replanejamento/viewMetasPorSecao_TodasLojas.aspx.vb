Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Web


Partial Class MemberPages_viewMetasPorSecao_TodasLojas
    Inherits System.Web.UI.Page

    Private connManager As String = clData_gerManager.dbConnect    '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"

    Protected Sub cboMes_ListMesChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.ListMesChanged

        Call AtualizarDados()

    End Sub

    Private Sub AtualizarDados()

        Dim cnBKTest As New SqlConnection(connManager)
        Dim cmdTest As New SqlCommand("uspAtualizaConsultaSecao", cnBKTest)

        cmdTest.CommandType = CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@idUser", SqlDbType.VarChar))
        cmdTest.Parameters("@idUser").Value = User.Identity.Name

        cmdTest.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        cmdTest.Parameters("@Ano").Value = Me.cboAno.CallAno

        cmdTest.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        cmdTest.Parameters("@Mes").Value = Me.cboMes.CallMes

        cmdTest.Parameters.Add(New SqlParameter("@idSecao", SqlDbType.TinyInt))
        cmdTest.Parameters("@idSecao").Value = Me.cboSecao.CallSecao

        Try
            cnBKTest.Open()
            cmdTest.ExecuteNonQuery()
            cnBKTest.Close()
        Catch ex As Exception
            'varDesc = "Certo!!!"

        Finally
            cnBKTest.Close()
        End Try
        Me.ASPxGridView1.DataBind()
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Session("sUser") = User.Identity.Name
            Me.cboSecao.CallSecao = 1
            Me.cboSecao.AutoPostBack = True
            Call AtualizarDados()
        End If

    End Sub

    Protected Sub cboSecao_ListSecaoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboSecao.ListSecaoChanged
        Call AtualizarDados()
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Call AtualizarDados()
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(ByVal sender As Object, ByVal e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        Dim oVem As New VendaEmpresaMes
        If e.Item.FieldName = "percMargem" Then
            Dim Margem As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrMargem")
            Dim Venda As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlr")

            Dim vMargem As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(Margem))
            Dim vVenda As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(Venda))

            If vVenda = 0 Then
                e.TotalValue = 0
            ElseIf vMargem = 0 Then
                e.TotalValue = 0
            Else
                e.TotalValue = ((vMargem / vVenda) * 100)
            End If

        End If




        If e.Item.FieldName = "percPart" Then
            Dim Venda As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlr")
            Dim vVenda As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(Venda))

            oVem.Busca_Rev_Corporacao(1, Me.cboAno.CallAno, Me.cboMes.CallMes, 199)
            e.TotalValue = ((vVenda / oVem.vlrRev) * 100)

        End If

        'If e.Item.FieldName = "percRealMargem" Then
        '    oVem.Busca_Rea_MargemCorporacao_Dia(Me.aspxCalendario.Text)
        '    e.TotalValue = Convert.ToDecimal(oVem.percRea)
        'End If

        'If e.Item.FieldName = "difMargem" Then
        '    Dim percMargemMeta As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("percMetaMargem")
        '    Dim percMargemReal As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("percRealMargem")

        '    Dim vMetaMargem As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(percMargemMeta))
        '    Dim vRealMargem As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(percMargemReal))

        '    e.TotalValue = vRealMargem - vMetaMargem

        'End If

    End Sub

    Protected Sub ASPxButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButton2.Click
        Me.ExporterExcel1.WriteXlsToResponse()
    End Sub
End Class
