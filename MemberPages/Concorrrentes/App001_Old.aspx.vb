
#Region " Imports"

Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Web
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.IO
Imports System.Web.UI
Imports System.Web.UI.WebControls

#End Region

Partial Class App001_Old

    Inherits System.Web.UI.Page

#Region " Dim / Private"

    Dim strSQL, strBusca As String
    Dim cnnStr As String = "Data Source=WIN-DJITT2B93NO;Initial Catalog=gerConcor;User ID=sa; PWD=rd700@1"
    Dim connString As String = "Data Source=WIN-DJITT2B93NO;Initial Catalog=gerContSQL1;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Dim cnnStrManager As String = "Data Source=WIN-DJITT2B93NO;Initial Catalog=gerManager;User ID=sa; PWD=rd700@1"
    Private selectedProduct As Product
    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes
    Dim oProj As New Projeto

#End Region

#Region " Atualizações"

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

    Sub AtualizarConsulta()
        If Me.optSupermercadista.Checked = True Then    'Supermercadista esta selecionado
            oFun.Grid_ColumnTitle(grid, "partAT", cboAno.Value)
            oFun.Grid_ColumnTitle(grid, "partAA", cboAno.Value - 1)
            Me.grid.DataBind()
            Me.dsDetail.DataBind()
        Else    'Lojas esta selecionado
            Me.gridLojas.DataBind()
        End If

    End Sub

    Sub AtualizarConsultaPorFormato()

        Call AtualizarConsulta()

    End Sub


#End Region

#Region " Check"

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

    Protected Sub chkAtacarejo_CheckedChanged(sender As Object, e As EventArgs) Handles chkAtacarejo.CheckedChanged
        Call FormatoAtualiza()
        Me.lblOptFormato.Text = 2   'Não todos
        Call CreateTipo()
        Call AtualizarConsultaPorFormato()

    End Sub

    Protected Sub chkGourmet_CheckedChanged(sender As Object, e As EventArgs) Handles chkGourmet.CheckedChanged
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

    Protected Sub chkLojaDepto_CheckedChanged(sender As Object, e As EventArgs) Handles chkLojaDepto.CheckedChanged
        Call FormatoAtualiza()
        Me.lblOptFormato.Text = 2   'Não todos
        Call CreateTipo()
        Call AtualizarConsultaPorFormato()
    End Sub

    Protected Sub chkMatriz_CheckedChanged(sender As Object, e As EventArgs) Handles chkMatriz.CheckedChanged
        Call FormatoAtualiza()
        Me.lblOptFormato.Text = 2   'Não todos
        Call CreateTipo()
        Call AtualizarConsultaPorFormato()
    End Sub

#End Region

#Region " Tipo"

    Sub CreateTipo()
        Dim str As String = 1
        Dim conn As New SqlConnection(cnnStr)
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
        Call CreateTipo_Structure(Me.chkGourmet, 9) 'Gourmet
        Call CreateTipo_Structure(Me.chkDepositos, 4) 'Depósitos
        Call CreateTipo_Structure(Me.chkFarmacia, 5) 'Farmácia
        Call CreateTipo_Structure(Me.chkAtacado, 3) 'Atacado
        Call CreateTipo_Structure(Me.chkPosto, 7) 'Posto
        Call CreateTipo_Structure(Me.chkLojaDepto, 8) 'Loja Depto.
        Call CreateTipo_Structure(Me.chkMatriz, 10) 'Loja Depto.
        Call CreateTipo_Structure(Me.chkOutros, 99) 'Outros    
    End Sub

    Sub CreateTipo_Structure(ByVal chkMy As ASPxCheckBox, ByVal numTipo As Byte)

        Dim str As String = 1
        Dim conn As New SqlConnection(cnnStr)
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

#End Region

