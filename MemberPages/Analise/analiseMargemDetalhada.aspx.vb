Imports System.Activities.Statements
Imports System.Data
Imports System.Data.SqlClient
Imports System.Windows.Forms
Imports DevExpress.DashboardCommon.Native
Imports DevExpress.ExpressApp.EasyTest.WebAdapter.Commands
Imports DevExpress.Web
Imports DevExpress.XtraDiagram.Base
Imports DevExpress.XtraScheduler.UI
Imports DevExpress.XtraSpreadsheet.Forms

Partial Class MemberPages_analiseMargemDetalhada
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Private vIsLoja As Boolean
    Private vIsRegional As Boolean
    Private vDepartamento As String
    Private vFilial As Int16
    Dim oProj As New Projeto
    Dim selects As New preencheSelects

#Region " Variaveis para Calculo"

    Private m1_vlrRev As Decimal = 0
    Private m1_percRev As Decimal = 0
    Private m1_vlrRea As Decimal = 0
    Private m1_percRea As Decimal = 0
    Private m1_vlrMxR As Decimal = 0
    Private m1_percMxR As Decimal = 0

    Private m2_vlrRev As Decimal = 0
    Private m2_percRev As Decimal = 0
    Private m2_vlrRea As Decimal = 0
    Private m2_percRea As Decimal = 0
    Private m2_vlrMxR As Decimal = 0
    Private m2_percMxR As Decimal = 0

    Private m3_vlrRev As Decimal = 0
    Private m3_percRev As Decimal = 0
    Private m3_vlrRea As Decimal = 0
    Private m3_percRea As Decimal = 0
    Private m3_vlrMxR As Decimal = 0
    Private m3_percMxR As Decimal = 0

    Private m4_vlrRev As Decimal = 0
    Private m4_percRev As Decimal = 0
    Private m4_vlrRea As Decimal = 0
    Private m4_percRea As Decimal = 0
    Private m4_vlrMxR As Decimal = 0
    Private m4_percMxR As Decimal = 0

    Private m5_vlrRev As Decimal = 0
    Private m5_percRev As Decimal = 0
    Private m5_vlrRea As Decimal = 0
    Private m5_percRea As Decimal = 0
    Private m5_vlrMxR As Decimal = 0
    Private m5_percMxR As Decimal = 0

    Private m6_vlrRev As Decimal = 0
    Private m6_percRev As Decimal = 0
    Private m6_vlrRea As Decimal = 0
    Private m6_percRea As Decimal = 0
    Private m6_vlrMxR As Decimal = 0
    Private m6_percMxR As Decimal = 0

    Private m7_vlrRev As Decimal = 0
    Private m7_percRev As Decimal = 0
    Private m7_vlrRea As Decimal = 0
    Private m7_percRea As Decimal = 0
    Private m7_vlrMxR As Decimal = 0
    Private m7_percMxR As Decimal = 0

    Private m8_vlrRev As Decimal = 0
    Private m8_percRev As Decimal = 0
    Private m8_vlrRea As Decimal = 0
    Private m8_percRea As Decimal = 0
    Private m8_vlrMxR As Decimal = 0
    Private m8_percMxR As Decimal = 0

    Private m9_vlrRev As Decimal = 0
    Private m9_percRev As Decimal = 0
    Private m9_vlrRea As Decimal = 0
    Private m9_percRea As Decimal = 0
    Private m9_vlrMxR As Decimal = 0
    Private m9_percMxR As Decimal = 0

    Private m10_vlrRev As Decimal = 0
    Private m10_percRev As Decimal = 0
    Private m10_vlrRea As Decimal = 0
    Private m10_percRea As Decimal = 0
    Private m10_vlrMxR As Decimal = 0
    Private m10_percMxR As Decimal = 0

    Private m11_vlrRev As Decimal = 0
    Private m11_percRev As Decimal = 0
    Private m11_vlrRea As Decimal = 0
    Private m11_percRea As Decimal = 0
    Private m11_vlrMxR As Decimal = 0
    Private m11_percMxR As Decimal = 0

    Private m12_vlrRev As Decimal = 0
    Private m12_percRev As Decimal = 0
    Private m12_vlrRea As Decimal = 0
    Private m12_percRea As Decimal = 0
    Private m12_vlrMxR As Decimal = 0
    Private m12_percMxR As Decimal = 0

    Private p1_vlrRev As Decimal = 0
    Private p1_percRev As Decimal = 0
    Private p1_vlrRea As Decimal = 0
    Private p1_percRea As Decimal = 0
    Private p1_vlrMxR As Decimal = 0
    Private p1_percMxR As Decimal = 0

    Private p2_vlrRev As Decimal = 0
    Private p2_percRev As Decimal = 0
    Private p2_vlrRea As Decimal = 0
    Private p2_percRea As Decimal = 0
    Private p2_vlrMxR As Decimal = 0
    Private p2_percMxR As Decimal = 0

    Private p3_vlrRev As Decimal = 0
    Private p3_percRev As Decimal = 0
    Private p3_vlrRea As Decimal = 0
    Private p3_percRea As Decimal = 0
    Private p3_vlrMxR As Decimal = 0
    Private p3_percMxR As Decimal = 0

    Private p4_vlrRev As Decimal = 0
    Private p4_percRev As Decimal = 0
    Private p4_vlrRea As Decimal = 0
    Private p4_percRea As Decimal = 0
    Private p4_vlrMxR As Decimal = 0
    Private p4_percMxR As Decimal = 0

    Private an_vlrRev As Decimal = 0
    Private an_percRev As Decimal = 0
    Private an_vlrRea As Decimal = 0
    Private an_percRea As Decimal = 0
    Private an_vlrMxR As Decimal = 0
    Private an_percMxR As Decimal = 0

    Private ac_vlrRev As Decimal = 0
    Private ac_percRev As Decimal = 0
    Private ac_vlrRea As Decimal = 0
    Private ac_percRea As Decimal = 0
    Private ac_vlrMxR As Decimal = 0
    Private ac_percMxR As Decimal = 0


    Private acAA_vlrRea As Decimal = 0
    Private acAA_percRea As Decimal = 0


    Private m1_vlrOri As Decimal = 0
    Private m2_vlrOri As Decimal = 0
    Private m3_vlrOri As Decimal = 0
    Private m4_vlrOri As Decimal = 0
    Private m5_vlrOri As Decimal = 0
    Private m6_vlrOri As Decimal = 0
    Private m7_vlrOri As Decimal = 0
    Private m8_vlrOri As Decimal = 0
    Private m9_vlrOri As Decimal = 0
    Private m10_vlrOri As Decimal = 0
    Private m11_vlrOri As Decimal = 0
    Private m12_vlrOri As Decimal = 0
    Private p1_vlrOri As Decimal = 0
    Private p2_vlrOri As Decimal = 0
    Private p3_vlrOri As Decimal = 0
    Private ac_vlrOri As Decimal = 0
    Private an_vlrOri As Decimal = 0

    Private m1_percOri As Decimal = 0
    Private m2_percOri As Decimal = 0
    Private m3_percOri As Decimal = 0
    Private m4_percOri As Decimal = 0
    Private m5_percOri As Decimal = 0
    Private m6_percOri As Decimal = 0
    Private m7_percOri As Decimal = 0
    Private m8_percOri As Decimal = 0
    Private m9_percOri As Decimal = 0
    Private m10_percOri As Decimal = 0
    Private m11_percOri As Decimal = 0
    Private m12_percOri As Decimal = 0
    Private p1_percOri As Decimal = 0
    Private p2_percOri As Decimal = 0
    Private p3_percOri As Decimal = 0
    Private ac_percOri As Decimal = 0
    Private an_percOri As Decimal = 0

