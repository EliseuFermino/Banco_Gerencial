#Region " Imports"

Imports DevExpress.Web
Imports System.Data.SqlClient

#End Region



Partial Class MemberPages_SLV_Fornecedor_AnaliseFornecedorCategoria
    Inherits System.Web.UI.Page

    ''' <summary>
    ''' Eliseu
    ''' </summary>

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes


    Private Sub Bordas()

        oFun.Grid_Column_BorderRight(grid, "descProdutoSubgrupoLista", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCresc_QtdeEmp", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCresc_vlrVendaEmp", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCresc_EmpvlrLucroTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "difPercMargTotal_Emp", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCresc_QtdeForn", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCresc_vlrVendaForn", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCresc_vlrLucroTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)

    End Sub

#Region " Panel"

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback


        CallSession()

        Me.grid.DataBind()

        Bordas()

        If rndDepto.Checked = True Then
            oFun.Grid_Column_Visible(grid, "descProdutoDeptoLista", True)
            oFun.Grid_Column_Visible(grid, "descProdutoSecaoLista", False)
            oFun.Grid_Column_Visible(grid, "descProdutoGrupoLista", False)
            oFun.Grid_Column_Visible(grid, "descProdutoSubgrupoLista", False)
        End If

        If rndSecao.Checked = True Then
            oFun.Grid_Column_Visible(grid, "descProdutoDeptoLista", True)
            oFun.Grid_Column_Visible(grid, "descProdutoSecaoLista", True)
            oFun.Grid_Column_Visible(grid, "descProdutoGrupoLista", False)
            oFun.Grid_Column_Visible(grid, "descProdutoSubgrupoLista", False)
        End If

        If rndGrupo.Checked = True Then
            oFun.Grid_Column_Visible(grid, "descProdutoDeptoLista", True)
            oFun.Grid_Column_Visible(grid, "descProdutoSecaoLista", True)
            oFun.Grid_Column_Visible(grid, "descProdutoGrupoLista", True)
            oFun.Grid_Column_Visible(grid, "descProdutoSubgrupoLista", False)
        End If

        If rndFamilia.Checked = True Then
            oFun.Grid_Column_Visible(grid, "descProdutoDeptoLista", True)
            oFun.Grid_Column_Visible(grid, "descProdutoSecaoLista", True)
            oFun.Grid_Column_Visible(grid, "descProdutoGrupoLista", True)
            oFun.Grid_Column_Visible(grid, "descProdutoSubgrupoLista", True)
        End If


        Hidden_Percentual("EmpQtdeAA", "EmpQtdeAT", "percCresc_QtdeEmp")
        Hidden_Percentual("EmpvlrVendaAA", "EmpvlrVendaAT", "percCresc_vlrVendaEmp")
        Hidden_Percentual("EmpvlrLucroTotalAA", "EmpvlrLucroTotalAT", "percCresc_EmpvlrLucroTotal")
        Hidden_Percentual("percMargTotalAA_Emp", "percMargTotalAT_Emp", "difPercMargTotal_Emp")
        Hidden_Percentual("QtdeAA", "QtdeAT", "percCresc_QtdeForn")
        Hidden_Percentual("vlrVendaAA", "vlrVendaAT", "percCresc_vlrVendaForn")
        Hidden_Percentual("vlrLucroTotalAA", "vlrLucroTotalAT", "percCresc_vlrLucroTotal")
        Hidden_Percentual("percMargTotalAA", "percMargTotalAT", "difPercMargTotal")


        Select Case cboVisao.Value
            Case 1
                Visao_1()
            Case 2
                Visao_2()
        End Select

        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0

    End Sub


#End Region

    Private Sub Visao_1()

        oFun.Grid_Column_Index(grid, "bandVolumeEmp", 5)
        oFun.Grid_Column_Index(grid, "bandVolumeForn", 6)
        oFun.Grid_Column_Index(grid, "bandVendaEmp", 7)
        oFun.Grid_Column_Index(grid, "bandVendaForn", 8)

        oFun.Grid_Column_Index(grid, "bandLucroEmp", 9)
        oFun.Grid_Column_Index(grid, "bandLucroForn", 10)
        oFun.Grid_Column_Index(grid, "bandMargemEmp", 11)
        oFun.Grid_Column_Index(grid, "bandMargemForn", 12)


    End Sub

    Private Sub Visao_2()

        oFun.Grid_Column_Index(grid, "bandVolumeEmp", 5)
        oFun.Grid_Column_Index(grid, "bandVendaEmp", 6)
        oFun.Grid_Column_Index(grid, "bandLucroEmp", 7)
        oFun.Grid_Column_Index(grid, "bandMargemEmp", 8)

        oFun.Grid_Column_Index(grid, "bandVolumeForn", 9)
        oFun.Grid_Column_Index(grid, "bandVendaForn", 10)
        oFun.Grid_Column_Index(grid, "bandLucroForn", 11)
        oFun.Grid_Column_Index(grid, "bandMargemForn", 12)

    End Sub

#Region " Functions"

    Private Sub Hidden_Percentual(ByVal fieldAA As String, ByVal fieldAT As String, fieldPerc As String)
        Dim widthPercentualVisible As Int16 = 100

        If chkSoPercentuais.Checked = True Then
            oFun.Grid_Column_Visible(grid, fieldAA, False)
            oFun.Grid_Column_Visible(grid, fieldAT, False)
            oFun.Grid_Column_Width(grid, fieldPerc, widthPercentualVisible)
        Else
            oFun.Grid_Column_Visible(grid, fieldAA, True)
            oFun.Grid_Column_Visible(grid, fieldAT, True)
            oFun.Grid_Column_Width(grid, fieldPerc, 70)
        End If
    End Sub


#End Region

#Region " SESSION"

    Private Sub CallSession()

        Session("sDIA_INICIAL") = Me.cboDia.CallDiaInicial
        Session("sDIA_FINAL") = Me.cboDia.CallDiaFinal
        Session("sFORNECEDOR") = txtFornecedor.CallFornecedor
        Session("sFILIAL") = 99
        Session("sUSERNAME") = Page.User.Identity.Name

        If cboDia.Checked_MesmosDias = True Then
            Session("sMESMOSDIAS") = 2  'Mesmos Dias
        Else
            Session("sMESMOSDIAS") = 1  'Normal
        End If

        If cboDia.Checked_MesAnterior = True Then
            Session("sMESMOSDIAS") = 3  'Mes Anterior
        Else
            Session("sMESANTERIOR") = 1  'Normal
        End If

        If rndDepto.Checked = True Then Session("sMERCADOLOGICO") = 1
        If rndSecao.Checked = True Then Session("sMERCADOLOGICO") = 2
        If rndGrupo.Checked = True Then Session("sMERCADOLOGICO") = 3
        If rndFamilia.Checked = True Then Session("sMERCADOLOGICO") = 4

        'Session("sBASE_CNPJ") = chkCNPJ_Principal.CheckState

    End Sub


#End Region

#Region " grid"

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate


        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc_QtdeEmp", "EmpQtdeAT", "EmpQtdeAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc_vlrVendaEmp", "EmpvlrVendaAT", "EmpvlrVendaAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc_EmpvlrLucroTotal", "EmpvlrLucroTotalAT", "EmpvlrLucroTotalAA", Funcoes.CalculateType.Growth)

        'Margem Total
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargTotalAT_Emp", "EmpvlrLucroTotalAT", "EmpvlrVendaAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargTotalAA_Emp", "EmpvlrLucroTotalAA", "EmpvlrVendaAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "difPercMargTotal_Emp", "percMargTotalAT_Emp", "percMargTotalAA_Emp", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc_QtdeForn", "QtdeAT", "QtdeAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc_vlrVendaForn", "vlrVendaAT", "vlrVendaAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc_vlrLucroTotal", "vlrLucroTotalAT", "vlrLucroTotalAA", Funcoes.CalculateType.Growth)

        'Margem Total Fornecedor
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargTotalAT", "vlrLucroTotalAT", "vlrVendaAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargTotalAA", "vlrLucroTotalAA", "vlrVendaAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "difPercMargTotal", "percMargTotalAT", "percMargTotalAA", Funcoes.CalculateType.Decrease)

    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData

        oFun.Grid_Calculate(e, "difVolumeEmp", "EmpQtdeAT", "EmpQtdeAA", Funcoes.CalculateType.Decrease)
       
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCresc_QtdeEmp")
        oFun.Grid_RedIsNegative(e, "percCresc_vlrVendaEmp")

        oFun.Grid_RedIsNegative(e, "percMargTotalAA_Emp")
        oFun.Grid_RedIsNegative(e, "percMargTotalAT_Emp")
        oFun.Grid_RedIsNegative(e, "difPercMargTotal_Emp")
        oFun.Grid_RedIsNegative(e, "percCresc_EmpvlrLucroTotal")

        oFun.Grid_RedIsNegative(e, "percCresc_QtdeForn")
        oFun.Grid_RedIsNegative(e, "percCresc_vlrVendaForn")
        oFun.Grid_RedIsNegative(e, "percCresc_vlrLucroTotal")
        oFun.Grid_RedIsNegative(e, "difPercMargTotal")
        oFun.Grid_RedIsNegative(e, "difVolumeEmp")

        'oFun.Grid_RedIsNegative(e, "difVlrLucro")
        'oFun.Grid_RedIsNegative(e, "difCliente")

        'If e.DataColumn.FieldName = "descDepto" Then
        '    If e.CellValue = "08-vasilhame e engradados" Then
        '        e.Cell.ForeColor = System.Drawing.Color.LightGreen
        '    End If
        'End If

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        'If e.RowType <> GridViewRowType.Data Then
        'End If

        'Dim NomeColuna As String = e.GetValue("idFilial")

        'Select Case NomeColuna
        '    Case "207", "208", "215", "250"
        '        e.Row.BackColor = System.Drawing.Color.LightGray
        '        e.Row.Font.Bold = True
        '    Case "240", "255"
        '        e.Row.BackColor = System.Drawing.Color.LawnGreen
        '        e.Row.Font.Bold = True
        'End Select
        'LightYellow
        'Lavender

        'e.Row.BackColor = System.Drawing.Color.Honeydew     'Verde Claro
        'e.Row.BackColor = System.Drawing.Color.LightGray    'Cinza Claro
    End Sub

#End Region

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            cboDia.Visible_MesmosDias = True
            cboDia.Visible_MesAnterior = True

            txtFornecedor.CNPJ_Principal_Checked = True
            txtFornecedor.CNPJ_Principal_Enabled = False

            CallSession()   'Chamar Sessões

            ChangeCaptions()
            oVem.AtualizarEstatisticaPrograma(318, User.Identity.Name)
            cboSize.CallSize = 100

            Bordas()

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise por Categoria - PGR318"
        End If
    End Sub

    Private Sub ChangeCaptions()



        Dim myAno As Int32
        myAno = Year(Me.cboDia.CallDiaFinal)

        Dim myMesInicial, myMesFinal, myMesAnterior As Byte
        Dim myAnoInicial, myAnoFinal As Int32

        Dim captionAnterior, captionAtual As String

        myMesInicial = Month(cboDia.CallDiaInicial)
        myMesFinal = Month(cboDia.CallDiaFinal)
        myMesAnterior = Month(DateAdd(DateInterval.Month, -1, cboDia.CallDiaInicial))

        myAnoInicial = Year(cboDia.CallDiaInicial)
        myAnoFinal = Year(cboDia.CallDiaFinal)

        captionAnterior = Left(MonthName(myMesAnterior), 3) & "/" & Right(myAnoFinal, 2)
        captionAtual = Left(MonthName(myMesFinal), 3) & "/" & Right(myAnoFinal, 2)

        If myAnoInicial = myAnoFinal Then
            If myMesInicial = myMesFinal Then

                If cboDia.Checked_MesAnterior = True Then

                    Me.grid.Columns("EmpQtdeAA").Caption = captionAnterior
                    Me.grid.Columns("EmpQtdeAT").Caption = captionAtual

                    Me.grid.Columns("EmpvlrVendaAA").Caption = captionAnterior
                    Me.grid.Columns("EmpvlrVendaAT").Caption = captionAtual

                    Me.grid.Columns("percMargTotalAA_Emp").Caption = captionAnterior
                    Me.grid.Columns("percMargTotalAT_Emp").Caption = captionAtual

                    Me.grid.Columns("EmpvlrLucroTotalAA").Caption = captionAnterior
                    Me.grid.Columns("EmpvlrLucroTotalAT").Caption = captionAtual

                    Me.grid.Columns("QtdeAA").Caption = captionAnterior
                    Me.grid.Columns("QtdeAT").Caption = captionAtual

                    Me.grid.Columns("vlrVendaAA").Caption = captionAnterior
                    Me.grid.Columns("vlrVendaAT").Caption = captionAtual

                    Me.grid.Columns("vlrLucroTotalAA").Caption = captionAnterior
                    Me.grid.Columns("vlrLucroTotalAT").Caption = captionAtual

                    Me.grid.Columns("percMargTotalAA").Caption = captionAnterior
                    Me.grid.Columns("percMargTotalAT").Caption = captionAtual
                Else
                    Me.grid.Columns("EmpQtdeAA").Caption = myAno - 1
                    Me.grid.Columns("EmpQtdeAT").Caption = myAno

                    Me.grid.Columns("EmpvlrVendaAA").Caption = myAno - 1
                    Me.grid.Columns("EmpvlrVendaAT").Caption = myAno

                    Me.grid.Columns("percMargTotalAA_Emp").Caption = myAno - 1
                    Me.grid.Columns("percMargTotalAT_Emp").Caption = myAno

                    Me.grid.Columns("EmpvlrLucroTotalAA").Caption = myAno - 1
                    Me.grid.Columns("EmpvlrLucroTotalAT").Caption = myAno

                    Me.grid.Columns("QtdeAA").Caption = myAno - 1
                    Me.grid.Columns("QtdeAT").Caption = myAno

                    Me.grid.Columns("vlrVendaAA").Caption = myAno - 1
                    Me.grid.Columns("vlrVendaAT").Caption = myAno

                    Me.grid.Columns("vlrLucroTotalAA").Caption = myAno - 1
                    Me.grid.Columns("vlrLucroTotalAT").Caption = myAno

                    Me.grid.Columns("percMargTotalAA").Caption = myAno - 1
                    Me.grid.Columns("percMargTotalAT").Caption = myAno

                End If



            End If
        End If





    End Sub

#End Region

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
        Bordas()
    End Sub


    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        Dim oDb As New clDataDb
        CallSession()

        Dim AnoInicial As Int16 = Year(cboDia.CallDiaInicial)
        Dim AnoFinal As Int16 = Year(cboDia.CallDiaFinal)
        Dim mesInicial As Byte = Month(cboDia.CallDiaInicial)
        Dim mesFinal As Byte = Month(cboDia.CallDiaFinal)
        Dim numDiaInicial As Byte = Day(cboDia.CallDiaInicial)
        Dim numDiaFinal As Byte = Day(cboDia.CallDiaFinal)

        lblError.Text = ""

        If AnoInicial = AnoFinal Then
            If mesInicial = mesFinal Then
                Select Case mesFinal
                    Case 1, 3, 5, 7, 8, 10, 12
                        If numDiaInicial = 1 And numDiaFinal <> 31 Then
                            cboDia.Enabled_MesmosDias = True
                        ElseIf numDiaInicial <> 1 And numDiaFinal = 31 Then
                            cboDia.Enabled_MesmosDias = True
                        ElseIf numDiaInicial = 1 And numDiaFinal = 31 Then
                            cboDia.Enabled_MesmosDias = False
                        End If
                    Case 4, 6, 9, 11
                        If numDiaInicial = 1 And numDiaFinal <> 30 Then
                            cboDia.Enabled_MesmosDias = True
                        ElseIf numDiaInicial <> 1 And numDiaFinal = 30 Then
                            cboDia.Enabled_MesmosDias = True
                        ElseIf numDiaInicial = 1 And numDiaFinal = 30 Then
                            cboDia.Enabled_MesmosDias = False
                        End If
                    Case 2
                        If numDiaInicial = 1 And numDiaFinal <> 29 Then
                            cboDia.Enabled_MesmosDias = True
                        ElseIf numDiaInicial <> 1 And numDiaFinal = 29 Then
                            cboDia.Enabled_MesmosDias = True
                        ElseIf numDiaInicial = 1 And numDiaFinal = 29 Then
                            cboDia.Enabled_MesmosDias = False
                        End If
                End Select
            Else
                cboDia.Enabled_MesmosDias = False
            End If
        Else
            cboDia.Enabled_MesmosDias = False
        End If

        oDb.ExecuteStoredProcedure("dbo.usp_Report_Andreia_Zonta", Conexao.gerVendaFornecedoresSLV_str, "@idFornecedor", Session("sFORNECEDOR"),
                                   "@SdiaInicial", Session("sDIA_INICIAL"),
                                   "@SdiaFinal", Session("sDIA_FINAL"),
                                   "@idFilial", Session("sFILIAL"),
                                   "@mesmosDias", Session("sMESMOSDIAS"),
                                   "@userName", Session("sUSERNAME"))
        lblError.Text = oDb.varDesc
        Me.grid.Visible = True
        grid.DataBind()
        ChangeCaptions()
    End Sub



End Class
