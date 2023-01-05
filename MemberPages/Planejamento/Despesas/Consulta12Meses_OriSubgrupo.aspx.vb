
Partial Class MemberPages_Consulta12Meses
    Inherits System.Web.UI.Page
    Dim varStatus As String = 1

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(48, User.Identity.Name)
            Me.cboAno.AutoPostBack = True
            '-----------------------
            Dim idCat As String = Request.QueryString("idCat")
            Me.NewItem.Text = idCat
            Call AdicionarItem()
            Call AdicionarItemPosicao()
            '-----------------------
            Me.ASPxGridView1.Visible = False
            Me.cboAno.AnoInicial = 2011
            Me.cboAno.AnoFinal = Year(DateAndTime.Now().AddYears(1))
            If Month(Date.Today) > 9 Then
                Me.cboAno.CallAno = Year(Date.Today) + 1
                Session("sAno") = Year(Date.Today) + 1
            Else
                Me.cboAno.CallAno = Year(Date.Today)
                Session("sAno") = Year(Date.Today)
            End If

            Session("sPosicao") = Me.cboPosicao.CallPosicao
            'Me.cboGrupo.Text = 1
            ' Me.ASPxGridView1.Caption = "Meta Original das Vendas por Seção do Ano de " & Me.cboAno.Value & ". Seção " & Me.cboSecao.Text & "."
            Me.cboGrupo_Subgrupo.CallSubgrupo = ""
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
    End Sub

    Protected Sub cboPosicao_ListPosicaoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboPosicao.ListPosicaoChanged
        Session("sPosicao") = Me.cboPosicao.CallPosicao
    End Sub

    Protected Sub cboGrupo_Subgrupo_ListGrupoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboGrupo_Subgrupo.ListGrupoChanged
        Me.ASPxGridView1.Visible = False
        Me.cboGrupo_Subgrupo.CallSubgrupo = ""
        varStatus = 2
    End Sub

    Protected Sub cboGrupo_Subgrupo_ListSubgrupoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboGrupo_Subgrupo.ListSubgrupoChanged
        Session("sSubgrupo") = Me.cboGrupo_Subgrupo.CallSubgrupo
        Me.ASPxGridView1.Visible = True
    End Sub

    Sub AdicionarItem()
        Dim sourceItem As String = Server.HtmlEncode(NewItem.Text)
        cboGrupo_Subgrupo.AddSourceItem(sourceItem)
    End Sub

    Sub AdicionarItemPosicao()
        Dim sourceItem As String = Server.HtmlEncode(NewItem.Text)
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


    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If varStatus = 2 Then Me.cboGrupo_Subgrupo.CallSubgrupo = ""

    End Sub

End Class
