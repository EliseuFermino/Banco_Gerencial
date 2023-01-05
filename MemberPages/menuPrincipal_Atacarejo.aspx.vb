Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing
Imports System.Net

Imports DevExpress.Web.ASPxGauges
Imports DevExpress.Web.ASPxGauges.Gauges.Circular
Imports DevExpress.Web

Partial Class MemberPages_menuPrincipal_Atacarejo
    Inherits System.Web.UI.Page

    Dim nota As String
    Dim descFilial As String
    Dim Periodo As String
    Dim varDesc As String

    Dim oPro As New Projeto
    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Variaveis Ultima Linha"

    Private QtdVendas As Decimal = 0
    Private vlrVenda As Decimal = 0
    Private Clientes As Decimal = 0
    Private vlrLucroTotal As Decimal = 0
    Private percMargemFinal As Decimal = 0
    Private vlrPrecoMedio As Decimal = 0
    Private percPartVendas As Decimal = 0

#End Region


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        On Error Resume Next
        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(420, User.Identity.Name)
            mySession()

            atcarejo_cboDia.AutoPostBack_cboDiaInicial = False
            atcarejo_cboDia.AutoPostBack_cboDiaFinal = False

            atcarejo604_cboDia.AutoPostBack_cboDiaInicial = False
            atcarejo604_cboDia.AutoPostBack_cboDiaFinal = False

            Session("sDIA_INICIAL_GESTOR") = myDateTimes.GetFirstDayOfMonth(Date.Now)
            Session("sDIA_FINAL_GESTOR") = Date.Today.AddDays(-1)
            Session("sDIA_ACIMA") = Date.Today

            atcarejo_cboDia.CallDiaInicial = myDateTimes.GetFirstDayOfMonth(Date.Now).Date
            atcarejo604_cboDia.CallDiaInicial = myDateTimes.GetFirstDayOfMonth(Date.Now).Date

            If DateAndTime.Today.Day = 1 Then
                atcarejo_cboDia.CallDiaFinal = Date.Today.Date
                atcarejo604_cboDia.CallDiaFinal = Date.Today.Date
            Else
                atcarejo_cboDia.CallDiaFinal = Date.Today.AddDays(-1).Date
                atcarejo604_cboDia.CallDiaFinal = Date.Today.AddDays(-1).Date
            End If


            Session("sDIA_INICIAL_ATACAREJO") = myDateTimes.GetFirstDayOfMonth(Date.Now)
            Session("sDIA_FINAL_ATACAREJO") = Date.Today.AddDays(-1)

            lblParticipacao_Atacarejo.Text = "O canal de Tele-Vendas representa " & Math.Round(CDbl(clDataDb.ExecuteStoredProcedure_Scalar("Atacarejo.usp_Participacao_VendaNF_Sobre_VendaTotal", Conexao.gerKnowledge_str, "DiaInicial", Session("sDIA_INICIAL_ATACAREJO"), "DiaFinal", Session("sDIA_FINAL_ATACAREJO"))), 2) & "% da Venda Total do período selecionado."

            cbPanelAtacarejo_Callback(sender, e)
            cbPanelAtacarejo604_Callback(sender, e)

            'Depto
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Depto, "nomeDiaSemanaDesc", Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Depto, "percPartVendas", Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Depto, "vlrPrecoMedio", Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Depto, "vlrVenda", Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Depto, "percMargemPDV", Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Depto, "percMargemFinal", Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Depto, "percMargemFinalNF", Color.Gray, BorderStyle.Solid, 2)

            'Secao
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Secao, "nomeDiaSemanaDesc", Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Secao, "percPartVendas", Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Secao, "vlrPrecoMedio", Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Secao, "vlrVenda", Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Secao, "percMargemPDV", Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Secao, "percMargemFinal", Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Atacarejo_Grid_Vendas_Diarias_Secao, "percMargemFinalNF", Color.Gray, BorderStyle.Solid, 2)

        End If
        'If cboFilial.IsLoja = True Then btnAtualizar.Visible = False


    End Sub

   

    Private Function GetGaugeScale(ByVal gaugeControl As ASPxGaugeControl, ByVal gaugeIndex As Integer, ByVal scaleIndex As Integer) As ArcScaleComponent
        Return (CType(gaugeControl.Gauges(gaugeIndex), ICircularGauge)).Scales(scaleIndex)
    End Function

    Private Sub Buscar_Total_PiorLoja_Mes(ByVal iNomeStoredProcedure As String, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iOrdem As Byte, ByVal iFilial As Byte)

        Dim con As New SqlConnection(Conexao.gerCheckList)
        Dim comando As New SqlCommand(iNomeStoredProcedure, con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@numOrdem", SqlDbType.TinyInt))
        comando.Parameters("@numOrdem").Value = iOrdem

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                nota = CDbl(reader5.GetSqlMoney(0)).ToString("n2")
                descFilial = reader5.GetSqlString(1)
                Periodo = reader5.GetSqlString(2)

            End While

        Catch ex As Exception
            varDesc = "Private Sub - Buscar_Total_PiorLoja_Mes " & ex.Message

        Finally
            con.Close()
        End Try
    End Sub

    Private Sub mySession()

        Dim sDiaNum As Byte

        Session("sFILIAL") = 99
        Session("sOPCAO") = 1
        Session("sMERCADOLOGICO") = 1

     

        Session("sSEMANA") = sDiaNum
        Session("sDIA") = DateAndTime.Today

        Session("sANO") = Year(DateAndTime.Today.AddDays(-1))
        Session("sMES") = Month(DateAndTime.Today.AddDays(-1))
        Session("sDEPARTAMENTO") = Trim(oPro.BuscarDepartamentoDoUsuario(User.Identity.Name))


    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        On Error Resume Next
        If Not IsPostBack Then

            Legendas()
            Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Vendidos.DataBind()
            'Session("sFILIAL") = CByte(Right(User.Identity.Name, 2))
            'lblOBS.Text = "REGIONAL " & Session("sREGIONAL") & " USUARIO: " & Session("sUSUARIO") & " DEPARTAMENTO: " & Session("sDEPARTAMENTO")
            'Graph.DataBind()
            'Chart_TicketMedio.DataBind()
            'cboFilial_ListFilialChanged(sender, e)

        End If
    End Sub

    Private Sub Legendas()

        Dim diaHoje, diaPrimeiro, diaOntem, diaPrimeiroMA, diaFinalMA As Date
        Dim sPrimeiro, sPrimeiroAA, sFinalAA, sHoje, sOntem As String

        diaHoje = DateAndTime.Now.Date
        diaOntem = DateAndTime.Now.Date.AddDays(-1)
        diaPrimeiro = myDateTimes.GetFirstDayOfMonth(diaHoje)

        sHoje = Left(CStr(diaHoje), 5)
        sOntem = Left(CStr(diaOntem), 5)
        sPrimeiro = Left(CStr(diaPrimeiro), 5)

        If diaHoje = diaPrimeiro Then

            diaPrimeiroMA = myDateTimes.GetFirstDayOfMonth_MesAnterior(diaPrimeiro)
            diaFinalMA = myDateTimes.GetLastDayOfMonth(diaPrimeiroMA)
            sPrimeiroAA = Left(CStr(diaPrimeiroMA), 5)
            sFinalAA = Left(CStr(diaFinalMA), 5)

            'lblTitle_Gestor.Text = " " & sPrimeiroAA & " à " & sFinalAA
        Else

            'lblTitle_Gestor.Text = " " & sPrimeiro & " à " & sOntem
        End If

        'lbl_2_2.Text = sPrimeiro & " à " & sOntem
        '  lbl_3_2.Text = sPrimeiro & " à " & sOntem


    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "    Dashboard Atacarejo - PGR420"
        End If
    End Sub

    Protected Sub grid_Loja_Nao_Fizeram_Checklist_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sGESTOR") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
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


#Region " GUIA ATACAREJO"

    Protected Sub cbPanelAtacarejo604_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanelAtacarejo604.Callback

        On Error Resume Next

        Session("sDIA_INICIAL_ATACAREJO_604") = atcarejo604_cboDia.CallDiaInicial
        Session("sDIA_FINAL_ATACAREJO_604") = atcarejo604_cboDia.CallDiaFinal

        Atacarejo_Grid_Vendas_Diarias_604.DataBind()
        Atacarejo_Grid_Vendas_Diarias_Depto_604.DataBind()
        Atacarejo_Grid_Vendas_Diarias_Secao_604.DataBind()
        Atacarejo_Grid_Vendas_Diarias_Tele_Vendas_604.DataBind()
        Atacarejo_Grid_Vendas_Diarias_Item_604.DataBind()
        Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Vendidos_604.DataBind()
        Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Lucratividade_604.DataBind()

    End Sub

    Protected Sub cbPanelAtacarejo_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanelAtacarejo.Callback

        On Error Resume Next

        Session("sDIA_INICIAL_ATACAREJO") = atcarejo_cboDia.CallDiaInicial
        Session("sDIA_FINAL_ATACAREJO") = atcarejo_cboDia.CallDiaFinal
        Atacarejo_Projecao()

        Atacarejo_Grid_Vendas_Diarias.DataBind()
        Atacarejo_Grid_Vendas_Diarias_Depto.DataBind()
        Atacarejo_Grid_Vendas_Diarias_Secao.DataBind()
        Atacarejo_Grid_Vendas_Diarias_Tele_Vendas.DataBind()
        Atacarejo_Grid_Vendas_Diarias_Item.DataBind()
        Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Vendidos.DataBind()
        Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Lucratividade.DataBind()

        lblParticipacao_Atacarejo.Text = "O canal de Tele-vendas representa " & Math.Round(CDbl(clDataDb.ExecuteStoredProcedure_Scalar("Atacarejo.usp_Participacao_VendaNF_Sobre_VendaTotal", Conexao.gerKnowledge_str, "DiaInicial", Session("sDIA_INICIAL_ATACAREJO"), "DiaFinal", Session("sDIA_FINAL_ATACAREJO"))), 2) & "% da Venda Total do período selecionado."

    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_BeforePerformDataSelect(sender As Object, e As EventArgs) Handles Atacarejo_Grid_Vendas_Diarias.BeforePerformDataSelect
        Atacarejo_Projecao()
    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles Atacarejo_Grid_Vendas_Diarias.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percAtingimentoMeta")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
        oFun.Grid_RedIsNegative(e, "vlrLucroTotal")
    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles Atacarejo_Grid_Vendas_Diarias.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias, "percAtingimentoMeta", "vlrVenda", "vlrMeta_Venda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias, "vlrPrecoMedio", "vlrVenda", "QtdVendas", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias, "percMargemFinal", "vlrLucroTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias, "TickeMedio", "vlrVenda", "numCliente", Funcoes.CalculateType.Division)

        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias, "idStatusAtingMeta_100", "vlrVenda", "vlrMeta_Venda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias, "percCAI", "vlrCAI", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias, "percSellOut", "vlrSellOut", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles Atacarejo_Grid_Vendas_Diarias.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Private Sub Atacarejo_Projecao()
        If Atacarejo_chkProjecao.Checked Then
            Dim vUltimoDiaMes As Date = myDateTimes.GetLastDayOfMonth(DateAndTime.Now.Date)
            atcarejo_cboDia.CallDiaFinal = vUltimoDiaMes
            Session("sDIA_FINAL_ATACAREJO") = vUltimoDiaMes
            Session("sPROJECAO") = 1
        Else
            Session("sDIA_FINAL_ATACAREJO") = atcarejo_cboDia.CallDiaFinal
            Session("sPROJECAO") = 0
        End If
    End Sub