#End Region

#Region " PAGE"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Session.Timeout = 5000
            iniSessions()


            If Not (Session("sDATINI") = "") Then
                daterange.Value = Session("sDATINI").ToString() & " à " & Session("sDATFIM").ToString()
            Else
                daterange.Value = "Selecione um período..."
            End If

            oProj.BuscarLocalDoUsuario(Page.User.Identity.Name)
            vDepartamento = LCase(Trim(oProj.Buscar_Departamento_Usuario(Page.User.Identity.Name)))
            Session("sDEPARTAMENTO") = vDepartamento

            Call carregaSelects()

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        'CType(Master.FindControl("lblTitle"), Label).Text = "Resultado Teórico - Por Seção"


        'MainContent_selFilial_selFilial_CapC

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then

            'Session("sANO") = Now().Year
            'Session("sFILIAL") = Me.selFilial.SelectedValue

            'Call ColocarBordas()

            'Me.ASPxGridView1.DataBind()
        End If
    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not Me.IsPostBack Then


        End If
    End Sub

#End Region

#Region "GridView"

    Protected Sub chkParticip_CheckedChanged(sender As Object, e As EventArgs)

        If chkParticip.Checked Then

            OcultarColuna("Fat_N")
            OcultarColuna("Lucro_N")
            OcultarColuna("Margem_N")
            OcultarColuna("Fat_0_5")
            OcultarColuna("Lucro_0_5")
            OcultarColuna("Margem_0_5")
            OcultarColuna("Fat_5_10")
            OcultarColuna("Lucro_5_10")
            OcultarColuna("Margem_5_10")
            OcultarColuna("Fat_10_15")
            OcultarColuna("Lucro_10_15")
            OcultarColuna("Margem_10_15")
            OcultarColuna("Fat_15_20")
            OcultarColuna("Lucro_15_20")
            OcultarColuna("Margem_15_20")
            OcultarColuna("Fat_20_25")
            OcultarColuna("Lucro_20_25")
            OcultarColuna("Margem_20_25")
            OcultarColuna("Fat_25_30")
            OcultarColuna("Lucro_25_30")
            OcultarColuna("Margem_25_30")
            OcultarColuna("Fat_30_AC")
            OcultarColuna("Lucro_30_AC")
            OcultarColuna("Margem_30_AC")

        Else

            ExibirColuna("Fat_N")
            ExibirColuna("Lucro_N")
            ExibirColuna("Margem_N")
            ExibirColuna("Fat_0_5")
            ExibirColuna("Lucro_0_5")
            ExibirColuna("Margem_0_5")
            ExibirColuna("Fat_5_10")
            ExibirColuna("Lucro_5_10")
            ExibirColuna("Margem_5_10")
            ExibirColuna("Fat_10_15")
            ExibirColuna("Lucro_10_15")
            ExibirColuna("Margem_10_15")
            ExibirColuna("Fat_15_20")
            ExibirColuna("Lucro_15_20")
            ExibirColuna("Margem_15_20")
            ExibirColuna("Fat_20_25")
            ExibirColuna("Lucro_20_25")
            ExibirColuna("Margem_20_25")
            ExibirColuna("Fat_25_30")
            ExibirColuna("Lucro_25_30")
            ExibirColuna("Margem_25_30")
            ExibirColuna("Fat_30_AC")
            ExibirColuna("Lucro_30_AC")
            ExibirColuna("Margem_30_AC")


        End If


    End Sub

    Protected Sub ASPxGridView1_DataBound(sender As Object, e As EventArgs)

        'band_Ano, band_Periodo_4
        'If chkPeriodo_1.Checked = True Then
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_1", True)
        'Else
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_1", False)
        'End If

        'If chkPeriodo_2.Checked = True Then
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_2", True)
        'Else
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_2", False)
        'End If

        'If chkPeriodo_3.Checked = True Then
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_3", True)
        'Else
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_3", False)
        'End If

        'If chkPeriodo_4.Checked = True Then
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_4", True)
        'Else
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Periodo_4", False)
        'End If

        'If chkPeriodo_5.Checked = True Then
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Acumulado", True)
        'Else
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Acumulado", False)
        'End If

        'If chkPeriodo_6.Checked = True Then
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Ano", True)
        'Else
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Ano", False)
        'End If

        'If chkTrimestres.Checked = True Then
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_1", True)
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_2", True)
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_3", True)
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_4", True)
        'Else
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_1", False)
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_2", False)
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_3", False)
        '    oFun.Grid_Column_Visible(ASPxGridView1, "band_Trimestre_4", False)
        'End If

        'Session("sFILIAL") = Me.selFilial.SelectedValue
        'Session("sANO") = Me.selAno.SelectedValue

        'Mostrar Cabeçalho
        'If Me.chkMostrarCabecalho.Checked = True Then
        '    Me.ASPxGridView1.Settings.ShowVerticalScrollBar = True
        'Else
        '    Me.ASPxGridView1.Settings.ShowVerticalScrollBar = False
        'End If

        'Call ColocarBordas()

    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next
        'If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then

        '    m1_vlrRev = 0
        '    m1_percRev = 0
        '    m1_vlrRea = 0
        '    m1_percRea = 0
        '    m1_vlrMxR = 0
        '    m1_percMxR = 0

        '    m2_vlrRev = 0
        '    m2_percRev = 0
        '    m2_vlrRea = 0
        '    m2_percRea = 0
        '    m2_vlrMxR = 0
        '    m2_percMxR = 0

        '    m3_vlrRev = 0
        '    m3_percRev = 0
        '    m3_vlrRea = 0
        '    m3_percRea = 0
        '    m3_vlrMxR = 0
        '    m3_percMxR = 0

        '    m4_vlrRev = 0
        '    m4_percRev = 0
        '    m4_vlrRea = 0
        '    m4_percRea = 0
        '    m4_vlrMxR = 0
        '    m4_percMxR = 0

        '    m5_vlrRev = 0
        '    m5_percRev = 0
        '    m5_vlrRea = 0
        '    m5_percRea = 0
        '    m5_vlrMxR = 0
        '    m5_percMxR = 0

        '    m6_vlrRev = 0
        '    m6_percRev = 0
        '    m6_vlrRea = 0
        '    m6_percRea = 0
        '    m6_vlrMxR = 0
        '    m6_percMxR = 0

        '    m7_vlrRev = 0
        '    m7_percRev = 0
        '    m7_vlrRea = 0
        '    m7_percRea = 0
        '    m7_vlrMxR = 0
        '    m7_percMxR = 0

        '    m8_vlrRev = 0
        '    m8_percRev = 0
        '    m8_vlrRea = 0
        '    m8_percRea = 0
        '    m8_vlrMxR = 0
        '    m8_percMxR = 0

        '    m9_vlrRev = 0
        '    m9_percRev = 0
        '    m9_vlrRea = 0
        '    m9_percRea = 0
        '    m9_vlrMxR = 0
        '    m9_percMxR = 0

        '    m10_vlrRev = 0
        '    m10_percRev = 0
        '    m10_vlrRea = 0
        '    m10_percRea = 0
        '    m10_vlrMxR = 0
        '    m10_percMxR = 0

        '    m11_vlrRev = 0
        '    m11_percRev = 0
        '    m11_vlrRea = 0
        '    m11_percRea = 0
        '    m11_vlrMxR = 0
        '    m11_percMxR = 0

        '    m12_vlrRev = 0
        '    m12_percRev = 0
        '    m12_vlrRea = 0
        '    m12_percRea = 0
        '    m12_vlrMxR = 0
        '    m12_percMxR = 0

        '    p1_vlrRev = 0
        '    p1_percRev = 0
        '    p1_vlrRea = 0
        '    p1_percRea = 0
        '    p1_vlrMxR = 0
        '    p1_percMxR = 0

        '    p2_vlrRev = 0
        '    p2_percRev = 0
        '    p2_vlrRea = 0
        '    p2_percRea = 0
        '    p2_vlrMxR = 0
        '    p2_percMxR = 0

        '    p3_vlrRev = 0
        '    p3_percRev = 0
        '    p3_vlrRea = 0
        '    p3_percRea = 0
        '    p3_vlrMxR = 0
        '    p3_percMxR = 0

        '    p4_vlrRev = 0
        '    p4_percRev = 0
        '    p4_vlrRea = 0
        '    p4_percRea = 0
        '    p4_vlrMxR = 0
        '    p4_percMxR = 0

        '    an_vlrRev = 0
        '    an_percRev = 0
        '    an_vlrRea = 0
        '    an_percRea = 0
        '    an_vlrMxR = 0
        '    an_percMxR = 0

        '    ac_vlrRev = 0
        '    ac_percRev = 0
        '    ac_vlrRea = 0
        '    ac_percRea = 0
        '    ac_vlrMxR = 0
        '    ac_percMxR = 0

        '    acAA_vlrRea = 0
        '    acAA_percRea = 0

        '    m1_vlrOri = 0
        '    m2_vlrOri = 0
        '    m3_vlrOri = 0
        '    m4_vlrOri = 0
        '    m5_vlrOri = 0
        '    m6_vlrOri = 0
        '    m7_vlrOri = 0
        '    m8_vlrOri = 0
        '    m9_vlrOri = 0
        '    m10_vlrOri = 0
        '    m11_vlrOri = 0
        '    m12_vlrOri = 0
        '    p1_vlrOri = 0
        '    p2_vlrOri = 0
        '    p3_vlrOri = 0
        '    an_vlrOri = 0
        '    ac_vlrOri = 0

        '    m1_percOri = 0
        '    m2_percOri = 0
        '    m3_percOri = 0
        '    m4_percOri = 0
        '    m5_percOri = 0
        '    m6_percOri = 0
        '    m7_percOri = 0
        '    m8_percOri = 0
        '    m9_percOri = 0
        '    m10_percOri = 0
        '    m11_percOri = 0
        '    m12_percOri = 0
        '    p1_percOri = 0
        '    p2_percOri = 0
        '    p3_percOri = 0
        '    ac_percOri = 0
        '    an_percOri = 0

        'End If
        'If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

        '    Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idGrupo"))
        '    If myFilter = 47 Then

        '        m1_vlrRev += Convert.ToDecimal(e.GetValue("m1_vlrRev"))
        '        m1_percRev += Convert.ToDecimal(e.GetValue("m1_percRev"))
        '        m1_vlrRea += Convert.ToDecimal(e.GetValue("m1_vlrRea"))
        '        m1_percRea += Convert.ToDecimal(e.GetValue("m1_percRea"))
        '        m1_vlrMxR += Convert.ToDecimal(e.GetValue("m1_vlrMxR"))
        '        m1_percMxR += Convert.ToDecimal(e.GetValue("m1_percMxR"))

        '        m2_vlrRev += Convert.ToDecimal(e.GetValue("m2_vlrRev"))
        '        m2_percRev += Convert.ToDecimal(e.GetValue("m2_percRev"))
        '        m2_vlrRea += Convert.ToDecimal(e.GetValue("m2_vlrRea"))
        '        m2_percRea += Convert.ToDecimal(e.GetValue("m2_percRea"))
        '        m2_vlrMxR += Convert.ToDecimal(e.GetValue("m2_vlrMxR"))
        '        m2_percMxR += Convert.ToDecimal(e.GetValue("m2_percMxR"))

        '        m3_vlrRev += Convert.ToDecimal(e.GetValue("m3_vlrRev"))
        '        m3_percRev += Convert.ToDecimal(e.GetValue("m3_percRev"))
        '        m3_vlrRea += Convert.ToDecimal(e.GetValue("m3_vlrRea"))
        '        m3_percRea += Convert.ToDecimal(e.GetValue("m3_percRea"))
        '        m3_vlrMxR += Convert.ToDecimal(e.GetValue("m3_vlrMxR"))
        '        m3_percMxR += Convert.ToDecimal(e.GetValue("m3_percMxR"))

        '        m4_vlrRev += Convert.ToDecimal(e.GetValue("m4_vlrRev"))
        '        m4_percRev += Convert.ToDecimal(e.GetValue("m4_percRev"))
        '        m4_vlrRea += Convert.ToDecimal(e.GetValue("m4_vlrRea"))
        '        m4_percRea += Convert.ToDecimal(e.GetValue("m4_percRea"))
        '        m4_vlrMxR += Convert.ToDecimal(e.GetValue("m4_vlrMxR"))
        '        m4_percMxR += Convert.ToDecimal(e.GetValue("m4_percMxR"))

        '        m5_vlrRev += Convert.ToDecimal(e.GetValue("m5_vlrRev"))
        '        m5_percRev += Convert.ToDecimal(e.GetValue("m5_percRev"))
        '        m5_vlrRea += Convert.ToDecimal(e.GetValue("m5_vlrRea"))
        '        m5_percRea += Convert.ToDecimal(e.GetValue("m5_percRea"))
        '        m5_vlrMxR += Convert.ToDecimal(e.GetValue("m5_vlrMxR"))
        '        m5_percMxR += Convert.ToDecimal(e.GetValue("m5_percMxR"))

        '        m6_vlrRev += Convert.ToDecimal(e.GetValue("m6_vlrRev"))
        '        m6_percRev += Convert.ToDecimal(e.GetValue("m6_percRev"))
        '        m6_vlrRea += Convert.ToDecimal(e.GetValue("m6_vlrRea"))
        '        m6_percRea += Convert.ToDecimal(e.GetValue("m6_percRea"))
        '        m6_vlrMxR += Convert.ToDecimal(e.GetValue("m6_vlrMxR"))
        '        m6_percMxR += Convert.ToDecimal(e.GetValue("m6_percMxR"))

        '        m7_vlrRev += Convert.ToDecimal(e.GetValue("m7_vlrRev"))
        '        m7_percRev += Convert.ToDecimal(e.GetValue("m7_percRev"))
        '        m7_vlrRea += Convert.ToDecimal(e.GetValue("m7_vlrRea"))
        '        m7_percRea += Convert.ToDecimal(e.GetValue("m7_percRea"))
        '        m7_vlrMxR += Convert.ToDecimal(e.GetValue("m7_vlrMxR"))
        '        m7_percMxR += Convert.ToDecimal(e.GetValue("m7_percMxR"))

        '        m8_vlrRev += Convert.ToDecimal(e.GetValue("m8_vlrRev"))
        '        m8_percRev += Convert.ToDecimal(e.GetValue("m8_percRev"))
        '        m8_vlrRea += Convert.ToDecimal(e.GetValue("m8_vlrRea"))
        '        m8_percRea += Convert.ToDecimal(e.GetValue("m8_percRea"))
        '        m8_vlrMxR += Convert.ToDecimal(e.GetValue("m8_vlrMxR"))
        '        m8_percMxR += Convert.ToDecimal(e.GetValue("m8_percMxR"))

        '        m9_vlrRev += Convert.ToDecimal(e.GetValue("m9_vlrRev"))
        '        m9_percRev += Convert.ToDecimal(e.GetValue("m9_percRev"))
        '        m9_vlrRea += Convert.ToDecimal(e.GetValue("m9_vlrRea"))
        '        m9_percRea += Convert.ToDecimal(e.GetValue("m9_percRea"))
        '        m9_vlrMxR += Convert.ToDecimal(e.GetValue("m9_vlrMxR"))
        '        m9_percMxR += Convert.ToDecimal(e.GetValue("m9_percMxR"))

        '        m10_vlrRev += Convert.ToDecimal(e.GetValue("m10_vlrRev"))
        '        m10_percRev += Convert.ToDecimal(e.GetValue("m10_percRev"))
        '        m10_vlrRea += Convert.ToDecimal(e.GetValue("m10_vlrRea"))
        '        m10_percRea += Convert.ToDecimal(e.GetValue("m10_percRea"))
        '        m10_vlrMxR += Convert.ToDecimal(e.GetValue("m10_vlrMxR"))
        '        m10_percMxR += Convert.ToDecimal(e.GetValue("m10_percMxR"))

        '        m11_vlrRev += Convert.ToDecimal(e.GetValue("m11_vlrRev"))
        '        m11_percRev += Convert.ToDecimal(e.GetValue("m11_percRev"))
        '        m11_vlrRea += Convert.ToDecimal(e.GetValue("m11_vlrRea"))
        '        m11_percRea += Convert.ToDecimal(e.GetValue("m11_percRea"))
        '        m11_vlrMxR += Convert.ToDecimal(e.GetValue("m11_vlrMxR"))
        '        m11_percMxR += Convert.ToDecimal(e.GetValue("m11_percMxR"))

        '        m12_vlrRev += Convert.ToDecimal(e.GetValue("m12_vlrRev"))
        '        m12_percRev += Convert.ToDecimal(e.GetValue("m12_percRev"))
        '        m12_vlrRea += Convert.ToDecimal(e.GetValue("m12_vlrRea"))
        '        m12_percRea += Convert.ToDecimal(e.GetValue("m12_percRea"))
        '        m12_vlrMxR += Convert.ToDecimal(e.GetValue("m12_vlrMxR"))
        '        m12_percMxR += Convert.ToDecimal(e.GetValue("m12_percMxR"))

        '        p1_vlrRev += Convert.ToDecimal(e.GetValue("p1_vlrRev"))
        '        p1_percRev += Convert.ToDecimal(e.GetValue("p1_percRev"))
        '        p1_vlrRea += Convert.ToDecimal(e.GetValue("p1_vlrRea"))
        '        p1_percRea += Convert.ToDecimal(e.GetValue("p1_percRea"))
        '        p1_vlrMxR += Convert.ToDecimal(e.GetValue("p1_vlrMxR"))
        '        p1_percMxR += Convert.ToDecimal(e.GetValue("p1_percMxR"))

        '        p2_vlrRev += Convert.ToDecimal(e.GetValue("p2_vlrRev"))
        '        p2_percRev += Convert.ToDecimal(e.GetValue("p2_percRev"))
        '        p2_vlrRea += Convert.ToDecimal(e.GetValue("p2_vlrRea"))
        '        p2_percRea += Convert.ToDecimal(e.GetValue("p2_percRea"))
        '        p2_vlrMxR += Convert.ToDecimal(e.GetValue("p2_vlrMxR"))
        '        p2_percMxR += Convert.ToDecimal(e.GetValue("p2_percMxR"))

        '        p3_vlrRev += Convert.ToDecimal(e.GetValue("p3_vlrRev"))
        '        p3_percRev += Convert.ToDecimal(e.GetValue("p3_percRev"))
        '        p3_vlrRea += Convert.ToDecimal(e.GetValue("p3_vlrRea"))
        '        p3_percRea += Convert.ToDecimal(e.GetValue("p3_percRea"))
        '        p3_vlrMxR += Convert.ToDecimal(e.GetValue("p3_vlrMxR"))
        '        p3_percMxR += Convert.ToDecimal(e.GetValue("p3_percMxR"))

        '        p4_vlrRev += Convert.ToDecimal(e.GetValue("p4_vlrRev"))
        '        p4_percRev += Convert.ToDecimal(e.GetValue("p4_percRev"))
        '        p4_vlrRea += Convert.ToDecimal(e.GetValue("p4_vlrRea"))
        '        p4_percRea += Convert.ToDecimal(e.GetValue("p4_percRea"))
        '        p4_vlrMxR += Convert.ToDecimal(e.GetValue("p4_vlrMxR"))
        '        p4_percMxR += Convert.ToDecimal(e.GetValue("p4_percMxR"))

        '        ac_vlrRev += Convert.ToDecimal(e.GetValue("ac_vlrRev"))
        '        ac_percRev += Convert.ToDecimal(e.GetValue("ac_percRev"))
        '        ac_vlrRea += Convert.ToDecimal(e.GetValue("ac_vlrRea"))
        '        ac_percRea += Convert.ToDecimal(e.GetValue("ac_percRea"))
        '        ac_vlrMxR += Convert.ToDecimal(e.GetValue("ac_vlrMxR"))
        '        ac_percMxR += Convert.ToDecimal(e.GetValue("ac_percMxR"))

        '        acAA_vlrRea += Convert.ToDecimal(e.GetValue("acAA_vlrRea"))
        '        acAA_percRea += Convert.ToDecimal(e.GetValue("acAA_percRea"))

        '        an_vlrRev += Convert.ToDecimal(e.GetValue("an_vlrRev"))
        '        an_percRev += Convert.ToDecimal(e.GetValue("an_percRev"))
        '        an_vlrRea += Convert.ToDecimal(e.GetValue("an_vlrRea"))
        '        an_percRea += Convert.ToDecimal(e.GetValue("an_percRea"))
        '        an_vlrMxR += Convert.ToDecimal(e.GetValue("an_vlrMxR"))
        '        an_percMxR += Convert.ToDecimal(e.GetValue("an_percMxR"))

        '        m1_vlrOri += Convert.ToDecimal(e.GetValue("m1_vlrOri"))
        '        m2_vlrOri += Convert.ToDecimal(e.GetValue("m2_vlrOri"))
        '        m3_vlrOri += Convert.ToDecimal(e.GetValue("m3_vlrOri"))
        '        m4_vlrOri += Convert.ToDecimal(e.GetValue("m4_vlrOri"))
        '        m5_vlrOri += Convert.ToDecimal(e.GetValue("m5_vlrOri"))
        '        m6_vlrOri += Convert.ToDecimal(e.GetValue("m6_vlrOri"))
        '        m7_vlrOri += Convert.ToDecimal(e.GetValue("m7_vlrOri"))
        '        m8_vlrOri += Convert.ToDecimal(e.GetValue("m8_vlrOri"))
        '        m9_vlrOri += Convert.ToDecimal(e.GetValue("m9_vlrOri"))
        '        m10_vlrOri += Convert.ToDecimal(e.GetValue("m10_vlrOri"))
        '        m11_vlrOri += Convert.ToDecimal(e.GetValue("m11_vlrOri"))
        '        m12_vlrOri += Convert.ToDecimal(e.GetValue("m12_vlrOri"))
        '        p1_vlrOri += Convert.ToDecimal(e.GetValue("p1_vlrOri"))
        '        p2_vlrOri += Convert.ToDecimal(e.GetValue("p2_vlrOri"))
        '        p3_vlrOri += Convert.ToDecimal(e.GetValue("p3_vlrOri"))
        '        ac_vlrOri += Convert.ToDecimal(e.GetValue("ac_vlrOri"))
        '        an_vlrOri += Convert.ToDecimal(e.GetValue("an_vlrOri"))

        '        m1_percOri += Convert.ToDecimal(e.GetValue("m1_percOri"))
        '        m2_percOri += Convert.ToDecimal(e.GetValue("m2_percOri"))
        '        m3_percOri += Convert.ToDecimal(e.GetValue("m3_percOri"))
        '        m4_percOri += Convert.ToDecimal(e.GetValue("m4_percOri"))
        '        m5_percOri += Convert.ToDecimal(e.GetValue("m5_percOri"))
        '        m6_percOri += Convert.ToDecimal(e.GetValue("m6_percOri"))
        '        m7_percOri += Convert.ToDecimal(e.GetValue("m7_percOri"))
        '        m8_percOri += Convert.ToDecimal(e.GetValue("m8_percOri"))
        '        m9_percOri += Convert.ToDecimal(e.GetValue("m9_percOri"))
        '        m10_percOri += Convert.ToDecimal(e.GetValue("m10_percOri"))
        '        m11_percOri += Convert.ToDecimal(e.GetValue("m11_percOri"))
        '        m12_percOri += Convert.ToDecimal(e.GetValue("m12_percOri"))
        '        p1_percOri += Convert.ToDecimal(e.GetValue("p1_percOri"))
        '        p2_percOri += Convert.ToDecimal(e.GetValue("p2_percOri"))
        '        p3_percOri += Convert.ToDecimal(e.GetValue("p3_percOri"))
        '        ac_percOri += Convert.ToDecimal(e.GetValue("ac_percOri"))
        '        an_percOri += Convert.ToDecimal(e.GetValue("an_percOri"))

        '    End If

        'End If
        'If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_vlrRev" Then e.TotalValue = m1_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_percRev" Then e.TotalValue = m1_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_vlrRea" Then e.TotalValue = m1_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_percRea" Then e.TotalValue = m1_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_vlrMxR" Then e.TotalValue = m1_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_percMxR" Then e.TotalValue = m1_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_vlrRev" Then e.TotalValue = m2_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_percRev" Then e.TotalValue = m2_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_vlrRea" Then e.TotalValue = m2_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_percRea" Then e.TotalValue = m2_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_vlrMxR" Then e.TotalValue = m2_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_percMxR" Then e.TotalValue = m2_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_vlrRev" Then e.TotalValue = m3_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_percRev" Then e.TotalValue = m3_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_vlrRea" Then e.TotalValue = m3_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_percRea" Then e.TotalValue = m3_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_vlrMxR" Then e.TotalValue = m3_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_percMxR" Then e.TotalValue = m3_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_vlrRev" Then e.TotalValue = m4_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_percRev" Then e.TotalValue = m4_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_vlrRea" Then e.TotalValue = m4_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_percRea" Then e.TotalValue = m4_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_vlrMxR" Then e.TotalValue = m4_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_percMxR" Then e.TotalValue = m4_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_vlrRev" Then e.TotalValue = m5_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_percRev" Then e.TotalValue = m5_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_vlrRea" Then e.TotalValue = m5_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_percRea" Then e.TotalValue = m5_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_vlrMxR" Then e.TotalValue = m5_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_percMxR" Then e.TotalValue = m5_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_vlrRev" Then e.TotalValue = m6_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_percRev" Then e.TotalValue = m6_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_vlrRea" Then e.TotalValue = m6_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_percRea" Then e.TotalValue = m6_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_vlrMxR" Then e.TotalValue = m6_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_percMxR" Then e.TotalValue = m6_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_vlrRev" Then e.TotalValue = m7_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_percRev" Then e.TotalValue = m7_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_vlrRea" Then e.TotalValue = m7_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_percRea" Then e.TotalValue = m7_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_vlrMxR" Then e.TotalValue = m7_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_percMxR" Then e.TotalValue = m7_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_vlrRev" Then e.TotalValue = m8_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_percRev" Then e.TotalValue = m8_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_vlrRea" Then e.TotalValue = m8_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_percRea" Then e.TotalValue = m8_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_vlrMxR" Then e.TotalValue = m8_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_percMxR" Then e.TotalValue = m8_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_vlrRev" Then e.TotalValue = m9_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_percRev" Then e.TotalValue = m9_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_vlrRea" Then e.TotalValue = m9_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_percRea" Then e.TotalValue = m9_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_vlrMxR" Then e.TotalValue = m9_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_percMxR" Then e.TotalValue = m9_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_vlrRev" Then e.TotalValue = m10_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_percRev" Then e.TotalValue = m10_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_vlrRea" Then e.TotalValue = m10_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_percRea" Then e.TotalValue = m10_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_vlrMxR" Then e.TotalValue = m10_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_percMxR" Then e.TotalValue = m10_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_vlrRev" Then e.TotalValue = m11_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_percRev" Then e.TotalValue = m11_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_vlrRea" Then e.TotalValue = m11_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_percRea" Then e.TotalValue = m11_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_vlrMxR" Then e.TotalValue = m11_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_percMxR" Then e.TotalValue = m11_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_vlrRev" Then e.TotalValue = m12_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_percRev" Then e.TotalValue = m12_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_vlrRea" Then e.TotalValue = m12_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_percRea" Then e.TotalValue = m12_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_vlrMxR" Then e.TotalValue = m12_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_percMxR" Then e.TotalValue = m12_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_vlrRev" Then e.TotalValue = p1_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_percRev" Then e.TotalValue = p1_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_vlrRea" Then e.TotalValue = p1_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_percRea" Then e.TotalValue = p1_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_vlrMxR" Then e.TotalValue = p1_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_percMxR" Then e.TotalValue = p1_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_vlrRev" Then e.TotalValue = p2_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_percRev" Then e.TotalValue = p2_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_vlrRea" Then e.TotalValue = p2_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_percRea" Then e.TotalValue = p2_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_vlrMxR" Then e.TotalValue = p2_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_percMxR" Then e.TotalValue = p2_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_vlrRev" Then e.TotalValue = p3_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_percRev" Then e.TotalValue = p3_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_vlrRea" Then e.TotalValue = p3_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_percRea" Then e.TotalValue = p3_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_vlrMxR" Then e.TotalValue = p3_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_percMxR" Then e.TotalValue = p3_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p4_vlrRev" Then e.TotalValue = p4_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p4_percRev" Then e.TotalValue = p4_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p4_vlrRea" Then e.TotalValue = p4_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p4_percRea" Then e.TotalValue = p4_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p4_vlrMxR" Then e.TotalValue = p4_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p4_percMxR" Then e.TotalValue = p4_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_vlrRev" Then e.TotalValue = ac_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_percRev" Then e.TotalValue = ac_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_vlrRea" Then e.TotalValue = ac_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_percRea" Then e.TotalValue = ac_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_vlrMxR" Then e.TotalValue = ac_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_percMxR" Then e.TotalValue = ac_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "acAA_vlrRea" Then e.TotalValue = acAA_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "acAA_percRea" Then e.TotalValue = acAA_percRea

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_vlrRev" Then e.TotalValue = an_vlrRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_percRev" Then e.TotalValue = an_percRev
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_vlrRea" Then e.TotalValue = an_vlrRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_percRea" Then e.TotalValue = an_percRea
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_vlrMxR" Then e.TotalValue = an_vlrMxR
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_percMxR" Then e.TotalValue = an_percMxR

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_vlrOri" Then e.TotalValue = m1_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_vlrOri" Then e.TotalValue = m2_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_vlrOri" Then e.TotalValue = m3_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_vlrOri" Then e.TotalValue = m4_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_vlrOri" Then e.TotalValue = m5_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_vlrOri" Then e.TotalValue = m6_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_vlrOri" Then e.TotalValue = m7_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_vlrOri" Then e.TotalValue = m8_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_vlrOri" Then e.TotalValue = m9_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_vlrOri" Then e.TotalValue = m10_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_vlrOri" Then e.TotalValue = m11_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_vlrOri" Then e.TotalValue = m12_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_vlrOri" Then e.TotalValue = p1_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_vlrOri" Then e.TotalValue = p2_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_vlrOri" Then e.TotalValue = p3_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_vlrOri" Then e.TotalValue = ac_vlrOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_vlrOri" Then e.TotalValue = an_vlrOri

        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m1_percOri" Then e.TotalValue = m1_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m2_percOri" Then e.TotalValue = m2_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m3_percOri" Then e.TotalValue = m3_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m4_percOri" Then e.TotalValue = m4_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m5_percOri" Then e.TotalValue = m5_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m6_percOri" Then e.TotalValue = m6_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m7_percOri" Then e.TotalValue = m7_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m8_percOri" Then e.TotalValue = m8_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m9_percOri" Then e.TotalValue = m9_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m10_percOri" Then e.TotalValue = m10_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m11_percOri" Then e.TotalValue = m11_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "m12_percOri" Then e.TotalValue = m12_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_percOri" Then e.TotalValue = p1_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_percOri" Then e.TotalValue = p2_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_percOri" Then e.TotalValue = p3_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_percOri" Then e.TotalValue = ac_percOri
        '    If DirectCast(e.Item, ASPxSummaryItem).FieldName = "an_percOri" Then e.TotalValue = an_percOri

        'End If

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "Text")
        oFun.Grid_RedIsNegative(e, "Fat_N")
        oFun.Grid_RedIsNegative(e, "Lucro_N")
        oFun.Grid_RedIsNegative(e, "Margem_N")
        oFun.Grid_RedIsNegative(e, "Part_N")
        oFun.Grid_RedIsNegative(e, "Fat_0_5")
        oFun.Grid_RedIsNegative(e, "Lucro_0_5")
        oFun.Grid_RedIsNegative(e, "Margem_0_5")
        oFun.Grid_RedIsNegative(e, "Part_0_5")
        oFun.Grid_RedIsNegative(e, "Fat_Total")
        oFun.Grid_RedIsNegative(e, "Lucro_Total")
        oFun.Grid_RedIsNegative(e, "Margem_Total")


    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        'If e.RowType <> GridViewRowType.Data Then
        'End If

        Dim NomeColuna As String = e.GetValue("Text")

        Select Case NomeColuna
            Case "Total"
                e.Row.BackColor = System.Drawing.Color.Cyan
                e.Row.Font.Bold = True
        End Select


        'End Select
        'LightYellow
        'Lavender
        'LightGoldenrodYellow
        'LightGreen
        'MediumSpringGreen
        'PaleGreen
        'Gainsboro = Cinza Claro
        'Lavender = Roxo Claro
        'LightPink = Rosa Claro
        'LightSalmon = Laranja
    End Sub

    Protected Sub ASPxGridView1_SummaryDisplayText(sender As Object, e As ASPxGridViewSummaryDisplayTextEventArgs) Handles ASPxGridView1.SummaryDisplayText
        On Error Resume Next
        'If e.Item.FieldName = "ac_vlrOri" Then
        '    Me.ASPxGridView1.Columns.Item("ac_vlrOri").FooterCellStyle.Font.Bold = True
        '    If Convert.ToDecimal(e.Value) < 0 Then
        '        Me.ASPxGridView1.Columns.Item("ac_vlrOri").FooterCellStyle.ForeColor = Drawing.Color.Red
        '    Else
        '        Me.ASPxGridView1.Columns.Item("ac_vlrOri").FooterCellStyle.ForeColor = Drawing.Color.Blue
        '    End If
        'End If

        'If e.Item.FieldName = "ac_percOri" Then
        '    Me.ASPxGridView1.Columns.Item("ac_percOri").FooterCellStyle.Font.Bold = True
        '    If Convert.ToDecimal(e.Value) < 0 Then
        '        Me.ASPxGridView1.Columns.Item("ac_percOri").FooterCellStyle.ForeColor = Drawing.Color.Red
        '    Else
        '        Me.ASPxGridView1.Columns.Item("ac_percOri").FooterCellStyle.ForeColor = Drawing.Color.Blue
        '    End If
        'End If

        'If e.Item.FieldName = "ac_vlrRev" Then
        '    Me.ASPxGridView1.Columns.Item("ac_vlrRev").FooterCellStyle.Font.Bold = True
        '    If Convert.ToDecimal(e.Value) < 0 Then
        '        Me.ASPxGridView1.Columns.Item("ac_vlrRev").FooterCellStyle.ForeColor = Drawing.Color.Red
        '    Else
        '        Me.ASPxGridView1.Columns.Item("ac_vlrRev").FooterCellStyle.ForeColor = Drawing.Color.Blue
        '    End If
        'End If

        'If e.Item.FieldName = "ac_percRev" Then
        '    Me.ASPxGridView1.Columns.Item("ac_percRev").FooterCellStyle.Font.Bold = True
        '    If Convert.ToDecimal(e.Value) < 0 Then
        '        Me.ASPxGridView1.Columns.Item("ac_percRev").FooterCellStyle.ForeColor = Drawing.Color.Red
        '    Else
        '        Me.ASPxGridView1.Columns.Item("ac_percRev").FooterCellStyle.ForeColor = Drawing.Color.Blue
        '    End If
        'End If

        'If e.Item.FieldName = "ac_vlrRea" Then
        '    Me.ASPxGridView1.Columns.Item("ac_vlrRea").FooterCellStyle.Font.Bold = True
        '    If Convert.ToDecimal(e.Value) < 0 Then
        '        Me.ASPxGridView1.Columns.Item("ac_vlrRea").FooterCellStyle.ForeColor = Drawing.Color.Red
        '    Else
        '        Me.ASPxGridView1.Columns.Item("ac_vlrRea").FooterCellStyle.ForeColor = Drawing.Color.Blue
        '    End If
        'End If

        'If e.Item.FieldName = "ac_percRea" Then
        '    Me.ASPxGridView1.Columns.Item("ac_percRea").FooterCellStyle.Font.Bold = True
        '    If Convert.ToDecimal(e.Value) < 0 Then
        '        Me.ASPxGridView1.Columns.Item("ac_percRea").FooterCellStyle.ForeColor = Drawing.Color.Red
        '    Else
        '        Me.ASPxGridView1.Columns.Item("ac_percRea").FooterCellStyle.ForeColor = Drawing.Color.Blue
        '    End If
        'End If

        'If e.Item.FieldName = "ac_vlrMxR" Then
        '    Me.ASPxGridView1.Columns.Item("ac_vlrMxR").FooterCellStyle.Font.Bold = True
        '    If Convert.ToDecimal(e.Value) < 0 Then
        '        Me.ASPxGridView1.Columns.Item("ac_vlrMxR").FooterCellStyle.ForeColor = Drawing.Color.Red
        '    Else
        '        Me.ASPxGridView1.Columns.Item("ac_vlrMxR").FooterCellStyle.ForeColor = Drawing.Color.Blue
        '    End If
        'End If

        'If e.Item.FieldName = "ac_percMxR" Then
        '    Me.ASPxGridView1.Columns.Item("ac_percMxR").FooterCellStyle.Font.Bold = True
        '    If Convert.ToDecimal(e.Value) < 0 Then
        '        Me.ASPxGridView1.Columns.Item("ac_percMxR").FooterCellStyle.ForeColor = Drawing.Color.Red
        '    Else
        '        Me.ASPxGridView1.Columns.Item("ac_percMxR").FooterCellStyle.ForeColor = Drawing.Color.Blue
        '    End If
        'End If

        'If e.Item.FieldName = "descConta" Then
        '    Me.ASPxGridView1.Columns.Item("descConta").FooterCellStyle.Font.Bold = True
        '    Me.ASPxGridView1.Columns.Item("descConta").FooterCellStyle.ForeColor = Drawing.Color.Blue
        'End If
    End Sub

    Private Sub ExibirColuna(ByVal iNomeColuna As String)
        Me.ASPxGridView1.Columns.Item(iNomeColuna).Visible = True
    End Sub
    Private Sub OcultarColuna(ByVal iNomeColuna As String)
        Me.ASPxGridView1.Columns.Item(iNomeColuna).Visible = False
    End Sub
    Private Sub AjustarColuna(ByVal iNomeColuna As String, ByVal iVal As String)
        Me.ASPxGridView1.Columns.Item(iNomeColuna).Width = iVal
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        If daterange.Value <> "Selecione um período..." Then
            Call callSessions()
            carregaGrid()
        Else
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertCampos();", True)
        End If

    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

