#Region " Imports"


Imports DevExpress.Web
Imports System.Data.SqlClient
Imports System.Data

#End Region

Partial Class MemberPages_SLV_SLV002
    Inherits System.Web.UI.Page

#Region " Variables"

    Dim oFun As New Funcoes

    Private connDW As String = clData_DW_Condor.dbConnect

    Private qAA As Decimal = 0
    Private qAT As Decimal = 0
    Private difVolume As Decimal = 0

    Private pAT As Decimal = 0
    Private pmAT As Decimal = 0

    Private mAA As Decimal = 0
    Private mAT As Decimal = 0
    Private difLucro As Decimal = 0

    Private vAT As Decimal = 0
    Private vAA As Decimal = 0
    Private difVenda As Decimal = 0

    Private pAA As Decimal = 0

    Private pmAA As Decimal = 0

    Private mv As Decimal = 0
    Private mm As Decimal = 0
    Private pmm As Decimal = 0

    Private percCresc As Decimal = 0
    Private percCrescReal As Decimal = 0
    Private percCrescQtde As Decimal = 0
    Private percCrescLucro As Decimal = 0

    Private cAA As Decimal = 0
    Private cAT As Decimal = 0

    Private maiAA As Decimal = 0
    Private maiAT As Decimal = 0

    Private impAA As Decimal = 0
    Private impAT As Decimal = 0
    Private difImposto As Decimal = 0

    Private vlrSelloutAT As Decimal = 0
    Private vlrSelloutAA As Decimal = 0
    Private difSellOut As Decimal = 0
    Private percCrescSellOut As Decimal = 0

    Private Dif_Venda_Meta_Realizado As Decimal = 0
    Private percConclusao As Decimal = 0
    Private precoMedioAA As Decimal = 0
    Private precoMedioAT As Decimal = 0
    Private percCresc_PrecoMedio As Decimal = 0

    Private vlrLucroTotalAA As Decimal = 0
    Private vlrLucroTotalAT As Decimal = 0
    Private difLucroTotal As Decimal = 0
    Private percCrescLucroTotal As Decimal = 0

    Dim varOpcao As Byte

