
Partial Class MemberPages_Checklist_ProdutosSemGiro_Listagem_Vendas
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Dim oCon As New Conexao
    Dim oPro As New Projeto

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(443, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboFilial.AutoPostBack = False
            cboDepto.CallDepto = 1

            oFun.Grid_Column_BorderRight(grid, "Dias_Sem_Saida", Drawing.Color.Gray, BorderStyle.Solid, 2)
            cboFilial.Visible_cboCorporacao = False

            Session("sUSUARIO") = Page.User.Identity.Name
            Session("sDiaHoje") = DateAndTime.Today()
            Session("sMEIO_DIVULGACAO") = 0

            lblOBS.Visible = True

            Dim DiaOntem As Date = DateAndTime.Today().AddDays(-1)
            Dim DiaInicio10 As Date = DateAndTime.Today().AddDays(-10)

            divQuadrante2.Visible = False
            divQuadrante3.Visible = False
            divQuadrante5.Visible = False

        End If

    End Sub

    Private Sub Atualizar_Legendas_Dias(ByVal myDia As Date, myColumnName As String)

        Dim Dia As Integer = DateAndTime.Today.AddDays(-1).Day

        'If Dia > 9 Then
        oFun.Grid_ColumnFormat(grid, myColumnName, Left(myDia, 5), "Vendas do produto no dia " + myDia + ".", Funcoes.CasaDecimais.Moeda_Nenhuma, 70)
        'Else
        '    oFun.Grid_ColumnFormat(grid, myColumnName, Left(myDia, 4), "Vendas do produto no dia " + myDia + ".", Funcoes.CasaDecimais.Moeda_Nenhuma, 70)
        'End If


    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Giro Estoque pela Venda - PGR443"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboSize.CallSize = 100
            mySession()

            If cboFilial.IsLoja = True Then
                Session("sLOJA") = 0    ' E Loja

            Else
                Session("sLOJA") = 1   ' Não é Loja

            End If

            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()

        Session("sDIAS") = txtDias.Text

        Session("sDEPTO") = cboDepto.CallDepto
        cboDepto.Enabled = True

    End Sub

    Private Sub Atualizar()
        On Error Resume Next
        oFun.Grid_Title(grid, "Produtos Sem Giro")
        Me.grid.DataBind()

    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize, True)
    End Sub

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click

        Dim sql As New clDataDb



        Dim vClass_A As String
        Dim vClass_B As String
        Dim vClass_CA As String
        Dim vClass_CB As String
        Dim vClass_CC As String

        oCon.Lista_Usuario_String(Conexao.DW_Condor_One, chkSistematica, "Temp.tblSistematicaUsuario_Vendas", Page.User.Identity.Name)

        oCon.ListaUsuario_Excluir_String(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario_Vendas", Page.User.Identity.Name)

        'If chkClassif_A.Checked = True Then oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario_Vendas", Page.User.Identity.Name, "A")
        'If chkClassif_B.Checked = True Then oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario_Vendas", Page.User.Identity.Name, "B")
        'If chkClassif_CA.Checked = True Then oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario_Vendas", Page.User.Identity.Name, "CA")
        'If chkClassif_CB.Checked = True Then oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario_Vendas", Page.User.Identity.Name, "CB")
        'If chkClassif_CC.Checked = True Then oCon.ValorUnico_Adicionar(Conexao.DW_Condor_One, "Temp.tblClassificacaoUsuario_Vendas", Page.User.Identity.Name, "CC")


        If chkClassif_A.Checked = True Then
            vClass_A = "A"
        Else
            vClass_A = 0
        End If

        If chkClassif_B.Checked = True Then
            vClass_B = "B"
        Else
            vClass_B = 0
        End If

        If chkClassif_CA.Checked = True Then
            vClass_CA = "CA"
        Else
            vClass_CA = 0
        End If

        If chkClassif_CB.Checked = True Then
            vClass_CB = "CB"
        Else
            vClass_CB = 0
        End If

        If chkClassif_CC.Checked = True Then
            vClass_CC = "CC"
        Else
            vClass_CC = 0
        End If


        'If chkClassif_B.Checked = True Then vClass_B = "B"
        'If chkClassif_CA.Checked = True Then vClass_CA = "CA"
        'If chkClassif_CB.Checked = True Then vClass_CB = "CB"
        'If chkClassif_CC.Checked = True Then vClass_CC = "CC"

        mySession()

        sql.ExecuteStoredProcedure("Analises.uspProdutosSemGiro_Vendas", Conexao.gerVendaItem_str, "@idFilial", cboFilial.CallFilial, "@idMercadologico", cboDepto.CallDepto,
                                                "@Giro_A", vClass_A, "@Percentual_A", txt_A.Text,
                                                "@Giro_B", vClass_B, "@Percentual_B", txt_B.Text,
                                                "@Giro_CA", vClass_CA, "@Percentual_CA", txt_CA.Text,
                                                "@Giro_CB", vClass_CB, "@Percentual_CB", txt_CB.Text,
                                                "@Giro_CC", vClass_CC, "@Percentual_CC", txt_CC.Text,
                                                "@Usuario", Page.User.Identity.Name)

        Call Atualizar()

        'lblOBS.Text = "cboFilial " & cboFilial.CallFilial & "; Session(sDEPTO) " & Session("sDEPTO") & "; Giro_A: " & vClass_A & "; Percentual_A: " & txt_A.Text & "; Session(sUSUARIO) " & Session("sUSUARIO") & "; Error = " & sql.varDesc

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