#End Region

#Region " Eventos filtros "

    Protected Sub selFilial_SelectedIndexChanged(sender As Object, e As EventArgs)
        If (Me.selFilial.SelectedValue.ToString() <> "0") Then
            Session("sFILIAL") = Me.selFilial.SelectedValue.ToString()
        Else
            Session("sFILIAL") = ""
        End If
    End Sub

    Protected Sub cboDepto_SelectedIndexChanged(sender As Object, e As EventArgs)

        If (Me.cboDepto.SelectedValue.ToString() <> "0") Then
            Session("sDEP") = Me.cboDepto.SelectedValue.ToString()
        Else
            Session("sDEP") = ""
        End If

        Me.cboSecao.DataBind()
        Me.cboSecao.SelectedValue = 0
        Me.cboSecao.Enabled = True
        If (Me.cboDepto.SelectedValue.ToString() = 0) Then
            Me.cboSecao.Enabled = False
            Me.cboGrupo.Enabled = False
            Me.cboSubgrupo.Enabled = False
            Me.cboProduto.Enabled = False
        End If
    End Sub
    Protected Sub cboSecao_SelectedIndexChanged(sender As Object, e As EventArgs)

        If (Me.cboSecao.SelectedValue.ToString() <> "0") Then
            Session("sSEC") = Me.cboSecao.SelectedValue.ToString()
        Else
            Session("sSEC") = ""
        End If

        Me.cboGrupo.DataBind()
        Me.cboGrupo.SelectedValue = 0
        Me.cboGrupo.Enabled = True
        Me.cboSubgrupo.Enabled = False
        If (Me.cboSecao.SelectedValue.ToString() = 0) Then
            Me.cboGrupo.Enabled = False
            Me.cboSubgrupo.Enabled = False
            Me.cboProduto.Enabled = False
        End If
    End Sub
    Protected Sub cboGrupo_SelectedIndexChanged(sender As Object, e As EventArgs)

        If (Me.cboGrupo.SelectedValue.ToString() <> "0") Then
            Session("sGRU") = Me.cboGrupo.SelectedValue.ToString()
        Else
            Session("sGRU") = ""
        End If

        Me.cboSubgrupo.DataBind()
        Me.cboSubgrupo.SelectedValue = 0
        Me.cboSubgrupo.Enabled = True
        If (Me.cboGrupo.SelectedValue.ToString() = 0) Then
            Me.cboSubgrupo.Enabled = False
        End If
    End Sub
    Protected Sub cboSubgrupo_SelectedIndexChanged(sender As Object, e As EventArgs)
        If (Me.cboSubgrupo.SelectedValue.ToString() <> "0") Then
            Session("sSUB") = Me.cboSubgrupo.SelectedValue.ToString()
        Else
            Session("sSUB") = ""
        End If

        Me.cboProduto.DataBind()
        Me.cboProduto.SelectedValue = 0
        Me.cboProduto.Enabled = True
        If (Me.cboSubgrupo.SelectedValue.ToString() = 0) Then
            Me.cboProduto.Enabled = False
        End If
    End Sub
    Protected Sub cboProduto_SelectedIndexChanged(sender As Object, e As EventArgs)
        If (Me.cboProduto.SelectedValue.ToString() <> "0") Then
            Session("sPRO") = Me.cboProduto.SelectedValue.ToString()
        Else
            Session("sPRO") = ""
        End If
    End Sub

    Protected Sub cboDepto_DataBound(sender As Object, e As EventArgs)
        Me.cboDepto.Items.Insert(0, New ListItem("Selecione um Departamento", "0"))
        Me.cboDepto.SelectedValue = "0"

    End Sub
    Protected Sub cboSecao_DataBound(sender As Object, e As EventArgs)
        If (Me.cboDepto.SelectedValue = "0") Then
            Me.cboSecao.Items.Insert(0, New ListItem("Selecione uma Seção", "0"))
        Else
            Me.cboSecao.Items.Insert(0, New ListItem("Selecione uma Seção", "0"))
            Me.cboSecao.SelectedValue = "0"
        End If
    End Sub
    Protected Sub cboGrupo_DataBound(sender As Object, e As EventArgs)
        If (Me.cboSecao.SelectedValue.ToString() <> "0") Then
            Me.cboGrupo.Items.Insert(0, New ListItem("Selecione um Grupo", "0"))
            Me.cboGrupo.SelectedValue = "0"
        Else
            Me.cboGrupo.Items.Insert(0, New ListItem("Selecione um Grupo", "0"))
        End If
    End Sub
    Protected Sub cboSubgrupo_DataBound(sender As Object, e As EventArgs)
        If (Me.cboGrupo.SelectedValue.ToString() <> "0") Then
            Me.cboSubgrupo.Items.Insert(0, New ListItem("Selecione um Sub-Grupo", "0"))
            Me.cboSubgrupo.SelectedValue = "0"
        Else
            Me.cboSubgrupo.Items.Insert(0, New ListItem("Selecione um Sub-Grupo", "0"))
        End If
    End Sub
    Protected Sub cboProduto_DataBound(sender As Object, e As EventArgs)
        If (Me.cboSubgrupo.SelectedValue.ToString() <> "0") Then
            Me.cboProduto.Items.Insert(0, New ListItem("Selecione um Produto", "0"))
            Me.cboProduto.SelectedValue = "0"
        Else
            Me.cboProduto.Items.Insert(0, New ListItem("Selecione um Produto", "0"))
        End If
    End Sub

