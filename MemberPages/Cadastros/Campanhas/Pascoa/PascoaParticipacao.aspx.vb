
#Region " Imports"

Imports DevExpress.Web
Imports System.Data
Imports System.Data.SqlClient

#End Region

Partial Class MemberPages_Campanhas_Pascoa_PascoaParticipacao
    Inherits System.Web.UI.Page

    Private connManager As String = clData_gerManager.dbConnect
    Dim oFun As New Funcoes

    Protected Sub cboCod_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboCod.SelectedIndexChanged
        Session("sCOD") = Me.cboCod.Value
    End Sub

#Region " Page"

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(210, User.Identity.Name)

            If Month(Now()) < 2 Then

                oVem.Campanha_BuscarPeriodo(1, Year(Now()) - 1)
            Else

                oVem.Campanha_BuscarPeriodo(1, Year(Now()))
            End If

            Session("sCOD") = 0

        End If
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Campanha da Páscoa - Acompanhamento Semanal - Empresa - PGR210"
        End If

    End Sub

#End Region

#Region " Grid"

    Protected Sub gridCrescPascoaDia_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridCrescPascoaDia.HtmlFooterCellPrepared

        On Error Resume Next
        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub gridCrescPascoaDia_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridCrescPascoaDia.HtmlDataCellPrepared
        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "difAcumulada")
        oFun.Grid_RedIsNegative(e, "difPartPerc")
        oFun.Grid_RedIsNegative(e, "DifCrescReal")
        oFun.Grid_RedIsNegative(e, "DifCrescReal_Qtde")
        oFun.Grid_RedIsNegative(e, "DifCrescLucro")
        oFun.Grid_RedIsNegative(e, "difVolume")

    End Sub

    Protected Sub gridCrescPascoaDia_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridCrescPascoaDia.CustomUnboundColumnData
        On Error Resume Next

        oFun.Grid_Calculate(e, "difAcumulada", "PartAcumAT", "PartAcumAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Calculate(e, "difPartPerc", "percPartAT", "percPartAA", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "DifCrescReal", "VendaAT", "VendaAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Calculate(e, "DifCrescLucro", "LucroAT", "LucroAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Calculate(e, "DifCrescReal_Qtde", "QtdeAT", "QtdeAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Calculate(e, "difVolume", "QtdeAT", "QtdeAA", Funcoes.CalculateType.Decrease)

    End Sub

    Protected Sub gridCrescPascoaDia_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridCrescPascoaDia.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate(sender, e, Me.gridCrescPascoaDia, "percMargemAA", "LucroAA", "VendaAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, Me.gridCrescPascoaDia, "percMargemAT", "LucroAT", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, Me.gridCrescPascoaDia, "difAcumulada", "SemanaAcumAT", "SemanaAcumAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, Me.gridCrescPascoaDia, "difPartPerc", "percPartAT", "percPartAA", Funcoes.CalculateType.Decrease)
        oFun.Grid_Footer_Calculate(sender, e, Me.gridCrescPascoaDia, "DifCrescReal", "VendaAT", "VendaAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, Me.gridCrescPascoaDia, "DifCrescLucro", "LucroAT", "LucroAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, Me.gridCrescPascoaDia, "DifCrescReal_Qtde", "QtdeAT", "QtdeAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, Me.gridCrescPascoaDia, "difVolume", "QtdeAT", "QtdeAA", Funcoes.CalculateType.Decrease)
    End Sub

#End Region

End Class