#End Region

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback


        Dim oVem As New VendaEmpresaMes

        If cboMercadologico.Checked_rdTotal = True Then varOpcao = 1


        If cboMercadologico.Checked_rdDepartamento = True Then varOpcao = 2
        If cboMercadologico.Checked_rdSecao = True Then varOpcao = 3
        If cboMercadologico.Checked_rdGrupo = True Then varOpcao = 4
        If cboMercadologico.Checked_rdSubgrupo = True Then varOpcao = 5

        CallSession(varOpcao)   'Chamar Sessões


        If Me.cboMercadologico.Checked_rdTotal = True Then    'Total - Exibe todos os departamento
            varOpcao = 1    'Total
            oFun.Grid_Title(grid, "Venda Total")
            oFun.Grid_ColumnTitle(grid, "descID", "Total")
            oFun.Grid_Column_Visible(grid, "bandMeta", True)

            oVem.AtualizarEstatisticaPrograma(68, User.Identity.Name)
            Unhide_Meta()
        End If

        If Me.cboMercadologico.Checked_rdDepartamento = True Then    'Departamento - Exibe todas as seções do Departamento selecionado
            varOpcao = 2    'Departamento
            oFun.Grid_Title(grid, "Venda do Departamento " & cboMercadologico.CallDeptoDescricao)
            oFun.Grid_ColumnTitle(grid, "descID", "Departamento")
            oFun.Grid_Column_Visible(grid, "bandMeta", True)

            oVem.AtualizarEstatisticaPrograma(133, User.Identity.Name)
            Unhide_Meta()
        End If

        If Me.cboMercadologico.Checked_rdSecao = True Then    'Seção - Exibe todos os grupos da seção selecionada
            varOpcao = 3    'Seção
            oFun.Grid_Title(grid, "Venda da Seção " & cboMercadologico.CallSecaoDescricao)
            oFun.Grid_ColumnTitle(grid, "descID", "Seção")
            oFun.Grid_Column_Visible(grid, "bandMeta", True)

            oVem.AtualizarEstatisticaPrograma(134, User.Identity.Name)
            Unhide_Meta()
        End If

        If Me.cboMercadologico.Checked_rdGrupo = True Then    'Grupo - Exibe todos os subgrupos do grupo selecionado
            varOpcao = 4    'Grupo
            oFun.Grid_Title(grid, "Venda do Grupo " & cboMercadologico.CallGrupoDescricao)
            oFun.Grid_ColumnTitle(grid, "descID", "Grupo")
            oFun.Grid_Column_Visible(grid, "bandMeta", False)

            oVem.AtualizarEstatisticaPrograma(135, User.Identity.Name)
            Hide_Meta()
        End If

        If Me.cboMercadologico.Checked_rdSubgrupo = True Then 'Item - Exibe todos os Itens do Subgrupo selecionado
            varOpcao = 5    'Subgrupo
            oFun.Grid_Title(grid, "Venda do Subgrupo " & cboMercadologico.CallSubgrupoDescricao)
            oFun.Grid_ColumnTitle(grid, "descID", "Familia")
            oFun.Grid_Column_Visible(grid, "bandMeta", False)

            oVem.AtualizarEstatisticaPrograma(136, User.Identity.Name)
            Hide_Meta()
        End If

        If chkAnaliseLucro.Checked = True Then
            oFun.Grid_Column_Visible(grid, "rnk", False)
            oFun.Grid_Column_Visible(grid, "bandAnoAtual", False)
            oFun.Grid_Column_Visible(grid, "bandVolume", False)
            oFun.Grid_Column_Visible(grid, "bandImpostos", False)
            oFun.Grid_Column_Visible(grid, "bandCAI", False)
            oFun.Grid_Column_Visible(grid, "bandPercentualCAI", False)
            oFun.Grid_Column_Visible(grid, "bandMAI", False)
            oFun.Grid_Column_Visible(grid, "bandMeta", False)
            oFun.Grid_Column_Visible(grid, "bandinfo", False)

            oFun.Grid_Column_Visible(grid, "mv", False)
            oFun.Grid_Column_Visible(grid, "Dif_Venda_Meta_Realizado", False)
            oFun.Grid_Column_Visible(grid, "percAtingMetaVlr", False)
            oFun.Grid_Column_Visible(grid, "percConclusao", False)

        Else
            oFun.Grid_Column_Visible(grid, "rnk", True)
            oFun.Grid_Column_Visible(grid, "bandAnoAtual", True)
            oFun.Grid_Column_Visible(grid, "bandVolume", True)
            oFun.Grid_Column_Visible(grid, "bandImpostos", True)
            oFun.Grid_Column_Visible(grid, "bandCAI", True)
            oFun.Grid_Column_Visible(grid, "bandPercentualCAI", True)
            oFun.Grid_Column_Visible(grid, "bandMAI", True)
            oFun.Grid_Column_Visible(grid, "bandMeta", True)
            oFun.Grid_Column_Visible(grid, "bandinfo", True)

            oFun.Grid_Column_Visible(grid, "mv", True)
            oFun.Grid_Column_Visible(grid, "Dif_Venda_Meta_Realizado", True)
            oFun.Grid_Column_Visible(grid, "percAtingMetaVlr", True)
            oFun.Grid_Column_Visible(grid, "percConclusao", True)
        End If

        If chkDelivery.Checked = True Then
            Session("sDELIVERY") = 1
        Else
            Session("sDELIVERY") = 0
        End If


        ' Titulos ------------------------------------------------------------------------------------------------------------------

       Titulos_Grid()

        'lblTeste.Text = "sDATA_INICIAL " & Session("sDATA_INICIAL") & ". <br> sDATA_FINAL: " & Session("sDATA_FINAL") & "<br> sOPCAO: " & Session("sOPCAO") & " <br> sUSUARIO: " & Session("sUSUARIO") & "<br> sMESMOS_DIAS " & Session("sMESMOS_DIAS") & "<br> sDELIVERY " & Session("sDELIVERY")

        Me.grid.Visible = True
        Me.grid.DataBind()

        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0
    End Sub

    Private Sub Hide_Meta()
        oFun.Grid_Column_Visible(grid, "mv", False)
        oFun.Grid_Column_Visible(grid, "Dif_Venda_Meta_Realizado", False)
        oFun.Grid_Column_Visible(grid, "percAtingMetaVlr", False)
        oFun.Grid_Column_Visible(grid, "percConclusao", False)
    End Sub

    Private Sub Unhide_Meta()
        oFun.Grid_Column_Visible(grid, "mv", True)
        oFun.Grid_Column_Visible(grid, "Dif_Venda_Meta_Realizado", True)
        oFun.Grid_Column_Visible(grid, "percAtingMetaVlr", True)
        oFun.Grid_Column_Visible(grid, "percConclusao", True)
    End Sub

    Private Sub CallSession(ByVal iOpcao As Byte)

        Session("sDATA_INICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDATA_FINAL") = Me.cboPeriodo.CallDiaFinal
        Session("sOPCAO") = iOpcao
        Session("sUSUARIO") = Page.User.Identity.Name

        If cboPeriodo.Checked_MesmosDias = True Then
            Session("sMESMOS_DIAS") = 2  'Mesmos Dias
        Else
            Session("sMESMOS_DIAS") = 1  'Normal
        End If

    End Sub


