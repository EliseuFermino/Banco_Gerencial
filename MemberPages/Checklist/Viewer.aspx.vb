Imports System.Data.SqlClient
Imports System.Data

Partial Class MemberPages_CheckList_Viewer
    Inherits System.Web.UI.Page

    Private connManager As String = clData_gerManager.dbConnect  '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ds As New DataSet

        Dim da As SqlClient.SqlDataAdapter

        Dim strSQL As String

        strSQL = "Select imgId, Dia, idFilial, descPergunta, listaSubgrupo, listaGrupo, Descricao, Hora from Checklist.viewImages"

        da = New SqlClient.SqlDataAdapter(strSQL, connManager)

        da.Fill(ds)

        ds.Tables(0).Columns.Add("imgFile")

        For Each tempRow As DataRow In ds.Tables(0).Rows

            tempRow.Item("imgFile") = ("imgGrab.aspx?id=" & tempRow.Item("imgID"))

        Next

        imgGrid.DataSource = ds

        imgGrid.DataBind()

        Call Carregarnovos()
    End Sub

    Private Sub Carregarnovos()
        Dim ds As New DataSet

        Dim da As SqlClient.SqlDataAdapter

        Dim strSQL As String

        strSQL = "Select imgId, idFilial from Checklist.Images"

        da = New SqlClient.SqlDataAdapter(strSQL, connManager)

        da.Fill(ds)

        ds.Tables(0).Columns.Add("imgFile")

        For Each tempRow As DataRow In ds.Tables(0).Rows

            tempRow.Item("imgFile") = ("imgGrab.aspx?id=" & tempRow.Item("imgID"))

        Next


        GridView1.DataSource = ds
        GridView1.DataBind()
    End Sub

End Class
