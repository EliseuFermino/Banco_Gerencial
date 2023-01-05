﻿#Region " Imports"

Imports DevExpress.Web
Imports System.Data.SqlClient
Imports System.Data

#End Region

Partial Class MemberPages_SLV_SLV005_MP
    Inherits System.Web.UI.Page

    Private connDW As String = clData_DW_Condor.dbConnect
    Dim oFun As New Funcoes

#Region " Variaveis Ultima Linha"


    Private Qtde_AA As Decimal = 0
    Private vlrVenda_AA As Decimal = 0
    Private vlrLucro_AA As Decimal = 0
    Private vlrLucroSellout_AA As Decimal = 0
    Private vlrCAI_AA As Decimal = 0

    Private Qtde_AT As Decimal = 0
    Private vlrVenda_AT As Decimal = 0
    Private vlrLucro_AT As Decimal = 0
    Private vlrLucroSellout_AT As Decimal = 0
    Private vlrCAI_AT As Decimal = 0

    Private percMargem_AA As Decimal = 0
    Private percMargem_AT As Decimal = 0
    Private percPart_AA As Decimal = 0
    Private percPart_AT As Decimal = 0

    Private percCresc_Venda As Decimal = 0
    Private percCresc_Qtde As Decimal = 0
    Private percCresc_Lucro As Decimal = 0

    Private difPercMargem As Decimal = 0

    Private percCAI_AA As Decimal = 0
    Private percCAI_AT As Decimal = 0

    Private vlrLucroFinal_AT As Decimal = 0
    Private percMargemSellout_AT As Decimal = 0
    Private percMargemFinal_AT As Decimal = 0

    Private vlrLucroFinal_AA As Decimal = 0
    Private percMargemSellout_AA As Decimal = 0
    Private percMargemFinal_AA As Decimal = 0

#End Region

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback

        Dim oVem As New VendaEmpresaMes

        CallSession()

        oFun.CheckBoxStatusExibir(Me.chkMostrar_AA, Me.grid, "bandAnoAnterior")     'Exibir Ano Anterior
        oFun.CheckBoxStatusExibir(Me.chkMostrar_AT, Me.grid, "bandAnoAtual")    'Exibir Ano Atual
        oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAnterior")    'Exibir CAI - Ano Anterior
        oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAtual")    'Exibir CAI - Ano Atual

        oFun.Grid_FixHeader(Me.chkFixarCabecalho, Me.grid)

        'Exibir Sell-Out
        If Me.chkMostrar_SellOut.Checked = True Then
            oFun.Grid_Column_Visible(Me.grid, "vlrLucroSellout_AT", True)
            oFun.Grid_Column_Visible(Me.grid, "vlrLucroFinal_AT", True)
            oFun.Grid_Column_Visible(Me.grid, "percMargemSellout_AT", True)
            oFun.Grid_Column_Visible(Me.grid, "percMargemFinal_AT", True)

            oFun.Grid_Column_Visible(Me.grid, "vlrLucroSellout_AA", True)
            oFun.Grid_Column_Visible(Me.grid, "vlrLucroFinal_AA", True)
            oFun.Grid_Column_Visible(Me.grid, "percMargemSellout_AA", True)
            oFun.Grid_Column_Visible(Me.grid, "percMargemFinal_AA", True)

            'Formatar Bordas da Coluna e Rodapé
            '--------------------- ANO ATUAL ------------------------------------------------------------
            oFun.Grid_Column_BorderRight(Me.grid, "vlrVenda_AT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "vlrLucroFinal_AT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "percMargemFinal_AT", Drawing.Color.Gray, BorderStyle.Dashed, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "percMargem_AT", Nothing, BorderStyle.NotSet, 1)

            '--------------------- ANO ANTERIOR ------------------------------------------------------------
            oFun.Grid_Column_BorderRight(Me.grid, "vlrVenda_AA", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "vlrLucroFinal_AA", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "percMargemFinal_AA", Drawing.Color.Gray, BorderStyle.Dashed, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "percMargem_AA", Nothing, BorderStyle.NotSet, 1)

        Else
            oFun.Grid_Column_Visible(Me.grid, "vlrLucroSellout_AT", False)
            oFun.Grid_Column_Visible(Me.grid, "vlrLucroFinal_AT", False)
            oFun.Grid_Column_Visible(Me.grid, "percMargemSellout_AT", False)
            oFun.Grid_Column_Visible(Me.grid, "percMargemFinal_AT", False)

            oFun.Grid_Column_Visible(Me.grid, "vlrLucroSellout_AA", False)
            oFun.Grid_Column_Visible(Me.grid, "vlrLucroFinal_AA", False)
            oFun.Grid_Column_Visible(Me.grid, "percMargemSellout_AA", False)
            oFun.Grid_Column_Visible(Me.grid, "percMargemFinal_AA", False)

        End If

        Me.grid.Settings.ShowFilterRow = False
        ' oVem.AtualizarEstatisticaPrograma(137, User.Identity.Name)

        Call LimparGrid()
        Select Case Me.cboVisao.Value
            Case 1
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao1_Todas()
                oVem.AtualizarEstatisticaPrograma(188, User.Identity.Name)
            Case 2
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao2_Vendas()
                oVem.AtualizarEstatisticaPrograma(189, User.Identity.Name)
            Case 3
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao3_VendasPArticipacao()
                oVem.AtualizarEstatisticaPrograma(190, User.Identity.Name)
            Case 4
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao4_Volume()
                oVem.AtualizarEstatisticaPrograma(191, User.Identity.Name)
            Case 5
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao5_Lucro()
                oVem.AtualizarEstatisticaPrograma(192, User.Identity.Name)
            Case 6
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao6_LucroComSellOut()
                oVem.AtualizarEstatisticaPrograma(193, User.Identity.Name)
            Case 7
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao7_Margem()
                oVem.AtualizarEstatisticaPrograma(194, User.Identity.Name)
            Case 8
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao8_MargemComSellOut()
                oVem.AtualizarEstatisticaPrograma(195, User.Identity.Name)
        End Select

        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0
    End Sub

