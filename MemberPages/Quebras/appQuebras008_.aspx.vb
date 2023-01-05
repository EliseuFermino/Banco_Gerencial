
#Region " Imports"

Imports DevExpress.Web
Imports System.Data.SqlClient

#End Region

Partial Class MemberPages_Quebras_appQuebras008_
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes
    Dim oPro As New Projeto

    'Define Enum Mercadologico
    Private Enum Mercadologico As Byte
        Total = 1
        Departamento = 2
        Secao = 3
        Grupo = 4
        Subgrupo = 5
        Item = 6
    End Enum

#Region " Panel"

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback
        On Error Resume Next



        Dim varOpcao As Byte
        If Me.rdTotal.Checked = True Then varOpcao = 0
        If Me.rdDepartamento.Checked = True Then varOpcao = 1
        If Me.rdSecao.Checked = True Then varOpcao = 2
        If Me.rdGrupo.Checked = True Then varOpcao = 3
        If Me.rdSubgrupo.Checked = True Then varOpcao = 4

        CallSession(varOpcao)   'Chamar Sessões

        Me.grid.Visible = True
        Me.grid.DataBind()

        If varOpcao = 0 Then AtualizarBackground("Análise por Filial - Total", 131)
        If varOpcao = 1 Then AtualizarBackground("Análise por Filial - Departamento: " & Session("sNOME_MERCADOLOGICO"), 259)
        If varOpcao = 2 Then AtualizarBackground("Análise por Filial - Seção: " & Session("sNOME_MERCADOLOGICO"), 260)
        If varOpcao = 3 Then AtualizarBackground("Análise por Filial - Grupo: " & Session("sNOME_MERCADOLOGICO"), 261)
        If varOpcao = 4 Then AtualizarBackground("Análise por Filial - Familia: " & Session("sNOME_MERCADOLOGICO"), 262)

        oFun.Grid_FixHeader(Me.chkFixarCabecalho, Me.grid)

        ChangeCaptions()

        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0


    End Sub

    Protected Sub cbPanelMercadologico_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelMercadologico.Callback

        'Session("sUSUARIO") = Page.User.Identity.Name

        ' Departamento
        If Me.rdDepartamento.Checked = True Then
            Me.cblDepartamento.Visible = True
            AtualizarMercadologico(Me.cblDepartamento, Mercadologico.Departamento, "Temp.tblUsuarioDepto")

        End If

        ' Seção
        If Me.rdSecao.Checked = True Then
            Me.cblDepartamento.Visible = True
            Me.cblSecao.Visible = True
            AtualizarMercadologico(Me.cblDepartamento, Mercadologico.Departamento, "Temp.tblUsuarioDepto")
            AtualizarMercadologico(Me.cblSecao, Mercadologico.Secao, "Temp.tblUsuarioSecao")
        End If

        ' Grupo
        If Me.rdGrupo.Checked = True Then
            Me.cblDepartamento.Visible = True
            Me.cblSecao.Visible = True
            Me.cblGrupo.Visible = True
            AtualizarMercadologico(Me.cblDepartamento, Mercadologico.Departamento, "Temp.tblUsuarioDepto")
            AtualizarMercadologico(Me.cblSecao, Mercadologico.Secao, "Temp.tblUsuarioSecao")
            AtualizarMercadologico(Me.cblGrupo, Mercadologico.Grupo, "Temp.tblUsuarioGrupo")

            Me.cblDepartamento.Enabled = False
        End If

        ' Subgrupo
        If Me.rdSubgrupo.Checked = True Then
            Me.cblDepartamento.Visible = True
            Me.cblSecao.Visible = True
            Me.cblGrupo.Visible = True
            Me.cblsubgrupo.Visible = True
            AtualizarMercadologico(Me.cblDepartamento, Mercadologico.Departamento, "Temp.tblUsuarioDepto")
            AtualizarMercadologico(Me.cblSecao, Mercadologico.Secao, "Temp.tblUsuarioSecao")
            AtualizarMercadologico(Me.cblGrupo, Mercadologico.Grupo, "Temp.tblUsuarioGrupo")
            AtualizarMercadologico(Me.cblsubgrupo, Mercadologico.Subgrupo, "Temp.tblUsuarioSubgrupo")

            Me.cblDepartamento.Enabled = False
            Me.cblSecao.Enabled = False
        End If

        Me.cblDepartamento.DataBind()
        Me.cblSecao.DataBind()
        Me.cblGrupo.DataBind()
        Me.cblsubgrupo.DataBind()
    End Sub

#End Region