#End Region

#Region "Funções internas"

    Private Sub iniSessions()
        Session("sDATINI") = ""
        Session("sDATFIM") = ""
        Session("sTIPO") = ""
        Session("sFILIAL") = ""
        Session("sFILTRO") = ""
        Session("sDEP") = ""
        Session("sSEC") = ""
        Session("sGRU") = ""
        Session("sSUB") = ""
        Session("sPRO") = ""
    End Sub
    Private Sub callSessions()
        iniSessions()

        Session("sDATINI") = Split(daterange.Value, " à ", 0)(0).ToString()
        Session("sDATFIM") = Split(daterange.Value, " à ", 0)(1).ToString()
        Session("sTIPO") = selTipo.SelectedValue
        Session("sFILIAL") = selFilial.SelectedValue
        Session("sDEP") = cboDepto.SelectedValue
        Session("sSEC") = cboSecao.SelectedValue
        Session("sGRU") = cboGrupo.SelectedValue
        Session("sSUB") = cboSubgrupo.SelectedValue
        Session("sPRO") = cboProduto.SelectedValue

        If cboProduto.SelectedValue <> 0 Then
            Session("sFILTRO") = 5
        ElseIf cboSubgrupo.SelectedValue <> 0 Then
            Session("sFILTRO") = 4
        ElseIf cboGrupo.SelectedValue <> 0 Then
            Session("sFILTRO") = 3
        ElseIf cboSecao.SelectedValue <> 0 Then
            Session("sFILTRO") = 2
        ElseIf cboDepto.SelectedValue <> 0 Then
            Session("sFILTRO") = 1
        Else
            Session("sFILTRO") = 0
        End If
    End Sub

    Private Sub carregaSelects()

        selects.Define_Filial(3, Session("sDEPARTAMENTO"), User.Identity.Name, Session("sFILIAL"), selFilial)

        Me.selFilial.Items.Insert(0, New ListItem("Selecione uma Filial", "0"))
        Me.selFilial.SelectedValue = "0"
    End Sub

    Private Sub carregaGrid()
        Dim constr As String = ConfigurationManager.ConnectionStrings("gerVendaItemConnectionString").ConnectionString
        Dim con As New SqlConnection(constr)
        Dim comando As New SqlCommand("dbo.uspBuscarAnaliseMargem", con)
        Dim idr As IDataReader
        comando.CommandType = CommandType.StoredProcedure
        comando.CommandTimeout = 900

        comando.Parameters.Add(New SqlParameter("@DiaIni", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@DiaFim", SqlDbType.VarChar))
        comando.Parameters.Add(New SqlParameter("@Tipo", SqlDbType.TinyInt))
        comando.Parameters.Add(New SqlParameter("@Filial", SqlDbType.SmallInt))
        comando.Parameters.Add(New SqlParameter("@Filtro", SqlDbType.TinyInt))
        comando.Parameters.Add(New SqlParameter("@Depto", SqlDbType.Int))
        comando.Parameters.Add(New SqlParameter("@Secao", SqlDbType.Int))
        comando.Parameters.Add(New SqlParameter("@Grupo", SqlDbType.Int))
        comando.Parameters.Add(New SqlParameter("@SubGrupo", SqlDbType.Int))
        comando.Parameters.Add(New SqlParameter("@Produto", SqlDbType.Int))

        comando.Parameters("@DiaIni").Value = Session("sDATINI")
        comando.Parameters("@DiaFim").Value = Session("sDATFIM")
        comando.Parameters("@Tipo").Value = Session("sTIPO")
        comando.Parameters("@Filial").Value = Session("sFILIAL")
        comando.Parameters("@Filtro").Value = Session("sFILTRO")
        comando.Parameters("@Depto").Value = Session("sDEP")
        comando.Parameters("@Secao").Value = Session("sSEC")
        comando.Parameters("@Grupo").Value = Session("sGRU")
        comando.Parameters("@SubGrupo").Value = Session("sSUB")
        comando.Parameters("@Produto").Value = Session("sPRO")

        Try
            con.Open()
            idr = comando.ExecuteReader()
            Me.ASPxGridView1.DataSource = idr
            Me.ASPxGridView1.DataBind()
        Catch ex As Exception

        Finally
            'idr.Dispose()
            con.Close()
            comando.Dispose()
        End Try


    End Sub

#End Region

End Class
