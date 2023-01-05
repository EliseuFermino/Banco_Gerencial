Imports DevExpress.Web

Partial Class MemberPages_SLV_AnaliseVendaMaiorTop1000
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        On Error Resume Next
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(142, User.Identity.Name)
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(DateAndTime.Now())
            Me.cboAno.CallAno = Year(DateAndTime.Now())
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Ranking por Item - Top 1000 - PGR142"
        End If

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "percCresc" Or
           e.DataColumn.FieldName = "percCrescQtde" Or
           e.DataColumn.FieldName = "percCrescLucro" Or
           e.DataColumn.FieldName = "mAT" Or
           e.DataColumn.FieldName = "mAA" Or
           e.DataColumn.FieldName = "pmAT" Or
           e.DataColumn.FieldName = "pmAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(72, User.Identity.Name)
        End If
    End Sub


    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        'Exibir Ano Anterior
        If Me.chkAnoAnterior.Checked = True Then
            Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Else
            Me.grid.Columns.Item("bandAnoAnterior").Visible = False
        End If

        Me.grid.DataBind()
        Me.grid.Visible = True

    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        On Error Resume Next

        ' Margem - percentual Ano Atual
        If e.Column.FieldName = "pmAT" Then
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vAT"))
            Dim vRealMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("mAT"))
            If vMetaVenda <> 0 Then
                e.Value = vRealMargem / vMetaVenda * 100
            Else
                e.Value = 0
            End If
        End If

        ' Margem - percentual Ano Anterior
        If e.Column.FieldName = "pmAA" Then
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vAA"))
            Dim vRealMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("mAA"))
            If vMetaVenda <> 0 Then
                e.Value = vRealMargem / vMetaVenda * 100
            Else
                e.Value = 0
            End If
        End If

        ' Crescimento - percentual Venda
        If e.Column.FieldName = "percCresc" Then
            Dim VendaAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vAT"))
            Dim VendaAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vAA"))
            If VendaAT <> 0 Then
                e.Value = (((VendaAT / VendaAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

        ' Crescimento - percentual Quantidade
        If e.Column.FieldName = "percCrescQtde" Then
            Dim vlrAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("qAT"))
            Dim vlrAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("qAA"))
            If vlrAT <> 0 Then
                e.Value = (((vlrAT / vlrAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

        ' Crescimento - percentual Lucro
        If e.Column.FieldName = "percCrescLucro" Then
            Dim vlrAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("mAT"))
            Dim vlrAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("mAA"))
            If vlrAT <> 0 Then
                e.Value = (((vlrAT / vlrAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If
    End Sub

    
End Class