#Region " Functions"

    Private Sub ExcluirMercadologicoDoUsuario(ByVal iTipo As Byte, ByVal nomeDaTabela As String)

        Dim connection As SqlConnection = Conexao.DW_Condor_One

        Dim deleteSQL = "DELETE FROM " & nomeDaTabela & " WHERE Usuario = ('" & Page.User.Identity.Name & "')"
        Dim deleteCommand = New SqlCommand(deleteSQL, connection)

        Try
            connection.Open()
            deleteCommand.ExecuteNonQuery()
        Catch ex As Exception
            Me.lblError.Text = Err.Description
        Finally
            connection.Close()
        End Try

    End Sub

    Private Sub InserirMercadologico(ByVal ListaDeMercadologico As ASPxListBox, ByVal nomeDaTabela As String)

        Dim connection As SqlConnection = Conexao.DW_Condor_One

        For Each item In ListaDeMercadologico.SelectedValues

            Dim idMercadologico As Int16 = item.ToString

            Dim insertSQL = "INSERT INTO " & nomeDaTabela & " (Usuario,idMercadologico) VALUES ('" & Page.User.Identity.Name & "', '" & idMercadologico & "')"
            Dim insertCommand = New SqlCommand(insertSQL, connection)

            Try
                connection.Open()
                insertCommand.ExecuteNonQuery()
            Catch ex As Exception
                Me.lblError.Text = Err.Description
            Finally
                connection.Close()
            End Try

            Session("sMERCADOLOGICO") = idMercadologico

        Next

        For Each nomeItem In ListaDeMercadologico.SelectedItems

            Dim strMercadologico As String = nomeItem.ToString
            Session("sNOME_MERCADOLOGICO") = strMercadologico
        Next


    End Sub

    Private Sub AtualizarMercadologico(ByVal ListaDeMercadologico As ASPxListBox, ByVal NumeroMercadologico As Int16, nomeDaTabela As String)
        If ListaDeMercadologico.SelectedValues.Count > 0 Then
            ExcluirMercadologicoDoUsuario(NumeroMercadologico, nomeDaTabela)
            InserirMercadologico(ListaDeMercadologico, nomeDaTabela)
        End If
    End Sub

    Private Sub AtualizarBackground(ByVal nomeDoTitulo As String, ByVal NumeroDoPrograma As Int16)

        oFun.Grid_Title(Me.grid, nomeDoTitulo)
        oVem.AtualizarEstatisticaPrograma(NumeroDoPrograma, User.Identity.Name)

    End Sub

#End Region

#Region " SESSION"

    Private Sub CallSession(ByVal iOpcao As Byte)
        Session("sDIA_INICIAL") = Me.cboDia.CallDiaInicial
        Session("sDIA_FINAL") = Me.cboDia.CallDiaFinal
        Session("sTIPO") = iOpcao
        Session("sFORNECEDOR") = txtFornecedor.CallFornecedor
        Session("sBASE_CNPJ") = chkCNPJ_Principal.CheckState

        lblError.Text = "sDIA_INICIAL : " & Session("sDIA_INICIAL") & " sDIA_FINAL : " & Session("sDIA_FINAL") & " sTIPO : " & Session("sTIPO") & " sFORNECEDOR : " & Session("sFORNECEDOR") & " sBASE_CNPJ : " & Session("sBASE_CNPJ") & " sMERCADOLOGICO : " & Session("sMERCADOLOGICO")

    End Sub

#End Region