#Region " Page"

    'Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
    '    If Not IsPostBack Then
    '        cboPeriodo.AutoPostBack_cboDiaInicial = False
    '        cboPeriodo.AutoPostBack_cboDiaFinal = False
    '    End If
    'End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            cboSize.CallSize = 100
            cboPeriodo.Visible_MesmosDias = True

            varOpcao = 1

            Me.grid.Visible = False

            ' Bordas ----
            oFun.Grid_Column_BorderRight(grid, "percCrescQtde", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescReal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "difPercMargem", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescCAI", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "pmaiAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCAI_AT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "difPercSellOut", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc_PrecoMedio", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescLucroTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas por Mercadológico - Loja a Loja - PGR68"
            CType(Master.FindControl("lblTitle"), Label).ToolTip = "Analise as informações de Volume (Qtde), Venda, Lucro, Margem e Participação do Ano Atual, Ano Anterior e Mês Anterior. Há ainda informações de meta de venda e margem e ainda há o % de Crescimento da Venda, Volume e Lucro."

        End If

    End Sub


#End Region

#Region " grid"

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then

            vAT = 0
            pAT = 0

            pmAT = 0

            qAA = 0
            qAT = 0
            difVolume = 0


            vAA = 0
            pAA = 0

            mAA = 0
            mAT = 0
            difLucro = 0

            pmAA = 0

            mv = 0
            mm = 0
            pmm = 0

            percCresc = 0
            percCrescReal = 0
            percCrescQtde = 0
            percCrescLucro = 0

            cAT = 0
            cAA = 0

            maiAT = 0
            maiAA = 0

            impAA = 0
            impAT = 0
            difImposto = 0
            difVolume = 0
            difVenda = 0

            vlrSelloutAT = 0
            vlrSelloutAA = 0
            difSellOut = 0
            percCrescSellOut = 0

            Dif_Venda_Meta_Realizado = 0
            percConclusao = 0
            precoMedioAA = 0
            precoMedioAT = 0
            percCresc_PrecoMedio = 0

            vlrLucroTotalAA = 0
            vlrLucroTotalAT = 0
            difLucroTotal = 0
            percCrescLucroTotal = 0

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idCod"))
            If myFilter = 255 Then
                qAT += Convert.ToDecimal(e.GetValue("qAT"))
                vAT += Convert.ToDecimal(e.GetValue("vAT"))
                pAT += Convert.ToDecimal(e.GetValue("pAT"))
                mAT += Convert.ToDecimal(e.GetValue("mAT"))
                pmAT += Convert.ToDecimal(e.GetValue("pmAT"))

                qAA += Convert.ToDecimal(e.GetValue("qAA"))
                vAA += Convert.ToDecimal(e.GetValue("vAA"))
                pAA += Convert.ToDecimal(e.GetValue("pAA"))
                mAA += Convert.ToDecimal(e.GetValue("mAA"))
                pmAA += Convert.ToDecimal(e.GetValue("pmAA"))

                mv += Convert.ToDecimal(e.GetValue("mv"))
                mm += Convert.ToDecimal(e.GetValue("mm"))
                pmm += Convert.ToDecimal(e.GetValue("pmm"))

                percCresc += Convert.ToDecimal(e.GetValue("percCresc"))
                percCrescReal += Convert.ToDecimal(e.GetValue("percCrescReal"))
                percCrescQtde += Convert.ToDecimal(e.GetValue("percCrescQtde"))
                percCrescLucro += Convert.ToDecimal(e.GetValue("percCrescLucro"))

                cAA += Convert.ToDecimal(e.GetValue("cAA"))
                cAT += Convert.ToDecimal(e.GetValue("cAT"))

                maiAA += Convert.ToDecimal(e.GetValue("maiAA"))
                maiAT += Convert.ToDecimal(e.GetValue("maiAT"))

                impAA += Convert.ToDecimal(e.GetValue("impAA"))
                impAT += Convert.ToDecimal(e.GetValue("impAT"))
                difImposto += Convert.ToDecimal(e.GetValue("difImposto"))
                difVolume += Convert.ToDecimal(e.GetValue("difVolume"))
                difLucro += Convert.ToDecimal(e.GetValue("difLucro"))
                difVenda += Convert.ToDecimal(e.GetValue("difVenda"))

                vlrSelloutAT += Convert.ToDecimal(e.GetValue("vlrSelloutAT"))
                vlrSelloutAA += Convert.ToDecimal(e.GetValue("vlrSelloutAA"))
                difSellOut += Convert.ToDecimal(e.GetValue("difSellOut"))
                percCrescSellOut += Convert.ToDecimal(e.GetValue("percCrescSellOut"))
                Dif_Venda_Meta_Realizado += Convert.ToDecimal(e.GetValue("Dif_Venda_Meta_Realizado"))
                percConclusao += Convert.ToDecimal(e.GetValue("percConclusao"))

                precoMedioAA += Convert.ToDecimal(e.GetValue("precoMedioAA"))
                precoMedioAT += Convert.ToDecimal(e.GetValue("precoMedioAT"))
                percCresc_PrecoMedio += Convert.ToDecimal(e.GetValue("percCresc_PrecoMedio"))

                vlrLucroTotalAA += Convert.ToDecimal(e.GetValue("vlrLucroTotalAA"))
                vlrLucroTotalAT += Convert.ToDecimal(e.GetValue("vlrLucroTotalAT"))
                difLucroTotal += Convert.ToDecimal(e.GetValue("difLucroTotal"))
                percCrescLucroTotal += Convert.ToDecimal(e.GetValue("percCrescLucroTotal"))

            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "qAT" Then e.TotalValue = qAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vAT" Then e.TotalValue = vAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pAT" Then e.TotalValue = pAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "mAT" Then e.TotalValue = mAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pmAT" Then e.TotalValue = pmAT

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "qAA" Then e.TotalValue = qAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vAA" Then e.TotalValue = vAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pAA" Then e.TotalValue = pAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "mAA" Then e.TotalValue = mAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pmAA" Then e.TotalValue = pmAA

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "mv" Then e.TotalValue = mv
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "mm" Then e.TotalValue = mm
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "pmm" Then e.TotalValue = pmm

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc" Then e.TotalValue = percCresc
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescReal" Then e.TotalValue = percCrescReal
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescQtde" Then e.TotalValue = percCrescQtde
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescLucro" Then e.TotalValue = percCrescLucro

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "cAA" Then e.TotalValue = cAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "cAT" Then e.TotalValue = cAT

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "maiAA" Then e.TotalValue = maiAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "maiAT" Then e.TotalValue = maiAT

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "impAA" Then e.TotalValue = impAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "impAT" Then e.TotalValue = impAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difImposto" Then e.TotalValue = difImposto
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difVolume" Then e.TotalValue = difVolume
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difLucro" Then e.TotalValue = difLucro
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difVenda" Then e.TotalValue = difVenda

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrSelloutAT" Then e.TotalValue = vlrSelloutAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrSelloutAA" Then e.TotalValue = vlrSelloutAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difSellOut" Then e.TotalValue = difSellOut
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescSellOut" Then e.TotalValue = percCrescSellOut
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Dif_Venda_Meta_Realizado" Then e.TotalValue = Dif_Venda_Meta_Realizado
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percConclusao" Then e.TotalValue = percConclusao

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "precoMedioAA" Then e.TotalValue = precoMedioAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "precoMedioAT" Then e.TotalValue = precoMedioAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_PrecoMedio" Then e.TotalValue = percCresc_PrecoMedio

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrLucroTotalAA" Then e.TotalValue = vlrLucroTotalAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrLucroTotalAT" Then e.TotalValue = vlrLucroTotalAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difLucroTotal" Then e.TotalValue = difLucroTotal
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescLucroTotal" Then e.TotalValue = percCrescLucroTotal

        End If


        'Calculo da Margem Total do Ano Atual
        oFun.Grid_Footer_Calculate(sender, e, grid, "pmAT", "mAT", "vAT", Funcoes.CalculateType.ValueOverRevenue)

        'Calculo da Margem Total do Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "pmAA", "mAA", "vAA", Funcoes.CalculateType.ValueOverRevenue)

        'Calculo da Margem Total - Meta
        oFun.Grid_Footer_Calculate(sender, e, grid, "pmm", "mm", "mv", Funcoes.CalculateType.ValueOverRevenue)

        'Calculo do Crescimento em Reais - R$
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc", "vAT", "vAA", Funcoes.CalculateType.Growth)

        'Calculo do Crescimento em Volume
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescQtde", "qAT", "qAA", Funcoes.CalculateType.Growth)

        'Calculo do Crescimento em Lucro
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescLucro", "mAT", "mAA", Funcoes.CalculateType.Growth)

        'Diferença de Margem (Meta - Realizad)
        oFun.Grid_Footer_Calculate(sender, e, grid, "difPercMargem", "pmAT", "pmm", Funcoes.CalculateType.Decrease)

        'Atingimento de Meta - Valor
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAtingMetaVlr", "vAT", "mv", Funcoes.CalculateType.Growth)

        'Calculo do Percentual de CAI
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCAI_AT", "cAT", "vAT", Funcoes.CalculateType.ValueOverRevenue)

        'Calculo do CAI - Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCAI_AA", "cAA", "vAA", Funcoes.CalculateType.ValueOverRevenue)

        'Calculo do Percentual de MAI
        oFun.Grid_Footer_Calculate(sender, e, grid, "pmaiAT", "maiAT", "vAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "pmaiAA", "maiAA", "vAA", Funcoes.CalculateType.ValueOverRevenue)

        'Calculo do Crescimento do Impostos
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescImposto", "impAT", "impAA", Funcoes.CalculateType.Growth)

        'Calculo do SellOut
        oFun.Grid_Footer_Calculate(sender, e, grid, "percSellOutAA", "vlrSelloutAA", "vAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percSellOutAT", "vlrSelloutAT", "vAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "difPercSellOut", "percSellOutAT", "percSellOutAA", Funcoes.CalculateType.Decrease)



    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        On Error Resume Next

        'Calcular o % de Atingimento da  Meta
        oFun.Grid_Calculate(e, "percAtingMetaVlr", "vAT", "mv", Funcoes.CalculateType.Growth)

        ' Margem - percentual Ano Atual
        oFun.Grid_Calculate(e, "percMargemAT", "mAT", "vAT", Funcoes.CalculateType.ValueOverRevenue)

        ' Margem - percentual Ano Anterior
        oFun.Grid_Calculate(e, "percMargemAA", "mAA", "vAA", Funcoes.CalculateType.ValueOverRevenue)

        'Calcular a Diferença de Margem (Realizado x Meta)
        oFun.Grid_Calculate(e, "difPercMargem", "pmAT", "pmm", Funcoes.CalculateType.Decrease)

        ' Percentual CAI - AT
        oFun.Grid_Calculate(e, "percCAI_AT", "cAT", "vAT", Funcoes.CalculateType.ValueOverRevenue)

        ' Percentual CAI - AA
        oFun.Grid_Calculate(e, "percCAI_AA", "cAA", "vAA", Funcoes.CalculateType.ValueOverRevenue)

        ' Diferença de Impostos
        oFun.Grid_Calculate(e, "difImposto", "impAT", "impAA", Funcoes.CalculateType.Decrease)

        ' Diferença de Impostos
        oFun.Grid_Calculate(e, "Dif_Venda_Meta_Realizado", "vAT", "mv", Funcoes.CalculateType.Decrease)

        ' % de Crescimento de Impostos
        oFun.Grid_Calculate(e, "percCrescImposto", "impAT", "impAA", Funcoes.CalculateType.Growth)

        ' Diferença de Lucro SellOut
        oFun.Grid_Calculate(e, "difSellOut", "vlrSelloutAT", "vlrSelloutAA", Funcoes.CalculateType.Decrease)

        ' % de Crescimento de SellOut
        oFun.Grid_Calculate(e, "percCrescSellOut", "vlrSelloutAT", "vlrSelloutAA", Funcoes.CalculateType.Growth)

        ' Diferença de SellOut
        oFun.Grid_Calculate(e, "difPercSellOut", "percSellOutAT", "percSellOutAA", Funcoes.CalculateType.Decrease)

        ' Crescimento Nominal
        oFun.Grid_Calculate(e, "percCrescReal", "percCresc", "percCresc_PrecoMedio", Funcoes.CalculateType.Decrease)

        oFun.Grid_Calculate(e, "precoMedioAA", "vAA", "qAA", Funcoes.CalculateType.Division)
        oFun.Grid_Calculate(e, "precoMedioAT", "vAT", "qAT", Funcoes.CalculateType.Division)
        oFun.Grid_Calculate(e, "percCresc_PrecoMedio", "precoMedioAT", "precoMedioAA", Funcoes.CalculateType.Growth)

        oFun.Grid_Calculate(e, "vlrLucroTotalAA", "mAA", "vlrSelloutAA", Funcoes.CalculateType.Sum)
        oFun.Grid_Calculate(e, "vlrLucroTotalAT", "mAT", "vlrSelloutAT", Funcoes.CalculateType.Sum)
        oFun.Grid_Calculate(e, "difLucroTotal", "vlrLucroTotalAT", "vlrLucroTotalAA", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "percCrescLucroTotal", "vlrLucroTotalAT", "vlrLucroTotalAA", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        On Error Resume Next

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "percCrescReal")
        oFun.Grid_RedIsNegative(e, "percAtingMetaVlr")
        oFun.Grid_RedIsNegative(e, "difPercMargem")
        oFun.Grid_RedIsNegative(e, "percCrescQtde")
        oFun.Grid_RedIsNegative(e, "percCrescLucro")
        oFun.Grid_RedIsNegative(e, "pmAT")
        oFun.Grid_RedIsNegative(e, "pmAA")
        oFun.Grid_RedIsNegative(e, "vAT")
        oFun.Grid_RedIsNegative(e, "vAA")
        oFun.Grid_RedIsNegative(e, "difVolume")
        oFun.Grid_RedIsNegative(e, "difVenda")
        oFun.Grid_RedIsNegative(e, "difLucro")
        oFun.Grid_RedIsNegative(e, "difPercMargem")
        oFun.Grid_RedIsNegative(e, "difCAI")
        oFun.Grid_RedIsNegative(e, "percCrescCAI")
        oFun.Grid_RedIsNegative(e, "difImposto")
        oFun.Grid_RedIsNegative(e, "percCrescImposto")
        oFun.Grid_RedIsNegative(e, "difSellOut")
        oFun.Grid_RedIsNegative(e, "percCrescSellOut")
        oFun.Grid_RedIsNegative(e, "difPercSellOut")
        oFun.Grid_RedIsNegative(e, "Dif_Venda_Meta_Realizado")
        oFun.Grid_RedIsNegative(e, "percCresc_PrecoMedio")
        oFun.Grid_RedIsNegative(e, "percCrescLucroTotal")

        If e.DataColumn.FieldName = "descDepto" Then
            If e.CellValue = "08-vasilhame e engradados" Then
                e.Cell.ForeColor = System.Drawing.Color.LightGreen
            End If
        End If

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        On Error Resume Next
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idCod")

        Select Case NomeColuna
            Case "207", "208", "251", "240"
                e.Row.BackColor = System.Drawing.Color.Yellow
                e.Row.Font.Bold = True
            Case "255", "250"
                e.Row.BackColor = System.Drawing.Color.GreenYellow
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender

        'e.Row.BackColor = System.Drawing.Color.Honeydew     'Verde Claro
        'e.Row.BackColor = System.Drawing.Color.LightGray    'Cinza Claro
    End Sub

#End Region

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub


#Region " Visões"

    Private Sub Visao1_Todas()

        'Call LimparGrid()
        'Me.grid.Columns.Item("bandCrescimento").Visible = True
        'Me.grid.Columns.Item("bandMeta").Visible = True
        'Me.grid.Columns.Item("bandMetaLucro").Visible = True
        'Me.grid.Columns.Item("bandMetaMargem").Visible = True
        'Me.grid.Columns.Item("percCresc_Venda").Visible = True
        'Me.grid.Columns.Item("bandClientes").Visible = True

        'If Me.cboVisao.Value = 1 Then
        '    If Me.chkMostrar_AA.Checked = True Then
        '        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        '        Me.grid.Columns.Item("Qtde_AA").Visible = True
        '        Me.grid.Columns.Item("vlrLucro_AA").Visible = True
        '        Me.grid.Columns.Item("percPartDepto_AA").Visible = True
        '        Me.grid.Columns.Item("percMargem_AA").Visible = True
        '        Me.grid.Columns.Item("percPart_AA").Visible = True
        '        Me.grid.Columns.Item("vlrVenda_AA").Visible = True
        '    Else
        '        Me.grid.Columns.Item("bandAnoAnterior").Visible = False
        '        Me.grid.Columns.Item("Qtde_AA").Visible = False
        '        Me.grid.Columns.Item("vlrLucro_AA").Visible = False
        '        Me.grid.Columns.Item("percPartDepto_AA").Visible = False
        '        Me.grid.Columns.Item("percMargem_AA").Visible = False
        '        Me.grid.Columns.Item("percPart_AA").Visible = False
        '        Me.grid.Columns.Item("vlrVenda_AA").Visible = False
        '    End If

        '    If Me.chkMostrar_AT.Checked = True Then
        '        Me.grid.Columns.Item("bandAnoAtual").Visible = True
        '        Me.grid.Columns.Item("Qtde_AT").Visible = True
        '        Me.grid.Columns.Item("vlrLucro_AT").Visible = True
        '        Me.grid.Columns.Item("percPartDepto_AT").Visible = True
        '        Me.grid.Columns.Item("percMargem_AT").Visible = True
        '        Me.grid.Columns.Item("percPart_AT").Visible = True
        '        Me.grid.Columns.Item("vlrVenda_AT").Visible = True
        '    Else
        '        Me.grid.Columns.Item("bandAnoAtual").Visible = False
        '        Me.grid.Columns.Item("Qtde_AT").Visible = False
        '        Me.grid.Columns.Item("vlrLucro_AT").Visible = False
        '        Me.grid.Columns.Item("percPartDepto_AT").Visible = False
        '        Me.grid.Columns.Item("percMargem_AT").Visible = False
        '        Me.grid.Columns.Item("percPart_AT").Visible = False
        '        Me.grid.Columns.Item("vlrVenda_AT").Visible = False
        '    End If

        '    If Me.chkMostrar_SellOut.Checked = True Then
        '        Me.grid.Columns.Item("vlrLucroSellout_AT").Visible = True
        '        Me.grid.Columns.Item("vlrLucroFinal_AT").Visible = True
        '        Me.grid.Columns.Item("percMargemSellout_AT").Visible = True
        '        Me.grid.Columns.Item("percMargemFinal_AT").Visible = True

        '        Me.grid.Columns.Item("vlrLucroSellout_AA").Visible = True
        '        Me.grid.Columns.Item("vlrLucroFinal_AA").Visible = True
        '        Me.grid.Columns.Item("percMargemSellout_AA").Visible = True
        '        Me.grid.Columns.Item("percMargemFinal_AA").Visible = True
        '    End If

        '    If Me.chkMostrar_CAI.Checked = True Then
        '        Me.grid.Columns.Item("bandCAI_AnoAnterior").Visible = True
        '        Me.grid.Columns.Item("bandCAI_AnoAtual").Visible = True
        '        Me.grid.Columns.Item("vlrCAI_AT").Visible = True
        '        Me.grid.Columns.Item("vlrCAI_AA").Visible = True
        '        Me.grid.Columns.Item("percCAI_AA").Visible = True
        '        Me.grid.Columns.Item("percCAI_AT").Visible = True
        '    Else
        '        Me.grid.Columns.Item("bandCAI_AnoAnterior").Visible = False
        '        Me.grid.Columns.Item("bandCAI_AnoAtual").Visible = False
        '        Me.grid.Columns.Item("vlrCAI_AT").Visible = False
        '        Me.grid.Columns.Item("vlrCAI_AA").Visible = False
        '        Me.grid.Columns.Item("percCAI_AA").Visible = False
        '        Me.grid.Columns.Item("percCAI_AT").Visible = False
        '    End If
        'End If

        'Me.grid.Columns.Item("percCresc_Qtde").Visible = True
        'Me.grid.Columns.Item("percCresc_Lucro").Visible = True

        'Me.grid.Columns.Item("vlrVenda_meta").Visible = True
        'Me.grid.Columns.Item("vlrLucro_meta").Visible = True
        'Me.grid.Columns.Item("difValorMeta").Visible = True
        'Me.grid.Columns.Item("difValorMetaLucro").Visible = True

        'Me.grid.Columns.Item("percAtingMetaVlr").Visible = True
        'Me.grid.Columns.Item("percAtingMetaLucro").Visible = True
        'Me.grid.Columns.Item("percMargem_meta").Visible = True
        'Me.grid.Columns.Item("difPercMargem").Visible = True

    End Sub

    Private Sub Visao2_Vendas()
        'Call LimparGrid()
        'Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        'Me.grid.Columns.Item("bandCrescimento").Visible = True

        'Me.grid.Columns.Item("vlrVenda_AA").Visible = True
        'Me.grid.Columns.Item("vlrVenda_AT").Visible = True
        'Me.grid.Columns.Item("percCresc_Venda").Visible = True

    End Sub

    Private Sub Visao3_VendasPArticipacao()
        'Call LimparGrid()
        'Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        'Me.grid.Columns.Item("bandCrescimento").Visible = True

        'Me.grid.Columns.Item("vlrVenda_AA").Visible = True
        'Me.grid.Columns.Item("vlrVenda_AT").Visible = True
        'Me.grid.Columns.Item("percCresc_Venda").Visible = True

        'Me.grid.Columns.Item("percPart_AA").Visible = True
        'Me.grid.Columns.Item("percPart_AT").Visible = True
        'Me.grid.Columns.Item("percPartDepto_AA").Visible = True
        'Me.grid.Columns.Item("percPartDepto_AT").Visible = True

    End Sub

    Private Sub Visao4_Volume()
        'Call LimparGrid()
        'Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        'Me.grid.Columns.Item("bandCrescimento").Visible = True

        'Me.grid.Columns.Item("Qtde_AA").Visible = True
        'Me.grid.Columns.Item("Qtde_AT").Visible = True
        'Me.grid.Columns.Item("percCresc_Qtde").Visible = True
    End Sub

    Private Sub Visao5_Lucro()
        'Call LimparGrid()
        'Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        'Me.grid.Columns.Item("bandCrescimento").Visible = True

        'Me.grid.Columns.Item("vlrLucro_AA").Visible = True
        'Me.grid.Columns.Item("vlrLucro_AT").Visible = True
        'Me.grid.Columns.Item("percCresc_Lucro").Visible = True
    End Sub

    Private Sub Visao6_LucroComSellOut()
        'Call LimparGrid()
        'Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        'Me.grid.Columns.Item("bandCrescimento").Visible = True

        'Me.grid.Columns.Item("vlrLucro_AA").Visible = True
        'Me.grid.Columns.Item("vlrLucro_AT").Visible = True
        'Me.grid.Columns.Item("percCresc_Lucro").Visible = True

        'Me.grid.Columns.Item("vlrLucroSellout_AA").Visible = True
        'Me.grid.Columns.Item("vlrLucroSellout_AT").Visible = True

        'Me.grid.Columns.Item("vlrLucroFinal_AA").Visible = True
        'Me.grid.Columns.Item("vlrLucroFinal_AT").Visible = True

        'With Me.grid.Columns.Item("vlrLucroFinal_AT").FooterCellStyle.BorderRight
        '    .BorderColor = Drawing.Color.Gray
        '    .BorderStyle = BorderStyle.Solid
        '    .BorderWidth = 2
        'End With

        'With Me.grid.Columns.Item("vlrLucroFinal_AT").CellStyle.BorderRight
        '    .BorderColor = Drawing.Color.Gray
        '    .BorderStyle = BorderStyle.Solid
        '    .BorderWidth = 2
        'End With

        'With Me.grid.Columns.Item("vlrLucroFinal_AA").FooterCellStyle.BorderRight
        '    .BorderColor = Drawing.Color.Gray
        '    .BorderStyle = BorderStyle.Solid
        '    .BorderWidth = 2
        'End With

        'With Me.grid.Columns.Item("vlrLucroFinal_AA").CellStyle.BorderRight
        '    .BorderColor = Drawing.Color.Gray
        '    .BorderStyle = BorderStyle.Solid
        '    .BorderWidth = 2
        'End With
    End Sub

    Private Sub Visao7_Margem()
        'Call LimparGrid()
        'Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        'Me.grid.Columns.Item("bandCrescimento").Visible = True

        'Me.grid.Columns.Item("percMargem_AA").Visible = True
        'Me.grid.Columns.Item("percMargem_AT").Visible = True

        'Me.grid.Columns.Item("bandCrescimento").Visible = False

    End Sub

    Private Sub Visao8_MargemComSellOut()
        'Call LimparGrid()
        'Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        'Me.grid.Columns.Item("bandCrescimento").Visible = True

        'Me.grid.Columns.Item("percMargem_AA").Visible = True
        'Me.grid.Columns.Item("percMargem_AT").Visible = True

        'Me.grid.Columns.Item("percMargemSellout_AA").Visible = True
        'Me.grid.Columns.Item("percMargemFinal_AA").Visible = True

        'Me.grid.Columns.Item("percMargemSellout_AT").Visible = True
        'Me.grid.Columns.Item("percMargemFinal_AT").Visible = True

        'Me.grid.Columns.Item("bandCrescimento").Visible = False

        'With Me.grid.Columns.Item("percMargem_AA").CellStyle.BorderRight
        '    .BorderColor = Nothing
        '    .BorderStyle = BorderStyle.NotSet
        '    .BorderWidth = 1
        'End With

        'With Me.grid.Columns.Item("percMargem_AT").CellStyle.BorderRight
        '    .BorderColor = Nothing
        '    .BorderStyle = BorderStyle.NotSet
        '    .BorderWidth = 1
        'End With

        'With Me.grid.Columns.Item("percMargem_AA").FooterCellStyle.BorderRight
        '    .BorderColor = Nothing
        '    .BorderStyle = BorderStyle.NotSet
        '    .BorderWidth = 1
        'End With

        'With Me.grid.Columns.Item("percMargem_AT").FooterCellStyle.BorderRight
        '    .BorderColor = Nothing
        '    .BorderStyle = BorderStyle.NotSet
        '    .BorderWidth = 1
        'End With


        'With Me.grid.Columns.Item("percMargemFinal_AA").CellStyle.BorderRight
        '    .BorderColor = Drawing.Color.Gray
        '    .BorderStyle = BorderStyle.Solid
        '    .BorderWidth = 2
        'End With

        'With Me.grid.Columns.Item("percMargemFinal_AT").CellStyle.BorderRight
        '    .BorderColor = Drawing.Color.Gray
        '    .BorderStyle = BorderStyle.Solid
        '    .BorderWidth = 2
        'End With

        'With Me.grid.Columns.Item("percMargemFinal_AA").FooterCellStyle.BorderRight
        '    .BorderColor = Drawing.Color.Gray
        '    .BorderStyle = BorderStyle.Solid
        '    .BorderWidth = 2
        'End With

        'With Me.grid.Columns.Item("percMargemFinal_AT").FooterCellStyle.BorderRight
        '    .BorderColor = Drawing.Color.Gray
        '    .BorderStyle = BorderStyle.Solid
        '    .BorderWidth = 2
        'End With

    End Sub

    'Private Sub Visao9_MetaVersusRealizado()

    '    With Me.gridMetaVersusRealizado.Columns.Item("vlrVenda_meta").CellStyle.BorderRight
    '        .BorderColor = Nothing
    '        .BorderStyle = BorderStyle.NotSet
    '        .BorderWidth = 1
    '    End With

    '    With Me.gridMetaVersusRealizado.Columns.Item("vlrVenda_meta").FooterCellStyle.BorderRight
    '        .BorderColor = Nothing
    '        .BorderStyle = BorderStyle.NotSet
    '        .BorderWidth = 1
    '    End With

    '    With Me.gridMetaVersusRealizado.Columns.Item("percAtingMetaVlr").CellStyle.BorderRight
    '        .BorderColor = Drawing.Color.Gray
    '        .BorderStyle = BorderStyle.Solid
    '        .BorderWidth = 2
    '    End With

    '    With Me.gridMetaVersusRealizado.Columns.Item("percAtingMetaVlr").FooterCellStyle.BorderRight
    '        .BorderColor = Drawing.Color.Gray
    '        .BorderStyle = BorderStyle.Solid
    '        .BorderWidth = 2
    '    End With

    '    With Me.gridMetaVersusRealizado.Columns.Item("percMargem_AT").CellStyle.BorderRight
    '        .BorderColor = Nothing
    '        .BorderStyle = BorderStyle.NotSet
    '        .BorderWidth = 1
    '    End With

    '    With Me.gridMetaVersusRealizado.Columns.Item("percMargem_AT").FooterCellStyle.BorderRight
    '        .BorderColor = Nothing
    '        .BorderStyle = BorderStyle.NotSet
    '        .BorderWidth = 1
    '    End With

    'End Sub

#End Region

    Private Sub LimparGrid()
        'Me.grid.Columns.Item("Qtde_AA").Visible = False
        'Me.grid.Columns.Item("vlrVenda_AA").Visible = False
        'Me.grid.Columns.Item("vlrLucro_AA").Visible = False
        'Me.grid.Columns.Item("vlrLucroSellout_AA").Visible = False
        'Me.grid.Columns.Item("vlrCAI_AA").Visible = False
        'Me.grid.Columns.Item("Qtde_AT").Visible = False
        'Me.grid.Columns.Item("vlrVenda_AT").Visible = False
        'Me.grid.Columns.Item("vlrLucro_AT").Visible = False
        'Me.grid.Columns.Item("vlrLucroSellout_AT").Visible = False
        'Me.grid.Columns.Item("vlrCAI_AT").Visible = False
        'Me.grid.Columns.Item("vlrVenda_meta").Visible = False
        'Me.grid.Columns.Item("vlrLucro_meta").Visible = False
        'Me.grid.Columns.Item("difValorMeta").Visible = False
        'Me.grid.Columns.Item("difValorMetaLucro").Visible = False
        'Me.grid.Columns.Item("percMargem_AA").Visible = False
        'Me.grid.Columns.Item("percMargem_AT").Visible = False
        'Me.grid.Columns.Item("percPart_AA").Visible = False
        'Me.grid.Columns.Item("percPart_AT").Visible = False
        'Me.grid.Columns.Item("percCresc_Venda").Visible = False
        'Me.grid.Columns.Item("percCresc_Qtde").Visible = False
        'Me.grid.Columns.Item("percCresc_Lucro").Visible = False
        'Me.grid.Columns.Item("percAtingMetaVlr").Visible = False
        'Me.grid.Columns.Item("percAtingMetaLucro").Visible = False
        'Me.grid.Columns.Item("percMargem_meta").Visible = False
        'Me.grid.Columns.Item("difPercMargem").Visible = False
        'Me.grid.Columns.Item("percCAI_AA").Visible = False
        'Me.grid.Columns.Item("percCAI_AT").Visible = False
        'Me.grid.Columns.Item("vlrLucroFinal_AT").Visible = False
        'Me.grid.Columns.Item("percMargemSellout_AT").Visible = False
        'Me.grid.Columns.Item("percMargemFinal_AT").Visible = False
        'Me.grid.Columns.Item("vlrLucroFinal_AA").Visible = False
        'Me.grid.Columns.Item("percMargemSellout_AA").Visible = False
        'Me.grid.Columns.Item("percMargemFinal_AA").Visible = False

        'Me.grid.Columns.Item("bandCrescimento").Visible = False
        'Me.grid.Columns.Item("bandMeta").Visible = False
        'Me.grid.Columns.Item("bandMetaLucro").Visible = False
        'Me.grid.Columns.Item("bandMetaMargem").Visible = False

        'Me.grid.Columns.Item("percPartDepto_AA").Visible = False
        'Me.grid.Columns.Item("percPartDepto_AT").Visible = False

        'Me.grid.Columns.Item("bandCAI_AnoAnterior").Visible = False
        'Me.grid.Columns.Item("bandCAI_AnoAtual").Visible = False
        'Me.grid.Columns.Item("bandClientes").Visible = False

    End Sub

    Protected Sub grid_ExportRenderBrick(sender As Object, e As ASPxGridViewExportRenderingEventArgs) Handles grid.ExportRenderBrick
        On Error Resume Next
        Dim Ro As ASPxGridViewTableRowEventArgs = TryCast(sender, ASPxGridViewTableRowEventArgs)

        Titulos_Grid()
    End Sub

    Protected Sub pb_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim progressBar As ASPxProgressBar = CType(sender, ASPxProgressBar)

        If progressBar.Position > 100 Then
            progressBar.Position = 100
        End If

        If progressBar.Position >= 100.0 Then
            progressBar.IndicatorStyle.BackColor = Drawing.Color.Green
        Else
            progressBar.IndicatorStyle.BackColor = Drawing.Color.LightCoral
        End If
    End Sub

    Protected Sub cbPanelGrid_PreRender(sender As Object, e As EventArgs) Handles cbPanelGrid.PreRender
        Titulos_Grid()
    End Sub

    Private Sub Titulos_Grid()

        ' Titulos ------------------------------------------------------------------------------------------------------------------

        Dim Ano As Int16 = Year(cboPeriodo.CallDiaFinal)
        Dim AnoAA As Int16 = Ano - 1

        oFun.Grid_ColumnTitle(grid, "qAT", Ano)
        oFun.Grid_ColumnTitle(grid, "qAA", AnoAA)

        oFun.Grid_ColumnTitle(grid, "vAT", Ano)
        oFun.Grid_ColumnTitle(grid, "vAA", AnoAA)

        oFun.Grid_ColumnTitle(grid, "mAT", Ano)
        oFun.Grid_ColumnTitle(grid, "mAA", AnoAA)

        oFun.Grid_ColumnTitle(grid, "pmAT", Ano)
        oFun.Grid_ColumnTitle(grid, "pmAA", AnoAA)

        oFun.Grid_ColumnTitle(grid, "cAT", Ano)
        oFun.Grid_ColumnTitle(grid, "cAA", AnoAA)

        oFun.Grid_ColumnTitle(grid, "maiAT", Ano)
        oFun.Grid_ColumnTitle(grid, "maiAA", AnoAA)

        oFun.Grid_ColumnTitle(grid, "percCAI_AT", Ano)
        oFun.Grid_ColumnTitle(grid, "percCAI_AA", AnoAA)

        oFun.Grid_ColumnTitle(grid, "vlrSelloutAT", Ano)
        oFun.Grid_ColumnTitle(grid, "vlrSelloutAA", AnoAA)

        oFun.Grid_ColumnTitle(grid, "percSellOutAT", Ano)
        oFun.Grid_ColumnTitle(grid, "percSellOutAA", AnoAA)

        oFun.Grid_ColumnTitle(grid, "impAT", Ano)
        oFun.Grid_ColumnTitle(grid, "impAA", AnoAA)

        oFun.Grid_ColumnTitle(grid, "vlrLucroTotalAT", Ano)
        oFun.Grid_ColumnTitle(grid, "vlrLucroTotalAA", AnoAA)
    End Sub

   
End Class