#Region " DEPARTAMENTO "

    Protected Sub Atacarejo_Grid_Vendas_Diarias_Depto_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Depto.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Depto, "percAtingimentoMeta", "vlrVenda", "vlrMeta_Venda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Depto, "vlrPrecoMedio", "vlrVenda", "QtdVendas", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Depto, "percMargemFinal", "vlrLucroTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        ' oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias, "TickeMedio", "vlrVenda", "numCliente", Funcoes.CalculateType.Division)

        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Depto, "idStatusAtingMeta_100", "vlrVenda", "vlrMeta_Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Depto, "percMargemFinalNF", "vlrLucroFinalNF", "vlrVendaNF", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Depto, "percMargemPDV", "vlrLucroComercial", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Depto, "percMargemFinalNF_Liq", "vlrLucroTotal_Liq", "vlrVenda_Liq", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_Depto_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Depto.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_Depto_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Depto.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemPDV")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
    End Sub

#End Region


#Region " SECAO "

    Protected Sub Atacarejo_Grid_Vendas_Diarias_Secao_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Secao.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Secao, "percAtingimentoMeta", "vlrVenda", "vlrMeta_Venda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Secao, "vlrPrecoMedio", "vlrVenda", "QtdVendas", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Secao, "percMargemFinal", "vlrLucroTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        ' oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias, "TickeMedio", "vlrVenda", "numCliente", Funcoes.CalculateType.Division)

        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Secao, "idStatusAtingMeta_100", "vlrVenda", "vlrMeta_Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Secao, "percMargemFinalNF", "vlrLucroFinalNF", "vlrVendaNF", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Secao, "percMargemPDV", "vlrLucroComercial", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Secao, "percMargemFinalNF_Liq", "vlrLucroTotal_Liq", "vlrVenda_Liq", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_Secao_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Secao.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_Secao_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Secao.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemPDV")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
    End Sub

