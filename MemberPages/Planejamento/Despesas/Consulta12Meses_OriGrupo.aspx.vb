
Partial Class MemberPages_Consulta12Meses
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(47, User.Identity.Name)

            Me.cboAno.AutoPostBack = True
            Me.cboGrupo.Visible_cboSubgrupo = False
            Me.cboGrupo.Visible_LabelSubGrupo = False

            Me.cboAno.AnoInicial = 2011
            Me.cboAno.AnoFinal = Year(DateAndTime.Now().AddYears(1))
            If Year(Now()) > 9 Then
                Me.cboAno.CallAno = Year(Now()) + 1
            Else
                Me.cboAno.CallAno = Year(Now())
            End If
            '-----------------------
            Dim idCat As String = Request.QueryString("idCat")
            Me.NewItem.Text = idCat
            Call AdicionarItem()
            '-----------------------

            'Me.cboGrupo.Text = 1
            ' Me.ASPxGridView1.Caption = "Meta Original das Vendas por Seção do Ano de " & Me.cboAno.Value & ". Seção " & Me.cboSecao.Text & "."
        End If
    End Sub

    Private Sub AtualizarTitulo()
        ' Me.ASPxGridView1.Caption = "Meta Original das Vendas por Seção do Ano de " & Me.cboAno.Value & ". Seção " & Me.cboSecao.Text & "."
    End Sub

    Protected Sub btnExportarExcel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportarExcel.Click
        Me.ExporterExcel1.WriteXlsToResponse()
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sAno") = Me.cboAno.CallAno
        Me.ASPxGridView1.Visible = True
    End Sub

    Protected Sub cboPosicao_ListPosicaoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboPosicao.ListPosicaoChanged
        Session("sPosicao") = Me.cboPosicao.CallPosicao
    End Sub

    Sub AdicionarItem()
        Dim sourceItem As String = Server.HtmlEncode(NewItem.Text)
        cboGrupo.AddSourceItem(sourceItem)
    End Sub

    Protected Sub cboGrupo_ListGrupoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboGrupo.ListGrupoChanged
        Session("sGrupo") = Me.cboGrupo.CallGrupo
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

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Session("sAno") = Me.cboAno.CallAno
            Session("sPosicao") = Me.cboPosicao.CallPosicao
            Session("sGrupo") = Me.cboGrupo.CallGrupo
            Me.ASPxGridView1.DataBind()
        End If
    End Sub
End Class