#Region " Page"

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        If Not IsPostBack Then  'O IsPostBack é acionado por um controle qualquer. No Init da página não há PostBack.
            Me.cboAno.Text = Year(Now())
            'Me.cboMes.Text = 1
            Me.cboMes.Text = "Janeiro"
            Me.cboAno.Text = 2019

            Me.optMensal.Checked = True
            Me.optSupermercadista.Checked = True

            Me.chkHipermercados.Checked = True
            Me.chkSupermercados.Checked = True
            Me.lblOptPrincipalTodos.Text = 1
            Me.lblOptFormato.Text = 2
            Session("varMesAno") = 1   'Mes
            Me.btnVendas.Enabled = False



            Call CreateTipo()
            oVem.AtualizarEstatisticaPrograma(9, User.Identity.Name)

            Session("sANO") = Me.cboAno.Value
            Session("sMES") = Me.cboMes.Value
            Session("sUSER") = Page.User.Identity.Name
            Session("sCIDADE") = 2
            Session("sPERIODO") = 1
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If LCase(Trim(oProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))) = "supervisor" Then
                optConcDiretos.Enabled = False
                optTodasCidades.Enabled = False
                optCidadesComCondor.Enabled = False
                optAcumulado.Enabled = False
                optParana.Enabled = False

                optConcDiretos.Checked = True

                Session("sCIDADE") = 3
                Me.cboCidade.Enabled = True
                Call PreencherLojas_ConcorrentesDiretos() 'Agora preencher loja
                Me.cboCidade.Text = 3
                Call Preencher_tt_Filial()

                Me.cboCidade.Enabled = True
            Else
                Me.optParana.Checked = True
                ' Prencher Cidade
                Me.cboCidade.Enabled = False
                Call PreencherTodasCidades()
                Me.cboCidade.Text = "Curitiba"
            End If
            Call AtualizarConsulta()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Estimativa de Vendas dos Concorrentes - PGR9"
        End If
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Me.lblIPUser.Text = User.Identity.Name
            Me.cboSize.Text = 100
        End If

    End Sub

#End Region

#Region " Options"

    Protected Sub optLoja_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optLoja.CheckedChanged
        If Me.optLoja.Checked = True Then
            Me.gridLojas.Visible = True
            Me.gridLojas.DataBind()

            Me.grid.Visible = False
            Me.btnVendas.Enabled = True
            Me.btnExportarExcel.Visibled = True
            Me.btnExportarExcel_Principal.Visibled = False

            Call AtualizarConsulta()

        End If

    End Sub

    Protected Sub optSupermercadista_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optSupermercadista.CheckedChanged

        If Me.optSupermercadista.Checked = True Then
            Me.grid.Visible = True
            Me.grid.DataBind()

            Me.gridLojas.Visible = False
            Me.btnVendas.Enabled = False
            Me.btnExportarExcel.Visibled = False
            Me.btnExportarExcel_Principal.Visibled = True
            Call AtualizarConsulta()
        End If

    End Sub

    Protected Sub optCidadesComCondor_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optCidadesComCondor.CheckedChanged
        If Me.optCidadesComCondor.Checked = True Then
            Session("sCIDADE") = 4
            Me.cboCidade.Enabled = True
            PreencherCidadesComCondor() 'Agora preencher loja
            Me.cboCidade.Text = 72
            Preencher_tt_Cidades()
        End If
    End Sub

    Protected Sub optParana_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optParana.CheckedChanged
        If Me.optParana.Checked = True Then
            Session("sCIDADE") = 2
            Me.cboCidade.Enabled = False
            Call AtualizarConsulta()
        End If
    End Sub

    Protected Sub optTodasCidades_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optTodasCidades.CheckedChanged
        If Me.optTodasCidades.Checked = True Then
            Session("sCIDADE") = 1
            Me.cboCidade.Enabled = True
            Call PreencherTodasCidades()
            Me.cboCidade.Text = Me.cboCidade.Value

        End If
    End Sub

    Protected Sub optConcDiretos_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optConcDiretos.CheckedChanged
        If Me.optConcDiretos.Checked = True Then
            Session("sCIDADE") = 3
            Me.cboCidade.Enabled = True
            Call PreencherLojas_ConcorrentesDiretos() 'Agora preencher loja
            Me.cboCidade.Text = 3
            Call Preencher_tt_Filial()
        End If
    End Sub

    Protected Sub optMensal_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optMensal.CheckedChanged
        If Me.optMensal.Checked = True Then
            Session("sPERIODO") = 1
            Session("varMesAno") = 1
            Call AtualizarConsulta()
            Call Legenda_Mes_Acumulado()
        End If
        Call OcultarExibir_MesAnterior()
    End Sub

    Protected Sub optAcumulado_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optAcumulado.CheckedChanged

        If Me.optAcumulado.Checked = True Then
            Me.lblPeriodo.Text = "Acumulado até"
        End If

        If Me.optAcumulado.Checked = True Then
            Session("sPERIODO") = 2
            Session("varMesAno") = 2
            Call AtualizarConsulta()
        End If
        Call OcultarExibir_MesAnterior()

    End Sub

