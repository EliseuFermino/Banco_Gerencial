Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
Imports System.IO

Partial Class MemberPages_Despesas_Gestor_viewDespMesTotal
    Inherits System.Web.UI.Page
    Private Venda01 As Double = 0
    Private Venda02 As Double = 0
    Private Venda03 As Double = 0
    Private Meta As Double = 0
    Dim connString As String = "Data Source=10.1.1.14\SQLCONTRO;Initial Catalog=gerContSQL1;Persist Security Info=True;User ID=sa;Password=rd700@1"

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            If DataBinder.Eval(e.Row.DataItem, "difVlrRev") < 0D Then e.Row.Cells(5).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "difPercRev") < 0D Then e.Row.Cells(6).ForeColor = Drawing.Color.Red
        End If
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        With Me.GridView1
            .Columns(0).ItemStyle.Width = 100
            .Columns(1).ItemStyle.Width = 100
            .Columns(2).ItemStyle.Width = 50
            .Columns(3).ItemStyle.Width = 100
            .Columns(4).ItemStyle.Width = 50
            .Columns(5).ItemStyle.Width = 90
            .Columns(6).ItemStyle.Width = 50
        End With

        'Calcula os Totais
        If e.Row.RowType = DataControlRowType.DataRow Then
            Venda01 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrRev"))
            Venda02 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrReal"))
            Venda03 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "difVlrRev"))


        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(1).Text = Venda01.ToString("n0")
            e.Row.Cells(3).Text = Venda02.ToString("n0")
            e.Row.Cells(5).Text = Venda03.ToString("n0")

            e.Row.Cells(2).Text = ((e.Row.Cells(1).Text / Me.lblMetaRevista.Text) * 100).ToString("n2")
            e.Row.Cells(4).Text = ((e.Row.Cells(3).Text / Me.lblVendaRealizada.Text) * 100).ToString("n2")
            e.Row.Cells(6).Text = (e.Row.Cells(2).Text - e.Row.Cells(4).Text).ToString("n2")

            If e.Row.Cells(5).Text < 0 Then
                e.Row.Cells(5).ForeColor = Drawing.Color.Red
            Else
                e.Row.Cells(5).ForeColor = Drawing.Color.Black
            End If

            If e.Row.Cells(6).Text < 0 Then
                e.Row.Cells(6).ForeColor = Drawing.Color.Red
            Else
                e.Row.Cells(6).ForeColor = Drawing.Color.Black
            End If

            'If e.Row.Cells(12).Text < 0 Then
            '    e.Row.Cells(12).ForeColor = Drawing.Color.Red
            'Else
            '    e.Row.Cells(12).ForeColor = Drawing.Color.Black
            'End If
        End If
    End Sub

    Protected Sub btnExportExcel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportExcel.Click

        Response.Clear()
        Response.Buffer = True

        Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls")
        Response.Charset = ""
        Response.ContentType = "application/vnd.ms-excel"

        Dim sw As New StringWriter()
        Dim hw As New HtmlTextWriter(sw)

        GridView1.AllowPaging = False
        GridView1.DataBind()

        'Change the Header Row back to white color
        GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF")

        'Apply style to Individual Cells
        GridView1.HeaderRow.Cells(0).Style.Add("background-color", "green")
        GridView1.HeaderRow.Cells(1).Style.Add("background-color", "green")
        GridView1.HeaderRow.Cells(2).Style.Add("background-color", "green")
        GridView1.HeaderRow.Cells(3).Style.Add("background-color", "green")

        For i As Integer = 0 To GridView1.Rows.Count - 1
            Dim row As GridViewRow = GridView1.Rows(i)

            'Change Color back to white
            row.BackColor = System.Drawing.Color.White

            'Apply text style to each Row
            row.Attributes.Add("class", "textmode")

            'Apply style to Individual Cells of Alternating Row
            If i Mod 2 <> 0 Then
                row.Cells(0).Style.Add("background-color", "#C2D69B")
                row.Cells(1).Style.Add("background-color", "#C2D69B")
                row.Cells(2).Style.Add("background-color", "#C2D69B")
                row.Cells(3).Style.Add("background-color", "#C2D69B")
            End If
        Next
        GridView1.RenderControl(hw)

        'style to format numbers to string
        Dim style As String = "<style>.textmode{mso-number-format:\@;}</style>"
        Response.Write(style)
        Response.Output.Write(sw.ToString())
        Response.Flush()
        Response.End()

    End Sub

    Public Overloads Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        ' Verifies that the control is rendered
    End Sub

    Sub Atualizar()

        Dim oVendaEmpresaMes As New VendaEmpresaMes
        Me.lblVendaRealizada.Text = oVendaEmpresaMes.Venda(3, Me.cboAno.SelectedValue, Me.cboMes.SelectedValue).ToString("n0")
        Me.lblMetaRevista.Text = oVendaEmpresaMes.Venda(2, Me.cboAno.SelectedValue, Me.cboMes.SelectedValue).ToString("n0")

    End Sub
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Call Atualizar()
    End Sub


End Class