#End Region



    Protected Sub Atacarejo_Grid_Vendas_Diarias_Secao_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Secao.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(Atacarejo_Grid_Vendas_Diarias_Secao, e, "nomeDiaSemanaDesc", "Total 01-Mercearia", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(Atacarejo_Grid_Vendas_Diarias_Secao, e, "nomeDiaSemanaDesc", "Total 02-Pereciveis", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(Atacarejo_Grid_Vendas_Diarias_Secao, e, "nomeDiaSemanaDesc", "Total 03-Bazar", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(Atacarejo_Grid_Vendas_Diarias_Secao, e, "nomeDiaSemanaDesc", "Total 04-Textil", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(Atacarejo_Grid_Vendas_Diarias_Secao, e, "nomeDiaSemanaDesc", "Total 05-Eletro", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(Atacarejo_Grid_Vendas_Diarias_Secao, e, "nomeDiaSemanaDesc", "Total Geral", Drawing.Color.LightGreen, True)

    End Sub


    Protected Sub Atacarejo_Grid_Vendas_Diarias_Tele_Vendas_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Tele_Vendas.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_Tele_Vendas_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Tele_Vendas.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Tele_Vendas, "vlrPrecoMedio", "vlrVenda", "QtdVendas", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Tele_Vendas, "percMargemFinal", "vlrLucroTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_Tele_Vendas_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Tele_Vendas.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemFinal")
        oFun.Grid_RedIsNegative(e, "vlrLucroTotal")
    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_Item_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Item.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Item, "percMargemFinalPDV", "vlrLucroTotalPDV", "vlrVendaPDV", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Item, "percMargemFinalNF", "vlrLucroFinalNF", "vlrVendaNF", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Item, "percMargemFinal", "vlrLucroTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, Atacarejo_Grid_Vendas_Diarias_Item, "percMargemComercial", "vlrLucroComercial", "vlrVendaPDV", Funcoes.CalculateType.ValueOverRevenue)
    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_Item_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Item.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub



    Protected Sub Atacarejo_Grid_Vendas_Diarias_Item_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Item.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemFinalPDV")
        oFun.Grid_RedIsNegative(e, "vlrLucroTotalPDV")

        oFun.Grid_RedIsNegative(e, "percMargemFinalNF")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinalNF")

        oFun.Grid_RedIsNegative(e, "percMargemFinal")
        oFun.Grid_RedIsNegative(e, "vlrLucroTotal")

        oFun.Grid_RedIsNegative(e, "percMargemComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")

    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Vendidos_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Vendidos.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemFinal")
        oFun.Grid_RedIsNegative(e, "vlrLucroTotal")
    End Sub

    Protected Sub Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Lucratividade_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Lucratividade.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemFinal")
        oFun.Grid_RedIsNegative(e, "vlrLucroTotal")
    End Sub


#End Region



End Class
