
Partial Class MemberPages_Manutencao_Acerto_Vendas
    Inherits System.Web.UI.Page

    Dim oDb As New clDataDb
    Dim oVem As New VendaEmpresaMes

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        oDb.GetDataDB_ExecuteScalar_Parameter3("Manutencao.usp_Atualiza_Realizado_na_Meta_Loja", Conexao.DW_str, "Ano", txt_Ano.Text, "Mes", txt_Mes.Text, "idFilial", txt_Loja.Text)
        oVem.UserMsgBox(Me, "Pronto!!!")
    End Sub
End Class
