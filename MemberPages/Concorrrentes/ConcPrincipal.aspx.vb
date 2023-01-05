Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Web
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.IO

Partial Class Ranking_ConcPrincipal_work
    Inherits System.Web.UI.Page
    Dim strSQL, strBusca As String
    Dim cnnStr As String = "Data Source=CONTROLADORIA2\SQLCONTRO;Initial Catalog=gerCont;User ID=sa; PWD=rd700@1"
    Dim connString As String = "Data Source=CONTROLADORIA2\SQLCONTRO;Initial Catalog=gerContSQL1;Persist Security Info=True;User ID=sa;Password=rd700@1"

    Private selectedProduct As Product
    Dim oVem As New VendaEmpresaMes

    Protected Sub detailGrid_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        Session("CNPJ") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub optLoja_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optLoja.CheckedChanged
        If Me.optLoja.Checked = True Then
            Me.gridLojas.Visible = True
            Me.gridLojas.DataBind()

            Me.grid.Visible = False
            Me.btnVendas.Enabled = True
            Me.btnExportarExcel.Enabled = True
            Call AtualizarConsulta()
            Call FixarCabecalho()
        End If

    End Sub

    Protected Sub optSupermercadista_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optSupermercadista.CheckedChanged
        If Me.optSupermercadista.Checked = True Then

            Me.grid.Visible = True
            Me.grid.DataBind()

            Me.gridLojas.Visible = False
            Me.btnVendas.Enabled = False
            Me.btnExportarExcel.Enabled = False
            Call AtualizarConsulta()
            Call FixarCabecalho()
        End If
    End Sub

    Protected Sub optPrincipaisSup_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optPrincipaisSup.CheckedChanged
        If optPrincipaisSup.Checked = True Then
            Me.lblOptPrincipalTodos.Text = 1
            Call AtualizarConsulta()
        End If
    End Sub

    Protected Sub optTodos_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optTodos.CheckedChanged
        If optTodos.Checked = True Then
            Me.lblOptPrincipalTodos.Text = 2
            Call AtualizarConsulta()
        End If
    End Sub

    Protected Sub chkSupermercados_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkSupermercados.CheckedChanged
        Call FormatoAtualiza()
        Me.lblOptFormato.Text = 2   'Não todos
        Call CreateTipo()
        Call AtualizarConsultaPorFormato()
    End Sub

    Protected Sub chkHipermercados_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkHipermercados.CheckedChanged

        Call FormatoAtualiza()
        Me.lblOptFormato.Text = 2   'Não todos
        Call CreateTipo()
        Call AtualizarConsultaPorFormato()

    End Sub

    Protected Sub chkAtacado_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkAtacado.CheckedChanged

        Call FormatoAtualiza()
        Me.lblOptFormato.Text = 2   'Não todos
        Call CreateTipo()
        Call AtualizarConsultaPorFormato()

    End Sub

    Protected Sub chkDepositos_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkDepositos.CheckedChanged
        Call FormatoAtualiza()
        Me.lblOptFormato.Text = 2   'Não todos
        Call CreateTipo()
        Call AtualizarConsultaPorFormato()
    End Sub

    Protected Sub chkOutros_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkOutros.CheckedChanged
        Call FormatoAtualiza()
        Me.lblOptFormato.Text = 2   'Não todos
        Call CreateTipo()
        Call AtualizarConsultaPorFormato()
    End Sub

    Sub FormatoAtualiza()

        If Me.chkSupermercados.Checked = False Then
            If Me.chkHipermercados.Checked = False Then
                If Me.chkAtacado.Checked = False Then
                    If Me.chkDepositos.Checked = False Then
                        If Me.chkOutros.Checked = False Then
                            Me.lblOptFormato.Text = 1   'Todos 
                            Call CreateTipo()
                            Call AtualizarConsultaPorFormato()
                        End If
                    End If
                End If
            End If
        End If
    End Sub

    Sub AtualizarConsultaPorFormato()

        Dim sConnStr As String = cnnStr
        Dim cnBKTest As New SqlConnection(sConnStr)

        Dim cmdTest As New SqlCommand("uspConc_AtualizaView", cnBKTest)

        cmdTest.CommandType = CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@IPUser", SqlDbType.VarChar))
        cmdTest.Parameters("@IPUser").Value = Me.User.Identity.Name

        cnBKTest.Open()
        cmdTest.ExecuteNonQuery()
        cnBKTest.Close()

        Call AtualizarConsulta()

        If Me.optSupermercadista.Checked = True Then    'Supermercadista esta selecionado
            Me.grid.DataBind()
        Else    'Lojas esta selecionado
            Me.gridLojas.DataBind()
        End If

    End Sub

    Sub CreateTipo()
        Dim str As String = 1
        Dim conn As New SqlConnection(Conexao.gerConcor)
        Dim com As New SqlCommand(str, conn)
        Dim cmd As SqlCommand = Nothing
        com.Connection.Open()

        'Exclui todos os dados primeiro
        strSQL = "DELETE FROM tblConc_ttTipo WHERE IPUser = '" & Me.User.Identity.Name & "'"
        cmd = New SqlCommand(strSQL, conn)
        cmd.ExecuteNonQuery()

        Call CreateTipo_Structure(Me.chkSupermercados, 1) 'Supermercados
        Call CreateTipo_Structure(Me.chkHipermercados, 2) 'Hipermercados
        Call CreateTipo_Structure(Me.chkAtacarejo, 6) 'Atacarejo
        Call CreateTipo_Structure(Me.chkDepositos, 4) 'Depósitos
        Call CreateTipo_Structure(Me.chkFarmacia, 5) 'Farmácia
        Call CreateTipo_Structure(Me.chkAtacado, 3) 'Atacado
        Call CreateTipo_Structure(Me.chkPosto, 7) 'Posto
        Call CreateTipo_Structure(Me.chkOutros, 99) 'Outros    
    End Sub

    Sub CreateTipo_Structure(ByVal chkMy As ASPxCheckBox, ByVal numTipo As Byte)

        Dim str As String = 1
        Dim conn As New SqlConnection(Conexao.gerConcor)
        Dim com As New SqlCommand(str, conn)
        Dim cmd As SqlCommand = Nothing
        com.Connection.Open()

        'Adiciona os dados selecionados
        If chkMy.Checked = True Then
            strSQL = "INSERT INTO tblConc_ttTipo (TipoCod, IPUser) VALUES (" & numTipo & ", '" & Me.User.Identity.Name & "')"
            cmd = New SqlCommand(strSQL, conn)
            cmd.ExecuteNonQuery()
        End If
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        If Not IsPostBack Then  'O IsPostBack é acionado por um controle qualquer. No Init da página não há PostBack.
            Me.cboAno.Text = Year(Now())
            'Me.cboMes.Text = 1
            Me.cboMes.Text = "Janeiro"
            Me.cboAno.Text = 2013
            Me.optParana.Checked = True
            Me.optMensal.Checked = True
            Me.optSupermercadista.Checked = True
            Me.optPrincipaisSup.Checked = True
            Me.chkHipermercados.Checked = True
            Me.chkSupermercados.Checked = True
            Me.lblOptPrincipalTodos.Text = 1
            Me.lblOptFormato.Text = 2
            Session("varMesAno") = 1   'Mes
            Me.btnVendas.Enabled = False

            ' Prencher Cidade
            Call PreencherTodasCidades()
            Me.cboCidade.Text = 72

            Call CreateTipo()
            oVem.AtualizarEstatisticaPrograma(9, User.Identity.Name)

        End If

    End Sub

    Protected Sub cboAno_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.SelectedIndexChanged
        Call AtualizarConsulta()
    End Sub

    Protected Sub cboMes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.SelectedIndexChanged
        Call AtualizarConsulta()
    End Sub

    Sub AtualizarConsulta()
        Call CreateTipo()
        Dim sConnStr As String = cnnStr
        Dim cnBKTest As New SqlConnection(Conexao.gerConcor)

        If Me.optParana.Checked = True Then
            strBusca = "uspConc_Busca_Parana"
        ElseIf Me.optCidadesComCondor.Checked = True Then
            strBusca = "uspConc_Busca_Cidade"
        ElseIf Me.optTodasCidades.Checked = True Then
            strBusca = "uspConc_Busca_Cidade"
        End If

        Dim cmdTest As New SqlCommand(strBusca, cnBKTest)

        cmdTest.CommandType = CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        cmdTest.Parameters("@Ano").Value = Me.cboAno.Value

        cmdTest.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        cmdTest.Parameters("@Mes").Value = Me.cboMes.Value

        cmdTest.Parameters.Add(New SqlParameter("@OptPrincipalTodos", SqlDbType.TinyInt))
        cmdTest.Parameters("@OptPrincipalTodos").Value = CByte(Me.lblOptPrincipalTodos.Text)

        cmdTest.Parameters.Add(New SqlParameter("@IPUser", SqlDbType.VarChar))
        cmdTest.Parameters("@IPUser").Value = Me.User.Identity.Name

        If Me.optCidadesComCondor.Checked = True Or Me.optTodasCidades.Checked = True Then
            cmdTest.Parameters.Add(New SqlParameter("@Cidade", SqlDbType.SmallInt))
            cmdTest.Parameters("@Cidade").Value = Me.cboCidade.Value
        End If

        cmdTest.Parameters.Add(New SqlParameter("@varMesAno", SqlDbType.TinyInt))
        cmdTest.Parameters("@varMesAno").Value = Session("varMesAno")

        cnBKTest.Open()
        cmdTest.ExecuteNonQuery()
        cnBKTest.Close()

        If Me.optSupermercadista.Checked = True Then    'Supermercadista esta selecionado
            Me.grid.DataBind()
            Me.dsDetail.DataBind()
        Else    'Lojas esta selecionado
            Me.GridLojas.DataBind()
        End If

    End Sub

    Sub Preencher_tt_Cidades()
        Dim sConnStr As String = cnnStr
        Dim cnBKTest As New SqlConnection(sConnStr)

        Dim cmdTest As New SqlCommand("uspConc_ttAtualizaCidades", cnBKTest)

        cmdTest.CommandType = CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@Cidade", SqlDbType.SmallInt))
        cmdTest.Parameters("@Cidade").Value = Me.cboCidade.Value

        cmdTest.Parameters.Add(New SqlParameter("@IPUser", SqlDbType.VarChar))
        cmdTest.Parameters("@IPUser").Value = Me.User.Identity.Name

        cnBKTest.Open()
        cmdTest.ExecuteNonQuery()
        'Me.lblObs.Text = Me.cboCidade.Value
        cnBKTest.Close()

        Call AtualizarConsulta()
    End Sub

    Sub Preencher_tt_CidadesTodas()
        Dim sConnStr As String = cnnStr
        Dim cnBKTest As New SqlConnection(sConnStr)

        Dim cmdTest As New SqlCommand("uspConc_ttAtualizaCidadesTodas", cnBKTest)

        cmdTest.CommandType = CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@Cidade", SqlDbType.SmallInt))
        cmdTest.Parameters("@Cidade").Value = Me.cboCidade.Value

        cmdTest.Parameters.Add(New SqlParameter("@IPUser", SqlDbType.VarChar))
        cmdTest.Parameters("@IPUser").Value = Me.User.Identity.Name

        cnBKTest.Open()
        cmdTest.ExecuteNonQuery()
        cnBKTest.Close()

        Call AtualizarConsulta()
    End Sub

    Sub PreencherCidadesComCondor()

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT CodCidade, RTRIM(DescCidade) AS 'DescCidade' FROM tblCidadeCondor"

        Dim Conn As New SqlConnection(cnnStr)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)
        Conn.Open()

        objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
        Me.cboCidade.ValueField = "CodCidade"
        Me.cboCidade.TextField = "DescCidade"
        Me.cboCidade.DataSource = objDr
        Me.cboCidade.DataBind()
        Conn.Close()
    End Sub

    Sub PreencherTodasCidades()

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT cidregCod, cidregDesc FROM Cadastros.tblCidadeRegiao"

        Dim conn As New SqlConnection   ' Criando o objeto connection
        Dim cmd As New SqlCommand
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet

        conn.ConnectionString = Conexao.gerConcor ' "Data Source=WIN-DJITT2B93NO;Initial Catalog=gerManager;User ID=sa;Password=rd700@1"
        cmd.Connection = conn
        cmd.CommandText = strSQL
        cmd.CommandType = CommandType.Text
        da.SelectCommand = cmd
        da.Fill(ds, "tblCidadeRegiao") ' Preenchendo o DataSet

        ' Desconectando o Banco de Dados
        conn.Dispose()
        cmd.Dispose()
        da.Dispose()

        Me.cboCidade.ValueField = "cidregCod"
        Me.cboCidade.TextField = "cidregDesc"
        cboCidade.DataSource = ds
        cboCidade.DataBind()


    End Sub

    Protected Sub optCidadesComCondor_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optCidadesComCondor.CheckedChanged
        If Me.optCidadesComCondor.Checked = True Then
            Me.cboCidade.Enabled = True
            Call PreencherCidadesComCondor()
            Me.cboCidade.Text = Me.cboCidade.Value
            Call Preencher_tt_Cidades()
        End If
    End Sub

    Protected Sub optParana_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optParana.CheckedChanged
        If Me.optParana.Checked = True Then
            Me.cboCidade.Enabled = False
            Call AtualizarConsulta()
        End If
    End Sub

    Protected Sub optTodasCidades_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optTodasCidades.CheckedChanged
        If Me.optTodasCidades.Checked = True Then

            Me.cboCidade.Enabled = True
            Call PreencherCidadesComCondor()
            Me.cboCidade.Text = Me.cboCidade.Value
            Call Preencher_tt_Cidades()

            Me.cboCidade.Enabled = True
            Call PreencherTodasCidades()
            Me.cboCidade.Text = Me.cboCidade.Value

        End If
    End Sub

    Protected Sub optConcDiretos_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optConcDiretos.CheckedChanged
        If Me.optConcDiretos.Checked = True Then
            Me.cboCidade.Enabled = False
        End If
    End Sub

    Protected Sub cboCidade_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboCidade.SelectedIndexChanged
        If Me.optTodasCidades.Checked = True Then
            Call Preencher_tt_CidadesTodas()
        End If

        If Me.optCidadesComCondor.Checked = True Then
            Call Preencher_tt_Cidades()
        End If

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        If e.DataColumn.FieldName = "vlrDifMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrDifAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrDifMAperc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrDifAAperc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub gridLojas_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridLojas.HtmlDataCellPrepared
        If e.DataColumn.FieldName = "vlrDifMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrDifAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrDifMAperc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrDifAAperc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "StatusDesc" Then
            Select Case Convert.ToString(e.CellValue)
                Case "Original"
                    e.Cell.ForeColor = System.Drawing.Color.Blue
                Case "% Cresc."
                    e.Cell.ForeColor = System.Drawing.Color.Chocolate
                Case "% ABRAS"
                    e.Cell.ForeColor = System.Drawing.Color.DarkGreen
            End Select
        End If
     
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Call AtualizarConsulta()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Estimativa de Vendas dos Concorrentes"
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        Me.lblIPUser.Text = User.Identity.Name
    End Sub

    Sub PreencherCadastroLojas(ByVal iCNPJ As String)

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT [IE], [BAI_NO], [Endereço], [Ativo], [cidregDesc], [Obs], [Notes], [imgLoja] FROM [viewConcPorCidade] WHERE ([CNPJ_Principal] = " & iCNPJ & ")"
        Dim Conn As New SqlConnection(cnnStr)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)
        Conn.Open()

        objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

        Me.gridCadLojas.DataSource = objDr
        Me.gridCadLojas.DataBind()
        Conn.Close()
    End Sub

    Private Sub BuscarNomeFantasia()

        Dim con As New SqlConnection(cnnStr)
        Dim cmdTest As New SqlCommand("spu_Conc_BuscarNomeFantasia", con)
        cmdTest.CommandType = CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@IE", SqlDbType.BigInt))
        cmdTest.Parameters("@IE").Value = CLng(Me.txtIE.Text)

        Try

            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = cmdTest.ExecuteReader()
            While reader5.Read
                Me.lbl_VCS_NomeFantasia.Text = reader5.GetSqlString(0)
                Me.lblEndereco.Text = reader5.GetSqlString(1)
                Me.lblCEP.Text = reader5.GetSqlString(2)
            End While

        Catch ex As Exception
            Beep()
            oVem.UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try

    End Sub

    Protected Sub popAlterarVenda_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles popAlterarVenda.Load
        On Error Resume Next
        Me.txtIE_U.Text = Me.txtIE.Text
        Me.cboAno_U.Text = Me.cboAno.Text
        Me.cboMes_U.Text = Me.cboMes.Text
        Me.cboStatus.Text = "Manual"
        Me.txtVenda_U.Focus()
    End Sub

    Protected Sub optMensal_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optMensal.CheckedChanged
        If Me.optMensal.Checked = True Then
            Session("varMesAno") = 1
            Call AtualizarConsulta()
        End If
    End Sub

    Protected Sub optAcumulado_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optAcumulado.CheckedChanged
        If Me.optAcumulado.Checked = True Then
            Session("varMesAno") = 2
            Call AtualizarConsulta()
        End If


    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click
        Dim sConnStr As String = cnnStr
        Dim cnBKTest As New SqlConnection(sConnStr)

        Dim cmdTest As New SqlCommand("uspConc_AtualizarVendaManual", cnBKTest)

        cmdTest.CommandType = CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@IE", SqlDbType.Float))
        cmdTest.Parameters("@IE").Value = Me.txtIE_U.Value

        cmdTest.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        cmdTest.Parameters("@Ano").Value = Me.cboAno_U.Value

        cmdTest.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        cmdTest.Parameters("@Mes").Value = Me.cboMes_U.Value

        cmdTest.Parameters.Add(New SqlParameter("@vlr", SqlDbType.Money))
        cmdTest.Parameters("@vlr").Value = Me.txtVenda_U.Text

        Try
            cnBKTest.Open()
            cmdTest.ExecuteNonQuery()
            cnBKTest.Close()
            oVem.UserMsgBox(Me, "A venda foi alterada com sucesso!!!")
            Me.gridVendasPorIE.DataBind()

        Catch ex As Exception
            oVem.UserMsgBox(Me, ex.Message)
        Finally
            cnBKTest.Close()
        End Try
        
    End Sub

    Protected Sub cboMes_U_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes_U.SelectedIndexChanged
        Me.lblMesU.Text = Me.cboMes_U.Value
    End Sub

    Protected Sub btnExportarExcel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportarExcel.Click
        Me.ExporterExcel1.WriteXlsToResponse()
    End Sub

    Protected Sub detailGrid_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs)
        If e.DataColumn.FieldName = "vlrDifMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrDifAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrDifMAperc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrDifAAperc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub cboSupermercadista_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboSupermercadista.SelectedIndexChanged
        Call PreencherCadastroLojas(Me.cboSupermercadista.Value)
        selectedProduct = Me.GetSelectedProduct

        imgProduct.ImageUrl = "~//image//Concorrentes//" & selectedProduct.ImageFile
        
    End Sub

    Private Function GetSelectedProduct() As Product
        Dim productTable As DataView = CType(dsListaSupermercadista.Select( _
            DataSourceSelectArguments.Empty), DataView)
        productTable.RowFilter = "CNPJ_Principal = '" & Me.cboSupermercadista.Value & "'"
        Dim productRow As DataRowView = productTable(0)

        Dim product As New Product
        'product.ProductID = productRow("ProductID").ToString
        'product.Name = productRow("Name").ToString
        'product.ShortDescription = productRow("ShortDescription").ToString
        'product.LongDescription = productRow("LongDescription").ToString
        'product.UnitPrice = CDec(productRow("UnitPrice"))
        product.ImageFile = productRow("imgLogo").ToString
        Return product
    End Function

    Protected Sub gridVendasPorIE_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridVendasPorIE.CustomSummaryCalculate
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

   If e.IsTotalSummary Then
            If summary.FieldName = "perc2012" Then
                Dim vlrAT As Decimal = Convert.ToDecimal(gridVendasPorIE.GetTotalSummaryValue(gridVendasPorIE.TotalSummary("2012")))
                Dim vlrAA As Decimal = Convert.ToDecimal(gridVendasPorIE.GetTotalSummaryValue(gridVendasPorIE.TotalSummary("2011")))
                e.TotalValue = (((vlrAT / vlrAA) * 100) - 100)
            End If

            If summary.FieldName = "perc2011" Then
                Dim vlrAT As Decimal = Convert.ToDecimal(gridVendasPorIE.GetTotalSummaryValue(gridVendasPorIE.TotalSummary("2011")))
                Dim vlrAA As Decimal = Convert.ToDecimal(gridVendasPorIE.GetTotalSummaryValue(gridVendasPorIE.TotalSummary("2010")))
                e.TotalValue = (((vlrAT / vlrAA) * 100) - 100)
            End If

            If summary.FieldName = "perc2010" Then
                Dim vlrAT As Decimal = Convert.ToDecimal(gridVendasPorIE.GetTotalSummaryValue(gridVendasPorIE.TotalSummary("2010")))
                Dim vlrAA As Decimal = Convert.ToDecimal(gridVendasPorIE.GetTotalSummaryValue(gridVendasPorIE.TotalSummary("2009")))
                e.TotalValue = (((vlrAT / vlrAA) * 100) - 100)
            End If

            If summary.FieldName = "perc2009" Then
                Dim vlrAT As Decimal = Convert.ToDecimal(gridVendasPorIE.GetTotalSummaryValue(gridVendasPorIE.TotalSummary("2009")))
                Dim vlrAA As Decimal = Convert.ToDecimal(gridVendasPorIE.GetTotalSummaryValue(gridVendasPorIE.TotalSummary("2008")))
                e.TotalValue = (((vlrAT / vlrAA) * 100) - 100)
            End If

            If summary.FieldName = "perc2008" Then
                Dim vlrAT As Decimal = Convert.ToDecimal(gridVendasPorIE.GetTotalSummaryValue(gridVendasPorIE.TotalSummary("2008")))
                Dim vlrAA As Decimal = Convert.ToDecimal(gridVendasPorIE.GetTotalSummaryValue(gridVendasPorIE.TotalSummary("2007")))
                e.TotalValue = (((vlrAT / vlrAA) * 100) - 100)
            End If

            If summary.FieldName = "perc2013" Then
                Dim vlrAT As Decimal = Convert.ToDecimal(gridVendasPorIE.GetTotalSummaryValue(gridVendasPorIE.TotalSummary("2013")))
                Dim vlrAA As Decimal = Convert.ToDecimal(gridVendasPorIE.GetTotalSummaryValue(gridVendasPorIE.TotalSummary("2012")))
                e.TotalValue = (((vlrAT / vlrAA) * 100) - 100)
            End If

 
        End If
    End Sub

    Protected Sub gridVendasPorIE_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridVendasPorIE.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "perc2012" Or _
           e.DataColumn.FieldName = "perc2011" Or _
           e.DataColumn.FieldName = "perc2010" Or _
           e.DataColumn.FieldName = "perc2009" Or _
           e.DataColumn.FieldName = "perc2008" Or _
           e.DataColumn.FieldName = "perc2007" Or _
           e.DataColumn.FieldName = "perc2013" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            Else
                e.Cell.ForeColor = System.Drawing.Color.Blue
            End If
        End If
    End Sub

    Protected Sub gridVendasPorIE_SummaryDisplayText(sender As Object, e As ASPxGridViewSummaryDisplayTextEventArgs) Handles gridVendasPorIE.SummaryDisplayText
        On Error Resume Next
        If e.Item.FieldName = "perc2012" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridVendasPorIE.Columns.Item("perc2012").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridVendasPorIE.Columns.Item("perc2012").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "perc2011" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridVendasPorIE.Columns.Item("perc2011").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridVendasPorIE.Columns.Item("perc2011").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "perc2010" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridVendasPorIE.Columns.Item("perc2010").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridVendasPorIE.Columns.Item("perc2010").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "perc2009" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridVendasPorIE.Columns.Item("perc2009").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridVendasPorIE.Columns.Item("perc2009").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "perc2008" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridVendasPorIE.Columns.Item("perc2008").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridVendasPorIE.Columns.Item("perc2008").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "perc2007" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridVendasPorIE.Columns.Item("perc2007").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridVendasPorIE.Columns.Item("perc2007").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

        If e.Item.FieldName = "perc2013" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.gridVendasPorIE.Columns.Item("perc2013").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.gridVendasPorIE.Columns.Item("perc2013").FooterCellStyle.ForeColor = Drawing.Color.Blue
            End If
        End If

    End Sub

    Protected Sub detailGrid_SummaryDisplayText(sender As Object, e As ASPxGridViewSummaryDisplayTextEventArgs)
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsTotalSummary Then
            If summary.FieldName = "vlrDifMA" Then
                If Convert.ToDecimal(e.Value) < 0 Then
                    Me.gridVendasPorIE.Columns.Item("vlrDifMA").FooterCellStyle.ForeColor = Drawing.Color.Red
                End If
            End If
        End If
    End Sub

    Protected Sub chkCabecalho_CheckedChanged(sender As Object, e As EventArgs) Handles chkCabecalho.CheckedChanged
        Call FixarCabecalho()
    End Sub

    Private Sub FixarCabecalho()
        If Me.optSupermercadista.Checked = True Then
            If Me.chkCabecalho.Checked = True Then
                Me.grid.Settings.ShowVerticalScrollBar = True
            Else
                Me.grid.Settings.ShowVerticalScrollBar = False
            End If
        Else
            If Me.chkCabecalho.Checked = True Then
                Me.gridLojas.Settings.ShowVerticalScrollBar = True
            Else
                Me.gridLojas.Settings.ShowVerticalScrollBar = False
            End If
        End If
    End Sub

    
    Protected Sub chkAtacarejo_CheckedChanged(sender As Object, e As EventArgs) Handles chkAtacarejo.CheckedChanged
        Call FormatoAtualiza()
        Me.lblOptFormato.Text = 2   'Não todos
        Call CreateTipo()
        Call AtualizarConsultaPorFormato()

    End Sub

    Protected Sub chkFarmacia_CheckedChanged(sender As Object, e As EventArgs) Handles chkFarmacia.CheckedChanged
        Call FormatoAtualiza()
        Me.lblOptFormato.Text = 2   'Não todos
        Call CreateTipo()
        Call AtualizarConsultaPorFormato()

    End Sub

    Protected Sub chkPosto_CheckedChanged(sender As Object, e As EventArgs) Handles chkPosto.CheckedChanged
        Call FormatoAtualiza()
        Me.lblOptFormato.Text = 2   'Não todos
        Call CreateTipo()
        Call AtualizarConsultaPorFormato()
    End Sub

   
    Protected Sub panelTodasVendas_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles panelTodasVendas.Callback
        Me.gridVendasPorIE.DataBind()
        Me.lbl_VCS_IE.Text = Me.txtIE.Text
        Call BuscarNomeFantasia()
        Select Case Me.lbl_VCS_NomeFantasia.Text
            Case "Irmãos Muffato"
                Me.imgLogo.ImageUrl = "/gerencial_hp/image/Concorrentes/logo_muffato.png"
            Case "BIG"
                Me.imgLogo.ImageUrl = "/gerencial_hp/image/Concorrentes/logo_big.png"
            Case "Agricer"
                Me.imgLogo.ImageUrl = "/gerencial_hp/image/Concorrentes/logo_agricer.png"
            Case "Alvorada"
                Me.imgLogo.ImageUrl = "/gerencial_hp/image/Concorrentes/logo_alvorada.png"
            Case "Angeloni"
                Me.imgLogo.ImageUrl = "/gerencial_hp/image/Concorrentes/logo_angeloni.png"
        End Select
    End Sub

End Class
