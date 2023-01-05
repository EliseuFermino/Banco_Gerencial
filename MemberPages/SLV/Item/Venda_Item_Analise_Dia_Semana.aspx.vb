
Partial Class MemberPages_SLV_Item_Venda_Item_Analise_Dia_Semana
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Dim oDat As New clDataDb


#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(375, User.Identity.Name)
            oFun.Grid_Column_BorderRight(grid, "descProdutoSubgrupoLista", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "rnk_QtdVendas", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "rnk_Venda", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "rnk_numCliente", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "rnk_vlrLucroTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)


            cboComprador.cboComprador_Label_Visible = False
            cboComprador.cboComprador_Visible = False


            grpSecao.Checked = True
            Session("sProdutoSecao") = 1
            Session("sTipo_Secao_Comprador") = 1
            Session("sRegiao") = 199

            cboRegiao.SelectedIndex = 0

            oFun.Grid_Title(grid, "Analise de Produtos dos Últimos 60 dias")

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Analise de Produtos dos Últimos 60 dias - PGR375"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboSize.CallSize = 100

            Session("sNumDiaSemana") = 1
            Session("sProdutoSecao") = 1
            Session("sTipo_Secao_Comprador") = 1
            Session("sRegiao") = 199
            'cboRegiao.Value = 200

            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sNumDiaSemana") = cboSemana.CallSemana
        Session("sProdutoSecao") = cboSecao.CallSecao
        Session("sComprador") = cboComprador.CallComprador
        Session("sRegiao") = cboRegiao.Value

        If grpSecao.Checked = True Then Session("sTipo_Secao_Comprador") = 1
        If grpComprador.Checked = True Then Session("sTipo_Secao_Comprador") = 2
        If grpGeral.Checked = True Then Session("sTipo_Secao_Comprador") = 3

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
        'lblError.Text = "Session_sNumDiaSemana " & Session("sNumDiaSemana") & " - Session_sProdutoSecao " & Session("sProdutoSecao") & " - Session_sComprador " & Session("sComprador") & " - Session_tipo_Secao_Comprador " & Session("sTipo_Secao_Comprador")
    End Sub

    Private Sub Atualizar()
        mySession()

        Me.grid.DataBind()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub


    Protected Sub grpSecao_CheckedChanged(sender As Object, e As EventArgs) Handles grpSecao.CheckedChanged
        If grpSecao.Checked = True Then
            cboSecao.cboSecao_Visible = True
            cboComprador.cboComprador_Visible = False

        End If
       
    End Sub

    Protected Sub grpComprador_CheckedChanged(sender As Object, e As EventArgs) Handles grpComprador.CheckedChanged
        If grpComprador.Checked = True Then
            cboComprador.cboComprador_Visible = True
            cboSecao.cboSecao_Visible = False
            cboComprador.cboComprador_List_Index = 0

        End If
    End Sub

    Protected Sub grpGeral_CheckedChanged(sender As Object, e As EventArgs) Handles grpGeral.CheckedChanged
        If grpGeral.Checked = True Then
            cboComprador.cboComprador_Visible = False
            cboSecao.cboSecao_Visible = False
        End If
    End Sub
End Class


