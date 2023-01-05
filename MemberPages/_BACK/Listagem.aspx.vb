
Partial Class MemberPages_Checklist_ProdutosSemGiro_Listagem
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Dim oCon As New Conexao

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(301, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboFilial.AutoPostBack = False
            cboDepto.CallDepto = 1

            oFun.Grid_Column_BorderRight(grid, "Dias_Sem_Saida", Drawing.Color.Gray, BorderStyle.Solid, 2)
            cboFilial.Visible_cboCorporacao = False

            oFun.Grid_Title(gridTotal, "Perda de Venda - Total por Loja")

            Session("sUSUARIO") = Page.User.Identity.Name
            Session("sDiaHoje") = DateAndTime.Today()

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Giro Estoque - PGR301"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboSize.CallSize = 100
            mySession()

            If cboFilial.IsLoja = True Then
                Session("sLOJA") = 0    ' E Loja
                chkTodos.Visible = False
                gridTotal.Visible = False
            End If

            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()

        Session("sDIAS") = txtDias.Text
        Session("sLOJA") = 0

        If chkTodos.Checked = True Then
            Session("sDEPTO") = 0
        Else
            Session("sDEPTO") = cboDepto.CallDepto
        End If

    End Sub

    Private Sub Atualizar()
        mySession()
        oFun.Grid_Title(grid, "Produtos Sem Giro")
        Me.grid.DataBind()
        Me.gridTotal.DataBind()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize, True)
    End Sub

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click

        Dim sql As New clDataDb

        oCon.Lista_Usuario_String(Conexao.DW_Condor_One, chkSituacao, "Temp.tblDadosUsuario", Page.User.Identity.Name)
        oCon.Lista_Usuario_String(Conexao.DW_Condor_One, chkSistematica, "Temp.tblSistematicaUsuario", Page.User.Identity.Name)

        oCon.ListaUsuario_Excluir_String(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name)

        If chkClassif_A.Checked = True And chkClassif_B.Checked = True And chkClassif_C.Checked = True Then
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "A")
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "B")
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CA")
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CB")
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CC")
        ElseIf chkClassif_A.Checked = True And chkClassif_B.Checked = True Then
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "A")
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "B")
        ElseIf chkClassif_B.Checked = True And chkClassif_C.Checked = True Then
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "B")
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CA")
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CB")
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CC")
        ElseIf chkClassif_A.Checked = True And chkClassif_C.Checked = True Then
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "A")
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CA")
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CB")
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CC")
        ElseIf chkClassif_A.Checked = True Then
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "A")
        ElseIf chkClassif_B.Checked = True Then
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "B")
        ElseIf chkClassif_C.Checked = True Then
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CA")
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CB")
            oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CC")
        End If

        If chkTodos.Checked = True Then
            sql.ExecuteStoredProcedure("Analises.uspProdutosSemGiro", Conexao.gerVendaItem_str, "@idFilial", cboFilial.CallFilial, "@idDepto", 0, "@Dias", txtDias.Text, "@Usuario", Page.User.Identity.Name, "isLoja", Session("sLOJA"))
        Else
            sql.ExecuteStoredProcedure("Analises.uspProdutosSemGiro", Conexao.gerVendaItem_str, "@idFilial", cboFilial.CallFilial, "@idDepto", cboDepto.CallDepto, "@Dias", txtDias.Text, "@Usuario", Page.User.Identity.Name, "isLoja", Session("sLOJA"))
        End If


        Call Atualizar()

        'lblOBS.Text = "cboFilial " & cboFilial.CallFilial & " Session(sLOJA) " & Session("sLOJA") & " Session(sDIAS) " & Session("sDIAS") & " Session(sDEPTO) " & Session("sDEPTO") & " Session(sUSUARIO) " & Session("sUSUARIO")

    End Sub

    Protected Sub grid_CellEditorInitialize(sender As Object, e As DevExpress.Web.ASPxGridViewEditorEventArgs) Handles grid.CellEditorInitialize
        If e.Column.FieldName = "idFilial" Or e.Column.FieldName = "CodProduto" Or e.Column.FieldName = "nomeProduto" Or e.Column.FieldName = "vlrTotalFisico" Or
           e.Column.FieldName = "EAN" Or e.Column.FieldName = "Sistematica" Or e.Column.FieldName = "descProdutoDeptoLista" Or e.Column.FieldName = "vlrDivergencia" Or
           e.Column.FieldName = "descProdutoSecaoLista" Or e.Column.FieldName = "descProdutoGrupoLista" Or e.Column.FieldName = "descProdutoSubgrupoLista" Or e.Column.FieldName = "Classificacao" Or
           e.Column.FieldName = "Dias_Sem_Saida" Or e.Column.FieldName = "Ultima_Saida" Or e.Column.FieldName = "EstoqueQtde" Or e.Column.FieldName = "EstoqueCusto" Or e.Column.FieldName = "Ultima_Entrada" Then
            e.Editor.Enabled = False
        End If

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrTotalFisico")
        oFun.Grid_RedIsNegative(e, "vlrDivergencia")
        oFun.Grid_RedIsNegative(e, "EstoqueQtde")
    End Sub

    Protected Sub chk_CheckedChanged(sender As Object, e As EventArgs)
        If chkClassif_A.Checked = True And chkClassif_B.Checked = True And chkClassif_C.Checked = True Then
            txtDias.Text = 3
        ElseIf chkClassif_A.Checked = True And chkClassif_B.Checked = True Then
            txtDias.Text = 3
        ElseIf chkClassif_B.Checked = True And chkClassif_C.Checked = True Then
            txtDias.Text = 3
        ElseIf chkClassif_A.Checked = True And chkClassif_C.Checked = True Then
            txtDias.Text = 3
        ElseIf chkClassif_A.Checked = True Then
            txtDias.Text = 3
        ElseIf chkClassif_B.Checked = True Then
            txtDias.Text = 5
        ElseIf chkClassif_C.Checked = True Then
            txtDias.Text = 10
        End If
    End Sub

End Class
