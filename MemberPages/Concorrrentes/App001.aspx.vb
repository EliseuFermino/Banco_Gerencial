
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

Partial Class MemberPages_Concorrrentes_App001
    Inherits System.Web.UI.Page

#Region " Dim / Private"

    Dim strSQL, strBusca As String
    'Dim cnnStr As String = "Data Source=WIN-DJITT2B93NO;Initial Catalog=gerConcor;User ID=sa; PWD=rd700@1"
    'Dim connString As String = "Data Source=WIN-DJITT2B93NO;Initial Catalog=gerContSQL1;Persist Security Info=True;User ID=sa;Password=rd700@1"
    'Dim cnnStrManager As String = "Data Source=WIN-DJITT2B93NO;Initial Catalog=gerManager;User ID=sa; PWD=rd700@1"
    Private selectedProduct As Product
    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes
    Dim oProj As New Projeto

#End Region

#Region " Tipo"

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
        Call CreateTipo_Structure(Me.chkGourmet, 9) 'Gourmet
        Call CreateTipo_Structure(Me.chkDepositos, 4) 'Depósitos
        Call CreateTipo_Structure(Me.chkFarmacia, 5) 'Farmácia
        Call CreateTipo_Structure(Me.chkAtacado, 3) 'Atacado
        Call CreateTipo_Structure(Me.chkPosto, 7) 'Posto
        Call CreateTipo_Structure(Me.chkLojaDepto, 8) 'Loja Depto.
        Call CreateTipo_Structure(Me.chkMatriz, 10) 'Loja Depto.
        Call CreateTipo_Structure(Me.chkCooperativa, 11) 'Cooperativa.
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

