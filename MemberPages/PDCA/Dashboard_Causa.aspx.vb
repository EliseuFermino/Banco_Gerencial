Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Web

Partial Class MemberPages_PDCA_Dashboard_Causa
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(313, Page.User.Identity.Name)

            Session("sFILIAL") = cboFilial.CallFilial

            'oFun.Grid_Title(grid_PlanoAcao, "Plano de Ação")
            grid_PlanoAcao.DataBind()

        End If

    End Sub

    Protected Sub btnExcluir_Click(sender As Object, e As EventArgs) Handles btnExcluir.Click

        Dim oDB As New clDataDb

        oDB.ExecuteStoredProcedure("PDCA.usp_Excluir_ProblemaCausa", Conexao.gerProjetos.ConnectionString, "@ID", CInt(txtID.Text))
        oVem.UserMsgBox(Me, "O Problema e Causa foi excluido!!!")
        grid_PlanoAcao.DataBind()

    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = cboFilial.CallFilial
        grid_PlanoAcao.DataBind()

    End Sub

    Private Sub Linkar(ByVal link As String, ByVal idCat As String, idFilial As String)
        Dim url As String = link & "?idCat=" & idCat & "&idFilial=" & idFilial & ""
        Dim sb As New StringBuilder()
        sb.Append("<script type = 'text/javascript'>")
        sb.Append("window.open('")
        sb.Append(url)
        sb.Append("');")
        sb.Append("</script>")
        ClientScript.RegisterStartupScript(Me.GetType(), "script", sb.ToString())
    End Sub

    Protected Sub btnEdit_Click(sender As Object, e As EventArgs) Handles btnEdit.Click
        Call Linkar("cadProblemaCausa.aspx", CInt(txtID.Text), CByte(cboFilial.CallFilial))
    End Sub


    Protected Sub grid_PlanoAcao_PreRender(sender As Object, e As EventArgs) Handles grid_PlanoAcao.PreRender
        TryCast(sender, ASPxGridView).FocusedRowIndex = -1
    End Sub

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        grid_PlanoAcao.DataBind()
    End Sub
End Class