#Region " Page"



    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        'Dim oProjeto As New Projeto
        'Select Case LCase(Trim(oProjeto.BuscarLocalDoUsuario(Page.User.Identity.Name)))
        '    Case "loja"
        '        Me.chkMostrar_CAI.Visible = False
        'End Select]
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja = True Then
                Me.chkMostrar_CAI.Visible = False
            Else
                Me.cboFilial.CallFilial = 3
            End If
            Me.cboSize.Text = 100
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Vendas Por Departamento e Seção - Visão 1 - PGR188"
            CType(Master.FindControl("lblTitle"), Label).ToolTip = "Analise as informações de Volume (Qtde), Venda, Lucro, Margem e Participação do Ano Atual, Ano Anterior e Mês Anterior. Há ainda informações de meta de venda e margem e ainda há o % de Crescimento da Venda, Volume e Lucro."
        End If

    End Sub

#End Region

    Protected Sub cboSize_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged
        Dim gridWith As Int16
        Dim gridHeight As Int16

        If Me.cboSize.SelectedValue = 100 Then
            gridWith = 1000
            gridHeight = 400
        Else

            If Me.cboSize.SelectedValue = 200 Then
                gridHeight = 400 * 195 / 100
                gridWith = 1000 * 205 / 100
            ElseIf Me.cboSize.SelectedValue = 150 Then
                gridHeight = 400 * 145 / 100
                gridWith = 1000 * 157 / 100
            ElseIf Me.cboSize.SelectedValue = 170 Then
                gridHeight = 400 * 175 / 100
                gridWith = 1000 * 175 / 100
            Else
                gridHeight = 400 * Me.cboSize.SelectedValue / 100
                gridWith = 1000 * Me.cboSize.SelectedValue / 100
            End If

        End If

        Me.grid.Width = gridWith
        Me.grid.Settings.VerticalScrollableHeight = gridHeight


            Me.grid.Visible = True



    End Sub