#End Region

#Region " cbo"

    Protected Sub cboAno_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.SelectedIndexChanged
        Session("sANO") = Me.cboAno.Value
        Call AtualizarConsulta()
    End Sub

    Protected Sub cboMes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.SelectedIndexChanged
        Session("sMES") = Me.cboMes.Value
        Call AtualizarConsulta()
    End Sub

    Protected Sub cboMes_U_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes_U.SelectedIndexChanged
        Me.lblMesU.Text = Me.cboMes_U.Value
    End Sub

    Protected Sub cboSupermercadista_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboSupermercadista.SelectedIndexChanged
        Call PreencherCadastroLojas(Me.cboSupermercadista.Value)
        selectedProduct = Me.GetSelectedProduct

        imgProduct.ImageUrl = "~//image//Concorrentes//" & selectedProduct.ImageFile

    End Sub

    Protected Sub cboCidade_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboCidade.SelectedIndexChanged
        If Me.optTodasCidades.Checked = True Then
            Call Preencher_tt_CidadesTodas()
            Call AtualizarConsulta()
        End If

        If optConcDiretos.Checked = True Then
            Call Preencher_tt_Filial()
            Call AtualizarConsulta()
        End If

        If Me.optCidadesComCondor.Checked = True Then
            Call Preencher_tt_Cidades()
            Call AtualizarConsulta()
        End If

    End Sub

    Protected Sub cboSize_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged
        Call Zoom()

        If Me.optSupermercadista.Checked = True Then
            Me.grid.DataBind()
        Else
            Me.gridLojas.DataBind()
        End If

    End Sub


#End Region

#Region " Preencher"

    Sub Preencher_tt_Filial()
        Dim sConnStr As String = cnnStr
        Dim cnBKTest As New SqlConnection(sConnStr)

        Dim cmdTest As New SqlCommand("uspConc_ttAtualizaFilial", cnBKTest)

        cmdTest.CommandType = CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        cmdTest.Parameters("@idFilial").Value = Me.cboCidade.Value

        cmdTest.Parameters.Add(New SqlParameter("@IPUser", SqlDbType.VarChar))
        cmdTest.Parameters("@IPUser").Value = Me.User.Identity.Name

        cnBKTest.Open()
        cmdTest.ExecuteNonQuery()
        'Me.lblObs.Text = Me.cboCidade.Value
        cnBKTest.Close()

        Call AtualizarConsulta()
    End Sub

    Sub Preencher_tt_Cidades()
        Dim sConnStr As String = cnnStr
        Dim cnBKTest As New SqlConnection(sConnStr)

        Dim cmdTest As New SqlCommand("uspConc_ttAtualizaCidades", cnBKTest)

        cmdTest.CommandType = CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@Cidade", SqlDbType.SmallInt))
        cmdTest.Parameters("@Cidade").Value = Me.cboCidade.Value

        cmdTest.Parameters.Add(New SqlParameter("@CidadeDesc", SqlDbType.VarChar))
        cmdTest.Parameters("@CidadeDesc").Value = Me.cboCidade.Text

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

        cmdTest.Parameters.Add(New SqlParameter("@Cidade", SqlDbType.VarChar))
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
        Dim strSQL As String = "SELECT CodCidade, DescCidade FROM dbo.tblCidadeCondor"

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

    Sub PreencherLojas_ConcorrentesDiretos()

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT Filial AS CodCidade, [Desc] AS DescCidade FROM gerManager.dbo.listLojas"


        Dim Conn As New SqlConnection(cnnStrManager)
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

        ''define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        'Dim strSQL As String = "SELECT cidade FROM tblCidadeRegiao"

        ''Dim Conn As New SqlConnection(cnnStr)
        'Dim objDr As SqlDataReader
        'Dim Cmd As New SqlCommand(strSQL, Conn)
        'Conn.Open()

        'objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

        'Me.cboCidade.ValueField = "cidade"
        'Me.cboCidade.TextField = "cidade"
        'Me.cboCidade.DataSource = objDr
        'Me.cboCidade.DataBind()
        'Conn.Close()

        ' -------------------------------------------------------------------------------------------------------------

        Dim conn As New SqlConnection   ' Criando o objeto connection
        Dim cmd As New SqlCommand
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet

        conn.ConnectionString = cnnStr ' "Data Source=WIN-DJITT2B93NO;Initial Catalog=gerManager;User ID=sa;Password=rd700@1"
        cmd.Connection = conn
        cmd.CommandText = "SELECT cidade FROM tblCidadeRegiao"
        cmd.CommandType = CommandType.Text
        da.SelectCommand = cmd
        da.Fill(ds, "tblCidadeRegiao") ' Preenchendo o DataSet

        ' Desconectando o Banco de Dados
        conn.Dispose()
        cmd.Dispose()
        da.Dispose()

        Me.cboCidade.ValueField = "cidade"
        Me.cboCidade.TextField = "cidade"
        Me.cboCidade.DataSource = ds
        Me.cboCidade.DataBind()


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