#Region " grid"

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        ' Calcular o percentual total de Quebra
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc", "vlrQuebra", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

        'Calcular Percentual de Margem
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem", "vlrLucroComercial", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemSellOut", "vlrLucroSellOut", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemCheia", "vlrLucroTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAg23", "vlrAg23", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAg51", "vlrAg51", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAg52", "vlrAg52", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percDiv", "vlrDiv", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        On Error Resume Next

        If e.Column.FieldName = "percAg23" Then
            Dim vVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda"))
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrAg23"))
            If vVenda <> 0 Then
                e.Value = ((vMetaVenda / vVenda) * 100)
            Else
                e.Value = 0
            End If
        End If

        If e.Column.FieldName = "percAg51" Then
            Dim vVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda"))
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrAg51"))
            If vVenda <> 0 Then
                e.Value = ((vMetaVenda / vVenda) * 100)
            Else
                e.Value = 0
            End If
        End If

        If e.Column.FieldName = "percAg52" Then
            Dim vVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda"))
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrAg52"))
            If vVenda <> 0 Then
                e.Value = ((vMetaVenda / vVenda) * 100)
            Else
                e.Value = 0
            End If
        End If

        If e.Column.FieldName = "percDiv" Then
            Dim vVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda"))
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrDiv"))
            If vVenda <> 0 Then
                e.Value = ((vMetaVenda / vVenda) * 100)
            Else
                e.Value = 0
            End If
        End If

        'oFun.Grid_Calculate(e, "percAg23", "vlrAg23", "vlrVenda", Funcoes.CalculateType.MultiplicationOverRevenue)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "QtdeQuebra")
        oFun.Grid_RedIsNegative(e, "vlrQuebra")
        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "QtdeDiv")
        oFun.Grid_RedIsNegative(e, "vlrDiv")
        oFun.Grid_RedIsNegative(e, "Qtde52")
        oFun.Grid_RedIsNegative(e, "vlrAg52")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemSellOut")
        oFun.Grid_RedIsNegative(e, "percMargemCheia")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroSellOut")
        oFun.Grid_RedIsNegative(e, "vlrLucroTotal")
        oFun.Grid_RedIsNegative(e, "Qtde23")
        oFun.Grid_RedIsNegative(e, "vlrAg23")
        oFun.Grid_RedIsNegative(e, "percAg23")
        oFun.Grid_RedIsNegative(e, "percAg51")
        oFun.Grid_RedIsNegative(e, "percAg52")
        oFun.Grid_RedIsNegative(e, "percDiv")

        'Band Perdas
        If e.DataColumn.FieldName = "CFTV" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "Sim" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "Manut" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "Não" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                End If
            End If
        End If

        If e.DataColumn.FieldName = "Antena" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "Sim" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "Manut" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "Não" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                End If
            End If
        End If

        If e.DataColumn.FieldName = "PPP" Then
            If Not IsNothing(e.CellValue) Then
                If Convert.ToString(e.CellValue) = "Sim" Then
                    e.Cell.BackColor = System.Drawing.Color.SteelBlue
                ElseIf Convert.ToString(e.CellValue) = "Manut" Then
                    e.Cell.BackColor = System.Drawing.Color.Orange
                ElseIf Convert.ToString(e.CellValue) = "Não" Then
                    e.Cell.BackColor = System.Drawing.Color.Red
                End If
            End If
        End If

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idFilial")

        Select Case NomeColuna
            Case "207", "208", "215", "250"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "240", "255"
                e.Row.BackColor = System.Drawing.Color.LawnGreen
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender

        'e.Row.BackColor = System.Drawing.Color.Honeydew     'Verde Claro
        'e.Row.BackColor = System.Drawing.Color.LightGray    'Cinza Claro
    End Sub

#End Region

  
#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oFun.Grid_FixHeader(Me.chkFixarCabecalho, Me.grid)
            Me.rdTotal.Checked = True
            Session("sTIPO") = 0   'Total
            Session("sMERCADOLOGICO") = 1   'Total
            CallSession(1)   'Chamar Sessões
            Me.grid.Visible = True
            ChangeCaptions()
            AtualizarBackground("Análise por Filial - Total", 131)
            cboSize.CallSize = 100
            txtFornecedor.CNPJ_Principal_Visible = False

            'oFun.Grid_Column_BorderRight(grid, "difMargemSellOut", Drawing.Color.Gray, BorderStyle.Solid, 2)
            'oFun.Grid_Column_BorderRight(grid, "percCresc", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            'oFun.Grid_Column_BorderRight(grid, "percCrescVlrLucro", Drawing.Color.Gray, BorderStyle.Solid, 2)
            'oFun.Grid_Column_BorderRight(grid, "difVlrLucro", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            'oFun.Grid_Column_BorderRight(grid, "difCliente", Drawing.Color.Gray, BorderStyle.Dashed, 1)


            Me.grid.DataBind()

            oPro.BuscarLocalDoUsuario(LCase(LTrim(RTrim(Page.User.Identity.Name))))
            If oPro.Isloja = True Then
                oFun.Grid_Column_Visible(grid, "bandVenda", False)
                oFun.Grid_Column_Visible(grid, "bandLucro", False)
            Else
                oFun.Grid_Column_Visible(grid, "bandVenda", True)
                oFun.Grid_Column_Visible(grid, "bandLucro", True)
            End If

            oVem.AtualizarEstatisticaPrograma(70, User.Identity.Name)
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Ánalise de Quebra Loja a Loja - por Fornecedor - PGR131"
        End If
    End Sub

    Private Sub ChangeCaptions()
        'Dim myAno As Int32
        'myAno = Year(Me.cboDia.CallDiaFinal)
        'Me.grid.Columns("QtdeAA").Caption = myAno - 1
        'Me.grid.Columns("QtdeAT").Caption = myAno

        'Me.grid.Columns("vlrVendaAA").Caption = myAno - 1
        'Me.grid.Columns("vlrVendaAT").Caption = myAno

        'Me.grid.Columns("percMargemAA").Caption = myAno - 1
        'Me.grid.Columns("percMargemAT").Caption = myAno

        'Me.grid.Columns("percMargemSellOutAA").Caption = myAno - 1
        'Me.grid.Columns("percMargemSellOutAT").Caption = myAno

    End Sub

#End Region


    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub
End Class