#Region " Visões"

    Private Sub Visao1_Todas()

        Call LimparGrid()
        Me.grid.Columns.Item("bandCrescimento").Visible = True
        Me.grid.Columns.Item("percCresc_Venda").Visible = True

        If Me.cboVisao.Value = 1 Then
            If Me.chkMostrar_AA.Checked = True Then
                Me.grid.Columns.Item("bandAnoAnterior").Visible = True
                Me.grid.Columns.Item("Qtde_AA").Visible = True
                Me.grid.Columns.Item("vlrLucro_AA").Visible = True
                Me.grid.Columns.Item("percPartDepto_AA").Visible = True
                Me.grid.Columns.Item("percMargem_AA").Visible = True
                Me.grid.Columns.Item("percPart_AA").Visible = True
                Me.grid.Columns.Item("vlrVenda_AA").Visible = True
            Else
                Me.grid.Columns.Item("bandAnoAnterior").Visible = False
                Me.grid.Columns.Item("Qtde_AA").Visible = False
                Me.grid.Columns.Item("vlrLucro_AA").Visible = False
                Me.grid.Columns.Item("percPartDepto_AA").Visible = False
                Me.grid.Columns.Item("percMargem_AA").Visible = False
                Me.grid.Columns.Item("percPart_AA").Visible = False
                Me.grid.Columns.Item("vlrVenda_AA").Visible = False
            End If

            If Me.chkMostrar_AT.Checked = True Then
                Me.grid.Columns.Item("bandAnoAtual").Visible = True
                Me.grid.Columns.Item("Qtde_AT").Visible = True
                Me.grid.Columns.Item("vlrLucro_AT").Visible = True
                Me.grid.Columns.Item("percPartDepto_AT").Visible = True
                Me.grid.Columns.Item("percMargem_AT").Visible = True
                Me.grid.Columns.Item("percPart_AT").Visible = True
                Me.grid.Columns.Item("vlrVenda_AT").Visible = True
            Else
                Me.grid.Columns.Item("bandAnoAtual").Visible = False
                Me.grid.Columns.Item("Qtde_AT").Visible = False
                Me.grid.Columns.Item("vlrLucro_AT").Visible = False
                Me.grid.Columns.Item("percPartDepto_AT").Visible = False
                Me.grid.Columns.Item("percMargem_AT").Visible = False
                Me.grid.Columns.Item("percPart_AT").Visible = False
                Me.grid.Columns.Item("vlrVenda_AT").Visible = False
            End If

            If Me.chkMostrar_SellOut.Checked = True Then
                Me.grid.Columns.Item("vlrLucroSellout_AT").Visible = True
                Me.grid.Columns.Item("vlrLucroFinal_AT").Visible = True
                Me.grid.Columns.Item("percMargemSellout_AT").Visible = True
                Me.grid.Columns.Item("percMargemFinal_AT").Visible = True

                Me.grid.Columns.Item("vlrLucroSellout_AA").Visible = True
                Me.grid.Columns.Item("vlrLucroFinal_AA").Visible = True
                Me.grid.Columns.Item("percMargemSellout_AA").Visible = True
                Me.grid.Columns.Item("percMargemFinal_AA").Visible = True
            End If

            If Me.chkMostrar_CAI.Checked = True Then
                Me.grid.Columns.Item("bandCAI_AnoAnterior").Visible = True
                Me.grid.Columns.Item("bandCAI_AnoAtual").Visible = True
                Me.grid.Columns.Item("vlrCAI_AT").Visible = True
                Me.grid.Columns.Item("vlrCAI_AA").Visible = True
                Me.grid.Columns.Item("percCAI_AA").Visible = True
                Me.grid.Columns.Item("percCAI_AT").Visible = True
            Else
                Me.grid.Columns.Item("bandCAI_AnoAnterior").Visible = False
                Me.grid.Columns.Item("bandCAI_AnoAtual").Visible = False
                Me.grid.Columns.Item("vlrCAI_AT").Visible = False
                Me.grid.Columns.Item("vlrCAI_AA").Visible = False
                Me.grid.Columns.Item("percCAI_AA").Visible = False
                Me.grid.Columns.Item("percCAI_AT").Visible = False
            End If
        End If

        Me.grid.Columns.Item("percCresc_Qtde").Visible = True
        Me.grid.Columns.Item("percCresc_Lucro").Visible = True

    End Sub

    Private Sub Visao2_Vendas()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("vlrVenda_AA").Visible = True
        Me.grid.Columns.Item("vlrVenda_AT").Visible = True
        Me.grid.Columns.Item("percCresc_Venda").Visible = True

    End Sub

    Private Sub Visao3_VendasPArticipacao()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("vlrVenda_AA").Visible = True
        Me.grid.Columns.Item("vlrVenda_AT").Visible = True
        Me.grid.Columns.Item("percCresc_Venda").Visible = True

        Me.grid.Columns.Item("percPart_AA").Visible = True
        Me.grid.Columns.Item("percPart_AT").Visible = True
        Me.grid.Columns.Item("percPartDepto_AA").Visible = True
        Me.grid.Columns.Item("percPartDepto_AT").Visible = True

    End Sub

    Private Sub Visao4_Volume()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("Qtde_AA").Visible = True
        Me.grid.Columns.Item("Qtde_AT").Visible = True
        Me.grid.Columns.Item("percCresc_Qtde").Visible = True
    End Sub

    Private Sub Visao5_Lucro()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("vlrLucro_AA").Visible = True
        Me.grid.Columns.Item("vlrLucro_AT").Visible = True
        Me.grid.Columns.Item("percCresc_Lucro").Visible = True
    End Sub

    Private Sub Visao6_LucroComSellOut()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("vlrLucro_AA").Visible = True
        Me.grid.Columns.Item("vlrLucro_AT").Visible = True
        Me.grid.Columns.Item("percCresc_Lucro").Visible = True

        Me.grid.Columns.Item("vlrLucroSellout_AA").Visible = True
        Me.grid.Columns.Item("vlrLucroSellout_AT").Visible = True

        Me.grid.Columns.Item("vlrLucroFinal_AA").Visible = True
        Me.grid.Columns.Item("vlrLucroFinal_AT").Visible = True

        With Me.grid.Columns.Item("vlrLucroFinal_AT").FooterCellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.grid.Columns.Item("vlrLucroFinal_AT").CellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.grid.Columns.Item("vlrLucroFinal_AA").FooterCellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.grid.Columns.Item("vlrLucroFinal_AA").CellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With
    End Sub

    Private Sub Visao7_Margem()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("percMargem_AA").Visible = True
        Me.grid.Columns.Item("percMargem_AT").Visible = True

        Me.grid.Columns.Item("bandCrescimento").Visible = False

    End Sub

    Private Sub Visao8_MargemComSellOut()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("percMargem_AA").Visible = True
        Me.grid.Columns.Item("percMargem_AT").Visible = True

        Me.grid.Columns.Item("percMargemSellout_AA").Visible = True
        Me.grid.Columns.Item("percMargemFinal_AA").Visible = True

        Me.grid.Columns.Item("percMargemSellout_AT").Visible = True
        Me.grid.Columns.Item("percMargemFinal_AT").Visible = True

        Me.grid.Columns.Item("bandCrescimento").Visible = False

        With Me.grid.Columns.Item("percMargem_AA").CellStyle.BorderRight
            .BorderColor = Nothing
            .BorderStyle = BorderStyle.NotSet
            .BorderWidth = 1
        End With

        With Me.grid.Columns.Item("percMargem_AT").CellStyle.BorderRight
            .BorderColor = Nothing
            .BorderStyle = BorderStyle.NotSet
            .BorderWidth = 1
        End With

        With Me.grid.Columns.Item("percMargem_AA").FooterCellStyle.BorderRight
            .BorderColor = Nothing
            .BorderStyle = BorderStyle.NotSet
            .BorderWidth = 1
        End With

        With Me.grid.Columns.Item("percMargem_AT").FooterCellStyle.BorderRight
            .BorderColor = Nothing
            .BorderStyle = BorderStyle.NotSet
            .BorderWidth = 1
        End With


        With Me.grid.Columns.Item("percMargemFinal_AA").CellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.grid.Columns.Item("percMargemFinal_AT").CellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.grid.Columns.Item("percMargemFinal_AA").FooterCellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.grid.Columns.Item("percMargemFinal_AT").FooterCellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

    End Sub