#End Region

#Region " grid"

    Protected Sub grid_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "vlrDifMA")
        oFun.Grid_RedIsNegative(e, "vlrDifAA")
        oFun.Grid_RedIsNegative(e, "vlrDifMAperc")
        oFun.Grid_RedIsNegative(e, "vlrDifAAperc")

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate_Detail(sender, e, "vlrDifMAperc", "vlrAT", "vlrMA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate_Detail(sender, e, "vlrDifAAperc", "vlrAT", "vlrAA", Funcoes.CalculateType.Growth)

    End Sub


#End Region

#Region " gridLojas"

    Protected Sub gridLojas_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridLojas.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "vlrDifMA")
        oFun.Grid_RedIsNegative(e, "vlrDifAA")
        oFun.Grid_RedIsNegative(e, "vlrDifMAperc")
        oFun.Grid_RedIsNegative(e, "vlrDifAAperc")

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

    Protected Sub gridLojas_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridLojas.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub gridLojas_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridLojas.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate_Detail(sender, e, "vlrDifMAperc", "vlrAT", "vlrMA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate_Detail(sender, e, "vlrDifAAperc", "vlrAT", "vlrAA", Funcoes.CalculateType.Growth)

    End Sub

#End Region

#Region " detailGrid"

    Protected Sub detailGrid_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs)

        oFun.Grid_RedIsNegative(e, "vlrDifMA")
        oFun.Grid_RedIsNegative(e, "vlrDifAA")
        oFun.Grid_RedIsNegative(e, "vlrDifMAperc")
        oFun.Grid_RedIsNegative(e, "vlrDifAAperc")
    End Sub

    Protected Sub detailGrid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub detailGrid_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        Session("CNPJ") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub detailGrid_Load(sender As Object, e As EventArgs)
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)

        If Me.optAcumulado.Checked = True Then
            gridView.Columns.Item("bandMesAnterior").Visible = False
        Else
            gridView.Columns.Item("bandMesAnterior").Visible = True
        End If

        'Definir Linhas
        Select Case Me.cboSize.SelectedValue
            Case 80
                gridView.Settings.VerticalScrollableHeight = 90
                gridView.Width = 730
            Case 90
                gridView.Settings.VerticalScrollableHeight = 120
                gridView.Width = 830
            Case 100
                gridView.Settings.VerticalScrollableHeight = 150
                gridView.Width = 930
            Case 110
                gridView.Settings.VerticalScrollableHeight = 160
                gridView.Width = 1020
            Case 120
                gridView.Settings.VerticalScrollableHeight = 190
                gridView.Width = 1120
            Case 130
                gridView.Settings.VerticalScrollableHeight = 230
                gridView.Width = 1210
            Case 140
                gridView.Settings.VerticalScrollableHeight = 260
                gridView.Width = 1300
            Case 150
                gridView.Settings.VerticalScrollableHeight = 280
                gridView.Width = 1300
        End Select

    End Sub

    Protected Sub detailGrid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)
        On Error Resume Next

        oFun.Grid_Footer_Calculate_Detail(sender, e, "vlrDifMAperc", "vlrAT", "vlrMA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate_Detail(sender, e, "vlrDifAAperc", "vlrAT", "vlrAA", Funcoes.CalculateType.Growth)

    End Sub

#End Region

#Region " gridVendasPorIE"

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

#End Region

#Region " btn"

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

#End Region

#Region " Funções"

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

    Private Sub OcultarExibir_MesAnterior()

        If Me.optAcumulado.Checked = True Then
            Me.grid.Columns.Item("bandMesAnterior").Visible = False
            Me.gridLojas.Columns.Item("bandMesAnterior").Visible = False
        Else
            Me.grid.Columns.Item("bandMesAnterior").Visible = True
            Me.gridLojas.Columns.Item("bandMesAnterior").Visible = True
        End If

        If Me.optAcumulado.Checked = True Then
            Me.lblPeriodo.Text = "Acumulado até"
        End If

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

    Protected Sub callbackPanel_Callback(ByVal source As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
        edBinaryImage.Value = FindImage(e.Parameter)
        litText.Text = GetNotes(e.Parameter).ToString()
    End Sub

    Private Function GetNotes(ByVal id As String) As Object
        Dim ds As New AccessDataSource()
        ds.DataFile = AccessDataSource1.DataFile
        ds.SelectCommand = String.Format("Select Notes FROM [Images] WHERE [IE]={0}", id)
        Dim view As DataView = CType(ds.Select(DataSourceSelectArguments.Empty), DataView)
        If view.Count > 0 Then
            Return view(0)("Notes")
        End If
        Return Nothing
    End Function

    Private Function FindImage(ByVal id As String) As Byte()
        Dim ds As New AccessDataSource()
        ds.DataFile = AccessDataSource1.DataFile
        ds.SelectCommand = "select ImageData from [Images] where IE=" & id
        Dim view As DataView = CType(ds.Select(DataSourceSelectArguments.Empty), DataView)
        If view.Count > 0 Then
            Return TryCast(view(0)(0), Byte())
        End If
        Return Nothing
    End Function

    Private Sub Zoom()
        Dim gridWith As Int16
        Dim gridHeight As Int16
        Dim gridHeightLojas As Int16

        If Me.cboSize.SelectedValue = 100 Then
            gridWith = 1000
            gridHeight = 330
            gridHeightLojas = 250
        Else

            If Me.cboSize.SelectedValue = 200 Then
                gridHeightLojas = 250 * 195 / 100
                gridHeight = 330 * 195 / 100
                gridWith = 1000 * 205 / 100
            ElseIf Me.cboSize.SelectedValue = 150 Then
                gridHeightLojas = 250 * 150 / 100
                gridHeight = 330 * 145 / 100
                gridWith = 1000 * 157 / 100
            ElseIf Me.cboSize.SelectedValue = 170 Then
                gridHeightLojas = 250 * 175 / 100
                gridHeight = 330 * 175 / 100
                gridWith = 1000 * 175 / 100
            Else
                gridHeightLojas = 250 * Me.cboSize.SelectedValue / 100
                gridHeight = 330 * Me.cboSize.SelectedValue / 100
                gridWith = 1000 * Me.cboSize.SelectedValue / 100
            End If

        End If


        'Definir Linhas
        Select Case Me.cboSize.SelectedValue
            Case 80
                Me.grid.SettingsPager.PageSize = 11
                Me.gridLojas.SettingsPager.PageSize = 9
            Case 90
                Me.grid.SettingsPager.PageSize = 12
                Me.gridLojas.SettingsPager.PageSize = 10
            Case 100
                Me.grid.SettingsPager.PageSize = 14
                Me.gridLojas.SettingsPager.PageSize = 11
            Case 110
                Me.grid.SettingsPager.PageSize = 15
                Me.gridLojas.SettingsPager.PageSize = 12
            Case 120
                Me.grid.SettingsPager.PageSize = 17
                Me.gridLojas.SettingsPager.PageSize = 13
            Case 130
                Me.grid.SettingsPager.PageSize = 19
                Me.gridLojas.SettingsPager.PageSize = 14
            Case 140
                Me.grid.SettingsPager.PageSize = 20
                Me.gridLojas.SettingsPager.PageSize = 16
            Case 150
                Me.grid.SettingsPager.PageSize = 21
                Me.gridLojas.SettingsPager.PageSize = 17
        End Select

        'Grid Principal
        Me.grid.Width = gridWith
        Me.grid.Settings.VerticalScrollableHeight = gridHeight

        'Grid Lojas
        Me.gridLojas.Width = gridWith
        Me.gridLojas.Settings.VerticalScrollableHeight = gridHeightLojas


    End Sub

    Private Sub Legenda_Mes_Acumulado()



        If Me.optMensal.Checked = True Then
            Me.lblPeriodo.Text = "Mês"
        End If

    End Sub

#End Region




End Class
