


Partial Class MemberPages_Manutencao_Default
    Inherits System.Web.UI.Page

    Dim oDb As New clDataDb

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click

        Try
            oDb.ExecuteStoredProcedure_TimedOut("dbo.usp_AtualizaNumeroClientes", Conexao.gerTran_Vendas_str, "Dia", Session("sDIA"), 2400)
            lblPronto.Text = "Clientes Atualizado com Sucesso"
            lblPronto.ForeColor = Drawing.Color.Blue
        Catch ex As Exception
            lblPronto.Text = "Erro " & Err.Description
            lblPronto.ForeColor = Drawing.Color.Red
        Finally
            lblPronto.Text = "Erro " & Err.Description
            lblPronto.ForeColor = Drawing.Color.Red
        End Try

    End Sub
End Class