#End Region

    Private Sub LimparGrid()
        Me.grid.Columns.Item("Qtde_AA").Visible = False
        Me.grid.Columns.Item("vlrVenda_AA").Visible = False
        Me.grid.Columns.Item("vlrLucro_AA").Visible = False
        Me.grid.Columns.Item("vlrLucroSellout_AA").Visible = False
        Me.grid.Columns.Item("vlrCAI_AA").Visible = False
        Me.grid.Columns.Item("Qtde_AT").Visible = False
        Me.grid.Columns.Item("vlrVenda_AT").Visible = False
        Me.grid.Columns.Item("vlrLucro_AT").Visible = False
        Me.grid.Columns.Item("vlrLucroSellout_AT").Visible = False
        Me.grid.Columns.Item("vlrCAI_AT").Visible = False
        Me.grid.Columns.Item("percMargem_AA").Visible = False
        Me.grid.Columns.Item("percMargem_AT").Visible = False
        Me.grid.Columns.Item("percPart_AA").Visible = False
        Me.grid.Columns.Item("percPart_AT").Visible = False
        Me.grid.Columns.Item("percCresc_Venda").Visible = False
        Me.grid.Columns.Item("percCresc_Qtde").Visible = False
        Me.grid.Columns.Item("percCresc_Lucro").Visible = False

        Me.grid.Columns.Item("percCAI_AA").Visible = False
        Me.grid.Columns.Item("percCAI_AT").Visible = False
        Me.grid.Columns.Item("vlrLucroFinal_AT").Visible = False
        Me.grid.Columns.Item("percMargemSellout_AT").Visible = False
        Me.grid.Columns.Item("percMargemFinal_AT").Visible = False
        Me.grid.Columns.Item("vlrLucroFinal_AA").Visible = False
        Me.grid.Columns.Item("percMargemSellout_AA").Visible = False
        Me.grid.Columns.Item("percMargemFinal_AA").Visible = False

        Me.grid.Columns.Item("bandCrescimento").Visible = False

        Me.grid.Columns.Item("percPartDepto_AA").Visible = False
        Me.grid.Columns.Item("percPartDepto_AT").Visible = False

        Me.grid.Columns.Item("bandCAI_AnoAnterior").Visible = False
        Me.grid.Columns.Item("bandCAI_AnoAtual").Visible = False

    End Sub