#End Region

    Protected Sub cbPanel_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanel.Callback

        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sMES_FINAL") = Me.cboMesFinal.CallMes

        If chkSupermercados.Checked = True Then
            lblError.Text = "Supermercados = TRUE"
        Else
            lblError.Text = "Supermercados = FALSE"
        End If

        Call CreateTipo()

        If Me.optCidadesComCondor.Checked = True Then
            lblCidade.Text = "CIDADE = TRUE"
            Session("sCIDADE") = 4
            Me.cboCidade.Enabled = True
            PreencherCidadesComCondor() 'Agora preencher loja
            Me.cboCidade.Text = 72
            Preencher_tt_Cidades()

        End If

        If Me.optLoja.Checked = True Then

            Me.gridLojas.Visible = True
            Me.gridLojas.DataBind()

            Me.grid.Visible = False

        End If

        If Me.optSupermercadista.Checked = True Then
            Me.grid.Visible = True
            Me.grid.DataBind()

            Me.gridLojas.Visible = False
        End If

        AtualizarConsulta()

        lblError.Text = "Session Ano: " & Session("sANO")

        cboSizeLoja.Visible = True

    End Sub

    Sub PreencherCidadesComCondor()

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT CodCidade, DescCidade FROM dbo.tblCidadeCondor"

        Dim conn As New SqlConnection(Conexao.gerConcor)
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

    Sub Preencher_tt_Cidades()
        Dim cnBKTest As New SqlConnection(Conexao.gerConcor)

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

        'Call AtualizarConsulta()
    End Sub

    Sub PreencherTodasCidades()

        ' -------------------------------------------------------------------------------------------------------------

        Dim strSQL As String = "SELECT CodCidade, DescCidade FROM tblCidadeRegiao"

        Dim conn As New SqlConnection(Conexao.gerConcor)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)
        Conn.Open()

        objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
        Me.cboCidade.ValueField = "CodCidade"
        Me.cboCidade.TextField = "DescCidade"
        Me.cboCidade.DataSource = objDr
        Me.cboCidade.DataBind()
        Conn.Close()


        'Dim conn As New SqlConnection(Conexao.gerConcor)
        'Dim cmd As New SqlCommand
        'Dim da As New SqlDataAdapter
        'Dim ds As New DataSet

        'conn.ConnectionString = cnnStr ' "Data Source=WIN-DJITT2B93NO;Initial Catalog=gerManager;User ID=sa;Password=rd700@1"
        'cmd.Connection = conn
        'cmd.CommandText = "SELECT CodCidade, DescCidade FROM tblCidadeRegiao"
        'cmd.CommandType = CommandType.Text
        'da.SelectCommand = cmd
        'da.Fill(ds, "tblCidadeRegiao") ' Preenchendo o DataSet

        '' Desconectando o Banco de Dados
        'conn.Dispose()
        'cmd.Dispose()
        'da.Dispose()

        'Me.cboCidade.ValueField = "CodCidade"
        'Me.cboCidade.TextField = "DescCidade"
        'Me.cboCidade.DataSource = ds
        'Me.cboCidade.DataBind()


    End Sub

    Sub PreencherLojas_ConcorrentesDiretos()

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT Filial AS CodCidade, [Desc] AS DescCidade FROM gerManager.dbo.listLojas"

        Dim conn As New SqlConnection(Conexao.gerManager)
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

    Sub Preencher_tt_Filial()
        Dim cnBKTest As New SqlConnection(Conexao.gerConcor)

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

        'Call AtualizarConsulta()
    End Sub

    Protected Sub cbPanelCidade_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanelCidade.Callback

        If Me.optCidadesComCondor.Checked = True Then
            lblCidade.Text = "CIDADE = TRUE"
            Session("sCIDADE") = 4
            Me.cboCidade.Enabled = True
            PreencherCidadesComCondor() 'Agora preencher loja
            Me.cboCidade.Value = 72
            Preencher_tt_Cidades()
        Else
            lblCidade.Text = "CIDADE = FALSE"
        End If

        If Me.optParana.Checked = True Then
            Session("sCIDADE") = 2
            Me.cboCidade.Enabled = False
            'Call AtualizarConsulta()
        End If

        If Me.optTodasCidades.Checked = True Then
            Session("sCIDADE") = 1
            Me.cboCidade.Enabled = True
            Call PreencherTodasCidades()
            'Me.cboCidade.Text = Me.cboCidade.Value

        End If

        If Me.optConcDiretos.Checked = True Then
            Session("sCIDADE") = 3
            Me.cboCidade.Enabled = True
            Call PreencherLojas_ConcorrentesDiretos() 'Agora preencher loja
            Me.cboCidade.Value = 3
            Call Preencher_tt_Filial()
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            cboAno.AnoInicial = 2014
            cboAno.AnoFinal = myDateTimes.YearToday
            cboAno.CallAno = myDateTimes.YearToday


            Session("sUSER") = Page.User.Identity.Name
            Session("sCIDADE") = 2
            Session("sPERIODO") = 1

            If LCase(Trim(oProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))) = "supervisor" Then
                optConcDiretos.Enabled = False
                optTodasCidades.Enabled = False
                optCidadesComCondor.Enabled = False
                'optAcumulado.Enabled = False
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


            oFun.Grid_Column_BorderRight(grid, "percPartAT", Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percPartAA1", Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percPartAA2", Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percPartAA3", Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(gridLojas, "percCrescAT", Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(gridLojas, "percCrescAA1", Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(gridLojas, "percCrescAA2", Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(gridLojas, "percCrescAA3", Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(gridLojas, "Endereco", Color.Gray, BorderStyle.Solid, 2)

        End If

    End Sub

#Region " grid"

    Protected Sub grid_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "vlrDifMA")
        oFun.Grid_RedIsNegative(e, "vlrDifAA")
        oFun.Grid_RedIsNegative(e, "vlrDifMAperc")
        oFun.Grid_RedIsNegative(e, "vlrDifAAperc")

        oFun.Grid_RedIsNegative(e, "percCrescAT")
        oFun.Grid_RedIsNegative(e, "percCrescAA1")
        oFun.Grid_RedIsNegative(e, "percCrescAA2")
        oFun.Grid_RedIsNegative(e, "percCrescAA3")

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate_Detail(sender, e, "vlrDifMAperc", "vlrAT", "vlrMA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate_Detail(sender, e, "vlrDifAAperc", "vlrAT", "vlrAA", Funcoes.CalculateType.Growth)

        oFun.Grid_Footer_Calculate_Detail(sender, e, "percCrescAT", "vlrAT", "vlrAA1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate_Detail(sender, e, "percCrescAA1", "vlrAA1", "vlrAA2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate_Detail(sender, e, "percCrescAA2", "vlrAA2", "vlrAA3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate_Detail(sender, e, "percCrescAA3", "vlrAA3", "vlrAA4", Funcoes.CalculateType.Growth)

    End Sub

#End Region

#Region " detailGrid"

    Protected Sub detailGrid_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs)

        oFun.Grid_RedIsNegative(e, "percCrescAT")
        oFun.Grid_RedIsNegative(e, "percCrescAA1")
        oFun.Grid_RedIsNegative(e, "percCrescAA2")
        oFun.Grid_RedIsNegative(e, "percCrescAA3")
    End Sub

    Protected Sub detailGrid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub detailGrid_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        Session("CNPJ") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub detailGrid_Load(sender As Object, e As EventArgs)
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)

        'If Me.optAcumulado.Checked = True Then
        '    gridView.Columns.Item("bandMesAnterior").Visible = False
        'Else
        '    gridView.Columns.Item("bandMesAnterior").Visible = True
        'End If

        'Definir Linhas

        oFun.Grid_ColumnTitle(gridView, "vlrAT", cboAno.CallAno)
        oFun.Grid_ColumnTitle(gridView, "vlrAA1", cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(gridView, "vlrAA2", cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(gridView, "vlrAA3", cboAno.CallAno - 3)

    End Sub

    Protected Sub detailGrid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)
        On Error Resume Next

        oFun.Grid_Footer_Calculate_Detail(sender, e, "vlrDifMAperc", "vlrAT", "vlrMA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate_Detail(sender, e, "vlrDifAAperc", "vlrAT", "vlrAA", Funcoes.CalculateType.Growth)

    End Sub

#End Region

    Sub AtualizarConsulta()
        On Error Resume Next
        'If Me.optSupermercadista.Checked = True Then    'Supermercadista esta selecionado
        oFun.Grid_ColumnTitle(grid, "bandAT", cboAno.CallAno)
        oFun.Grid_ColumnTitle(grid, "bandAA1", cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "bandAA2", cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(grid, "bandAA3", cboAno.CallAno - 3)

        oFun.Grid_ColumnTitle(gridLojas, "bandAT", cboAno.CallAno)
        oFun.Grid_ColumnTitle(gridLojas, "bandAA1", cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(gridLojas, "bandAA2", cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(gridLojas, "bandAA3", cboAno.CallAno - 3)



        Me.grid.DataBind()
        gridLojas.DataBind()
        Me.dsDetail.DataBind()
        ' Else    'Lojas esta selecionado
        ' Me.gridLojas.DataBind()
        ' End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboMes.CallMes = 7
            cboMesFinal.CallMes = 10

            Session("sANO") = Me.cboAno.CallAno
            Session("sMES") = 10
            Session("sMES_FINAL") = 10

            Call AtualizarConsulta()

        End If
    End Sub

    Protected Sub cboSizeLoja_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSizeLoja.SelectedIndexChanged_cboSize

        If optLoja.Checked = True Then
            oFun.Grid_Size(gridLojas, cboSizeLoja.CallSize)
        End If

        If optSupermercadista.Checked = True Then
            oFun.Grid_Size(grid, cboSizeLoja.CallSize)
        End If


    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Estimativa de Vendas dos Concorrentes - PGR9"
        End If
    End Sub

    Protected Sub gridLojas_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridLojas.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate_Detail(sender, e, "percCrescAT", "vlrAT", "vlrAA1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate_Detail(sender, e, "percCrescAA1", "vlrAA1", "vlrAA2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate_Detail(sender, e, "percCrescAA2", "vlrAA2", "vlrAA3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate_Detail(sender, e, "percCrescAA3", "vlrAA3", "vlrAA4", Funcoes.CalculateType.Growth)
    End Sub


End Class
