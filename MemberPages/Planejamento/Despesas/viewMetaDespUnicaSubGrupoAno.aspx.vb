Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Despesas_viewMetaDespUnicaLojaMes
    Inherits System.Web.UI.Page

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sAno") = Me.cboAno.CallAno
        Call Atualizar()
    End Sub

    Protected Sub cboPosicao_ListPosicaoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboPosicao.ListPosicaoChanged
        Session("sPosicao") = Me.cboPosicao.CallPosicao
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
            '-----------------------

            Me.cboAno.AutoPostBack = True

            Dim idCat As String = Request.QueryString("idCat")
            Me.NewItem.Text = idCat
            Call AdicionarItem()
            '-----------------------
            Me.cboAno.AnoInicial = 2011
            Me.cboAno.AnoFinal = Year(DateAndTime.Now().AddYears(1))
            If Year(Now()) > 9 Then
                Me.cboAno.CallAno = Year(Now()) + 1
            Else
                Me.cboAno.CallAno = Year(Now())
            End If

            Session("sAno") = Me.cboAno.CallAno
            Session("sSubgrupo") = Me.cboGrupo_SubGrupo.CallSubgrupo
            Session("sPosicao") = Me.cboPosicao.CallPosicao
            Call Atualizar()
        End If
    End Sub

    Protected Sub ASPxButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButton1.Click
        Me.ExporterExcel1.WriteXlsToResponse()
    End Sub

    Sub Atualizar()
        Dim oVEM As New VendaEmpresaMes
        oVEM.Busca_Ori_Corporacao_Ano(1, Me.cboAno.CallAno, 99)
        Me.lblVenda.Text = oVEM.vlrOri
    End Sub

    Protected Sub cboGrupo_SubGrupo_ListSubgrupoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboGrupo_SubGrupo.ListSubgrupoChanged
        Session("sSubgrupo") = Me.cboGrupo_SubGrupo.CallSubgrupo
    End Sub

    Sub AdicionarItem()
        Dim sourceItem As String = Server.HtmlEncode(NewItem.Text)
        cboGrupo_SubGrupo.AddSourceItem(sourceItem)
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim oProjeto As New Projeto

        Select Case LCase(Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))
            Case "administração", "diretor", "marketing"    'Adailton
                Me.cboPosicao.CallPosicao = 2  'Administração
                'lblOBS.Text = LCase(Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))
            Case "controladoria"

            Case "supervisor", "supervisor_M"  'Supervisores

                Me.cboPosicao.CallPosicao = 1  'Loja
            Case "loja"  'Supervisores

                '                    Me.cboPosicao.CallPosicao = 1  'Loja
            Case "informática"    'Adailton

            Case Else

        End Select


    End Sub
End Class
