
Partial Class MemberPages_Checklist_ProdutosSemGiro_Listagem
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Dim oCon As New Conexao
    Dim oPro As New Projeto

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
            Session("sMEIO_DIVULGACAO") = 0

            lblOBS.Visible = True

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
            Else
                Session("sLOJA") = 1   ' Não é Loja
                chkTodos.Visible = True
                gridTotal.Visible = True
            End If

            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()

        Session("sDIAS") = txtDias.Text
        Session("sDIAS_TRANSITO") = txtTransito.Text
        Session("sLOJA") = 0

        If chkTodos.Checked = True Then
            Session("sDEPTO") = 0
            cboDepto.Enabled = False
        Else
            Session("sDEPTO") = cboDepto.CallDepto
            cboDepto.Enabled = True
        End If

        If chkPromocionais.Checked = True Then Session("sMEIO_DIVULGACAO") = 1
        If chkPromocionais.Checked = False Then Session("sMEIO_DIVULGACAO") = 0


    End Sub

    Private Sub Atualizar()
        On Error Resume Next
        oFun.Grid_Title(grid, "Produtos Sem Giro")
        Me.grid.DataBind()
        Me.gridTotal.DataBind()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize, True)
    End Sub

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click

        Dim sql As New clDataDb

        mySession()

        oCon.Lista_Usuario_String(Conexao.DW_Condor_One, chkSituacao, "Temp.tblDadosUsuario", Page.User.Identity.Name)
        oCon.Lista_Usuario_String(Conexao.DW_Condor_One, chkSistematica, "Temp.tblSistematicaUsuario", Page.User.Identity.Name)

        oCon.ListaUsuario_Excluir_String(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name)

        If chkClassif_A.Checked = True Then oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "A")
        If chkClassif_B.Checked = True Then oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "B")
        If chkClassif_CA.Checked = True Then oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CA")
        If chkClassif_CB.Checked = True Then oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CB")
        If chkClassif_CC.Checked = True Then oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario", Page.User.Identity.Name, "CC")

        If chkTodos.Checked = True Then
            sql.ExecuteStoredProcedure("Analises.uspProdutosSemGiro", Conexao.gerVendaItem_str, "@idFilial", cboFilial.CallFilial, "@idDepto", 0, "@Dias", txtDias.Text, "@Usuario", Page.User.Identity.Name, "isLoja", Session("sLOJA"), "@DiasEmTransito", txtTransito.Text, "@MeioDivulgacao", Session("sMEIO_DIVULGACAO"))
        Else
            sql.ExecuteStoredProcedure("Analises.uspProdutosSemGiro", Conexao.gerVendaItem_str, "@idFilial", cboFilial.CallFilial, "@idDepto", cboDepto.CallDepto, "@Dias", txtDias.Text, "@Usuario", Page.User.Identity.Name, "isLoja", Session("sLOJA"), "@DiasEmTransito", txtTransito.Text, "@MeioDivulgacao", Session("sMEIO_DIVULGACAO"))  ' 
        End If

        Call Atualizar()

        'lblOBS.Text = "cboFilial " & cboFilial.CallFilial & " Session(sLOJA) " & Session("sLOJA") & " Session(sDIAS) " & Session("sDIAS") & " Session(sDEPTO) " & Session("sDEPTO") & " Session(sUSUARIO) " & Session("sUSUARIO") & " Session(sDIAS_TRANSITO) " & Session("sDIAS_TRANSITO") & " Session(sMEIO_DIVULGACAO) " & Session("sMEIO_DIVULGACAO")

    End Sub

    Protected Sub grid_CellEditorInitialize(sender As Object, e As DevExpress.Web.ASPxGridViewEditorEventArgs) Handles grid.CellEditorInitialize
        If e.Column.FieldName = "idFilial" Or e.Column.FieldName = "CodProduto" Or e.Column.FieldName = "nomeProduto" Or e.Column.FieldName = "vlrTotalFisico" Or
           e.Column.FieldName = "EAN" Or e.Column.FieldName = "Sistematica" Or e.Column.FieldName = "descProdutoDeptoLista" Or e.Column.FieldName = "vlrDivergencia" Or
           e.Column.FieldName = "descProdutoSecaoLista" Or e.Column.FieldName = "descProdutoGrupoLista" Or e.Column.FieldName = "descProdutoSubgrupoLista" Or e.Column.FieldName = "Classificacao" Or
           e.Column.FieldName = "Dias_Sem_Saida" Or e.Column.FieldName = "Ultima_Saida" Or e.Column.FieldName = "EstoqueQtde" Or e.Column.FieldName = "EstoqueCusto" Or
           e.Column.FieldName = "Ultima_Entrada" Or e.Column.FieldName = "QtdeTrocas" Or e.Column.FieldName = "Ranking" Or e.Column.FieldName = "MeioDivulgacao" Or e.Column.FieldName = "QtdeEstoqueVirtual" Then
            e.Editor.Enabled = False
        End If

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrTotalFisico")
        oFun.Grid_RedIsNegative(e, "vlrDivergencia")
        oFun.Grid_RedIsNegative(e, "EstoqueQtde")
    End Sub

    Protected Sub chk_CheckedChanged(sender As Object, e As EventArgs)
        If chkClassif_A.Checked = True And chkClassif_B.Checked = True And chkClassif_CA.Checked = True Then
            txtDias.Text = 2
        ElseIf chkClassif_A.Checked = True And chkClassif_B.Checked = True Then
            txtDias.Text = 2
        ElseIf chkClassif_B.Checked = True And chkClassif_CA.Checked = True Then
            txtDias.Text = 2
        ElseIf chkClassif_A.Checked = True And chkClassif_CA.Checked = True Then
            txtDias.Text = 2
        ElseIf chkClassif_A.Checked = True Then
            txtDias.Text = 2
        ElseIf chkClassif_B.Checked = True Then
            txtDias.Text = 2
        ElseIf chkClassif_CA.Checked = True Then
            txtDias.Text = 2
        End If
    End Sub

End Class