#Region " Grid"

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        On Error Resume Next

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            Qtde_AA = 0
            vlrVenda_AA = 0
            vlrLucro_AA = 0
            vlrLucroSellout_AA = 0
            vlrCAI_AA = 0

            Qtde_AT = 0
            vlrVenda_AT = 0
            vlrLucro_AT = 0
            vlrLucroSellout_AT = 0
            vlrCAI_AT = 0

            percMargem_AA = 0
            percMargem_AT = 0
            percPart_AA = 0
            percPart_AT = 0

            percCresc_Venda = 0
            percCresc_Qtde = 0
            percCresc_Lucro = 0

            difPercMargem = 0

            percCAI_AA = 0
            percCAI_AT = 0

            vlrLucroFinal_AT = 0
            percMargemSellout_AT = 0
            percMargemFinal_AT = 0

            vlrLucroFinal_AA = 0
            percMargemSellout_AA = 0
            percMargemFinal_AA = 0

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idSecao"))
            If myFilter = 799 Then
                Qtde_AA += Convert.ToDecimal(e.GetValue("Qtde_AA"))
                vlrVenda_AA += Convert.ToDecimal(e.GetValue("vlrVenda_AA"))
                vlrLucro_AA += Convert.ToDecimal(e.GetValue("vlrLucro_AA"))
                vlrLucroSellout_AA += Convert.ToDecimal(e.GetValue("vlrLucroSellout_AA"))
                vlrCAI_AA += Convert.ToDecimal(e.GetValue("vlrCAI_AA"))

                Qtde_AT += Convert.ToDecimal(e.GetValue("Qtde_AT"))
                vlrVenda_AT += Convert.ToDecimal(e.GetValue("vlrVenda_AT"))
                vlrLucro_AT += Convert.ToDecimal(e.GetValue("vlrLucro_AT"))
                vlrLucroSellout_AT += Convert.ToDecimal(e.GetValue("vlrLucroSellout_AT"))
                vlrCAI_AT += Convert.ToDecimal(e.GetValue("vlrCAI_AT"))

                percMargem_AA += Convert.ToDecimal(e.GetValue("percMargem_AA"))
                percMargem_AT += Convert.ToDecimal(e.GetValue("percMargem_AT"))
                percPart_AA += Convert.ToDecimal(e.GetValue("percPart_AA"))
                percPart_AT += Convert.ToDecimal(e.GetValue("percPart_AT"))

                percCresc_Venda += Convert.ToDecimal(e.GetValue("percCresc_Venda"))
                percCresc_Qtde += Convert.ToDecimal(e.GetValue("percCresc_Qtde"))
                percCresc_Lucro += Convert.ToDecimal(e.GetValue("percCresc_Lucro"))

                difPercMargem += Convert.ToDecimal(e.GetValue("difPercMargem"))

                percCAI_AA += Convert.ToDecimal(e.GetValue("percCAI_AA"))
                percCAI_AT += Convert.ToDecimal(e.GetValue("percCAI_AT"))

                vlrLucroFinal_AT += Convert.ToDecimal(e.GetValue("vlrLucroFinal_AT"))
                percMargemSellout_AT += Convert.ToDecimal(e.GetValue("percMargemSellout_AT"))
                percMargemFinal_AT += Convert.ToDecimal(e.GetValue("percMargemFinal_AT"))

                vlrLucroFinal_AA += Convert.ToDecimal(e.GetValue("vlrLucroFinal_AA"))
                percMargemSellout_AA += Convert.ToDecimal(e.GetValue("percMargemSellout_AA"))
                percMargemFinal_AA += Convert.ToDecimal(e.GetValue("percMargemFinal_AA"))

            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Qtde_AA" Then e.TotalValue = Qtde_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVenda_AA" Then e.TotalValue = vlrVenda_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrLucro_AA" Then e.TotalValue = vlrLucro_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrLucroSellout_AA" Then e.TotalValue = vlrLucroSellout_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrCAI_AA" Then e.TotalValue = vlrCAI_AA

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Qtde_AT" Then e.TotalValue = Qtde_AT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVenda_AT" Then e.TotalValue = vlrVenda_AT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrLucro_AT" Then e.TotalValue = vlrLucro_AT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrLucroSellout_AT" Then e.TotalValue = vlrLucroSellout_AT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrCAI_AT" Then e.TotalValue = vlrCAI_AT

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargem_AA" Then e.TotalValue = percMargem_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargem_AT" Then e.TotalValue = percMargem_AT

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart_AA" Then e.TotalValue = percPart_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart_AT" Then e.TotalValue = percPart_AT

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_Venda" Then e.TotalValue = percCresc_Venda
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_Qtde" Then e.TotalValue = percCresc_Qtde
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_Lucro" Then e.TotalValue = percCresc_Lucro

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difPercMargem" Then e.TotalValue = difPercMargem

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCAI_AA" Then e.TotalValue = percCAI_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCAI_AT" Then e.TotalValue = percCAI_AT

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrLucroFinal_AT" Then e.TotalValue = vlrLucroFinal_AT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemSellout_AT" Then e.TotalValue = percMargemSellout_AT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemFinal_AT" Then e.TotalValue = percMargemFinal_AT

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrLucroFinal_AA" Then e.TotalValue = vlrLucroFinal_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemSellout_AA" Then e.TotalValue = percMargemSellout_AA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemFinal_AA" Then e.TotalValue = percMargemFinal_AA

        End If


    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        On Error Resume Next

        oFun.Grid_Calculate(e, "percCAI_AT", "vlrCAI_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)        ' Percentual CAI - AT
        oFun.Grid_Calculate(e, "percCAI_AA", "vlrCAI_AA", "vlrVenda_AA", Funcoes.CalculateType.ValueOverRevenue)        ' Percentual CAI - AA

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        oFun.Grid_RedIsNegative(e, "percCresc_Venda")
        oFun.Grid_RedIsNegative(e, "difPercMargem")

        oFun.Grid_RedIsNegative(e, "percCresc_Qtde")
        oFun.Grid_RedIsNegative(e, "percCresc_Lucro")

        oFun.Grid_RedIsNegative(e, "percMargem_AT")
        oFun.Grid_RedIsNegative(e, "percMargem_AA")

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 1", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 2", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 3", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 4", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 5", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Total", Drawing.Color.LightGreen, True)

    End Sub

#End Region


#Region " SESSION"

    Private Sub CallSession()
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sDATA_INICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDATA_FINAL") = Me.cboPeriodo.CallDiaFinal

        If Me.chkMostrar_MesmosDias.Checked = True Then
            Session("sMESMOSDIAS") = 2  'Mesmos Dias
        Else
            Session("sMESMOSDIAS") = 1  'Normal
        End If
    End Sub

#End Region


End Class
